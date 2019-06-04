let dbg = true

type glb_etr =
  | Etr of (etr ref)
  | Def_Prd of prd ref
  | Def_CoPrd of coprd ref
and etr = { gl_name:string; src:typ; dst:typ; code:code }
and prd = { prd_name:string; prd_cns:(string * typ) list }
and coprd = { coprd_name:string; coprd_cns:(string * typ) list }
and gl_st = glb_etr list
and plc =
  | Plc_Z
  | Plc_Rcd of plc list
  | Plc_IO of plc * plc
  | Plc_Btm
  | Plc_Top
  | Plc_Null
  | Plc_For_All of string * plc
  | Plc_CoPrd of plc list
  | Plc_Prd of plc list
  | Plc_Name of string
  | Plc_Val of string
  | Plc_App of plc * plc
  | DepPlc of opr * plc
  | Plc_Exn
and typ =
  | Typ_App of typ * typ
  | DepTyp of st * typ
  | Typ_Exn
  | Typ_Z
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
  | Id of plc
  | Seq of code * code
  | Canon of code list
  | Opr of { src:plc; dst:plc; opr:opr }
  | Code_CoPrd of { pre:code; post:code list }
  | Code_Prd of { pre:code list; post:code }
and opr =
  | Agl of opr
  | Opr_Z of int
  | Plus of opr * opr
  | Mult of opr * opr
  | Gl_call of string
  | Opr_Rcd of opr list
  | Root of int
  | Eq of opr * opr
  | App of opr * opr
  | Prj of opr * opr
  | Opr_IO of code
  | Opr_Exn of string
  | Const of st
  | Opr_Sgn
and st = typ * tkn
and tkn =
  | Tkn_Exn of string
  | Tkn_Z of int
  | Tkn_Rcd of tkn list
  | Tkn_CoPrd of tkn_coprd
  | Tkn_Prd of { st:st; gl_st:gl_st; roots:st list; codes:code list }
  | Tkn_Null
  | Tkn_Btm
  | Tkn_IO of io
  | Tkn_Agl of tkn
  | Tkn_Sgn of int
and tkn_coprd = tkn list
and io =
  | IO_Code of { gl_st:gl_st; roots:st list; code : code }
  | IO_Inj of { inj_name:(coprd ref); i:int }
  | IO_Cho of { cho_name:(prd ref); i:int }
  | Sgn
type mdl = string * (glb_etr list)
type buffer =
  | Evo of code
  | End
and glb_mode_stt = { name : string; src : typ; dst : typ }
exception End
type evo_mode = Calc | Glb

type evo_rtn =
  | Nml of st
  | Agl of st list
  | AglTop
type rcd_rtn =
  | RcdNml of tkn list
  | RcdMix of (((tkn list) option) list)
  | RcdMixTop of tkn list

let rec string_of_plc d x =
  match x with
  | Plc_Z -> "ℤ"
  | Plc_Rcd r ->
    if d=0
    then (Util.string_of_list " " (string_of_plc (d+1)) r)
    else "{ "^(Util.string_of_list " " (string_of_plc (d+1)) r)^" }"
  | Plc_Top -> "Top"
  | Plc_Null -> "Null"
  | Plc_IO (src,dst) -> "("^(string_of_plc (d+1) src)^"→"^(string_of_plc (d+1) dst)^")"
  | Plc_Btm -> "⊥"
  | Plc_Val x -> x^"'"
  | Plc_For_All (x,t) ->
    x^"∀ "^(string_of_plc 0 t)
  | Plc_Name n -> n
  | Plc_App (p1,p2) -> (string_of_plc 1 p1)^"◂"^(string_of_plc 1 p2)
  | Plc_CoPrd _ -> raise @@ Failure "error:string_of_plc:Plc_CoPrd"
  | _ -> raise @@ Failure "error:string_of_plc:_"

let rec string_of_typ d x =
  let ex= if d=0 then "! " else "" in
  match x with
  | Typ_Z -> ex^"ℤ"
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
      | Tkn_Sgn i -> ex^"sgn"
    ) in
  v

let string_of_st (x:st) : string =
  "` "^(string_of_typ 0 (fst x))^" : "^(string_of_tkn 0 (snd x))

