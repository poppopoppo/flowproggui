let dbg = true

type glb_etr =
  | Etr of etr
  | Def_Prd of prd
  | Def_CoPrd of coprd
and etr = string * typ * typ * code
(* <name> : <src> ⊢ <dst> ≒ <code> *)
and prd = string * ((typ * string) list)
and coprd = string *  ((typ * string) list)
and gl_st = glb_etr list
and typ =
  | Typ_App of typ * typ
  | DepTyp of opr * typ
  | Typ_Exn
  | Typ_Z
  | Typ_Sgn
  | Typ_Rcd of typ list
  | Typ_IO of typ * typ
  | Typ_Btm
  | Typ_Top
  | Typ_Null
  | Typ_For_All of string * typ
  | Typ_CoPrd of typ list
  | Typ_Prd of typ list
  | Typ_Name of string
  | Typ_Val of string

and code =
  | Id of typ
  | Seq of code * code
  | Canon of code list
  | Opr of typ * typ * opr
  | Code_CoPrd of code * (code list)
  | Code_Prd of (code list) * code
and opr =
  | Agl of opr
  | Opr_Z of int
  | Plus of opr * opr
  | Mult of opr * opr
  | Gl_call of string
  | Opr_Rcd of opr list
  | Root
  | Eq of opr * opr
  | App of opr * opr
  | Prj of opr * opr
  | Opr_Exn of string
  | Const of st
  | Opr_Sgn_Ini
and st = typ * tkn
and tkn =
  | Tkn_Exn of string
  | Tkn_Z of int
  | Tkn_Rcd of tkn list
  | Tkn_CoPrd of tkn list
  | Tkn_Prd of st * (code list)
  | Tkn_Null
  | Tkn_Btm
  | Tkn_IO of io
  | Tkn_Agl of tkn
  | Tkn_Sgn of int
and io =
  | IO_Code of gl_st * code
  | IO_Inj of int
  | IO_Cho of int
  | IO_Sgn
type mdl = string * (glb_etr list)
type buffer =
  | Evo of code
  | End
exception End

let rec string_of_typ d x =
  let ex= if d=0 then "! " else "" in
  match x with
  | Typ_Z -> ex^"ℤ"
  | Typ_Sgn -> "|&|"
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
  | Typ_CoPrd c -> "Typ_CoPrd^"
  | _ -> raise @@ Failure ("error:string_of_typ:")

let rec string_of_tkn d s =
  let ex= if d=0 then "! " else "" in
  let v =
    ( match s with
      | Tkn_Z z ->
        ex^(string_of_int z)
      | Tkn_Rcd l ->
        let m = (Util.string_of_list " " (string_of_tkn (d+1)) l) in
        if d=0 then m else ("{ "^m^" }")
      | Tkn_Exn x -> ex^"exn("^x^")"
      | Tkn_CoPrd c ->
        ex^"∐\'◂{ "^(Util.string_of_list " " (string_of_tkn 1) c)^" }"
      (*    | Pure (i,v) -> ex^"\\∐["^(string_of_int i)^"]"^(string_of_tkn 1 v) *)
      | Tkn_Prd _ -> ex^"Tkn_Prd"
      | Tkn_Null -> ex^"∅"
      | Tkn_Btm -> ex^"Tkn_Btm"
      | Tkn_IO _ -> ex^"io"
      | Tkn_Agl c -> ex^"∠["^(string_of_tkn (d+1) c)^"]"
      | Tkn_Sgn i -> ex^"¿p"
    ) in
  v

let string_of_st (x:st) : string =
  "` "^(string_of_typ 0 (fst x))^" : "^(string_of_tkn 0 (snd x))

let rec string_of_code x =
  match x with
  | Id _ -> ""
  | Seq (a,b) -> (string_of_code a)^"\n» "^(string_of_code b)
  | Canon l -> "⁅ "^(Util.string_of_list " ¦ " string_of_code l)^" ⁆"
  | Opr (s,d,o) -> "` "^(string_of_typ 0 d)^" : "^(string_of_opr o)
  | Code_CoPrd (c,l) -> (string_of_code c)^"\t\n∐ "^(Util.string_of_list "\n\t∐ " string_of_code l)^"\n∇\n"
  | Code_Prd (l,c) -> (Util.string_of_list "\t\n∏ " string_of_code l)^(string_of_code c)^"\n∆\n"

