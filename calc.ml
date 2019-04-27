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
    | None -> ref Flow.St.Unit
    | Some s -> ref (Flow.load s) in

  let _ = Sys.signal Sys.sigint
      (Signal_handle (fun _ -> exit_calc (Some gl_st) gl_dst None)) in

  while true do
    try
      let _ = pnt_line ();Flow.print_st !gl_st in
      let _ = print_string "command # ";flush stdout in
      let s = input_line stdin in
      let lexbuf = Lexing.from_string s in
      let result = string_to_command lexbuf in
      let _  = gl_st := Flow.calc (!gl_st) result in
      ()
    with
    | Parser.Error -> pnt "error: parsing error"
    | Failure s -> pnt @@ "error:"^s
    | Invalid_argument s -> pnt @@ "error:Invalid_argument "^s
    | err -> exit_calc (Some gl_st) gl_dst (Some err)
  done