let rec string_of_code x =
  match x with
  | Id _ -> ""
  | Seq (a,b) -> (string_of_code a)^"\n» "^(string_of_code b)
  | Canon l -> "⁅ "^(Util.string_of_list " ¦ " string_of_code l)^" ⁆"
  | Opr o -> "` "^(string_of_plc 0 o.dst)^" : "^(string_of_opr o.opr)
  | Code_CoPrd l -> (string_of_code l.pre)^"\n∐ "^(Util.string_of_list " ∐ " string_of_code l.post)^"∇"
  | Code_Prd l -> (Util.string_of_list " ∏ " string_of_code l.pre)^(string_of_code l.post)
and string_of_opr x =
  match x with
  | Agl e -> "∠["^(string_of_opr e)^"]"
  | Opr_Z z -> string_of_int z
  | Plus (e1,e2) -> "("^(string_of_opr e1)^"+"^(string_of_opr e2)^")"
  | Mult (e1,e2) -> "("^(string_of_opr e1)^"*"^(string_of_opr e2)^")"
  | Gl_call n -> n
  | Opr_Rcd l -> "{"^(Util.string_of_list " " string_of_opr l)^"}"
  | Root i -> "$"^(String.make i '\'')
  | App (f,x) -> "("^(string_of_opr f)^"◂"^(string_of_opr x)
  | Prj (f,x) -> "("^(string_of_opr f)^"◃"^(string_of_opr x)
  | Opr_IO c -> ".» "^(string_of_code c)
  | Opr_Exn s -> "¡"^s
  | Const v -> string_of_st v
  | Eq (e1,e2) -> "("^(string_of_opr e1)^"="^(string_of_opr e2)^")"
  | Opr_Sgn -> "&"
let string_of_gl_st (s:gl_st) =
  let f gs =
    ( match gs with
      | Etr g ->
        ("§ "^(!g.gl_name)^" : "^(string_of_typ 0 !g.src)^" ⊢ "^(string_of_typ 0 !g.dst)^" ≒ \n.» ")^
        (string_of_code !g.code)^"\n"
      | Def_CoPrd g ->
        "¶ "^(!g.coprd_name)^" ≃ "^(Util.string_of_list " ∐ " (fun (n,_) -> n) !g.coprd_cns)^" ≒ ?"
      | Def_Prd g ->
        "¶ "^(!g.prd_name)^" ≃ "^(Util.string_of_list " ∏ " (fun (n,_) -> n) !g.prd_cns)^" ≒ ?"
    )  in
  (Util.string_of_list "\n" f s)

let string_of_glb_etr e =
  match e with
  | Etr e -> "§ "^(!e.gl_name)^" ≒ \n"^(string_of_code !e.code)
  | Def_Prd p ->
    "¶ "^(!p.prd_name)^" ≃ ∏ "^
    (Util.string_of_list " ∏ " (fun (c,t) -> (string_of_typ 0 t)^" : "^c) !p.prd_cns)^
    "\n"
  | Def_CoPrd p ->
    "¶ "^(!p.coprd_name)^" ≃ ∐ "^
    (Util.string_of_list " ∐ " (fun (c,t) -> (string_of_typ 0 t)^" : "^c) !p.coprd_cns)^
      "\n"

let string_of_mdl m =
  ("§§ "^(fst m)^" ≒ \n"^
   (Util.string_of_list "\n" string_of_glb_etr (snd m))^"§§.\n")

let string_of_plc_tkn (b:bool) (p:plc) (v:tkn) : string =
  if b
  then "` "^(string_of_plc 0 p)^" : "^(string_of_tkn 0 v)
  else "` "^(string_of_plc 0 p)^" ¬: "^(string_of_tkn 0 v)



let rec tkn_of_plc (p:plc) : tkn =
  ( match p with
    | Plc_Z -> Tkn_Btm
    | Plc_Rcd r -> Tkn_Rcd (List.map tkn_of_plc r)
    | Plc_IO (_,_) -> Tkn_Btm
    | Plc_Btm -> Tkn_Btm
    | Plc_For_All _ -> Tkn_Btm
    | _ -> Tkn_Btm
  )