and string_of_opr x =
  match x with
  | Agl e -> "∠["^(string_of_opr e)^"]"
  | Opr_Z z -> string_of_int z
  | Plus (e1,e2) -> "("^(string_of_opr e1)^"+"^(string_of_opr e2)^")"
  | Mult (e1,e2) -> "("^(string_of_opr e1)^"*"^(string_of_opr e2)^")"
  | Gl_call n -> n
  | Opr_Rcd l -> "{"^(Util.string_of_list " " string_of_opr l)^"}"
  | Root -> "$"
  | App (f,x) -> "("^(string_of_opr f)^"◂"^(string_of_opr x)
  | Prj (f,x) -> "("^(string_of_opr f)^"◃"^(string_of_opr x)
  | Opr_Exn s -> "¡"^s
  | Const v -> string_of_st v
  | Eq (e1,e2) -> "("^(string_of_opr e1)^"="^(string_of_opr e2)^")"
  | Opr_Sgn_Ini -> "&"


let string_of_glb_etr e =
  ( match e with
    | Etr (n,s,d,c) ->
      ("§ "^n^" : "^(string_of_typ 0 s)^" ⊢ "^(string_of_typ 0 d)^" ≒ \n.» ")^
      (string_of_code c)^"\n"
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
  | Id p -> p
  | Seq (s,_) -> src_of_code s
  | Canon l -> Typ_Rcd (List.map src_of_code l)
  | Opr (s,d,o) -> s
  | Code_CoPrd (c,l) -> src_of_code c
  | Code_Prd (l,c) -> (try src_of_code (List.hd l) with _ -> raise @@ Failure "error:Imp.src_of_code")

and dst_of_code (c:code) : typ =
  match c with
  | Id p -> p
  | Seq (_,d) -> dst_of_code d
  | Canon l -> Typ_Rcd (List.map dst_of_code l)
  | Opr (s,d,o) -> d
  | Code_CoPrd (c,l) ->
    (try dst_of_code (List.hd l)
     with Failure s -> raise @@ Failure ("error:Imp.dst_of_code:"^(string_of_code c)^s))
  | Code_Prd (l,c) -> dst_of_code c

and tkn_in_typ (g:gl_st) (p:typ) (t:tkn) : bool =
  match p with
  | Typ_Null ->
    ( match t with
      | Tkn_Null -> true
      | _ -> false )
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
      | Tkn_IO io ->
        ( match io with
          | IO_Code (g,c) ->
            if (tkn_in_typ g (src_of_code c) s)
            && (tkn_in_typ g (dst_of_code c) d)
            then true else false
          | IO_Inj i ->
            ( match dst with
              | Typ_CoPrd f ->
                if src=(List.nth f i)
                then true else false
              | _ -> false )
          | IO_Cho i ->
            ( match src with
              | Typ_Prd f ->
                if dst=(List.nth f i)
                then true else false
              | _ -> false )
          | IO_Sgn ->
            src=(Typ_Rcd []) && dst=Typ_Sgn
        )
      | _ -> false
    )
  | Typ_Btm -> false
  | Typ_For_All _ -> false
  | _ -> false

let pure (l:int) (i:int) (x:tkn) =
  BatList.init l
    (fun j -> if j=i then x else Tkn_Null)

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

