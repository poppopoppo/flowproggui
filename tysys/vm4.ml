let dbg = true
open Types
type reg = int
type plc = Plc of Sgn.t
type ptr = Ptr_Reg of reg | Ptr_Hp of Sgn.t
and tkn =
  | Tkn_Unt
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_Ln of Sgn.t
  | Tkn_Tns of ptr * ptr
  | Tkn_CoP of int * ptr
  | Tkn_P of (plc array) * ptr * ptr
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
  | Tkn_Clj of plc * ptr * reg (* jmp_ptr arg0 { arg0 x } *)
type rcd_tkn =
  | Rcd of rcd_tkn list
  | Atm of tkn
type hp = (tkn * int) SgnHash.t
type vct = (tkn option) BatDynArray.t
type st = vct * hp
type st_h = (reg * tkn) list
type gst = st * (cs Stack.t)
and cs =
  | CS of plc * reg * st_h (* return-plc * return-reg *)
  | CS_A of plc * reg
  | CS_L of plc * reg * st_h * (tkn option S_Ref.t)
  | CS_R of plc * reg * st_h * (tkn option S_Ref.t)
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
type asm = (Sgn.t, pt) Core.Hashtbl.t
and pt =
  | Ret of reg
  | Op of op * plc
let plc () = Plc (sgn())
let plc_to p = ( match p with | Plc p -> p )
let pnt_reg r = "r"^(string_of_int r)
let print o =
  ( match !o with
    | None -> "_"
    | Some i -> "ri"^(string_of_int i))
let print_ptr p =
  ( match p with
    | Ptr_Reg r -> pnt_reg r
    | Ptr_Hp p -> "l"^(Sgn.print p))
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
    | Plc p -> "p"^(Sgn.print p))
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
    | Tkn_Sgn p -> "&"^(Sgn.print p)
    | Tkn_Ln p -> "l"^(Sgn.print p)
    | Tkn_Tns (p1,p2) -> "<"^(print_ptr p1)^"¦"^(print_ptr p2)^">"
    | Tkn_CoP (i,p0) -> "∠["^(string_of_int i)^","^(print_ptr p0)^"]"
    | Tkn_P (_,p0,p1) -> "\\["^(print_ptr p0)^","^(print_ptr p1)^"]"
    | Tkn_Pls -> "+"
    | Tkn_Mlt  -> "*"
    | Tkn_Mns -> "-"
    | Tkn_Cmp -> "<="
    | Tkn_Eq -> "="
    | Tkn_Inj i -> "∠["^(string_of_int i)^"]"
    | Tkn_Cho i -> "\\["^(string_of_int i)^"]"
    | Tkn_Fix -> "@"
    | Tkn_Exn -> "?"
    | Tkn_Fnc (t1,r1) -> "→["^(pnt_plc t1)^","^(pnt_reg r1)^"]"
    | Tkn_Clj (_,_,_) -> "tkn-clj"
  )
let rec print_k_rcd k =
  ( match k with
    | Rcd l -> "{ "^(Util.string_of_list " " print_k_rcd l)^" }"
    | Atm a -> print_k a )
let print_st (v,h) =
  let s =
    BatDynArray.fold_left
      (fun s o ->
         ( match o with
           | None -> s^" _"
           | Some k -> s^" "^(print_k k)))
      "⟦" v in
  let sh =
    SgnHash.fold
      (fun p (k,n) sh ->
         sh^("("^(string_of_int n)^") l"^(Sgn.print p)^"~"^(print_k k)))
      h "" in
  s^" ⟧ , { "^sh^" }"
let len v = BatDynArray.length v
let min v =
  ( try
      let i = BatDynArray.index_of (fun b -> b=None) v in
      i
    with _ -> len v)
let rec set_k_p (v,h) p k =
  (* Util.pnt true ("enter set_k_p:"^(print_st (v,h))^
                 (print_ptr p)^","^(print_k k)^"\n"); *)
  ( match p with
    | Ptr_Reg r -> set_k_r v r k
    | Ptr_Hp p -> set_k_h h p k )
and set_k_r v r k =
  let (m,l) = (min v,len v) in
  if r<l then
    ( match BatDynArray.get v r with
      | None ->
        BatDynArray.set v r (Some k)
      | Some k1 ->
        let s = ("set_k_r 0:"
                 ^(pnt_reg r)^","^(print_k k)^","^(print_k k1)) in
        (* Util.pnt dbg (s^"\n"); *)
        raise (Failure s))
  else (raise @@ Failure "set_k_r:i")