let rec tkn_of_typ (p:typ) : tkn =
  ( match p with
    | Typ_Z -> Tkn_Btm
    | Typ_Rcd r -> Tkn_Rcd (List.map tkn_of_typ r)
    | Typ_IO (_,_) -> Tkn_Btm
    | Typ_Btm -> Tkn_Btm
    | Typ_For_All _ -> Tkn_Btm
    | _ -> Tkn_Btm
  )

let rec src_of_code (c:code) : plc =
  match c with
  | Id p -> p
  | Seq (s,_) -> src_of_code s
  | Canon l -> Plc_Rcd (List.map src_of_code l)
  | Opr o -> o.src
  | Code_CoPrd j -> src_of_code j.pre
  | Code_Prd j -> (try src_of_code (List.hd j.pre) with _ -> raise @@ Failure "error:Imp.src_of_code")

and dst_of_code (c:code) : plc =
  match c with
  | Id p -> p
  | Seq (_,d) -> dst_of_code d
  | Canon l -> Plc_Rcd (List.map dst_of_code l)
  | Opr o -> o.dst
  | Code_CoPrd j ->
    (try dst_of_code (List.hd j.post)
     with Failure s -> raise @@ Failure ("error:Imp.dst_of_code:"^(string_of_code c)^s))
  | Code_Prd j -> dst_of_code j.post

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
          | IO_Code c ->
            if (tkn_in_plc g (src_of_code c.code) s)
            && (tkn_in_plc g (dst_of_code c.code) d)
            then true else false
          | IO_Inj j ->
            ( match dst with
              | Typ_CoPrd f ->
                if src=(List.nth f j.i)
                then true else false
              | _ -> false )
          | IO_Cho j ->
            ( match src with
              | Typ_Prd f ->
                if dst=(List.nth f j.i)
                then true else false
              | _ -> false )
          | Sgn -> true
        )
      | _ -> false
    )
  | Typ_Btm -> false
  | Typ_For_All _ -> false
  | _ -> false

and tkn_in_plc (g:gl_st) (p:plc) (t:tkn) : bool =
  match p with
  | Plc_Null ->
    ( match t with
      | Tkn_Null -> true
      | _ -> false )
  | Plc_Top -> true
  | Plc_Z ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Z _ -> true
      | Tkn_Btm  -> true
      | _ -> false
    )
  | Plc_Rcd r ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_Rcd v ->
        ( try
            List.for_all (fun (x,y) -> tkn_in_plc g x y) (List.combine r v)
          with | Invalid_argument _ -> false )
      | _ -> false
    )
  | Plc_CoPrd j ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_CoPrd c ->
        let l = List.combine j c in
        let f (p,t) = tkn_in_plc g (plc_of_typ p) t in
        List.for_all f l
      (* | Tkn_CoPrd (Pure p) ->
         tkn_in_typ g (snd (List.nth (fst p) !j.coprd_cns)) (snd p) *)
      | _ -> false
    )
  | Plc_IO (src,dst) ->
    let (s,d) = (tkn_of_plc src,tkn_of_plc dst) in
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Btm  -> true
      | Tkn_IO io ->
        ( match io with
          | IO_Code c ->
            if (tkn_in_plc g (src_of_code c.code) s)
            && (tkn_in_plc g (dst_of_code c.code) d)
            then true else false
          | IO_Inj j ->
            ( match dst with
              | Plc_CoPrd f ->
                if src=(plc_of_typ (List.nth f j.i))
                then true else false
              | _ -> false )
          | IO_Cho j ->
            ( match src with
              | Plc_Prd f ->
                if dst=(plc_of_typ (List.nth f j.i))
                then true else false
              | _ -> false )
          | Sgn -> true
        )
      | _ -> false
    )
  | Plc_Btm -> false
  | Plc_For_All _ -> false
  | _ -> false


