
type glb_etr =
  | Etr of (etr ref)
  | Def_Prd of prd ref
  | Def_CoPrd of coprd ref
and etr = { gl_name:string; src:plc; dst:plc; code:code }
and prd = { prd_xs:string list; prd_name:string; prd_cns:(string * plc) list }
and coprd = { coprd_xs:string list; coprd_name:string; coprd_cns:(string * plc) list }
and gl_st = glb_etr list
and plc =
  | Plc_Z
  | Plc_Rcd of plc list
  | Plc_IO of plc * plc
  | Btm
  | Top
  | For_All of { xs:(string list); co_p:plc; p:plc }
  | Plc_CoPrd of (coprd ref)
  | Plc_Prd of (prd ref)
  | Val of string
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
and st = { plc:plc; tkn:tkn }
and tkn =
  | Tkn_Exn of string
  | Tkn_Z of { z:(int option); agl_flg:bool }
  | Tkn_Rcd of tkn list
  | Tkn_CoPrd of { st:(tkn option) list; agl_flg : bool }
  | Tkn_Prd of { st:st; gl_st:gl_st; roots:st list; codes:code list }
  | Unknown
  | Tkn_IO of io
and io =
  | IO_Code of { gl_st:gl_st; roots:st list; code : code }
  | IO_Inj of { inj_name:(coprd ref); i:int }
  | IO_Cho of { cho_name:(prd ref); i:int }

type buffer =
  | Evo of code
  | Glb_Etr of glb_etr
  | Glb_mode_Stt of glb_mode_stt
  | End
and glb_mode_stt = { name : string; src : plc; dst : plc }
exception End
type evo_mode = Calc | Glb

type rcd_rtn =
  | RcdNml of tkn list
  | RcdAglMix of (((tkn list) option) list)

let rec string_of_plc d x =
  let ex= if d=0 then "! " else "" in
  let v =
    (match x with
     | Plc_Z -> "ℤ"
     | Plc_Rcd r ->
       if d=0
       then (Util.string_of_list " " (string_of_plc (d+1)) r)
       else "{ "^(Util.string_of_list " " (string_of_plc (d+1)) r)^" }"
     | Top -> "Top"
     | Plc_IO (src,dst) -> "("^(string_of_plc (d+1) src)^"→"^(string_of_plc (d+1) dst)^")"
     | Btm -> "⊥"
     | Val x -> "¿"^x
     | For_All f ->
       "∀"^(Util.string_of_list " " (fun x -> x) f.xs)^
       "."^(string_of_plc 0 f.co_p)^"→"^(string_of_plc 0 f.p)
     | _ -> raise @@ Failure "error:string_of_plc"
    ) in ex^v

let rec string_of_tkn d s =
  let ex= if d=0 then "! " else "" in
  let v =
    ( match s with
      | Tkn_Z z ->
        ( match z.z with
          | Some z -> (string_of_int z)
          | None -> "?"
        )
      | Tkn_Rcd l ->
        let m = (Util.string_of_list " " (string_of_tkn (d+1)) l) in
        if d=0 then ("{ "^m^" }") else ("{ "^m^" }")
      | Tkn_Exn x -> "exn("^x^")"
      | Tkn_CoPrd c ->
        "∐[ "^(Util.string_of_list ","
                   (fun x ->
                      match x with
                      | None -> "⊥"
                      | Some x -> string_of_tkn 1 x)
                   c.st)^" ]"
      | Tkn_Prd _ -> "?Tkn_Prd"
      | Unknown -> "?Unknown"
      | Tkn_IO _ -> "io"
    ) in
  ex^v

let string_of_st (x:st) : string =
  "` "^(string_of_plc 0 x.plc)^" : "^(string_of_tkn 0 x.tkn)

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

