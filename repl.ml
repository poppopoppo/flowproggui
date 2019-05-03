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
      code:Flow.Exp.vh;
      st:Flow.evo_rtn
    }

let evo (v:t) (b:Flow.buf) : t =
  match b with
  | Evo e ->
    let st = Flow.evo_vh v.gl_st (Flow.Nml v.st) e in
    ( match st with
      | Flow.Nml st -> { v with st=st }
      | Flow.Agl (_,a) -> { v with st=a }
      | Flow.AglMix _ -> raise @@ Failure "error:Repl.evo:AglMix"
    )
  | Glb g -> { v with gl_st=(g::v.gl_st) }
  | Glb_mode (s,e) ->
    { v with
      mode=Glb_mode {
          name=s;
          code=(Flow.Exp.Exp Flow.Exp.Root);
          st=(Flow.Nml e) } }
let line = "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
let string_to_buf l = Parser.buffer Lexer.token l
let exit v dst =
  ( match (v.st,dst) with
    | (_,None) -> exit 0
    | (st,Some dst) ->
      Flow.save st dst; exit 0 )

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
let rec repl (v:t) : unit =
  let v' =
    try
    let pmpt =
      line^
      ((Flow.string_of_gl_st v.gl_st)^"\n")^
      (Flow.string_of_st 0 v.st)^
      "\ncommand #\n> " in
    pnt pmpt;

    let s = buf () in
    let lexbuf = Lexing.from_string s in
    let result = string_to_buf lexbuf in
    let v' = evo v result in
    v'
  with
  | Parser.Error -> (pnt "error: parsing error");v
  | Failure s -> (pnt @@ "error:"^s); v
  | Invalid_argument s -> (pnt @@ "error:Invalid_argument "^s); v
  | Lexer.Error _ -> (pnt "error:Lexer.Error"); v
  | err -> raise err in

  repl v'
let run () =
  let (src_ref,dst_ref) = (ref None,ref None) in
  Arg.parse
    [("-s",Arg.String
        (fun s -> src_ref:=(Some s)),"src file");
     ("-d",Arg.String (fun s -> dst_ref:=(Some s)),"dst file")      ]
    (fun _ -> ()) "-s src_filename -d dst_filename";


  let v =
    ( match !src_ref with
      | None -> init_st
      | Some s -> { init_st with st=(Flow.load s) }
    ) in

  let _ = Sys.signal Sys.sigint (Signal_handle (fun _ -> exit v !dst_ref)) in

  try
    repl v
  with
  | err ->
  ( match !dst_ref with
    | Some f -> (Flow.save v.st f); raise err
    | None -> raise err )
