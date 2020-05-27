
type t = { gl_st:Imp.gl_st; st:Imp.st; mode:mode; log:string list }
and mode =
    Calc
  | Glb_mode of glb_mode
and glb_mode = { name:string; src:Imp.typ; dst:Imp.typ; code:Imp.code; gm_st:Imp.st }

let evo (v:t) (b:Imp.buffer) : t =
  match b with
  | Imp.Evo e ->
    ( match v.mode with
      | Calc ->
        let st = Imp.evo_code v.gl_st [] v.st e in
        { v with st=st }

      | Glb_mode g ->
        let st = Imp.evo_code v.gl_st [] g.gm_st e in
        let g' = Glb_mode {
            g with code=(Imp.Seq (g.code,e)); gm_st=st } in
        { v with mode=g' }
    )
  | Imp.Glb_Etr g ->
    ( match g with
      | Imp.Etr l ->
        let b = Imp.check_io v.gl_st [] !l.code !l.src !l.dst in
        if b
        then { v with gl_st=(g::v.gl_st) }
        else raise @@ Failure "error:Repl.evo: type unmatced"
      | _ -> { v with gl_st=(g::v.gl_st) }
    )
  | Imp.Glb_mode_Stt g ->
    ( match v.mode with
      | Calc ->
        { v with
          mode=Glb_mode { name=g.name; src=g.src; dst=g.dst;
                          code=(Imp.Opr { src=(Imp.plc_of_typ g.src);dst=(Imp.plc_of_typ g.dst);
                                          opr=Imp.Root 0});
                          gm_st=(g.src,Imp.tkn_of_typ g.src) }
        }
      | Glb_mode _ -> raise @@ Failure "error:Repl.evo: allready global edit mode"
    )
  | Imp.End ->
    ( match v.mode with
      | Calc -> raise Imp.End
      | Glb_mode g ->
        if (Imp.tkn_in_typ v.gl_st g.dst (snd g.gm_st))
        then
          let e:Imp.etr = { gl_name=g.name; src=g.src; dst=g.dst; code=g.code } in

          let ge = Imp.Etr (ref e) in
          { v with mode=Calc; gl_st=(ge::v.gl_st) }
        else raise @@ Failure "error:Repl.evo: unmatched to dst place"
    )
let line = "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
let string_to_buf l = Imp_parser.buffer Imp_lexer.token l

let rec buf () =
  let s = input_line stdin in
  let reg = Str.regexp "\\(.*\\)\\(;\\)\\(.*\\)" in
  if (Str.string_match reg s 0)
  then
    let m = (Str.matched_group 1 s) in
    let _ = print_string "> ";flush stdout in
    m^" "^(buf ())
  else s
let init_st = {
  gl_st=[];
  st=(Imp.Typ_Rcd [],Imp.Tkn_Rcd []);
  mode=Calc;
  log=[]
}


let load (s:string) : t =
  try
    let reg = Str.regexp ".+\\.st" in
    if (Str.string_match reg s 0)
    then
      let f = open_in s in
      let s0 = Marshal.from_channel f  in
      let _ = close_in f in
      let _ = Sys.remove s in
      Util.pnt true (s^" is loaded");s0
    else raise @@ Failure ("error:load: can't load "^s^". file prefix need to be st")
  with | Failure err -> raise @@ Failure err
       | err -> Util.pnt true "error:load\n"; raise err
let save (st:t ref) s =
  let l = open_out "default.lg" in
  let rec f v =
    match v with
    | [] -> ()
    | h::t -> output_string l (h^"\n");f t in
  f !st.log; close_out l;
  let reg = Str.regexp ".+\\.st" in
  if (Str.string_match reg s 0)
  then let f = open_out s in
    let _ = Marshal.to_channel f !st [] in
    Util.pnt true (s^" is saved");close_out f
  else raise @@ Failure "error:load: can't save to s. file prefix need to be st"

let exit v dst =
  ( match dst with
    | None -> exit 0
    | Some dst ->
      save v dst; exit 0 )

let rec repl (v:t ref) : unit =
  ( match !v.mode with
    | Calc ->
      let pmpt =
        line^
        ((Imp.string_of_gl_st !v.gl_st)^"\n")^
        "state # "^(Imp.string_of_st !v.st)^
        "\ncommand #\n» " in
      Util.pnt true pmpt
    | Glb_mode g ->
      let pmpt =
        line^
        "~ global edit mode ~\n"^
        "§§ "^g.name^" "^(Imp.string_of_typ 0 g.src)^" ⊢ "^(Imp.string_of_typ 0 g.dst)^"\n"^
        "state # "^(Imp.string_of_st g.gm_st)^
        "\ncommand #\n» " in
      Util.pnt true pmpt );
  let v' =
    try
      let s = buf () in
      let lexbuf = Lexing.from_string s in
      let result = string_to_buf lexbuf in
      let s' = if !v.mode=Calc
        then s
        else if result=Imp.End
        then (" ». ")
        else (" » "^s) in
      let v' = evo !v result in
      { v' with log=(v'.log@[s']) }
    with
    | Imp.End -> raise Imp.End
    | Imp_parser.Error -> (Util.pnt true "error: parsing error");!v
    | Failure s -> (Util.pnt true @@ "error:"^s); !v
    | Invalid_argument s -> (Util.pnt true @@ "error:Invalid_argument "^s); !v
    | Imp_lexer.Error _ -> (Util.pnt true "error:Lexer.Error"); !v
    | err -> raise err in
  v:=v';
  repl v
let run () =
  let (src_ref,dst_ref) = (ref None,ref None) in
  Arg.parse
    [("-s",Arg.String
        (fun s -> src_ref:=(Some s)),"src file");
     ("-d",Arg.String (fun s -> dst_ref:=(Some s)),"dst file")      ]
    (fun _ -> ()) "-s src_filename -d dst_filename";


  let v = ref
      ( match !src_ref with
        | None -> init_st
        | Some s -> load s
      ) in

  let _ = Sys.signal Sys.sigint (Signal_handle (fun _ -> exit v !dst_ref)) in

  try
    repl v
  with
  | err ->
    ( match !dst_ref with
      | Some f -> (save v f); raise err
      | None -> raise err )