and plc_of_typ (p:typ) : plc =
  match p with
  | Typ_Z -> Plc_Z
  | Typ_Rcd l -> Plc_Rcd (List.map plc_of_typ l)
  | Typ_IO (s,d) -> Plc_IO (plc_of_typ s,plc_of_typ d)
  | Typ_Btm -> Plc_Btm
  | Typ_Top -> Plc_Top
  | Typ_Null -> Plc_Null
  | Typ_For_All (x,t) -> Plc_For_All (x,plc_of_typ t)
  | Typ_CoPrd j -> Plc_CoPrd j
  | Typ_Prd j -> Plc_Prd j
  | Typ_Name n -> Plc_Name n
  | Typ_Val v -> Plc_Val v
  | Typ_App (a,b) -> Plc_App (plc_of_typ a,plc_of_typ b)
  | DepTyp (s,t) -> DepPlc (Const s,plc_of_typ t)
  | Typ_Exn  -> Plc_Exn

let pure (l:int) (i:int) (x:tkn) =
  BatList.init l
    (fun j -> if j=i then x else Tkn_Null)
let gl_call (g:gl_st) (n:string) : io =
  Util.pnt dbg ("entered Imp.gl_call "^(string_of_gl_st g)^
                " "^n^"\n");
  if n="&"
  then Sgn
  else
    BatList.find_map
    (fun e ->
       ( match e with
         | Etr x -> if n=(!x.gl_name)
           then Some (IO_Code { gl_st=[]; roots=[]; code=(!x.code) } )
           else None
         | Def_Prd x ->
           let (i,_) = BatList.findi (fun _ (s,_) -> s=n) !x.prd_cns in
           Some (IO_Cho { cho_name=x; i=i })
         | Def_CoPrd x ->
           let (i,_) =
             BatList.findi (fun _ (s,_) -> s=n) !x.coprd_cns in
           Some (IO_Inj { inj_name=x; i=i })
       )
    ) g

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


let rec typ_of_plc g rs s p =
  match p with
  | Plc_Z -> Typ_Z
  | Plc_Rcd l -> Typ_Rcd (List.map (typ_of_plc g rs s) l)
  | Plc_IO (src,dst) -> Typ_IO ((typ_of_plc g rs s) src,(typ_of_plc g rs s) dst)
  | Plc_Btm -> Typ_Btm
  | Plc_Top -> Typ_Top
  | Plc_Null -> Typ_Null
  | Plc_For_All (x,p) -> Typ_For_All (x,(typ_of_plc g rs s) p)
  | Plc_CoPrd j -> Typ_CoPrd j
  | Plc_Prd j -> Typ_Prd j
  | Plc_Name n -> Typ_Name n
  | Plc_Val v -> Typ_Val v
  | DepPlc (o,v) -> DepTyp (evo g rs s o,(typ_of_plc g rs s) v)
  | Plc_App (a,b) -> Typ_App ((typ_of_plc g rs s) a,(typ_of_plc g rs s) b)
  | Plc_Exn -> Typ_Exn