(* )(BatDynArray.add v None; set_k_r v r k) *)
and set_k_h h p k =
  if SgnHash.mem h p then raise (Failure "set_k_h 0")
  else
    SgnHash.add h p (k,1)
let rec add_k_r v (k:tkn) : reg =
  let (m,l) = (min v,len v) in
  if m<l then
    (BatDynArray.set v m (Some k); m)
  else (BatDynArray.add v None; add_k_r v k)
let add_k_h h k =
  let p = sgn () in
  SgnHash.add h p (k,1);
  p
let rec get_k_r v i =
  if i<(len v) then
    let k = BatDynArray.get v i in
    let _ = BatDynArray.set v i None in
    k
  else (BatDynArray.add v None; get_k_r v i)
let rec get_k_h h l =
  ( try
      let (k,n) = SgnHash.find h l in
      if n=1 then
        ( SgnHash.remove h l;
          Some k )
      else
        ( SgnHash.replace h l (k,n-1);
          Some k )
    with _ -> None )
let get_k_p (v,h) p =
  ( match p with
    | Ptr_Reg r -> get_k_r v r
    | Ptr_Hp p -> get_k_h h p )
let rec free ((v,h):st) (p:ptr) =
  (* Util.pnt true ("enter vm4.free :"^(print_st (v,h))^","^(print_ptr p)^"\n"); *)
  ( match p with
    | Ptr_Reg r -> free_r (v,h) r
    | Ptr_Hp p -> free_h (v,h) p )
and free_r (v,h) r =
  ( match get_k_r v r with
    | None -> None
    | Some Tkn_Unt -> Some (Rcd [])
    | Some Tkn_Ln p ->
      free (v,h) (Ptr_Hp p)
    | Some (Tkn_Tns(p1,p2)) ->
      let k1 = free (v,h) p1 in
      let k2 = free (v,h) p2 in
      ( match k1,k2 with
        | Some k1,Some Rcd l -> Some (Rcd (k1::l))
        | Some k1,Some k2 ->
          raise (Failure (
              "vm4 0:0:"^(print_st (v,h))^","^(pnt_reg r)^","^
              (print_k_rcd k1)^","^(print_k_rcd k2)))
        | _,_ ->
          raise (Failure (
              "vm4 0:1:"^(print_st (v,h))^","^(pnt_reg r))))
    | Some x -> Some (Atm x) )
and free_h (v,h) p =
  let k = get_k_h h p in
  ( match k with
    | None -> None
    | Some Tkn_Unt -> Some (Rcd [])
    | Some Tkn_Ln p ->
      free (v,h) (Ptr_Hp p)
    | Some (Tkn_Tns(p1,p2)) ->
      let (k1,k2) = (free (v,h) p1,free (v,h) p2) in
      ( match k1,k2 with
        | Some k1,Some Rcd l -> Some (Rcd (k1::l))
        | _,_ -> raise (Failure (
            "vm4 0.1"^(print_st (v,h))^","^(Sgn.print p))))
    | Some x -> Some (Atm x) )
let rec add_k_rcd_r (v,h) s =
  ( match s with
    | Atm a ->
      add_k_r v a
    | Rcd l ->
      let l0 = add_k_h h Tkn_Unt in
      let ls =
        List.fold_right
          (fun k l0 ->
             let l1 = add_k_rcd_h h k in
             let l2 = add_k_h h (Tkn_Tns(Ptr_Hp l1,Ptr_Hp l0)) in
             l2 )
          l l0 in
      let rs = add_k_r v (Tkn_Ln ls) in
      rs
  )
and add_k_rcd_h h s =
  ( match s with
    | Atm a ->
      add_k_h h a
    | Rcd l ->
      let l0 = add_k_h h Tkn_Unt in
      let ls =
        List.fold_right
          (fun k l0 ->
             let l1 = add_k_rcd_h h k in
             let l2 = add_k_h h (Tkn_Tns(Ptr_Hp l1,Ptr_Hp l0)) in
             l2 )
          l l0 in
      ls
  )