let string_of_gl_st (s:gl_st) =
  let f gs =
    ( match gs with
      | Etr g ->
        ("§ "^(!g.gl_name)^" : "^(string_of_plc 0 !g.src)^" ⊢ "^(string_of_plc 0 !g.dst)^" ≒ ? ")
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

let pure (l:int) (i:int) (x:tkn) =
  BatList.init l
    (fun j -> if j=i then (Some x) else None)

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
let rec src_of_code (c:code) : plc =
  match c with
  | Seq (s,_) -> src_of_code s
  | Canon l -> Plc_Rcd (List.map src_of_code l)
  | Opr o -> o.src
  | Code_CoPrd j -> src_of_code j.pre
  | Code_Prd j -> src_of_code (List.hd j.pre)

let rec dst_of_code (c:code) : plc =
  match c with
  | Seq (_,d) -> dst_of_code d
  | Canon l -> Plc_Rcd (List.map dst_of_code l)
  | Opr o -> o.dst
  | Code_CoPrd j -> dst_of_code (List.hd j.post)
  | Code_Prd j -> dst_of_code j.post

let rec tkn_of_plc (p:plc) : tkn =
  ( match p with
    | Plc_Z -> Tkn_Z { z=None; agl_flg=false }
    | Plc_Rcd r -> Tkn_Rcd (List.map tkn_of_plc r)
    | Plc_IO (_,_) -> Unknown
    | Btm -> Unknown
    | For_All _ -> Unknown
    | _ -> Unknown
  )

let rec tkn_in_plc (g:gl_st) (p:plc) (t:tkn) : bool =
  match p with
  | Top -> true
  | Plc_Z ->
    ( match t with
      | Tkn_Exn _ -> true
      | Tkn_Z _ -> true
      | Unknown -> true
      | _ -> false
    )
  | Plc_Rcd r ->
    ( match t with
      | Tkn_Exn _ -> true
      | Unknown -> true
      | Tkn_Rcd v ->
        ( try
            List.for_all (fun (x,y) -> tkn_in_plc g x y) (List.combine r v)
          with | Invalid_argument _ -> false )
      | _ -> false
    )
  | Plc_CoPrd j ->
    ( match t with
      | Unknown -> true
      | Tkn_Exn _ -> true
      | Tkn_CoPrd c ->
        let l = List.combine !j.coprd_cns c.st in
        let f ((_,p),t) =
          ( match t with
            | None -> true
            | Some t -> tkn_in_plc g p t ) in
        List.for_all f l
      | _ -> false
    )
  | Plc_IO (src,dst) ->
    ( match t with
      | Tkn_Exn _ -> true
      | Unknown -> true
      | Tkn_IO io ->
        ( match io with
          | IO_Code c ->
            if (src_of_code c.code)=src && (dst_of_code c.code)=dst
            then true else false
          | IO_Inj j ->
            ( match dst with
              | Plc_CoPrd f ->
                if src=(snd (List.nth !f.coprd_cns j.i))
                then true else false
              | _ -> false )
          | IO_Cho j ->
            ( match src with
              | Plc_Prd f ->
                if dst=(snd (List.nth !f.prd_cns j.i))
                then true else false
              | _ -> false )
        )
      | _ -> false
    )
  | Btm -> false
  | For_All _ -> false
  | _ -> false

let rec evo (g:gl_st) (rs:st list) (s:st) (a:opr) : bool * st =
  ( match a with
    | Opr_Z z -> (false,{ plc=Plc_Z; tkn=Tkn_Z { z=(Some z)}})
    | App (f,x) ->
      let (f',x') = (evo g rs s f,evo g rs s x) in
      ( match (f'.plc,f'.tkn,x'.plc,x'.tkn) with
        | (_,Tkn_IO f,_,x) ->
          ( match f with
            | IO_Code f -> (false,evo_code g f.roots x' f.code)
            | IO_Inj j ->
              let t = Tkn_CoPrd {
                  st=(pure (List.length !(j.inj_name).coprd_cns) j.i x)} in
              (false,{ plc=(Plc_CoPrd j.inj_name); tkn=t })
            | IO_Cho j ->
              ( match x with
                | Tkn_Prd p ->
                  (false,evo_code p.gl_st p.roots (p.st:st) (List.nth p.codes j.i))
                | _ -> raise @@ Failure "error:Flow.evo:L_App:Cho:type unmatched"
              ) )
        | (Plc_Rcd w,Tkn_Rcd l,_,Tkn_Z z) ->
          ( match z.z with
            | Some z -> (false,{plc=(List.nth w z); tkn=(List.nth l z) })
            | _ -> raise @@ Failure "error:Imp.evo:L_App:projection unmatched"
          )
        | _ -> raise @@ Failure "error:Flow.evo:L_App:type unmatched"
      )
    | Prj (f,x) ->
      let (f',x') = (evo g rs s f,evo g rs s x) in
      ( match (f'.plc , f'.tkn , x'.plc , x'.tkn) with
        | (p,(Tkn_Rcd l),_,(Tkn_Z z)) ->
          ( match p with
            | Plc_Rcd w ->
              ( match z.z with
                | Some z ->
                  (false,{ plc=(List.nth w z); tkn=(List.nth l z) })
                | _ -> raise @@ Failure
                    "error:Imp.evo:Prj:projection unmatched"
              )
            | _ ->
              ( match z.z with
                | Some z -> (false,{ plc=Top; tkn=(List.nth l z) })
                | _ -> raise @@ Failure
                    "error:Imp.evo:Prj:projection unmatched"
              )
          )
        | (_,f',_,x') -> raise @@ Failure
            ("error:Imp.evo:Prj:type unmatched\n"^
             (string_of_tkn 0 f')^" ◃ "^(string_of_tkn 0 x'))
      )
    | Plus (x,y) ->
      let (f',x') = (evo g rs s x,evo g rs s y) in
      ( match (f'.plc , f'.tkn , x'.plc , x'.tkn) with
        | (_,Tkn_Z x,_,Tkn_Z y) ->
          ( match (x.z,y.z) with
            | (Some x,Some y) ->
              (false,{ plc=Plc_Z; tkn=(Tkn_Z { z=(Some (x+y)) }) })
            | _ ->
              (false,{ plc=Plc_Z; tkn=(Tkn_Z { z=None; agl_flg=false }) })
          )
        | (_,x,_,y) ->
          let (px,py) = (string_of_tkn 0 x,string_of_tkn 0 y) in
          let msg = "error:evo:type is unmatched\n"^px^" + "^py^"\n" in
          raise @@ Failure msg
      )
    | Mult (x,y) ->
      let (f',x') = (evo g rs s x,evo g rs s y) in
      ( match (f'.plc , f'.tkn , x'.plc , x'.tkn) with
        | (_,Tkn_Z x,_,Tkn_Z y) ->
          ( match (x.z,y.z) with
            | (Some x,Some y) ->
              (false,{ plc=Plc_Z; tkn=(Tkn_Z { z=(Some (x*y)) }) })
            | _ ->
              (false,{ plc=Plc_Z; tkn=(Tkn_Z { z=None }) })
          )
        | (_,x,_,y) ->
          let (px,py) = (string_of_tkn 0 x,string_of_tkn 0 y) in
          let msg = "error:evo:type is unmatched\n"^px^" + "^py^"\n" in
          raise @@ Failure msg
      )
    | Gl_call n ->
      ( try
          let f = gl_call g n in
          let (s,d) =
            ( match f with
              | IO_Code x -> (src_of_code x.code,dst_of_code x.code)
              | IO_Inj x ->
                (snd (List.nth !(x.inj_name).coprd_cns x.i),
                 Plc_CoPrd x.inj_name)
              | IO_Cho x ->
                (Plc_Prd x.cho_name,
                 snd (List.nth !(x.cho_name).prd_cns x.i))
            ) in
          (false,{ plc=Plc_IO (s,d); tkn=Tkn_IO f })
        with
        | Not_found -> raise @@ Failure ("error:evo:global name "^n^" is not found")
      )
    | Opr_Rcd r ->
      let r' = List.map (evo g rs s) r in
      let r'' =
        (List.fold_left
           (fun l x ->
              match l with
              | RcdNml l ->
                ( match x with
                  | Tkn_CoPrd c ->
                    if c.agl_flg
                    then RcdAglMix
                        (List.map
                           (fun a ->
                              match a with
                              | Some a -> Some (l@[a])
                              | None -> None ) c.st)

                    else RcdNml (l@[Tkn_CoPrd c])
                  | x -> RcdNml (l@[x])
                )
              | RcdAglMix m ->
                ( match x with
                  | Tkn_CoPrd c ->
                    if c.agl_flg
                    then raise @@ Failure "error:evo_top:RcdAglMix"
                    else RcdAglMix
                        (List.map
                           (fun w ->
                              match w with
                              | Some w -> Some (w@[Tkn_CoPrd c])
                              | None -> None ) m)
                  | x ->
                    RcdAglMix
                      (List.map
                         (fun w ->
                            match w with
                            | Some v -> Some (v@[x])
                            | None -> None) m)
                )
           ) (RcdNml []) (List.map (fun x -> x.tkn) r')) in
      ( match r'' with
        | RcdNml l ->
          (false,{ plc=Plc_Rcd (List.map (fun x -> x.plc) r'); tkn=(Tkn_Rcd l) })
        | RcdAglMix ll ->
          (true,{ plc=Plc_Rcd (List.map (fun x -> x.plc) r');
                  tkn=Tkn_CoPrd
                      { st=(List.map
                              (fun l ->
                                 match l with
                                 | Some l -> Some (Tkn_Rcd l)
                                 | None -> None) ll)} }
          )
        | Agl e ->
          let s' = evo g rs s e in
          ( match s'.tkn with
            | Tkn_CoPrd c ->
              if c.agl_flg
              then raise @@ Failure "error:evo_top:Agl"
              else (true,{ s' with tkn = Tkn_CoPrd c })
            | Tkn_Z z ->
              (false,{ s' with tkn=Tkn_Z { z=z.z; agl_flg=true }})
            | v -> raise @@ Failure
                ("error:evo_top:Agl:CoPrd:\n"^
                 (string_of_tkn 0 v))
          )
        | Root i ->
          ( try
              (false,List.nth (s::rs) i)
            with
            | _ -> raise @@ Failure
                ("error:evo:Code.Root "^(string_of_int i)^"\n"^
                 "[ "^(Util.string_of_list " ; " string_of_st (s::rs))^"]")
          )
        | Opr_IO f ->
          (false,{ plc=Plc_IO (src_of_code f,dst_of_code f);
                   tkn=(Tkn_IO
                          (IO_Code
                             { gl_st=g; roots=(s::rs); code=f })) })
        | Opr_Exn e ->
          (false,{ plc=Top; tkn=Tkn_Exn e })
      ) )
and evo_code (g:gl_st) (rs:st list) (s:st) (a:code) : st =
  ( match a with
    | Seq (f0,f1) ->
      let s' = evo_code g rs s f0 in
      let s'' = evo_code g rs s' f1 in
      s''
    | Canon l ->
      ( match (s.plc,s.tkn) with
        | (Plc_Rcd q,Tkn_Rcd v) ->
          let o = List.map (fun (x,y) -> { plc=x;tkn=y })
              (List.combine q v) in
          let y =
            List.map
              (fun (t,x) -> evo_code g rs x t)
              (List.combine l o) in
          { tkn=Tkn_Rcd (List.map (fun x -> x.tkn) y);
            plc=Plc_Rcd (List.map (fun x -> x.plc) y) }
        | _ -> raise @@ Failure "error:evo_code:Canon"
      )
    | Opr o ->
      if (tkn_in_plc g o.src s.tkn)
      then
        let s' = evo g rs s o.opr in
        if (tkn_in_plc g o.dst s'.tkn)
        then { plc=o.dst; tkn=s'.tkn }
        else raise @@ Failure "error:evo_code:Opr:place theck error"
      else raise @@ Failure
          ("error:evo_code:Exp:tkn unmatched to place\n"^
           (string_of_plc_tkn false o.src s.tkn))
    | Code_CoPrd l ->
      let s' = evo_code g rs s l.pre in
      ( match s'.tkn with
        | Tkn_CoPrd c ->
          if c.agl_flg
          then
            let tkn = Tkn_CoPrd {
                st=(List.map
                      (fun (x,f) ->
                         match x with
                         | Some x ->
                           let x' = (evo_code g rs {plc=Top;tkn=x} f) in
                           Some x'.tkn
                         | None -> None)
                      (List.combine c.st l.post));
                agl_flg=false
              } in
            { plc=Top; tkn=tkn }
          else raise @@ Failure "error:evo_code:CoPrd:c.agl_flg=false"
        | _ -> raise @@ Failure "error:evo_code:CoPrd"
      )
    | Code_Prd _ -> raise @@ Failure "Imp:error:evo_code:Prd"

  )

let check_io (g : gl_st) (rs : st list) (c : code) (src:plc) (dst:plc) : bool =
  let (s,_) = (tkn_of_plc src,tkn_of_plc dst) in
  let v = evo_code g rs {tkn=s;plc=src} c in
  tkn_in_plc g dst v.tkn
