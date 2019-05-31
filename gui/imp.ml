
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
  | Plc_For_All of bound * string * plc
  | Plc_CoPrd of (coprd ref)
  | Plc_Prd of (prd ref)
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
  | Typ_For_All of bound * string * typ
  | Typ_CoPrd of (coprd ref)
  | Typ_Prd of (prd ref)
  | Typ_Name of string
  | Typ_Val of string
and bound =
  | Class_Type
  | Class_Z
and code =
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
  | App of opr * opr
  | Prj of opr * opr
  | Opr_IO of code
  | Opr_Exn of string
  | Const of st
and st = typ * tkn
and tkn =
  | Tkn_Exn of string
  | Tkn_Z of int
  | Tkn_Rcd of tkn list
  | Tkn_CoPrd of tkn list
  | Tkn_Prd of { st:st; gl_st:gl_st; roots:st list; codes:code list }
  | Tkn_Null
  | Tkn_Btm
  | Tkn_IO of io
  | Tkn_Agl of tkn
and io =
  | IO_Code of { gl_st:gl_st; roots:st list; code : code }
  | IO_Inj of { inj_name:(coprd ref); i:int }
  | IO_Cho of { cho_name:(prd ref); i:int }
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

let string_of_class c =
  match c with
  | Class_Type -> "∀Type"
  | Class_Z -> "∀Z"
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
  | Plc_Val x -> "¿"^x
  | Plc_For_All (b,x,t) ->
    (string_of_class b)^" ?"^x^" \\ "^(string_of_plc 0 t)
  | _ -> raise @@ Failure "error:string_of_plc"

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
  | Typ_Val x -> ex^"?"^x
  | Typ_Name n -> ex^n
  | Typ_For_All (b,x,t) ->
    (string_of_class b)^" ?"^x^" \\ "^(string_of_typ 0 t)
  | _ -> raise @@ Failure "error:string_of_plc"

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
        ex^"∐[ "^(Util.string_of_list "," (string_of_tkn 1) c)^" ]"
      | Tkn_Prd _ -> ex^"Tkn_Prd"
      | Tkn_Null -> ex^"∅"
      | Tkn_Btm -> ex^"Tkn_Btm"
      | Tkn_IO _ -> ex^"io"
      | Tkn_Agl c -> ex^"∠["^(string_of_tkn (d+1) c)^"]"
    ) in
  v

let string_of_st (x:st) : string =
  "` "^(string_of_typ 0 (fst x))^" : "^(string_of_tkn 0 (snd x))

let rec string_of_code x =
  match x with
  | Seq (a,b) -> (string_of_code a)^"\n» "^(string_of_code b)
  | Canon l -> "{~ "^(Util.string_of_list " ¦ " string_of_code l)^" }"
  | Opr o -> "` "^(string_of_plc 0 o.dst)^" : "^(string_of_opr o.opr)
  | Code_CoPrd l -> (string_of_code l.pre)^(Util.string_of_list "∐" string_of_code l.post)
  | Code_Prd l -> (Util.string_of_list "∏" string_of_code l.pre)^(string_of_code l.post)
and string_of_opr x =
  match x with
  | Agl e -> "∠["^(string_of_opr e)^"]"
  | Opr_Z z -> string_of_int z
  | Plus (e1,e2) -> "("^(string_of_opr e1)^"+"^(string_of_opr e2)^")"
  | Mult (e1,e2) -> "("^(string_of_opr e1)^"*"^(string_of_opr e2)^")"
  | Gl_call n -> "#"^n
  | Opr_Rcd l -> "{"^(Util.string_of_list " " string_of_opr l)^"}"
  | Root i -> "$"^(String.make i '\'')
  | App (f,x) -> "("^(string_of_opr f)^"◂"^(string_of_opr x)
  | Prj (f,x) -> "("^(string_of_opr f)^"◃"^(string_of_opr x)
  | Opr_IO c -> ".» "^(string_of_code c)
  | Opr_Exn s -> "¡"^s
  | Const v -> string_of_st v

let string_of_gl_st (s:gl_st) =
  let f gs =
    ( match gs with
      | Etr g ->
        ("§ "^(!g.gl_name)^" : "^(string_of_typ 0 !g.src)^" ⊢ "^(string_of_typ 0 !g.dst)^" ≒ ? ")
      | Def_CoPrd g ->
        "¶ "^(!g.coprd_name)^" ≃ "^(Util.string_of_list "∐" (fun (n,_) -> n) !g.coprd_cns)^" ≒ ?"
      | Def_Prd g ->
        "¶ "^(!g.prd_name)^" ≃ "^(Util.string_of_list "∏" (fun (n,_) -> n) !g.prd_cns)^" ≒ ?"
    )  in
  "gl_state # "^(Util.string_of_list "," f s)


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
  | Seq (s,_) -> src_of_code s
  | Canon l -> Plc_Rcd (List.map src_of_code l)
  | Opr o -> o.src
  | Code_CoPrd j -> src_of_code j.pre
  | Code_Prd j -> src_of_code (List.hd j.pre)

