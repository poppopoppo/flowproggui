type t = Imp.gl_st * Imp.st
let string_of_t x =
  "global state: "^(Imp.string_of_gl_st (fst x))^
  "\nstate: "^(Imp.string_of_st (snd x))

let evo ((g,st):t) (b:Imp.buffer) : t =
  (try
     ( match b with
       | Imp.Evo e ->
         Util.pnt true (Imp.string_of_code e);
         let st0 = Imp.evo_code g st e in
         (g,st0)
       | _ -> raise @@ Failure ("Implib:evo:")
     )
   with Stack_overflow ->
     (Util.pnt true "Implib.evo:Stack_overflow\n");
     raise @@ Failure "Implib:evo:Stack_overflow" )

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

exception Load
let load_from_file (s:string) : t =
  try
    if Filename.check_suffix s "st"
    then
      let st:t = Util.open_in_close s (fun c -> Marshal.from_channel c) in
      Util.pnt true ((string_of_t st)^" is loaded from "^s^"\n");st
    else raise @@ Failure ("error:load: can't load "^s^". file prefix need to be st")
  with | Load -> Util.pnt true ("error:Load:load_from_file:"^"loading "^s^" is failed\n"); raise Load
       | Failure err -> Util.pnt true (err^"\n"); raise @@ Failure err
       | Util.OPEN_IN  -> Util.pnt true "open_in\n"; raise @@ Failure "open_in"
       | err -> Util.pnt true ("error:load_from_file:"^"loading "^s^" is failed\n"); raise err
let save_to_file (st:t) s =
  if Filename.check_suffix s "st"
  then
    let _ =
      Util.open_out_close s (fun c -> Marshal.to_channel c st []) in
    Util.pnt true ((string_of_t st)^" is saved to "^s^"\n")
  else raise @@ Failure "error:load: can't save to s. file prefix need to be st"
