open Types
type t = gl_st * st * (int ref)
let string_of_t (g,t,ir) =
  "global state: "^(Print.string_of_gl_st g)^
  "\nstate: "^(Print.string_of_st t)^
  "\nsgn-count: "^(string_of_int !ir)^"\n"
let evo ((g,(_,v),i):t) (b:Types.buffer) : t =
  (try
     ( match b with
       | Types.Evo e ->
         Util.pnt true (Print.string_of_code 0 e);
         let v0 = Imp.evo_code g v i e in
         let d = Types.Typ_Null in
         Util.pnt true "TEST0\n"; 
           (g,(d,v0),i)
       | _ -> raise @@ Failure ("Implib:evo:")
     )
   with Stack_overflow ->
     (Util.pnt true "Implib.evo:Stack_overflow\n");
     raise @@ Failure "Implib:evo:Stack_overflow"
      | _ -> raise (Failure "Implib:evo:err1")
  )

let init_st = ([],(Types.Typ_Rcd [],Types.Tkn_Rcd []),ref 0)


type ast_return =
  | Ast_Some of Types.buffer
  | Ast_Fail of string

let ast_from_string s =
  ( try
      let lexbuf = Lexing.from_string s in
      Ast_Some (Imp_parser.buffer Imp_lexer.token lexbuf)
    with _ -> Ast_Fail "" )

let ast_from_file (f:string) : Types.mdl =
  Util.open_in_close f
    (fun c ->
       let lexbuf = Lexing.from_channel c in
       Imp_parser.file Imp_lexer.token lexbuf)

let mdl_from_string (s:string) : mdl  =
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