and dst_of_code (c:code) : plc =
  match c with
  | Seq (_,d) -> dst_of_code d
  | Canon l -> Plc_Rcd (List.map dst_of_code l)
  | Opr o -> o.dst
  | Code_CoPrd j -> dst_of_code (List.hd j.post)
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
        let l = List.combine !j.coprd_cns c in
        let f ((_,p),t) = tkn_in_typ g p t in
        List.for_all f l
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
                if src=(snd (List.nth !f.coprd_cns j.i))
                then true else false
              | _ -> false )
          | IO_Cho j ->
            ( match src with
              | Typ_Prd f ->
                if dst=(snd (List.nth !f.prd_cns j.i))
                then true else false
              | _ -> false )
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
        let l = List.combine !j.coprd_cns c in
        let f ((_,p),t) = tkn_in_plc g (plc_of_typ p) t in
        List.for_all f l
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
                if src=(plc_of_typ (snd (List.nth !f.coprd_cns j.i)))
                then true else false
              | _ -> false )
          | IO_Cho j ->
            ( match src with
              | Plc_Prd f ->
                if (tkn_in_typ g (snd (List.nth !f.prd_cns j.i)) d)
                then true else false
              | _ -> false )
        )
      | _ -> false
    )
  | Plc_Btm -> false
  | Plc_For_All _ -> false
  | _ -> false


and plc_of_typ p =
  match p with
  | Typ_Z -> Plc_Z
  | Typ_Rcd l -> Plc_Rcd (List.map plc_of_typ l)
  | Typ_IO (s,d) -> Plc_IO (plc_of_typ s,plc_of_typ d)
  | Typ_Btm -> Plc_Btm
  | Typ_Top -> Plc_Top
  | Typ_Null -> Plc_Null
  | Typ_For_All (b,x,t) -> Plc_For_All (b,x,plc_of_typ t)
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
           let (i,_) = BatList.findi (fun _ (s,_) -> s=n) !x.coprd_cns in
           Some (IO_Inj { inj_name=x; i=i })
       )
    ) g

let rec agl (i:int) (v:st) : st =
  let agl_flg = ref false in
  let v' =
    ( match v with
      | (_,Tkn_Agl (Tkn_Z z)) ->
        agl_flg:=true;
        if (i=0)
        then (
          if z=0
          then (Typ_Rcd [],Tkn_Rcd [])
          else (Typ_Null,Tkn_Null)
        )
        else if (i=1)
        then (
          if z!=0
          then (Typ_Rcd [],Tkn_Rcd [])
          else (Typ_Null,Tkn_Null)
        )
        else raise @@ Failure "error:agl:type unmatched"
      | (Typ_Rcd r,Tkn_Rcd l) ->
        let m0 = List.combine r l in
        let m1 = BatList.map (agl i) m0 in
        let (t,v) = List.split m1 in
        (Typ_Rcd t,Tkn_Rcd v)
      | (_,Tkn_Rcd _) -> raise @@ Failure "error:agl:type unmatched"
      | (_,Tkn_Agl(Tkn_CoPrd l)) ->
        agl_flg:=true;
        let a = List.nth l i in
        (Typ_Top,a)
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
  if !agl_flg=false
  then raise @@ Failure "error:agl:agl not found"
  else v'


let rec typ_of_plc g rs s p =
    match p with
    | Plc_Z -> Typ_Z
    | Plc_Rcd l -> Typ_Rcd (List.map (typ_of_plc g rs s) l)
    | Plc_IO (src,dst) -> Typ_IO ((typ_of_plc g rs s) src,(typ_of_plc g rs s) dst)
    | Plc_Btm -> Typ_Btm
    | Plc_Top -> Typ_Top
    | Plc_Null -> Typ_Null
    | Plc_For_All (b,x,p) -> Typ_For_All (b,x,(typ_of_plc g rs s) p)
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
          let (s,d) =
            ( match f with
              | IO_Code x -> ((typ_of_plc g rs s) (src_of_code x.code),(typ_of_plc g rs s) (dst_of_code x.code))
              | IO_Inj x ->
                (snd (List.nth !(x.inj_name).coprd_cns x.i),
                 Typ_CoPrd x.inj_name)
              | IO_Cho x ->
                (Typ_Prd x.cho_name,
                 snd (List.nth !(x.cho_name).prd_cns x.i))
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
      else agl_flg:=true;s'
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
  )
and evo_code (g:gl_st) (rs:st list) (s:st) (a:code) : st =
  ( match a with
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
      let a = BatList.mapi agl (BatList.make (List.length l.post) s') in
      let a0 = List.mapi (fun i x -> evo_code g rs x (List.nth l.post i)) a in
      let (_,vs) = List.split a0 in
      (Typ_Top,Tkn_CoPrd vs)
    | Code_Prd _ -> raise @@ Failure "Imp:error:evo_code:Prd"

  )

let check_io (g : gl_st) (rs : st list) (c : code) (src:typ) (dst:typ) : bool =
  let (s,_) = (tkn_of_typ src,tkn_of_typ dst) in
  let v = evo_code g rs (src,s) c in
  tkn_in_typ g dst (snd v)
