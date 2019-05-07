let pnt s =
  print_string s;flush stdout

type t = {
  gl_st : Flow.Glb_St.t;
  st : Flow.St.t;
  mode : mode
}
and mode =
    Calc
  | Glb_mode of {
      name:string;
      src:Flow.Plc.t;
      dst:Flow.Plc.t;
      code:Flow.Exp.vh;
      st:Flow.St.t
    }

let evo (v:t) (b:Flow.Buffer.t) : t =
  match b with
  | Flow.Buffer.Evo e ->
    ( match v.mode with
      | Calc ->
        let st = Flow.evo_vh v.gl_st v.st e in
        ( match st with
          | Flow.St.CoPrd c ->
            if c.agl_flg
            then ( match c.st with
                | Pure (_,x) -> { v with st=x }
                | Mix _ -> raise @@ Failure "error:Repl.evo:Mix"
              )
            else { v with st=st }
          | x -> { v with st=x }
        )
      | Glb_mode g ->
        let st = Flow.evo_vh v.gl_st g.st e in
        ( match st with
          | Flow.St.CoPrd c ->
            if c.agl_flg
            then ( match c.st with
                | Pure (_,x) ->
                  let g' = Glb_mode { name=g.name; src=g.src; dst=g.dst;
                                      code=(Flow.Exp.Seq (g.code,e)); st=x } in
                  { v with mode=g' }
                | Mix _ -> raise @@ Failure "error:Repl.evo:Mix"
              )
            else
              let g' = Glb_mode { name=g.name; src=g.src; dst=g.dst;
                  code=(Flow.Exp.Seq (g.code,e)); st=st } in
              { v with mode=g' }
          | x ->
            let g' = Glb_mode { name=g.name; src=g.src; dst=g.dst;
                                code=(Flow.Exp.Seq (g.code,e)); st=x } in
            { v with mode=g' }
        )
    )
  | Flow.Buffer.Glb g -> { v with gl_st=(g::v.gl_st) }
  | Flow.Buffer.Glb_mode g ->
    ( match v.mode with
      | Calc -> { v with
                  mode=Glb_mode {
                      name=g.name;
                      code=(Flow.Exp.Exp (g.src,Flow.Exp.Root));
                      src=g.src;
                      dst=g.dst;
                      st=Flow.St.plc_to g.src
                    }
                }
      | Glb_mode _ -> raise @@ Failure "error:Repl.evo: allready global edit mode"
    )
  | Flow.Buffer.End ->
    ( match v.mode with
      | Calc -> raise Flow.Buffer.End
      | Glb_mode g ->
        let ge = Flow.Glb_St.Gl_Etr { name=g.name; src=g.src; dst=g.dst; code=g.code } in
        { v with mode=Calc; gl_st=(ge::v.gl_st) }
    )
  | Def g -> { v with gl_st=((Flow.Glb_St.Dta_Def g)::v.gl_st) }
let line = "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
let string_to_buf l = Parser.buffer Lexer.token l

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
  st=Flow.St.Rcd [];
  mode=Calc
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
      pnt (s^" is loaded");s0
    else raise @@ Failure ("error:load: can't load "^s^". file prefix need to be st")
  with | Failure err -> raise @@ Failure err
       | err -> pnt "error:load\n"; raise err
let save (st:t ref) s =
  let reg = Str.regexp ".+\\.st" in
  if (Str.string_match reg s 0)
  then let f = open_out s in
    let _ = Marshal.to_channel f !st [] in
    pnt (s^" is saved")
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
        ((Flow.Glb_St.string_of !v.gl_st)^"\n")^
        "state # "^(Flow.St.string_of 0 !v.st)^
        "\ncommand #\n» " in
      pnt pmpt
    | Glb_mode g ->
      let pmpt =
        line^
        "~ global edit mode ~\n"^
        "§§ "^g.name^" "^(Flow.Plc.string_of 0 g.src)^" ⊢ "^(Flow.Plc.string_of 0 g.dst)^"\n"^
        "state # "^(Flow.St.string_of 0 g.st)^
        "\ncommand #\n» " in
      pnt pmpt );
  let v' =
    try
      let s = buf () in
      let lexbuf = Lexing.from_string s in
      let result = string_to_buf lexbuf in
      let v' = evo !v result in
      v'
    with
    | Flow.Buffer.End -> raise Flow.Buffer.End
    | Parser.Error -> (pnt "error: parsing error");!v
    | Failure s -> (pnt @@ "error:"^s); !v
    | Invalid_argument s -> (pnt @@ "error:Invalid_argument "^s); !v
    | Lexer.Error _ -> (pnt "error:Lexer.Error"); !v
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
