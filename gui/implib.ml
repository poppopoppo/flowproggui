type t = Imp.gl_st * Imp.st

let evo ((g,st):t) (b:Imp.buffer) : t =
  match b with
  | Imp.Evo e ->
        let st0 = Imp.evo_code g [] st e in
        (g,st0)
  | Imp.Glb_Etr ge ->
    ( match ge with
      | Imp.Etr l ->
        let b = Imp.check_io g [] !l.code !l.src !l.dst in
        if b
        then ((ge::g),st)
        else raise @@ Failure "error:Repl.evo: type unmatced"
      | _ -> (ge::g,st)
    )
  | _ -> raise @@ Failure "Implib:evo"
let init_st = ([],(Imp.Typ_Rcd [],Imp.Tkn_Rcd []))

let ast_from_string s =
  let lexbuf = Lexing.from_string s in
  Imp_parser.buffer Imp_lexer.token lexbuf

let ast_from_file f =
  Util.open_in_close f
    (fun c ->
       let lexbuf = Lexing.from_channel c in
       Imp_parser.file Imp_lexer.token lexbuf)

let mdl_from_string s =
  let lexbuf = Lexing.from_string s in
  Imp_parser.file Imp_lexer.token lexbuf

type ide =
  string list * (* file names for loading *)
  t (* state *)


let load_from_file (s:string) : ide =
  try
    if Filename.check_suffix s "st"
    then
      let ide_st = Util.open_in_close s (fun c -> Marshal.from_channel c) in
      Util.pnt true (s^" is loaded");ide_st
    else raise @@ Failure ("error:load: can't load "^s^". file prefix need to be st")
  with | Failure err -> raise @@ Failure err
       | err -> Util.pnt true "error:load\n"; raise err
let save_to_file (st:ide) s =
  if Filename.check_suffix s "st"
  then
    let _ = Util.open_out_close s (fun c -> Marshal.to_channel c st) in
    Util.pnt true (s^" is saved")
  else raise @@ Failure "error:load: can't save to s. file prefix need to be st"