and evo (g:gl_st) (rs:st list) (s:st) (a:opr) : st =
  let agl_flg = ref false in
  ( match a with
    | Const v -> v
    | Opr_Z z -> (Typ_Z,(Tkn_Z z))
    | App (f,x) ->
      ( match (evo g rs s f,evo g rs s x) with
        | ((_,Tkn_IO f),(tx,x)) ->
          ( match f with
            | IO_Code f -> (evo_code g f.roots (tx,x) f.code)
            | IO_Inj j ->
              (Typ_Top,Tkn_CoPrd (pure (List.length !(j.inj_name).coprd_cns) j.i x))
            | IO_Cho j ->
              ( match x with
                | Tkn_Prd p ->
                  (evo_code p.gl_st p.roots p.st (List.nth p.codes j.i))
                | _ -> raise @@ Failure "error:Flow.evo:L_App:Cho:type unmatched"
              )
            | Sgn -> (Typ_Name "&",Tkn_Sgn 0)
          )
        | _ -> raise @@ Failure "error:Flow.evo:L_App:type unmatched"
      )
    | Prj (f,x) ->
      ( match (evo g rs s f,evo g rs s x) with
        | ((_,Tkn_Rcd l),(_,Tkn_Z z)) -> (Typ_Top,(List.nth l z))
        | ((_,f'),(_,x')) -> raise @@ Failure
            ("error:Imp.evo:Prj:type unmatched\n"^
             (string_of_tkn 0 f')^" ◃ "^(string_of_tkn 0 x'))
      )
    | Plus (x,y) ->
      ( match (evo g rs s x,evo g rs s y) with
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
      ( match (evo g rs s x,evo g rs s y) with
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
          let f = gl_call g n in
          Util.pnt dbg ("Gl_call:"^(string_of_tkn 1 (Tkn_IO f))^"\n");
          let (s,d) =
            ( match f with
              | IO_Code x ->
                (Util.pnt true ("\nImp.evo:Gl_call:"^(string_of_code x.code^"_n is called\n")));
                ((typ_of_plc g rs s) (src_of_code x.code),(typ_of_plc g rs s) (dst_of_code x.code))
              | IO_Inj x ->
                (snd (List.nth !(x.inj_name).coprd_cns x.i),
                 Typ_CoPrd x.inj_name)
              | IO_Cho x ->
                (Typ_Prd x.cho_name,
                 snd (List.nth !(x.cho_name).prd_cns x.i))
              | Sgn -> (Typ_Rcd [],Typ_Name "&")
            ) in
          (Typ_IO (s,d),(Tkn_IO f))
        with
        | Not_found -> raise @@ Failure ("error:evo:global name "^n^" is not found")
      )
    | Opr_Rcd r ->
      let l = List.map (evo g rs s) r in
      let (tl,vl) = List.split l in
      (Typ_Rcd tl,Tkn_Rcd vl)
    | Agl e ->
      let s' = evo g rs s e in
      if !agl_flg
      then raise @@ Failure "error:evo:Agl:double agl"
      else agl_flg:=true;(fst s',Tkn_Agl (snd s'))
    | Root i ->
      ( try
          (List.nth (s::rs) i)
        with
        | _ -> raise @@ Failure
            ("error:evo:Code.Root "^(string_of_int i)^"\n"^
             "[ "^(Util.string_of_list " ; " string_of_st (s::rs))^"]")
      )
    | Opr_IO f ->
      (Typ_IO (Typ_Btm,Typ_Top),
       (Tkn_IO
          (IO_Code
             { gl_st=g; roots=(s::rs); code=f })))
    | Opr_Exn e -> (Typ_Exn,(Tkn_Exn e))
    | Eq (e1,e2) -> (Typ_Z,Tkn_Z 0)
    | Opr_Sgn -> (Typ_IO (Typ_Rcd [],Typ_Name "&"),Tkn_Sgn 0)

  )
and evo_code (g:gl_st) (rs:st list) (s:st) (a:code) : st =
  ( match a with
    | Id _ -> s
    | Seq (f0,f1) ->
      let s' = evo_code g rs s f0 in
      let s'' = evo_code g rs s' f1 in
      s''
    | Canon l ->
      ( match s with
        | (Typ_Rcd q,Tkn_Rcd v) ->
          let o = List.map (fun (x,y) -> (x,y))
              (List.combine q v) in
          let y =
            List.map
              (fun (t,x) -> evo_code g rs x t)
              (List.combine l o) in
          (Typ_Rcd (List.map (fun x -> fst x) y),
           Tkn_Rcd (List.map (fun x -> snd x) y))
        | _ -> raise @@ Failure "error:evo_code:Canon"
      )
    | Opr o ->
      if (tkn_in_plc g o.src (snd s))
      then
        let s' = evo g rs s o.opr in
        if (tkn_in_plc g o.dst (snd s'))
        then s'
        else raise @@ Failure "error:evo_code:Opr:place theck error"
      else raise @@ Failure
          ("error:evo_code:Exp:tkn unmatched to place\n"^
           (string_of_plc_tkn false o.src (snd s)))
    | Code_CoPrd l ->
      let s' = evo_code g rs s l.pre in
      let _ = Util.pnt dbg ("s'=("^(string_of_st s')^")\n") in
      let a = BatList.mapi
          (fun i x ->
             (try
                Some (agl i x)
              with _ -> None) )
          (BatList.make (List.length l.post) s') in
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
             | Some x -> Some (evo_code g rs x (List.nth l.post i)))
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

let check_io (g : gl_st) (rs : st list) (c : code) (src:typ) (dst:typ) : bool =
  let (s,_) = (tkn_of_typ src,tkn_of_typ dst) in
  let v = evo_code g rs (src,s) c in
  tkn_in_typ g dst (snd v)