let rec evo (g:gl_st) (s:st) (a:opr) : st =
  let agl_flg = ref false in
  ( match a with
    | Const v -> v
    | Opr_Z z -> (Typ_Z,(Tkn_Z z))
    | App (f,x) ->
      ( match (evo g s f,evo g s x) with
        | ((_,Tkn_IO (IO_Code (g,c))),(tx,x)) ->
          (evo_code g (tx,x) c)
        | ((_,Tkn_IO (IO_Inj i)),(tx,x)) ->
          (Typ_Top,
           Tkn_CoPrd
             (BatList.init
                i
                (fun j -> if j=i then x else Tkn_Null)))
        | ((_,Tkn_IO (IO_Cho i)),(tx,x)) ->
          ( match x with
            | Tkn_Prd (s,l) ->
              (evo_code g s (List.nth l i))
            | _ -> raise @@ Failure "error:Flow.evo:L_App:Cho:type unmatched"
          )
        | ((_,Tkn_IO (IO_Sgn)),(tx,x)) ->
          (Typ_Sgn,Tkn_Sgn 0)
        | _ -> raise @@ Failure "error:Flow.evo:L_App:type unmatched"
      )
    | Prj (f,x) ->
      ( match (evo g s f,evo g s x) with
        | ((_,Tkn_Rcd l),(_,Tkn_Z z)) -> (Typ_Top,(List.nth l z))
        | ((_,f'),(_,x')) -> raise @@ Failure
            ("error:Imp.evo:Prj:type unmatched\n"^
             (string_of_tkn 0 f')^" ◃ "^(string_of_tkn 0 x'))
      )
    | Plus (x,y) ->
      ( match (evo g s x,evo g s y) with
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
        | _ -> raise @@ Failure "error:evo:Plus:type is unmatched"
      )
    | Mult (x,y) ->
      ( match (evo g s x,evo g s y) with
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
    | Gl_call n ->
      ( try
          Util.pnt dbg ("Gl_call:\n");
          BatList.find_map
            (fun f ->
               ( match f with
                 | Etr (name,src,dst,code) ->
                   if n=name
                   then Some (Typ_IO (src,dst),Tkn_IO (IO_Code([],code)))
                   else None
                 | Def_Prd (name,l) ->
                   ( try
                       let (i,(t,c)) =
                         BatList.findi
                           (fun i (t,c) -> if c=name then true else false)
                           l in
                       Some (Typ_IO (Typ_Name name,t),Tkn_IO(IO_Cho i))
                     with _ -> None )
                 | Def_CoPrd (name,l) ->
                   ( try
                       let (i,(t,c)) =
                         BatList.findi
                           (fun i (t,c) -> if c=name then true else false)
                           l in
                       Some (Typ_IO (t,Typ_Name name),Tkn_IO(IO_Inj i))
                     with _ -> None )
               )
            )
            g
        with
        | Not_found -> raise @@ Failure ("error:evo:global name "^n^" is not found")
      )
    | Opr_Rcd r ->
      let l = List.map (evo g s) r in
      let (tl,vl) = List.split l in
      (Typ_Rcd tl,Tkn_Rcd vl)
    | Agl e ->
      let s' = evo g s e in
      if !agl_flg
      then raise @@ Failure "error:evo:Agl:double agl"
      else agl_flg:=true;(fst s',Tkn_Agl (snd s'))
    | Root -> s
    | Opr_Exn e -> (Typ_Exn,(Tkn_Exn e))
    | Eq (e1,e2) -> (Typ_Z,Tkn_Z 0)
    | Opr_Sgn_Ini -> (Typ_IO (Typ_Rcd [],Typ_Sgn),Tkn_Sgn 0)

  )
and evo_code (g:gl_st) (s:st) (a:code) : st =
  let (t,v) = s in
  ( match a with
    | Id _ -> s
    | Seq (f0,f1) ->
      let s' = evo_code g s f0 in
      let s'' = evo_code g s' f1 in
      s''
    | Canon l ->
      ( match s with
        | (Typ_Rcd q,Tkn_Rcd v) ->
          let o = List.map (fun (x,y) -> (x,y))
              (List.combine q v) in
          let y =
            List.map
              (fun (t,x) -> evo_code g x t)
              (List.combine l o) in
          (Typ_Rcd (List.map (fun x -> fst x) y),
           Tkn_Rcd (List.map (fun x -> snd x) y))
        | _ -> raise @@ Failure "error:evo_code:Canon"
      )
    | Opr (s,d,o) ->
      if (tkn_in_typ g s v)
      then
        let (t1,v1) = evo g (t,v) o in
        if (tkn_in_typ g d v1)
        then (t1,v1)
        else raise @@ Failure "error:evo_code:Opr:place theck error"
      else raise @@ Failure
          ("error:evo_code:Exp:tkn unmatched to place\n"^
           (string_of_typ 0 s)^" ~: "^(string_of_tkn 0 v)^"\n")
    | Code_CoPrd (c,l) ->
      let (t1,v1) = evo_code g s c in
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
             | Some x -> Some (evo_code g x (List.nth l i)))
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
    | Code_Prd _ -> raise @@ Failure "Imp:error:evo_code:Prd"

  )

let check_io (g : gl_st) (c : code) (src:typ) (dst:typ) : bool =
  let (s,_) = (tkn_of_typ src,tkn_of_typ dst) in
  let v = evo_code g (src,s) c in
  tkn_in_typ g dst (snd v)
