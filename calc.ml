type mode =
    Calc
  | Glb_mode of {
      name:string;
      code:Flow.Exp.vh;
      st:Flow.evo_rtn
    }
let pnt s =
  print_string s;flush stdout
let line = "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
let pnt_line () = pnt line
let gl_src:(string option ref) = ref None
let gl_dst:(string option ref) = ref None
let string_to_command l = Parser.buffer Lexer.token l
let exit_calc st dst err =
  (match (st,dst) with
   | (None,None) -> ()
   | (Some _,None) -> ()
   | (None,Some _) -> ()
   | (Some st,Some dst) -> Flow.save !st dst);
  match err with
  | None -> exit 0
  | Some e -> raise e

let _ =
  let _ = Arg.parse
      [("-s",Arg.String
          (fun s -> gl_src := (Some s)),"src file");
       ("-d",Arg.String (fun s -> gl_dst := (Some s)),"dst file")      ]
      (fun _ -> ()) "-s src_filename -d dst_filename" in

  let (gl_src,gl_dst) = (!gl_src,!gl_dst) in
  let gl_st = match gl_src with
    | None -> ref (Flow.St.Rcd [])
    | Some s -> ref (Flow.load s) in
  let glb_st = ref [] in
  let _ = Sys.signal Sys.sigint
      (Signal_handle (fun _ -> exit_calc (Some gl_st) gl_dst None)) in
  let rec buf () =
    let s = input_line stdin in
    let reg = Str.regexp "\\(.*\\)\\(;\\)\\(.*\\)" in
    if (Str.string_match reg s 0)
    then
      let m = (Str.matched_group 1 s) in
      let _ = print_string "> ";flush stdout in
      m^" "^(buf ())
    else s in

  let mode = ref Calc in

  while true do
    try
      let pmpt =
        line^
        ((Flow.string_of_gl_st !glb_st)^"\n")^
        (Flow.string_of_st 0 !gl_st)^
        "command #\n> " in
      pnt pmpt;

      let s = buf () in
      let lexbuf = Lexing.from_string s in
      let result = string_to_command lexbuf in

      match result with
      | Flow.Glb g ->
        ( match !mode with
        | Calc -> glb_st := (g:: !glb_st)
        | Glb_mode _ -> raise @@ Failure "error:current mode is glb_mode"
        )
      | Flow.Evo e ->
        let st' = Flow.evo_vh !glb_st (!gl_st) e in
        ( match !mode with
          | Calc ->
            ( match st' with
              | Nml e -> gl_st := e
              | _ -> raise @@ Failure "error:calc:Agl returned"
            )
          | Glb_mode g ->
            ( match st' with
              | Nml st' ->
                mode := Glb_mode {
                name=g.name; code=Flow.Exp.Seq (g.code,e);
                st=(Nml st') }
              | _ -> raise @@ Failure "error:calc:glb_mode:Agl returned"
            )
        )
      | Flow.Glb_mode (n,s) ->
        mode := Glb_mode { name=n;code=(Flow.Exp.Exp Flow.Exp.Root);st=(Nml s) }
    with
    | Parser.Error -> pnt "error: parsing error"
    | Failure s -> pnt @@ "error:"^s
    | Invalid_argument s -> pnt @@ "error:Invalid_argument "^s
    | Lexer.Error _ -> pnt "error:Lexer.Error"
    | err -> exit_calc (Some gl_st) gl_dst (Some err)
  done