let rec set_k_rcd_h (v,h) l k =
  ( match k with
    | Atm a ->
      ( try set_k_h h l a with _ -> raise (Failure "set_k_rcd_r 0:"))
    | Rcd w ->
      let l0 = add_k_h h Tkn_Unt in
      let ls =
        List.fold_right
          (fun k l0 ->
             let l1 = add_k_rcd_h h k in
             let l2 = add_k_h h (Tkn_Tns(Ptr_Hp l1,Ptr_Hp l0)) in
             l2 )
          w l0 in
      let k1 = get_k_h h ls in
      ( match k1 with
        | Some k1 ->
          let _ = set_k_h h l k1 in
          ()
        | None -> raise (Failure "set_k_rcd_h 0"))
  )
and set_k_rcd_r (v,h) r k =
  (* Util.pnt true ("enter set_k_rcd_r:"^(print_st (v,h))^
                 ","^(pnt_reg r)^","^(print_k_rcd k^"\n")); *)
  ( match k with
    | Atm a ->
      ( try set_k_r v r a with _ -> raise (Failure "set_k_rcd_r 0:"))
    | Rcd l ->
      let _ =
        ( try set_k_r v r Tkn_Unt
          with _->
            Util.pnt true ("enter set_k_rcd_r:"^(print_st (v,h))^
                           ","^(pnt_reg r)^","^(print_k_rcd k^"\n"));
            raise (Failure ("set_k_rcd_r 1"))) in
      let l0 = add_k_h h Tkn_Unt in
      let ls =
        List.fold_right
          (fun k l0 ->
             let l1 = add_k_rcd_h h k in
             let l2 = add_k_h h (Tkn_Tns(Ptr_Hp l1,Ptr_Hp l0)) in
             l2 )
          l l0 in
      let _ = get_k_r v r in
      let _ = set_k_r v r (Tkn_Ln ls) in
      ()
  )
and set_k_rcd_p (v,h) p =
  ( match p with
    | Ptr_Reg r -> set_k_rcd_r (v,h) r
    | Ptr_Hp l -> set_k_rcd_h (v,h) l )
let set_list_r v l =
  List.fold_left
    ( fun _ (r,k) ->
        set_k_r v r k )
    () l
let to_list v =
  let (_,l) =
    BatDynArray.fold_left
      (fun (i,l) o ->
         ( match o with
           | None -> (i+1,l)
           | Some k -> BatDynArray.set v i None; (i+1,(i,k)::l)))
      (0,[]) v in
  l
let free_v (v,h) =
  let _ =
    BatDynArray.fold_left
      (fun i o ->
         BatDynArray.set v i None;
         ( match o with
           | Some Tkn_Ln l ->
             let _ = free_h (v,h) l in
             i+1
           | Some (Tkn_Tns(p1,p2)) ->
             let _ = (
               ( match p2 with
                 | Ptr_Hp l1 ->
                   let _ = free_h (v,h) l1 in
                   ()
                 | _ -> ()),
               ( match p2 with
                 | Ptr_Hp l2 ->
                   let _ = free_h (v,h) l2 in
                   ()
                 | _ -> ())
             ) in
             i+1
           | _ -> i+1
         ))
      0 v in
  ()
let rec ln h l =
  if SgnHash.mem h l
  then
    let (k,n) = SgnHash.find h l in
    SgnHash.replace h l (k,n+1);
    ( match k with
      | Tkn_Ln l1 ->
        ln h l1
      | Tkn_Tns (p1,p2) ->
        ( match p1 with
          | Ptr_Hp l1 -> ln h l1
          | _ -> () );
        ( match p2 with
          | Ptr_Hp l2 -> ln h l2
          | _ -> ())
      | _ -> ())
  else raise (Failure "ln 0:")
let src a s =
  ( match s with
    | Src_Reg r -> get_k_r a r
    | Im k -> Some k )
