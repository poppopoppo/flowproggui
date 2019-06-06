
let dbg = true
open Types
open Print

let rec tkn_of_typ (p:typ) : tkn =
  ( match p with
    | Typ_Z -> Tkn_Btm
    | Typ_Rcd r -> Tkn_Rcd (List.map tkn_of_typ r)
    | Typ_IO (_,_) -> Tkn_Btm
    | Typ_Btm -> Tkn_Btm
    | Typ_For_All _ -> Tkn_Btm
    | _ -> Tkn_Btm
  )

let rec src_of_code (c:code) : typ =
  match c with
  | Rtn -> Typ_Btm
  | Seq (_,_,_) -> Typ_Btm
  | Canon (l,_) -> Typ_Rcd (List.map src_of_code l)
  | Code_CoPrd (_,_,_,_) -> Typ_Btm
  | Code_Prd (_,_,_,_) -> Typ_Btm
  | Code_IO (_,_,_,_) -> Typ_Btm
and dst_of_code (c:code) : typ =
  match c with
  | Rtn -> Typ_Top
  | Seq (_,_,_) -> Typ_Top
  | Canon (_,_) -> Typ_Top
  | Code_CoPrd (_,_,_,_) -> Typ_Top
  | Code_Prd (_,_,_,_) -> Typ_Top
  | Code_IO (_,_,_,_) ->Typ_Top

let rec tkn_in_typ (g:gl_st) (p:typ) (t:tkn) : bool =
  match p with
  | Typ_Null -> true
  | Typ_Top -> true
  | Typ_Z ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Z _ -> true
      | Tkn_Btm  -> true
      | _ -> false
    )
  | Typ_Rcd r ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_Rcd v ->
        ( try
            List.for_all (fun (x,y) -> tkn_in_typ g x y) (List.combine r v)
          with | Invalid_argument _ -> false )
      | _ -> false
    )
  | Typ_CoPrd j ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_CoPrd c ->
        let l = List.combine j c in
        let f (p,t) = tkn_in_typ g p t in
        List.for_all f l
      (*  | Tkn_CoPrd (Pure p) ->
          tkn_in_typ g (snd (List.nth (fst p) !j.coprd_cns)) (snd p) *)
      | _ -> false
    )
  | Typ_IO (src,dst) ->
    let (s,d) = (tkn_of_typ src,tkn_of_typ dst) in
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_IO_Inj i ->
        ( match dst with
          | Typ_CoPrd f ->
            if src=(List.nth f i)
            then true else false
          | _ -> false )
      | Tkn_IO_Cho i ->
        ( match src with
          | Typ_Prd f ->
            if dst=(List.nth f i)
            then true else false
          | _ -> false )
      | Tkn_IO_Sgn -> src=(Typ_Rcd []) && dst=Typ_Sgn
      | Tkn_IO_Code ((t,o),c) -> false
      | _ -> false
    )
  | Typ_Btm -> false
  | Typ_For_All _ -> false
  | _ -> false

exception Null

