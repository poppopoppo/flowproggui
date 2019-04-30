let pnt s =
  print_string (s^"\n");flush stdout
let pnt_line () =
  pnt "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~"
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
  while true do
    try
      pnt_line ();
      print_string ((Flow.string_of_gl_st !glb_st)^"\n");
      Flow.print_st !gl_st;
      print_string "command #\n> ";flush stdout;

      let s = buf () in
      let lexbuf = Lexing.from_string s in
      let result = string_to_command lexbuf in
      match result with
      | Glb g -> glb_st := (g:: !glb_st)
      | Evo e ->
        let _  = gl_st := Flow.evo !glb_st (!gl_st) e in
        ()
    with
    | Parser.Error -> pnt "error: parsing error"
    | Failure s -> pnt @@ "error:"^s
    | Invalid_argument s -> pnt @@ "error:Invalid_argument "^s
    | Lexer.Error _ -> pnt "error:Lexer.Error"
    | err -> exit_calc (Some gl_st) gl_dst (Some err)
  done