let st_ini () = (BatDynArray.create (),SgnHash.create 10)
let st_mk i = (BatDynArray.init i (fun _ -> None),SgnHash.create 10)
let asm_ini () = Core.Hashtbl.create (module Sgn)
let asm_add a p o = Core.Hashtbl.add a ~key:(plc_to p) ~data:o
let asm_get a p = Core.Hashtbl.find a (plc_to p)
let rec run a p (v,h) cs =
  Util.pnt dbg ("enter vm2.run:"^(pnt_plc p)^","^(print_st (v,h))^"\n");
  let ox = asm_get a p in
  ( match ox with
    | Some x ->
      ( match x with
        | (Ret r0) ->
          (* Util.pnt dbg ("ret "^(pnt_reg r0)^"\n"); *)
          let k0 = free_r (v,h) r0 in
          let _ = free_v (v,h) in
          ( match k0 with
            | Some k0 ->
              if (Stack.is_empty cs) then k0
              else
                let hd = Stack.pop cs in
                ( match hd with
                  | CS (p0,r1,l) ->
                    set_list_r v l;
                    let _ = set_k_rcd_r (v,h) r1 k0 in
                    run a p0 (v,h) cs
                  | CS_A (p0,r1) ->
                    let _ = set_k_rcd_r (v,h) r1 k0 in
                    run a p0 (v,h) cs
                  | _ -> raise (Failure "vm1.run:0") )
            | None -> raise @@ Failure ("vm3.run:get_k_rcd:1")
          )
        | (Op (o0,np)) ->
          Util.pnt dbg ((print_op o0)^","^(pnt_plc np)^"\n");
          ( match o0 with
            | Id (r1,r2) ->
              let k2 = free_r (v,h) r2 in
              ( match k2 with
                | Some k2 ->
                  let _ = set_k_rcd_r (v,h) r1 k2 in
                  run a np (v,h) cs
                | None -> raise (Failure "vm2.run:10"))
            | Rm r0 ->
              let _ = free_r (v,h) r0 in
              run a np (v,h) cs
            | Agl (r0,r1,ps) ->
              let k1 = get_k_r v r1 in
              ( match k1 with
                | Some Tkn_CoP (i,p3) ->
                  let k2 = get_k_p (v,h) p3 in
                  ( match k2 with
                    | Some k2 ->
                      let _ = set_k_r v r1 k2 in
                      Stack.push (CS_A (np,r0)) cs;
                      run a ps.(i) (v,h) cs
                    | _ -> raise (Failure "vm2.run:11"))
                | Some Tkn_Z z ->
                  if z=0 then
                    ( let _ = set_k_r v r1 Tkn_Unt in
                      Stack.push (CS_A (np,r0)) cs;
                      run a ps.(0) (v,h) cs )
                  else
                    ( let _ = set_k_r v r1 Tkn_Unt in
                      Stack.push (CS_A (np,r0)) cs;
                      run a ps.(1) (v,h) cs )
                | _ -> raise (Failure "vm2:x0")
              )
            | Call (y,(f,x)) ->
              let k_f = get_k_r v f in
              ( match k_f with
                | Some k_f ->
                  ( match k_f with
                    | Tkn_Pls ->
                      let k_xl = free_r (v,h) x in
                      ( match k_xl with
                        | Some Rcd ((Atm Tkn_Z z1)::(Atm Tkn_Z z2)::[]) ->
                          let _ = set_k_r v y (Tkn_Z (z1+z2)) in
                          run a np (v,h) cs
                        | _ -> raise (Failure "vm1.run:2") )
                    | Tkn_Mlt ->
                      let k_xl = free_r (v,h) x in
                      ( match k_xl with
                        | Some Rcd  ((Atm Tkn_Z z1)::(Atm Tkn_Z z2)::[]) ->
                          let _ = set_k_r v y (Tkn_Z (z1*z2)) in
                          run a np (v,h) cs
                        | _ -> raise (Failure "vm1.run:3") )
                    | Tkn_Mns ->
                      let k = get_k_r v x in
                      ( match k with
                        | Some (Tkn_Z z1) ->
                          let _ = set_k_r v y (Tkn_Z (-z1)) in
                          run a np (v,h) cs
                        | _ -> raise (Failure "vm1.run:2") )
                    | Tkn_Cmp ->
                      let k_xl = free_r (v,h) x in
                      ( match k_xl with
                        | Some Rcd ((Atm Tkn_Z z1)::(Atm Tkn_Z z2)::[]) ->
                          let b = if z1<=z2 then 1 else 0 in
                          let _ = set_k_r v y (Tkn_Z b) in
                          run a np (v,h) cs
                        | _ -> raise (Failure "vm1.run:2") )
                    | Tkn_Eq ->
                      let k_r = free_r (v,h) x in
                      ( match k_r with
                        | Some Rcd (x1::x2::[]) ->
                          if x1=x2 then
                            ( let _ = set_k_r v y (Tkn_Bol true) in
                              run a np (v,h) cs)
                          else
                            ( let _ = set_k_r v y (Tkn_Bol false) in
                              run a np (v,h) cs)
                        | _ -> raise (Failure "vm1.run:3"))
                    | Tkn_Inj b ->
                      let k0 = get_k_r v x in
                      ( match k0 with
                        | Some k0 ->
                          let r0 = add_k_r v k0 in
                          let _ = set_k_r v y (Tkn_CoP (b,Ptr_Reg r0)) in
                          run a np (v,h) cs
                        | _ -> raise (Failure "vm1.run:13"))
                    | Tkn_Cho _ -> raise (Failure "vm1.run:4")
                    | Tkn_Fix -> raise (Failure "vm1.run:5")
                    | Tkn_Exn -> raise (Failure "vm1.run:6")
                    | Tkn_Fnc (t0,r0)->
                      let k0 = free_r (v,h) x in
                      ( match k0 with
                        | Some k0 ->
                          let l = to_list v in
                          (* let _ = free_v (v,h) in *)
                          let _ = set_k_rcd_r (v,h) r0 k0 in
                          Stack.push (CS(np,y,l)) cs;
                          (* Util.pnt dbg ("call : "^(pnt_plc t0)^","
                                         ^(pnt_reg r0)^","^
                                         (print_k_rcd k0)^"\n"); *)
                          run a t0 (v,h) cs
                        | None -> raise @@ Failure ("vm3.run:gkr:2"))
                    | Tkn_Clj (t0,p0,r1) ->
                      let k0 = free_r (v,h) x in
                      ( match k0 with
                        | Some k0 ->
                          let k1 = free (v,h) p0 in
                          ( match k1 with
                            | Some k1 ->
                              let l = to_list v in
                              (* let _ = free_v (v,h) in *)
                              let _ = set_k_rcd_r (v,h) r1 (Rcd [k0;k1]) in
                              Stack.push (CS(np,y,l)) cs;
                              run a t0 (v,h) cs
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
              let k0 = free_r (v,h) r1 in
              ( match k0 with
                | Some k0 ->
                  let l3 = add_k_rcd_h h k0 in
                  let _ = set_k_r v r0 (Tkn_P(ps,Ptr_Hp l3,Ptr_Reg r2)) in
                  run a np (v,h) cs
                | None -> raise @@ Failure ("vm3.run:gkr:5"))
            | Clj (r0,r1,r2,p0) ->
              let k0 = free_r (v,h) r1 in
              ( match k0 with
                | Some k0 ->
                  let l3 = add_k_rcd_h h k0 in
                  let _ = set_k_r v r0 (Tkn_Clj(p0,Ptr_Hp l3,r2)) in
                  run a np (v,h) cs
                | _ -> raise @@ Failure ("vm3.run:gkr:6"))
            | Cns (r0,(r1,r2)) ->
              let _ = set_k_r v r0 (Tkn_Tns(Ptr_Reg r1,Ptr_Reg r2)) in
              run a np (v,h) cs
            | Ini_Sgn r0 ->
              let _ = set_k_r v r0 (Tkn_Sgn(sgn())) in
              run a np (v,h) cs
            | Ini_Tkn (r0,k) ->
              let _ = set_k_r v r0 k in
              run a np (v,h) cs
            | Rpc ((r0,r1),r2) ->
              let k0 = free_r (v,h) r2 in
              ( match k0 with
                | Some k0 ->
                  let l0 = add_k_rcd_h h k0 in
                  let _ = ln h l0 in
                  let _ = set_k_r v r0 (Tkn_Ln l0) in
                  let _ = set_k_r v r1 (Tkn_Ln l0) in
                  run a np (v,h) cs
                | _ ->
                  (* Util.pnt dbg ("enter vm2.run:"^(pnt_plc p)^","^(print_st (v,h))^"\n"); *)
                  raise @@ Failure ("vm3.run:gkr:7"))
            | Spt((r1,r2),r3) ->
              let k0 = get_k_r v r3 in
              let rec spt k0 =
                ( match k0 with
                  | Some Tkn_Tns(p4,p5) ->
                    let k1 = free (v,h) p4 in
                    let k2 = free (v,h) p5 in
                    ( match k1,k2 with
                      | Some k1,Some k2 ->
                        let _ = set_k_rcd_r (v,h) r1 k1 in
                        let _ = set_k_rcd_r (v,h) r2 k2 in
                        ()
                      | _,_ -> raise (Failure "vm2.run:14"))
                  | Some Tkn_Ln l1 ->
                    let k1 = get_k_h h l1 in
                    spt k1
                  | _ -> raise (Failure "vm2.run:00")
                ) in
              spt k0;
              run a np (v,h) cs
            | Axm(_,_) -> raise (Failure "vm2.run:01")
          )
      )
    | _ -> raise (Failure ("vm2.run:17"^(pnt_plc p)))
  )
let rec asm_of_code tb a p0 (rv,rh) r0 c v0 =
  (* Util.pnt true (
     "enter asm_of_code"^
     (print_asm a)^","^
     (pnt_plc p0)^","^(pnt_reg r0)^"\n"); *)
  let _ = Core.Hashtbl.add tb ~key:v0 ~data:(p0,r0) in
  let f0 = get_code c v0 in
  ( match f0 with
    | V_S (v1,v2) ->
      let pm0 = asm_of_code tb a p0 (rv,rh) r0 c v1 in
      (* Util.pnt true (print_asm a); *)
      let o1 = Core.Hashtbl.find a pm0 in
      ( match o1 with
        | Some Ret r1 ->
          Core.Hashtbl.remove a pm0;
          let pm1 = asm_of_code tb a (Plc pm0) (rv,rh) r1 c v2 in
          pm1
        | _ -> raise (Failure ("vm2:a0:"^(pnt_plc (Plc pm0)))))
    | H_S (_,_) -> raise (Failure "vm2:a1")
    | E_S n1 ->
      let (p1,r2,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      (* Util.pnt true "test1\n"; *)
      let _ = asm_add a p1 (Ret r2) in
      (plc_to p1)
    | P_S (_,_) -> raise (Failure "vm2:a2")
    | A_S (n1,l) ->
      (* Util.pnt true "vm2:d1\n"; *)
      let (p1,r1,ra) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      ( match ra with
        | Some ra ->
          (* Util.pnt true "vm2:d0\n"; *)
          let ps = List.map (fun _ -> plc ()) l in
          let pa = Array.of_list ps in
          let r2 = add_k_r rv Tkn_Unt in
          let np = plc () in
          let _ = asm_add a p1 (Op(Agl(r2,ra,pa),np)) in
          let lp = List.combine ps l in
          let _ = List.map (fun (pf,f) -> asm_of_code tb a pf (rv,rh) r1 c f) lp in
          let _ = asm_add a np (Ret r2) in
          (plc_to np)
        | _ -> raise (Failure "vm2:a3")
      )
    | F_S (_,_,_) -> raise (Failure "vm2:a4")
  )
and asm_of_tns_tl tb a p0 (rv,rh) r0 c n0 =
  (* Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n"); *)
  ( match !n0 with
    | PL_x n1 ->
      let (np0,rr,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      let r1 = add_k_r rv Tkn_Unt in
      let r2 = add_k_r rv Tkn_Unt in
      let (np1,np2) = (plc (),plc ()) in
      let _ = asm_add a np0 (Op(Spt((r1,r2),rr),np1)) in
      let _ = free_r (rv,rh) rr in
      let _ = asm_add a np1 (Op(Rm r2,np2)) in
      let _ = free_r (rv,rh) r2 in
      (np2,r1,None)
    | PR_x n1 ->
      let (np0,rr,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      let r1 = add_k_r rv Tkn_Unt in
      let r2 = add_k_r rv Tkn_Unt in
      let (np1,np2) = (plc (),plc ()) in
      let _ = asm_add a np0 (Op(Spt((r1,r2),rr),np1)) in
      let _ = free_r (rv,rh) rr in
      let _ = asm_add a np1 (Op(Rm r1,np2)) in
      let _ = free_r (rv,rh) r1 in
      (np2,r2,None)
    | Inj_x i ->
      let r1 = add_k_r rv Tkn_Unt in
      let np0 = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Inj i),np0)) in
      (np0,r1,None)
    | Cho_x i ->
      let r1 = add_k_r rv Tkn_Unt in
      let np0 = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Cho i),np0)) in
      (np0,r1,None)
    | Agl_x n1 ->
      let (p1,r2,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      (p1,r2,Some r2)
    | Rot_x ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Id(r1,r0),np)) in
      let _ = free_r (rv,rh) r0 in
      (* Util.pnt true "test0\n"; *)
      (np,r1,None)
    | Unt_x ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Unt),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_pls ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Pls),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_mlt ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Mlt),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_mns ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Mns),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_std_le ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Cmp),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_eq ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Eq),np)) in
      (np,r1,None)
    | Plg_x q1 ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      ( try
          let (t2,r2) =
            ( match Core.Hashtbl.find tb q1 with
              | Some (p2,r2) -> (p2,r2)
              | _ -> raise (Failure "vm2.asm_of_tns_tl:0")) in
          let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Fnc(t2,r2)),np)) in
          (np,r1,None)
        with _ ->
          let p2 = plc () in
          (* let r2 = add_k_r rv Tkn_Unt in*)
          let vl = to_list rv in
          let _ = set_k_r rv 0 Tkn_Unt in
          let _ = asm_of_code tb a p2 (rv,rh) 0 c q1 in
          let _ = to_list rv in
          let _ = set_list_r rv vl in
          let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Fnc(p2,0)),np)) in
          (np,r1,None))
    | Z_x z ->
      (* Util.pnt true "test0\n"; *)
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Z z),np)) in
      (np,r1,None)
    | Stg_x s ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Stg s),np)) in
      (np,r1,None)
    | TnsT (n1,n2) ->
      let r0_0 = add_k_r rv Tkn_Unt in
      let r0_1 = add_k_r rv Tkn_Unt in
      let p0x = plc () in
      let _ = asm_add a p0 (Op(Rpc((r0_0,r0_1),r0),p0x)) in
      let _ = free_r (rv,rh) r0 in
      let (np1,nr1,o1) = asm_of_tns_tl tb a p0x (rv,rh) r0_0 c n1 in
      let (np2,nr2,o2) = asm_of_tns_tl tb a np1 (rv,rh) r0_1 c n2 in
      let o3 =
        ( match o1,o2 with
          | Some ro ,_ -> Some ro
          | _, Some ro -> Some ro
          | _,_ -> None ) in
      let p3 = plc () in
      let r4 = add_k_r rv Tkn_Unt in
      let _ = asm_add a np2 (Op(Cns(r4,(nr1,nr2)),p3)) in
      (p3,r4,o3)
    | AppT (n1,n2) ->
      let r0_0 = add_k_r rv Tkn_Unt in
      let r0_1 = add_k_r rv Tkn_Unt in
      let p0x = plc () in
      let _ = asm_add a p0 (Op(Rpc((r0_0,r0_1),r0),p0x)) in
      let _ = free_r (rv,rh) r0 in
      let (np1,nr1,_) = asm_of_tns_tl tb a p0x (rv,rh) r0_0 c n1 in
      let (np2,nr2,_) = asm_of_tns_tl tb a np1 (rv,rh) r0_1 c n2 in
      let p3 = plc () in
      let r4 = add_k_r rv Tkn_Unt in
      let _ = asm_add a np2 (Op(Call(r4,(nr1,nr2)),p3)) in
      let _ = free_r (rv,rh) nr1 in
      let _ = free_r (rv,rh) nr2 in
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
let rec tkn_s_of_k tb (v,h) p =
  ( match get_k_p (v,h) p with
    | Some x ->
      ( match x with
        | Tkn_Unt -> TknS_Unt
        | Tkn_Stg s -> TknS_Stg s
        | Tkn_Z z -> TknS_Z z
        | Tkn_Bol b -> TknS_Z (if b then 1 else 0)
        | Tkn_Sgn p -> TknS_Plg p
        | Tkn_Ln l1 -> tkn_s_of_k tb (v,h) (Ptr_Hp l1)
        | Tkn_Tns (r1,r2) -> TknS_Tns(tkn_s_of_k tb (v,h) r1,tkn_s_of_k tb (v,h) r2)
        | Tkn_CoP (i,r1) -> TknS_Tns(TknS_Inj i,tkn_s_of_k tb (v,h) r1)
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
