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

let init_st = ([],(Imp.Typ_Rcd [],Imp.Tkn_Rcd []))

let ast_from_string s =
  let lexbuf = Lexing.from_string s in
  Imp_parser.buffer Imp_lexer.token lexbuf

let ast_from_file f =
  Util.open_io f
    (fun c ->
       let lexbuf = Lexing.from_channel c in
       Imp_parser.file Imp_lexer.token lexbuf)