let agl (i:int) (v:st) : st =
  Util.pnt dbg ("Imp.agl ("^(string_of_int i)^") "^(string_of_st v)^":\n");

  let agl_flg = ref false in
  let rec agl0 i0 v0 =
    (Util.pnt dbg ("agl0 "^(string_of_int i)^(string_of_st v0)^":entered\n"));
    ( match v0 with
      | (_,Tkn_Agl (Tkn_Z z)) ->
        (Util.pnt dbg "agl0:Tkn_Z\n");
        agl_flg:=true;
        if (i0=0)
        then (
          if z=0
          then (Typ_Rcd [],Tkn_Rcd [])
          else
            ((Util.pnt dbg "agl0:i=0,z=0\n");
             raise Null) (* (Typ_Null,Tkn_Null) *)
        )
        else if (i0=1)
        then (
          if z!=0
          then (Typ_Rcd [],Tkn_Rcd [])
          else ((Util.pnt dbg "agl0:i=1,z!=0\n"); raise Null )(* (Typ_Null,Tkn_Null) *)
        )
        else raise @@ Failure "error:agl:type unmatched"
      | (Typ_Rcd r,Tkn_Rcd l) ->
        let _ = Util.pnt dbg ("PNT1:"^(string_of_tkn 1 (Tkn_Rcd l))^"\n") in
        let m0 = List.combine r l in
        let _ = Util.pnt dbg ("PNT2:"^(string_of_int (List.length m0))^"\n") in

        let m1 = List.map
            (fun x -> Util.pnt dbg "PNTx\n";agl0 i0 x) m0 in
        let (t1,v1) = List.split m1 in
        (Typ_Rcd t1,Tkn_Rcd v1)
      | (_,Tkn_Rcd _) -> raise @@ Failure "error:agl:type unmatched"
      | (_,Tkn_Agl(Tkn_CoPrd l)) ->
        agl_flg:=true;
        let a = List.nth l i0 in
        if a=Tkn_Null
        then raise Null
        else (Typ_Top,a)
      | (_,Tkn_Agl(Tkn_Btm)) ->
        agl_flg:=true;
        (Typ_Top,Tkn_Btm)
      | (_,Tkn_Agl(Tkn_Null)) ->
        agl_flg:=true;
        (Typ_Null,Tkn_Null)
      | (_,Tkn_Agl _) ->
        agl_flg:=true;
        raise @@ Failure "error:agl:type unmatched"
      | x -> x
    ) in
  let v' = agl0 i v in
  let _ = Util.pnt dbg ("v'=("^(string_of_st v')^")\n") in
  if !agl_flg=false
  then (Util.pnt dbg "gl_flg=false\n";
        raise @@ Failure "error:agl:agl not found")
  else v'

let rec evo (g:gl_st) (s:st) (ir:int ref) (a:opr) : st =
  let agl_flg = ref false in
  ( match a with
    | Const v -> v
    | Opr_Z z -> (Typ_Z,(Tkn_Z z))
    | App (f,x) ->
      ( match (evo g s ir f,evo g s ir x) with
        | ((_,Tkn_IO_Code(t,o,c)),(tx,x)) ->
          (evo_code g (tx,x) ir c)
        | ((_,Tkn_IO_Inj i),(_,x)) ->
          (Typ_Top,
           Tkn_CoPrd
             (BatList.init
                (i+1)
                (fun j -> if j=i then x else Tkn_Null)))
        | ((_,Tkn_IO_Cho i),(_,x)) ->
          ( match x with
            | Tkn_Prd (s,l) ->
              (evo_code g s ir (List.nth l i))
            | _ -> raise @@ Failure "error:Flow.evo:App:Cho:type unmatched"
          )
        | ((_,Tkn_IO_Sgn),(_,_)) ->
          let p = !ir in
          ir:=(!ir + 1);
          (Typ_Sgn,Tkn_Sgn p)
        | (f,x) -> raise @@ Failure ("error:Flow.evo:App:type unmatched\n"^
                                     (string_of_st f)^" ◂ "^(string_of_st x))
      )
    | Prj (f,x) ->
      ( match (evo g s ir f,evo g s ir x) with
        | ((_,Tkn_Rcd l),(_,Tkn_Z z)) -> (Typ_Top,(List.nth l z))
        | ((_,f'),(_,x')) -> raise @@ Failure
            ("error:Imp.evo:Prj:type unmatched\n"^
             (string_of_tkn 0 f')^" ◃ "^(string_of_tkn 0 x'))
      )
    | Plus (x,y) ->
      ( match (evo g s ir x,evo g s ir y) with
        | ((_,Tkn_Z x),(_,Tkn_Z y)) -> (Typ_Z,Tkn_Z (x+y))
        | ((Typ_Z,_),(Typ_Z,_)) -> (Typ_Z,Tkn_Btm)
        | ((Typ_Z,x),y) ->
          ( match y with
            | (Typ_Z,_) -> (Typ_Z,Tkn_Btm)
            | (Typ_Top,_) -> (Typ_Z,Tkn_Btm)
            | _ ->
              let (px,py) = (string_of_st (Typ_Z,x),string_of_st y) in
              let msg = "error:evo:Plus:type is unmatched\n"^px^" + "^py^"\n" in
              raise @@ Failure msg
          )
        | ((Typ_Top,x),y) ->
          ( match y with
            | (Typ_Z,_) -> (Typ_Z,Tkn_Btm)
            | (Typ_Top,_) -> (Typ_Z,Tkn_Btm)
            | _ ->
              let (px,py) = (string_of_st (Typ_Top,x),string_of_st y) in
              let msg = "error:evo:Plus:type is unmatched\n"^px^" + "^py^"\n" in
              raise @@ Failure msg
          )
        | ((t0,v0),(t1,v1)) ->
          let (px,py) = (string_of_st (t0,v0),string_of_st (t1,v1)) in
          let msg = "error:evo:Plus:type is unmatched\n"^px^" + "^py^"\n" in
          raise @@ Failure msg
      )
    | Mult (x,y) ->
      ( match (evo g s ir x,evo g s ir y) with
        | ((_,Tkn_Z x),(_,Tkn_Z y)) -> (Typ_Z,Tkn_Z (x*y))
        | ((Typ_Z,_),(Typ_Z,_)) -> (Typ_Z,Tkn_Btm)
        | ((Typ_Z,x),y) ->
          ( match y with
            | (Typ_Z,_) -> (Typ_Z,Tkn_Btm)
            | (Typ_Top,_) -> (Typ_Z,Tkn_Btm)
            | _ ->
              let (px,py) = (string_of_st (Typ_Z,x),string_of_st y) in
              let msg = "error:evo:Plus:type is unmatched\n"^px^" + "^py^"\n" in
              raise @@ Failure msg
          )
        | ((Typ_Top,x),y) ->
          ( match y with
            | (Typ_Z,_) -> (Typ_Z,Tkn_Btm)
            | (Typ_Top,_) -> (Typ_Z,Tkn_Btm)
            | _ ->
              let (px,py) = (string_of_st (Typ_Top,x),string_of_st y) in
              let msg = "error:evo:Plus:type is unmatched\n"^px^" + "^py^"\n" in
              raise @@ Failure msg
          )
        | _ -> raise @@ Failure "error:evo:Plus:type is unmatched"
      )
    | Minus e ->
      let (t,v) = evo g s ir e in
      ( match v with
        | Tkn_Z z -> (t,Tkn_Z (-z))
        | Tkn_Btm -> (t,Tkn_Btm)
        | Tkn_Null -> (t,Tkn_Null)
        | Tkn_Exn s -> (t,Tkn_Exn s)
        | _ -> raise @@ Failure ("Imp.evo:Minus:tkn step error")
      )
    | Opr_Name n ->
      ( try
          Util.pnt dbg ("Opr_Name:"^n^"\n");
          let e =
            BatList.find_map
              (fun f ->
                 ( match f with
                   | Etr (name,src,dst,code) ->
                     if n=name
                     then Some (Typ_IO (src,dst),Tkn_IO_Code((Typ_Btm,Tkn_Btm),code))
                     else None
                   | Def_Prd (name,l) ->
                     ( try
                         let (i,(t,_)) =
                           BatList.findi
                             (fun _ (_,c) -> if c=n then true else false)
                             l in
                         Some (Typ_IO (Typ_Name name,t),Tkn_IO_Cho i)
                       with _ -> None )
                   | Def_CoPrd (name,l) ->
                     ( try
                         let (i,(t,_)) =
                           BatList.findi
                             (fun _ (_,c) -> if c=n then true else false)
                             l in
                         Some (Typ_IO (t,Typ_Name name),Tkn_IO_Inj i)
                       with _ -> None )
                 )
              )
              g in
          Util.pnt dbg ("Opr_Name-found:"^(string_of_st e)^"\n");
          e
        with
        | Not_found -> raise @@ Failure ("error:evo:global name "^n^" is not found")
      )
    | Opr_Rcd r ->
      let l = List.map (evo g s ir) r in
      let (tl,vl) = List.split l in
      (Typ_Rcd tl,Tkn_Rcd vl)
    | Agl e ->
      let s' = evo g s ir e in
      if !agl_flg
      then raise @@ Failure "error:evo:Agl:double agl"
      else agl_flg:=true;(fst s',Tkn_Agl (snd s'))
    | Root -> s
    | Opr_Exn e -> (Typ_Exn,(Tkn_Exn e))
    | Eq (x,y) ->
      let ((_,v0),(_,v1)) = (evo g s ir x,evo g s ir y) in
      if (Eq.eq v0 v1) then (Typ_Z,Tkn_Z 0) else (Typ_Z,Tkn_Z 1)
    | Opr_Sgn_Ini -> (Typ_IO (Typ_Rcd [],Typ_Sgn),Tkn_IO IO_Sgn)
    | Opr_Stg s -> (Typ_Stg,Tkn_Stg s)

  )
and evo_code (g:gl_st) (s:tkn) (ir:int ref) (a:code) : tkn =
  let (_,_) = s in
  ( match a with
    | Rtn -> s
    | Seq ((t,o,_),c) ->
      let s' = evo g s ir o in
      if (tkn_in_typ g t s')
      then evo_code g s' ir c
      else raise @@ Failure ("type unmatched:"^(string_of_typ 0 t)^"¬:"^(string_of_tkn 0 s')^"\n")
    | Canon (l,c) ->
      ( match s with
        | (Typ_Rcd q,Tkn_Rcd v) ->
          let o = List.map (fun (x,y) -> (x,y))
              (List.combine q v) in
          let y =
            List.map
              (fun (t,x) -> evo_code g x ir t)
              (List.combine l o) in
          let (tl,vl) = List.split y in
          let s' = (Typ_Rcd tl,Tkn_Rcd vl) in
          evo_code g s' ir c
        | _ -> raise @@ Failure "error:evo_code:Canon"
      )
    | Code_CoPrd (_,o,l,_) ->
      let (t1,v1) = evo g s ir o in
      let _ = Util.pnt dbg ("s'=("^(string_of_st (t1,v1))^")\n") in
      let a = BatList.mapi
          (fun i x ->
             (try
                Some (agl i x)
              with _ -> None) )
          (BatList.make (List.length l) (t1,v1)) in
      Util.pnt dbg
        ("a=("^(Util.string_of_list ","
                  (fun x -> match x with
                     | None -> "None"
                     | Some _ -> "Some _" )
                  a )^")\n");
      let a0 = List.mapi
          (fun i x ->
             match x with
             | None -> None
             | Some x -> Some (evo_code g x ir (List.nth l i)))
          a in
      let sum = List.fold_left
          (fun o x ->
             match (o,x) with
             | (Some o,_) -> Some o
             | (None,None) -> None
             | (None,Some x) -> Some x )
          None a0 in
      let sum =
        (match sum with
         | None -> (Typ_Btm,Tkn_Btm)
         | Some x -> x ) in
      sum
    | Code_Prd (t,o,l,c) ->
      let s0 = evo g s ir o in
      let s1 = Tkn_Prd (s0,l) in
      let s2 = evo_code g s1 ir c in
      s2
    | Code_IO (t,o,c0,c1) ->
      let s0 = Tkn_IO_Code (t,o,c0) in
      let s1 = evo_code g s0 ir c in
      s1
  )

let check_io (g : gl_st) (c : code) (src:typ) (dst:typ) : bool =
  let (s,_) = (tkn_of_typ src,tkn_of_typ dst) in
  let v = evo_code g (src,s) (ref 0) c in
  tkn_in_typ g dst (snd v)
