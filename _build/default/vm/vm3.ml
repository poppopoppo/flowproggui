open Types
module Sgn_Core = Sgn
module SgnF : sig
  type t
  val ini : unit -> t
  val print : t -> string
  val compare : t -> t -> int
  val hash : t -> int
  val sexp_of_t : t -> Core.Sexp.t
  val free : t -> unit
  val eq : t -> t -> bool
end = struct
  type t = (int option) ref
  type v = bool BatDynArray.t
  let sgnF_N = ref 0
  let v = BatDynArray.create ()
  let ini () =
    ( try
        let i = BatDynArray.index_of (fun b -> b=false) v in
        BatDynArray.set v i true;
        ref (Some i)
      with
      | Not_found ->
        BatDynArray.add v true;
        sgnF_N := !sgnF_N + 1;
        ref (Some ((BatDynArray.length v)-1))
      | _ -> raise (Failure "SgnF.ini 0"))
  let print o =
    ( match !o with
      | None -> "_"
      | Some i -> "ri"^(string_of_int i))
  let compare o1 o2 =
    ( match !o1,!o2 with
      | Some i1,Some i2 -> compare_int i1 i2
      | _,_ -> raise (Failure "SgnF.compare"))
  let eq o1 o2 =
    ( match !o1,!o2 with
      | Some i1,Some i2 -> eq_int i1 i2
      | None,None -> true
      | _,_ -> false )
  let hash o1 =
    ( match !o1 with
      | None -> (-1)
      | Some i1 -> i1 )
  let free o1 =
    ( match !o1 with
      | None -> ()
      | Some i1 ->
        BatDynArray.set v i1 false;
        o1 := None )
  let sexp_of_t o1 = Core.Sexp.List []
end
module type Reg_T = sig
  type t
  type 'tkn st
  val st_ini : unit -> 'tkn st
  val ini : 'tkn st -> t
  val get_k : 'tkn st -> t ->  ('tkn option)
  val set_k : 'tkn st -> t -> 'tkn -> unit
  val ini_k : 'tkn st -> 'tkn -> t
  val free : 'tkn st -> t -> unit
  val clear : 'tkn st -> unit
  val copy : 'tkn st -> 'tkn st
  val pnt : t -> string
end
module Reg_Sgn = struct
  type t = Sgn_Core.t
  type 'tkn st = (t, 'tkn) Core.Hashtbl.t
  let st_ini () = Core.Hashtbl.create (module Sgn_Core)
  let ini (v:'tkn st) = Sgn_Core.ini ()
  let get_k v r =
    let k = Core.Hashtbl.find v r in
    let _ = Core.Hashtbl.remove v r in
    k
  let set_k v r k =
    let _ = Core.Hashtbl.add v r k in
    ()
  let ini_k v k =
    let r = ini v in
    let _ = set_k v r k in
    r
  let copy v = Core.Hashtbl.copy v
  let free v r = Core.Hashtbl.remove v r
  let clear v = Core.Hashtbl.clear v
  let pnt r = "r"^(Sgn_Core.print r)
end
module Reg_SgnH = struct
  type t = Sgn_Core.t
  type 'tkn st = (int, 'tkn) Core.Hashtbl.t
  let st_ini () = Core.Hashtbl.create (module Core.Int)
  let ini (v:'tkn st) = Sgn_Core.ini ()
  let hash r = Sgn_Core.hash r
  let get_k v r =
    let k = Core.Hashtbl.find v (hash r) in
    let _ = Core.Hashtbl.remove v (hash r) in
    k
  let set_k v r k =
    let _ = Core.Hashtbl.add v (hash r) k in
    ()
  let ini_k v k =
    let r = ini v in
    let _ = set_k v r k in
    r
  let copy v = Core.Hashtbl.copy v
  let free v r = Core.Hashtbl.remove v (hash r)
  let clear v = Core.Hashtbl.clear v
  let pnt r = "r"^(Sgn_Core.print r)
end
module Reg_SgnF = struct
  type t = SgnF.t
  type 'tkn st = ('tkn option) BatDynArray.t
  let hash r = SgnF.hash r
  let st_ini () = BatDynArray.create ()
  let ini (v:'tkn st) = SgnF.ini ()
  let get_k v r =
    let k = BatDynArray.get v (hash r) in
    let _ = BatDynArray.set v (hash r) None in
    k
  let rec set_k v r k =
    ( try
        let _ = BatDynArray.set v (hash r) (Some k) in
        ()
      with _ -> BatDynArray.add v None; set_k v r k )
  let ini_k v k =
    let r = ini v in
    let _ = set_k v r k in
    r
  let copy v = BatDynArray.copy v
  let free v r = BatDynArray.set v (hash r) None
  let clear v = BatDynArray.clear v
  let pnt r = "r"^(SgnF.print r)
end
module Reg_SgnA = struct
  type t = Sgn_Core.t
  type 'tkn st = ('tkn option) BatDynArray.t
  let st_ini () = BatDynArray.create ()
  let ini (v:'tkn st) = Sgn_Core.ini ()
  let hash r = Sgn_Core.hash r
  let rec get_k v r =
    ( try
        let k = BatDynArray.get v (hash r) in
        let _ = BatDynArray.set v (hash r) None in
        k
      with _ -> BatDynArray.add v None; get_k v r )
  let rec set_k v r k =
    ( try
        let _ = BatDynArray.set v (hash r) (Some k) in
        ()
      with _ -> BatDynArray.add v None; set_k v r k )
  let ini_k v k =
    let r = ini v in
    let _ = set_k v r k in
    r
  let copy v = BatDynArray.copy v
  let free v r = BatDynArray.set v (hash r) None
  let clear v = BatDynArray.clear v
  let pnt r = "r"^(Sgn_Core.print r)
end
module Reg_Int = struct
  type t = int
  type v = bool BatDynArray.t
  type 'tkn st = v * (('tkn option) BatDynArray.t)
  let st_ini () =
    (BatDynArray.init 10 (fun _ -> true),BatDynArray.init 10 (fun _ -> None))
  let ini (vt,v) =
    let i =
      BatDynArray.fold_left
        (fun i o ->
           ( match i,o with
             | `R i,_ -> `R i
             | `N i,false -> BatDynArray.set vt i true; `R i
             | `N i,true -> `N (i+1)))
        (`N 0) vt in
    ( match i with
      | `N i ->
        BatDynArray.add vt true;
        BatDynArray.add v None;
        i
      | `R i -> i )
  let rec ini_i (vt,v) i =
    ( try
        let _ = BatDynArray.get vt i in
        ( try
            let _ = BatDynArray.get v i in
            i
          with _ ->
            BatDynArray.add v None;
            BatDynArray.set vt i true;
            ini_i (vt,v) i )
      with _  -> BatDynArray.add vt true; ini_i (vt,v) i )
  let get_k (vt,v) r =
    let o =
      ( try BatDynArray.get v r
        with _ -> None ) in
    BatDynArray.set v r None;
    BatDynArray.set vt r true;
    o
  let set_k (vt,v) r k =
    let _ = ini_i (vt,v) r in
    BatDynArray.set v r (Some k);
    BatDynArray.set vt r true
  let ini_k v k =
    let r = ini v in
    set_k v r k;
    r
  let copy (vt,v) = (BatDynArray.copy vt,BatDynArray.copy v)
  let free (vt,v) r =
    BatDynArray.set v r None;
    BatDynArray.set vt r false
  let clear (vt,v) =
    BatDynArray.clear v;
    BatDynArray.clear vt
  let pnt i = "r"^(string_of_int i)
end
module Vm (Reg : Reg_T) = struct
  open Reg
  type reg = Reg.t
  type plc = Plc of Sgn_Core.t
  and tkn =
    | Tkn_Unt
    | Tkn_Stg of string
    | Tkn_Z of int
    | Tkn_Bol of bool
    | Tkn_Sgn of Sgn_Core.t
    | Tkn_Ln of reg
    | Tkn_Tns of reg * reg
    | Tkn_CoP of int * reg
    | Tkn_P of (plc array) * reg * reg
    | Tkn_Pls
    | Tkn_Mlt
    | Tkn_Mns
    | Tkn_Cmp
    | Tkn_Eq
    | Tkn_Inj of int
    | Tkn_Cho of int
    | Tkn_Fix
    | Tkn_Exn
    | Tkn_Fnc of plc * reg (* jmp_ptr arg_ptr *)
    | Tkn_Clj of plc * reg * reg (* jmp_ptr arg0 { arg0 x } *)
  type rcd_tkn =
    | Rcd of rcd_tkn list
    | Atm of tkn
  type st = tkn Reg.st
  type st_h = (reg * tkn) list
  type gst = st * (cs Stack.t)
  and cs =
    | CS of plc * reg * st (* return-plc * return-reg *)
    | CS_A of plc * reg
    | CS_L of plc * reg * st * (tkn option S_Ref.t)
    | CS_R of plc * reg * st * (tkn option S_Ref.t)
  type op =
    | Id of reg * reg
    | Rm of reg
    | Clj of reg * reg * reg * plc (* f * (src0 * src1 * f-ptr) *)
    | Prd of reg * reg * reg * (plc array)
    | Agl of reg * reg * (plc array)
    | Spt of (reg * reg) * reg
    | Rpc of (reg * reg) * reg
    | Cns of reg * (reg * reg)
    | Call of reg * (reg * reg) (* y <- f ◂ x *)
    | HCall of reg * (src * reg) * (src * reg) (* y <- (0f◂x0) (f1◂x1) *)
    | Ini_Tkn of reg * tkn
    | Ini_Sgn of reg
    | Axm of (reg list) * (reg list)
  and src =
    | Src_Reg of reg
    | Im of tkn
  type asm = (Sgn_Core.t, pt) Core.Hashtbl.t
  and pt =
    | Ret of reg
    | Op of op * plc
  let st_ini = Reg.st_ini
  let reg v = Reg.ini v
  let pnt_reg r = Reg.pnt r
  let plc () = Plc (sgn ())
  let plc_to p =
    ( match p with
      | Plc p -> p )

  let rec print_asm a : string =
    Core.Hashtbl.fold a ~init:""
      ~f:(fun ~key:p ~data:o s ->
          ( match o with
            | Ret r ->
              s^(pnt_plc (Plc p))^" @ ret : "^(pnt_reg r)^"\n"
            | Op (o,np) ->
              let s0 = print_op o in
              s^(pnt_plc (Plc p))^" ⊢ "^(pnt_plc np)^" @ "^s0
          ))
  and pnt_plc p =
    ( match p with
      | Plc p -> "p"^(Sgn_Core.print p))
  and pnt_arr rs rd =
    " : "^(Util.string_of_list " " pnt_reg rs)^" ⊢ "^(Util.string_of_list " " pnt_reg rd)^"\n"
  and print_op o =
    ( match o with
      | Id (r0,r1) -> "id"^(pnt_arr [r1] [r0])
      | Rm r0 -> "rm"^(pnt_arr [r0] [])
      | Clj (r0,r1,r2,p1) -> "clj "^(pnt_reg r2)^" "^(pnt_plc p1)^(pnt_arr [r1] [r0])
      | Prd (r0,r1,r2,ps) ->
        "prd "^(pnt_reg r2)^" ["^
        (Util.string_of_list " " pnt_plc (Array.to_list ps))^"]"^
        (pnt_arr [r1] [r0])
      | Agl (rs,r1,ps) ->
        let s0 = List.map pnt_plc (Array.to_list ps) in
        let s1 = List.fold_left
            (fun s1 sa ->
               s1^" "^sa)
            "" s0 in
        "∠ "^(pnt_reg r1)^" ["^s1^"]"^(pnt_arr [] [rs])
      | Spt ((r0,r1),r2) ->
        "spt"^(pnt_arr [r2] [r0;r1])
      | Rpc ((r0,r1),r2) ->
        "rpc"^(pnt_arr [r2] [r0;r1])
      | Cns (r0,(r1,r2)) ->
        "cns"^(pnt_arr [r1;r2] [r0])
      | Call (r0,(r1,r2)) ->
        "call"^(pnt_arr [r1;r2] [r0])
      | HCall (r0,(_,r1),(_,r2)) ->
        "hcall"^(pnt_arr [r1;r2] [r0])
      | Ini_Tkn (r0,k0) ->
        "ini_tkn "^(print_k k0)^(pnt_arr [] [r0])
      | Ini_Sgn r0 ->
        "ini_sgn"^(pnt_arr [] [r0])
      | Axm (rs0,rs1) ->
        "axm"^(pnt_arr rs0 rs1)
    )
  and print_k k =
    ( match k with
      | Tkn_Unt -> "{}"
      | Tkn_Stg s -> "\""^s^"\""
      | Tkn_Z z -> string_of_int z
      | Tkn_Bol b -> if b then "t" else "f"
      | Tkn_Sgn p -> "&"^(Sgn_Core.print p)
      | Tkn_Ln p -> "l."^(pnt_reg p)
      | Tkn_Tns (r1,r2) -> "<"^(pnt_reg r1)^"¦"^(pnt_reg r2)^">"
      | Tkn_CoP (i,r0) -> "∠["^(string_of_int i)^","^(pnt_reg r0)^"]"
      | Tkn_P (_,r0,r1) -> "\\["^(pnt_reg r0)^","^(pnt_reg r1)^"]"
      | Tkn_Pls -> "+"
      | Tkn_Mlt  -> "*"
      | Tkn_Mns -> "-"
      | Tkn_Cmp -> "<="
      | Tkn_Eq -> "="
      | Tkn_Inj i -> "∠["^(string_of_int i)^"]"
      | Tkn_Cho i -> "\\["^(string_of_int i)^"]"
      | Tkn_Fix -> "@"
      | Tkn_Exn -> "?"
      | Tkn_Fnc (p1,r1) -> "→["^(pnt_plc p1)^","^(pnt_reg r1)^"]"
      | Tkn_Clj (_,_,_) -> "tkn-clj"
    )
  let rec print_k_rcd k =
    ( match k with
      | Rcd l -> "{ "^(Util.string_of_list " " print_k_rcd l)^" }"
      | Atm a -> print_k a )
  let get_k_list v r =
    let rec f_i r0 =
      let k0 = get_k v r0 in
      ( match k0 with
        | Some Tkn_Unt -> []
        | Some Tkn_Tns(r1,r2) ->
          let k1 = get_k v r1 in
          ( match k1 with
            | Some k1 -> k1::(f_i r2)
            | _ -> raise (Failure "vm1.get_k_list:1"))
        | _ -> raise (Failure "vm1.get_k_list:0")
      ) in
    f_i r
  let rec get_k_rcd v r =
    (* Util.pnt true ("enter get_k_rcd:"^(Reg.pnt r)^"\n"); *)
    let k0 = get_k v r in
    ( match k0 with
      | Some Tkn_Unt -> Some (Rcd [])
      | Some Tkn_Tns(r1,r2) ->
        let k1 = get_k_rcd v r1 in
        let k2 = get_k_rcd v r2 in
        ( match k1,k2 with
          | Some k1,Some Rcd l -> Some (Rcd (k1::l))
          | _ ->
            (*      Util.pnt true ("error:get_k_rcd 0:"^(Reg.pnt r)^"\n"); *)
            None )
      | Some a -> Some (Atm a)
      | None ->
        (* Util.pnt true ("error:get_k_rcd 1:"^(Reg.pnt r)^"\n"); *)
        None )
  let rec set_k_rcd v r s =
    ( match s with
      | Atm a ->
        set_k v r a
      | Rcd l ->
        let r0 = reg v in
        set_k v r0 Tkn_Unt;
        let rs =
          List.fold_right
            (fun k r0 ->
               let r1 = reg v in
               set_k_rcd v r1 k;
               let r2 = reg v in
               set_k v r2 (Tkn_Tns(r1,r0));
               r2 )
            l r0 in
        let k = get_k v rs in
        ( match k with
          | Some k -> set_k v r k
          | None -> raise (Failure "set_k_rcd:0"))
    )
  let fresh v r0 =
    let r1 = reg v in
    let k0 = get_k_rcd v r0 in
    ( match k0 with
      | Some k0 ->
        set_k_rcd v r1 k0;
        r1
      | None -> raise (Failure "vm3.fresh"))
  let src a s =
    ( match s with
      | Src_Reg r -> get_k a r
      | Im k -> Some k )
  let asm_ini () = Core.Hashtbl.create (module Sgn_Core)
  let asm_add a p o = Core.Hashtbl.add a ~key:(plc_to p) ~data:o
  let asm_get a p = Core.Hashtbl.find a (plc_to p)
  type evo_rtn = Evo_Ret of tkn | Evo_Nxt of plc * st
(*
  let rec evo a cs p v =
    let ox = asm_get a p in
    ( match ox with
      | Some x ->
        ( match x with
          | (Ret r0) ->
            (* Util.pnt true ("ret "^(pnt_reg r0)^"\n"); *)
            let k0 = get_k_rcd v r0 in
            if (Stack.is_empty cs) then Evo_Ret k0
            else
              let hd = Stack.pop cs in
              ( match hd with
                | CS (p0,r1,v0) ->
                  set_k_rcd v0 r1 k0;
                  Reg.clear v;
                  Evo_Nxt (p0,v0)
                | CS_A (p0,r1) ->
                  set_k_rcd v r1 k0;
                  Evo_Nxt (p0,v)
                | _ -> raise (Failure "vm1.run:0") )
          | (Op (o0,np)) ->
            (*    Util.pnt true ((print_op o0)^","^(pnt_plc np)^"\n"); *)
            ( match o0 with
              | Id (r1,r2) ->
                let k2 = get_k v r2 in
                ( match k2 with
                  | Some k2 ->
                    set_k v r1 k2;
                    Evo_Nxt (np,v)
                  | None -> raise (Failure "vm2.run:10"))
              | Rm r0 ->
                let _ = get_k_rcd v r0 in
                Evo_Nxt (np,v)
              | Agl (r0,r1,ps) ->
                let k1 = get_k v r1 in
                ( match k1 with
                  | Some Tkn_CoP (i,r3) ->
                    let k2 = get_k v r3 in
                    ( match k2 with
                      | Some k2 ->
                        set_k v r1 k2;
                        Stack.push (CS_A (np,r0)) cs;
                        Evo_Nxt (ps.(i),v)
                      | _ -> raise (Failure "vm2.run:11"))
                  | Some Tkn_Z z ->
                    if z=0 then
                      ( set_k v r1 Tkn_Unt;
                        Stack.push (CS_A (np,r0)) cs;
                        run a ps.(0) v cs )
                    else
                      ( set_k v r1 Tkn_Unt;
                        Stack.push (CS_A (np,r0)) cs;
                        run a ps.(1) v cs )
                  | _ -> raise (Failure "vm2:x0")
                )
              | Call (y,(f,x)) ->
                let k_f = get_k v f in
                ( match k_f with
                  | Some k_f ->
                    ( match k_f with
                      | Tkn_Pls ->
                        let k_xl = get_k_list v x in
                        ( match k_xl with
                          | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                            set_k v y (Tkn_Z (z1+z2));
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:2") )
                      | Tkn_Mlt ->
                        let k_xl = get_k_list v x in
                        ( match k_xl with
                          | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                            set_k v y (Tkn_Z (z1*z2));
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:3") )
                      | Tkn_Mns ->
                        let k = get_k v x in
                        ( match k with
                          | Some (Tkn_Z z1) ->
                            set_k v y (Tkn_Z (-z1));
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:2") )
                      | Tkn_Cmp ->
                        let k_xl = get_k_list v x in
                        ( match k_xl with
                          | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                            let b = if z1<=z2 then 1 else 0 in
                            set_k v y (Tkn_Z b);
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:2") )
                      | Tkn_Eq ->
                        let k_r = get_k_rcd v x in
                        ( match k_r with
                          | Rcd (x1::x2::[]) ->
                            if x1=x2 then
                              ( set_k v y (Tkn_Bol true);
                                run a np v cs)
                            else
                              ( set_k v y (Tkn_Bol false);
                                run a np v cs)
                          | _ -> raise (Failure "vm1.run:3"))
                      | Tkn_Inj b ->
                        let k0 = get_k v x in
                        ( match k0 with
                          | Some k0 ->
                            let r0 = reg v in
                            set_k v r0 k0;
                            set_k v y (Tkn_CoP (b,r0));
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:13"))
                      | Tkn_Cho _ -> raise (Failure "vm1.run:4")
                      | Tkn_Fix -> raise (Failure "vm1.run:5")
                      | Tkn_Exn -> raise (Failure "vm1.run:6")
                      | Tkn_Fnc (p0,r0)->
                        let k0 = get_k_rcd v x in
                        let v1 = st_ini () in
                        set_k_rcd v1 r0 k0;
                        Stack.push (CS(np,y,v)) cs;
                        run a p0 v1 cs
                      | Tkn_Clj (p0,r0,r1) ->
                        let k0 = get_k_rcd v x in
                        let k1 = get_k_rcd v r0 in
                        let v1 = st_ini () in
                        set_k_rcd v1 r1 (Rcd [k0;k1]);
                        Stack.push (CS(np,y,v)) cs;
                        run a p0 v1 cs
                      | _ -> raise (Failure "vm2:run9")
                    )
                  | _ -> raise (Failure "vm2.run:15")
                )
              | HCall (_,(_,_),(_,_)) ->
                (* let (y1,y2) = (sgn(),sgn()) in
                   let (kf1,kx1,kf2,kx2) = (get_k v f1,get_k *) raise (Failure "vm1.run:7")
              | Prd (r0,r1,r2,ps) ->
                let k0 = get_k_rcd v r1 in
                let r3 = reg v in
                set_k_rcd v r3 k0;
                set_k v r0 (Tkn_P(ps,r3,r2));
                run a np v cs
              | Clj (r0,r1,r2,p0) ->
                let k0 = get_k_rcd v r1 in
                let r3 = reg v in
                set_k_rcd v r3 k0;
                set_k v r0 (Tkn_Clj(p0,r3,r2));
                run a np v cs
              | Cns (r0,(r1,r2)) ->
                (* let (r3,r4) = (fresh v r1,fresh v r2) in *)
                let (r3,r4) = (r1,r2) in
                set_k v r0 (Tkn_Tns(r3,r4));
                run a np v cs
              | Ini_Sgn r0 ->
                set_k v r0 (Tkn_Sgn(sgn()));
                run a np v cs
              | Ini_Tkn (r0,k) ->
                set_k v r0 k;
                run a np v cs
              | Rpc ((r0,r1),r2) ->
                let k0 = get_k_rcd v r2 in
                set_k_rcd v r0 k0;
                set_k_rcd v r1 k0;
                run a np v cs
              | Spt((r1,r2),r3) ->
                let k0 = get_k v r3 in
                ( match k0 with
                  | Some Tkn_Tns(r4,r5) ->
                    let (k1,k2) = (get_k v r4,get_k v r5) in
                    ( match k1,k2 with
                      | Some k1,Some k2 ->
                        set_k v r1 k1; set_k v r2 k2;
                        run a np v cs
                      | _,_ -> raise (Failure "vm2.run:14"))
                  | _ -> raise (Failure "vm2.run:00")
                )
              | Axm(_,_) -> raise (Failure "vm2.run:01")
            )
        )
      | _ -> raise (Failure ("vm2.run:17"^(pnt_plc p)))
    ) *)
  let rec run a p v cs =
    (* Util.pnt true ("enter vm2.run:"^(pnt_plc p)^"\n"); *)
    let ox = asm_get a p in
    ( match ox with
      | Some x ->
        ( match x with
          | (Ret r0) ->
            (* Util.pnt true ("ret "^(pnt_reg r0)^"\n"); *)
            let k0 = get_k_rcd v r0 in
            ( match k0 with
              | Some k0 ->
                if (Stack.is_empty cs) then k0
                else
                  let hd = Stack.pop cs in
                  ( match hd with
                    | CS (p0,r1,v0) ->
                      set_k_rcd v0 r1 k0;
                      Reg.clear v;
                      run a p0 v0 cs
                    | CS_A (p0,r1) ->
                      set_k_rcd v r1 k0;
                      run a p0 v cs
                    | _ -> raise (Failure "vm1.run:0") )
              | None -> raise @@ Failure ("vm3.run:get_k_rcd:1")
            )
          | (Op (o0,np)) ->
            (* Util.pnt true ((print_op o0)^","^(pnt_plc np)^"\n"); *)
            ( match o0 with
              | Id (r1,r2) ->
                let k2 = get_k v r2 in
                ( match k2 with
                  | Some k2 ->
                    set_k v r1 k2;
                    run a np v cs
                  | None -> raise (Failure "vm2.run:10"))
              | Rm r0 ->
                let _ = get_k_rcd v r0 in
                run a np v cs
              | Agl (r0,r1,ps) ->
                let k1 = get_k v r1 in
                ( match k1 with
                  | Some Tkn_CoP (i,r3) ->
                    let k2 = get_k v r3 in
                    ( match k2 with
                      | Some k2 ->
                        set_k v r1 k2;
                        Stack.push (CS_A (np,r0)) cs;
                        run a ps.(i) v cs
                      | _ -> raise (Failure "vm2.run:11"))
                  | Some Tkn_Z z ->
                    if z=0 then
                      ( set_k v r1 Tkn_Unt;
                        Stack.push (CS_A (np,r0)) cs;
                        run a ps.(0) v cs )
                    else
                      ( set_k v r1 Tkn_Unt;
                        Stack.push (CS_A (np,r0)) cs;
                        run a ps.(1) v cs )
                  | _ -> raise (Failure "vm2:x0")
                )
              | Call (y,(f,x)) ->
                let k_f = get_k v f in
                ( match k_f with
                  | Some k_f ->
                    ( match k_f with
                      | Tkn_Pls ->
                        let k_xl = get_k_list v x in
                        ( match k_xl with
                          | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                            set_k v y (Tkn_Z (z1+z2));
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:2") )
                      | Tkn_Mlt ->
                        let k_xl = get_k_list v x in
                        ( match k_xl with
                          | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                            set_k v y (Tkn_Z (z1*z2));
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:3") )
                      | Tkn_Mns ->
                        let k = get_k v x in
                        ( match k with
                          | Some (Tkn_Z z1) ->
                            set_k v y (Tkn_Z (-z1));
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:2") )
                      | Tkn_Cmp ->
                        let k_xl = get_k_list v x in
                        ( match k_xl with
                          | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                            let b = if z1<=z2 then 1 else 0 in
                            set_k v y (Tkn_Z b);
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:2") )
                      | Tkn_Eq ->
                        let k_r = get_k_rcd v x in
                        ( match k_r with
                          | Some Rcd (x1::x2::[]) ->
                            if x1=x2 then
                              ( set_k v y (Tkn_Bol true);
                                run a np v cs)
                            else
                              ( set_k v y (Tkn_Bol false);
                                run a np v cs)
                          | _ -> raise (Failure "vm1.run:3"))
                      | Tkn_Inj b ->
                        let k0 = get_k v x in
                        ( match k0 with
                          | Some k0 ->
                            let r0 = reg v in
                            set_k v r0 k0;
                            set_k v y (Tkn_CoP (b,r0));
                            run a np v cs
                          | _ -> raise (Failure "vm1.run:13"))
                      | Tkn_Cho _ -> raise (Failure "vm1.run:4")
                      | Tkn_Fix -> raise (Failure "vm1.run:5")
                      | Tkn_Exn -> raise (Failure "vm1.run:6")
                      | Tkn_Fnc (p0,r0)->
                        let k0 = get_k_rcd v x in
                        ( match k0 with
                          | Some k0 ->
                            let v1 = Reg.copy v in
                            set_k_rcd v1 r0 k0;
                            Stack.push (CS(np,y,v)) cs;
                            (*
                            Util.pnt true ("call : "^(pnt_plc p0)^","^(pnt_reg r0)^","^
                                           (print_k_rcd k0)^"\n"); *)
                            run a p0 v1 cs
                          | None -> raise @@ Failure ("vm3.run:gkr:2"))
                      | Tkn_Clj (p0,r0,r1) ->
                        let k0 = get_k_rcd v x in
                        ( match k0 with
                          | Some k0 ->
                            let k1 = get_k_rcd v r0 in
                            ( match k1 with
                              | Some k1 ->
                                let v1 = st_ini () in
                                set_k_rcd v1 r1 (Rcd [k0;k1]);
                                Stack.push (CS(np,y,v)) cs;
                                run a p0 v1 cs
                              | None -> raise @@ Failure ("vm3.run:gkr:4"))
                          | _ -> raise @@ Failure ("vm3.run:gkr:3"))
                      | _ -> raise (Failure "vm2:run9")
                    )
                  | _ -> raise (Failure "vm2.run:15")
                )
              | HCall (_,(_,_),(_,_)) ->
                (* let (y1,y2) = (sgn(),sgn()) in
                   let (kf1,kx1,kf2,kx2) = (get_k v f1,get_k *) raise (Failure "vm1.run:7")
              | Prd (r0,r1,r2,ps) ->
                let k0 = get_k_rcd v r1 in
                ( match k0 with
                  | Some k0 -> let r3 = reg v in
                    set_k_rcd v r3 k0;
                    set_k v r0 (Tkn_P(ps,r3,r2));
                    run a np v cs
                  | None -> raise @@ Failure ("vm3.run:gkr:5"))
              | Clj (r0,r1,r2,p0) ->
                let k0 = get_k_rcd v r1 in
                ( match k0 with
                  | Some k0 ->
                    let r3 = reg v in
                    set_k_rcd v r3 k0;
                    set_k v r0 (Tkn_Clj(p0,r3,r2));
                    run a np v cs
                  | _ -> raise @@ Failure ("vm3.run:gkr:6"))
              | Cns (r0,(r1,r2)) ->
                (* let (r3,r4) = (fresh v r1,fresh v r2) in *)
                let (r3,r4) = (r1,r2) in
                set_k v r0 (Tkn_Tns(r3,r4));
                run a np v cs
              | Ini_Sgn r0 ->
                set_k v r0 (Tkn_Sgn(sgn()));
                run a np v cs
              | Ini_Tkn (r0,k) ->
                set_k v r0 k;
                run a np v cs
              | Rpc ((r0,r1),r2) ->
                let k0 = get_k_rcd v r2 in
                ( match k0 with
                  | Some k0 ->
                    set_k_rcd v r0 k0;
                    set_k_rcd v r1 k0;
                    run a np v cs
                  | _ -> raise @@ Failure ("vm3.run:gkr:7"))
              | Spt((r1,r2),r3) ->
                let k0 = get_k v r3 in
                ( match k0 with
                  | Some Tkn_Tns(r4,r5) ->
                    let (k1,k2) = (get_k v r4,get_k v r5) in
                    ( match k1,k2 with
                      | Some k1,Some k2 ->
                        set_k v r1 k1; set_k v r2 k2;
                        run a np v cs
                      | _,_ -> raise (Failure "vm2.run:14"))
                  | _ -> raise (Failure "vm2.run:00")
                )
              | Axm(_,_) -> raise (Failure "vm2.run:01")
            )
        )
      | _ -> raise (Failure ("vm2.run:17"^(pnt_plc p)))
    )
  type asm_of_code = asm * plc * reg * code_s * Sgn_Core.t
  (* asm * src-plc * root-reg * src-code * src-start-ptr *)
  let rec asm_of_code tb a p0 rv r0 c v0 =
    (* Util.pnt true (
       "enter asm_of_code"^
       (print_asm a)^","^
       (pnt_plc p0)^","^(pnt_reg r0)^"\n");*)
    let _ = Core.Hashtbl.add tb ~key:v0 ~data:(p0,r0) in
    let f0 = get_code c v0 in
    ( match f0 with
      | V_S (v1,v2) ->
        let pm0 = asm_of_code tb a p0 rv r0 c v1 in
        (* Util.pnt true (print_asm a); *)
        let o1 = Core.Hashtbl.find a pm0 in
        ( match o1 with
          | Some Ret r1 ->
            Core.Hashtbl.remove a pm0;
            let pm1 = asm_of_code tb a (Plc pm0) rv r1 c v2 in
            pm1
          | _ -> raise (Failure ("vm2:a0:"^(pnt_plc (Plc pm0)))))
      | H_S (_,_) -> raise (Failure "vm2:a1")
      | E_S n1 ->
        let (p1,r2,_) = asm_of_tns_tl tb a p0 rv r0 c n1 in
        let _ = asm_add a p1 (Ret r2) in
        (plc_to p1)
      | P_S (_,_) -> raise (Failure "vm2:a2")
      | A_S (n1,l) ->
        (* Util.pnt true "vm2:d1\n"; *)
        let (p1,r1,ra) = asm_of_tns_tl tb a p0 rv r0 c n1 in
        ( match ra with
          | Some ra ->
            (* Util.pnt true "vm2:d0\n"; *)
            let ps = List.map (fun _ -> plc ()) l in
            let pa = Array.of_list ps in
            let r2 = Reg.ini_k rv Tkn_Unt in
            let np = plc () in
            let _ = asm_add a p1 (Op(Agl(r2,ra,pa),np)) in
            let lp = List.combine ps l in
            let _ = List.map (fun (pf,f) -> asm_of_code tb a pf rv r1 c f) lp in
            let _ = asm_add a np (Ret r2) in
            (plc_to np)
          | _ -> raise (Failure "vm2:a3")
        )
      | F_S (_,_,_) -> raise (Failure "vm2:a4")
    )
  and asm_of_tns_tl tb a p0 rv r0 c n0 =
    (*   Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n"); *)
    ( match !n0 with
      | PL_x n1 ->
        let (np0,rr,_) = asm_of_tns_tl tb a p0 rv r0 c n1 in
        let r1 = reg rv in
        let r2 = reg rv in
        let (np1,np2) = (plc (),plc ()) in
        let _ = asm_add a np0 (Op(Spt((r1,r2),rr),np1)) in
        let _ = asm_add a np1 (Op(Rm r2,np2)) in
        (np2,r1,None)
      | PR_x n1 ->
        let (np0,rr,_) = asm_of_tns_tl tb a p0 rv r0 c n1 in
        let r1 = reg rv in
        let r2 = reg rv in
        let (np1,np2) = (plc (),plc ()) in
        let _ = asm_add a np0 (Op(Spt((r1,r2),rr),np1)) in
        let _ = asm_add a np1 (Op(Rm r1,np2)) in
        (np2,r2,None)
      | Inj_x i ->
        let r1 = reg rv in
        let np0 = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Inj i),np0)) in
        (np0,r1,None)
      | Cho_x i ->
        let r1 = reg rv in
        let np0 = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Cho i),np0)) in
        (np0,r1,None)
      | Agl_x n1 ->
        let (p1,r2,_) = asm_of_tns_tl tb a p0 rv r0 c n1 in
        (p1,r2,Some r2)
      | Rot_x ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Id(r1,r0),np)) in
        (* Util.pnt true "test0\n"; *)
        (np,r1,None)
      | Unt_x ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Unt),np)) in
        (np,r1,None)
      | Plg_x q1 when q1=nd_pls ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Pls),np)) in
        (np,r1,None)
      | Plg_x q1 when q1=nd_mlt ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Mlt),np)) in
        (np,r1,None)
      | Plg_x q1 when q1=nd_mns ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Mns),np)) in
        (np,r1,None)
      | Plg_x q1 when q1=nd_std_le ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Cmp),np)) in
        (np,r1,None)
      | Plg_x q1 when q1=nd_eq ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Eq),np)) in
        (np,r1,None)
      | Plg_x q1 ->
        let r1 = reg rv in
        let np = plc () in
        ( try
            let (p2,r2) =
              ( match Core.Hashtbl.find tb q1 with
                | Some (p2,r2) -> (p2,r2)
                | _ -> raise (Failure "vm2.asm_of_tns_tl:0")) in
            let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Fnc(p2,r2)),np)) in
            (np,r1,None)
          with _ ->
            let p2 = plc () in
            let r2 = reg rv in
            let _ = asm_of_code tb a p2 rv r2 c q1 in
            let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Fnc(p2,r2)),np)) in
            (np,r1,None))
      | Z_x z ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Z z),np)) in
        (np,r1,None)
      | Stg_x s ->
        let r1 = reg rv in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Stg s),np)) in
        (np,r1,None)
      | TnsT (n1,n2) ->
        let (r0_0,r0_1,p0x) = (reg rv,reg rv,plc ()) in
        let _ = asm_add a p0 (Op(Rpc((r0_0,r0_1),r0),p0x)) in
        let (np1,nr1,o1) = asm_of_tns_tl tb a p0x rv r0_0 c n1 in
        let (np2,nr2,o2) = asm_of_tns_tl tb a np1 rv r0_1 c n2 in
        let o3 =
          ( match o1,o2 with
            | Some ro ,_ -> Some ro
            | _, Some ro -> Some ro
            | _,_ -> None ) in
        let p3 = plc () in
        let r4 = reg rv in
        let _ = asm_add a np2 (Op(Cns(r4,(nr1,nr2)),p3)) in
        (p3,r4,o3)
    (*
      let (p1,r1) = (sgn (),sgn ()) in
      let (np1,nr1,o1) = asm_of_tns_tl tb a p1 r1 c n1 in
      let (p2,r2) = (sgn (),sgn ()) in
      let (np2,nr2,o2) = asm_of_tns_tl tb a p2 r2 c n2 in
      let o3 =
        ( match o1,o2 with
          | Some ro ,_ -> Some ro
          | _, Some ro -> Some ro
          | _,_ -> None ) in
      let p3 = sgn () in
      let p4 = sgn () in
      let (r3,r4,r5) = (sgn (),sgn (),sgn ()) in
      asm_add a p0 (Op(Rpc((r3,r4),r0),p3));
      asm_add a p3
        (Op(
            HCall(r5,(Im(Tkn_Fnc(np1,nr1)),r3),(Im(Tkn_Fnc(np2,nr2)),r4)),
            p4));
      (p4,r5,o3) *)
      | AppT (n1,n2) ->
        let (r0_0,r0_1,p0x) = (reg rv,reg rv,plc ()) in
        let _ = asm_add a p0 (Op(Rpc((r0_0,r0_1),r0),p0x)) in
        let (np1,nr1,_) = asm_of_tns_tl tb a p0x rv r0_0 c n1 in
        let (np2,nr2,_) = asm_of_tns_tl tb a np1 rv r0_1 c n2 in
        let p3 = plc () in
        let r4 = reg rv in
        let _ = asm_add a np2 (Op(Call(r4,(nr1,nr2)),p3)) in
        (p3,r4,None)
    )
  let rec k_rcd_of_tkn_s tb v =
    ( match v with
      | TknS_Stg s -> Atm (Tkn_Stg s)
      | TknS_Z z -> Atm (Tkn_Z z)
      | TknS_Plg q1 when q1=nd_pls -> Atm Tkn_Pls
      | TknS_Plg q1 when q1=nd_mlt -> Atm Tkn_Mlt
      | TknS_Plg q1 when q1=nd_mns -> Atm Tkn_Mns
      | TknS_Plg q1 when q1=nd_std_le -> Atm Tkn_Cmp
      | TknS_Plg q1 when q1=nd_eq -> Atm Tkn_Eq
      | TknS_Plg q1 ->
        let (p2,r2) =
          ( match Core.Hashtbl.find tb q1 with
            | Some x -> x
            | _ -> raise (Failure "vm2.k_rcd_of_tkn_s")) in
        Atm (Tkn_Fnc(p2,r2))
      | TknS_Unt -> Rcd []
      | TknS_Inj i -> Atm (Tkn_Inj i)
      | TknS_Cho i -> Atm (Tkn_Cho i)
      | TknS_Tns (v1,v2) ->
        let k1 = k_rcd_of_tkn_s tb v1 in
        let k2 = k_rcd_of_tkn_s tb v2 in
        ( match k2 with
          | Rcd l ->
            Rcd (k1::l)
          | _ -> raise (Failure "vm2:s9"))
    )
  let rec tkn_s_of_k tb v r =
    ( match get_k v r with
      | Some x ->
        ( match x with
          | Tkn_Unt -> TknS_Unt
          | Tkn_Stg s -> TknS_Stg s
          | Tkn_Z z -> TknS_Z z
          | Tkn_Bol b -> TknS_Z (if b then 1 else 0)
          | Tkn_Sgn p -> TknS_Plg p
          | Tkn_Ln r1 -> tkn_s_of_k tb v r1
          | Tkn_Tns (r1,r2) -> TknS_Tns(tkn_s_of_k tb v r1,tkn_s_of_k tb v r2)
          | Tkn_CoP (i,r1) -> TknS_Tns(TknS_Inj i,tkn_s_of_k tb v r1)
          | Tkn_P (_,_,_) -> raise (Failure "vm2:sk0")
          | Tkn_Pls -> TknS_Plg nd_pls
          | Tkn_Mlt -> TknS_Plg nd_mlt
          | Tkn_Mns -> TknS_Plg nd_mns
          | Tkn_Cmp -> TknS_Plg nd_std_le
          | Tkn_Eq -> TknS_Plg nd_eq
          | Tkn_Inj i -> TknS_Inj i
          | Tkn_Cho i -> TknS_Cho i
          | Tkn_Fix -> raise (Failure "vm2:sk1")
          | Tkn_Exn -> raise (Failure "vm2:sk2")
          | Tkn_Fnc (_,_) -> TknS_Stg "Fnc"
          | Tkn_Clj (_,_,_) -> TknS_Stg "Clj"
        )
      | _ -> raise (Failure "vm2:sk3")
    )
end
module Vm3 = Vm(Reg_Sgn)
module Vm_Int = Vm(Reg_Int)
module Vm_F = Vm(Reg_SgnA)(*
let asm1_of_asm2 tb vt a1 p1 a2 p2 =
  let o = get_asm a1 p2 in
  ( match o with
    | Id (r1,r2) ->

  | Rm of reg
  | Clj of reg * reg * reg * plc (* f * (src0 * src1 * f-ptr) *)
  | Prd of reg * reg * reg * (plc array)
  | Agl of reg * reg * (plc array)
  | Spt of (reg * reg) * reg
  | Rpc of (reg * reg) * reg
  | Cns of reg * (reg * reg)
  | Call of reg * (reg * reg) (* y <- f ◂ x *)
  | HCall of reg * (src * reg) * (src * reg) (* y <- (0f◂x0) (f1◂x1) *)
  | Ini_Tkn of reg * tkn
  | Ini_Sgn of reg
  | Axm of (reg list) * (reg list)
*)
