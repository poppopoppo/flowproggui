open Util
open Lang
open IR
type t = IR.mdl * Types.t * (IR.pt, Sgn.t) Tkn.t
let print (_,_,k) = Tkn.print k
let init_st:t = { flow = []; grm = []; ir_vct = PtMap.empty; rm = SgnMap.empty; },(Types.Var (ref Types.WC)),Tkn.Rcd [||]
let evo (g,src,k) (b:Ast.line) =
  ( match b with
    | Ast.Line e ->
      let p0 = DName (sgn()) in
      let r0 = Rcd_Ptn.P_A(sgn ()) in
      let (ev,_,_) = vh_of_exp_ptn g.ir_vct p0 r0 e in
      let st = SgnMap.empty in
      let cs = Stack.create () in
      let st = set_reg_ptn st r0 k in
      let k1 = run ev p0 st cs in
      (g,src,k1)
    | _ -> err "evo:0" )
let ast_from_string s =
      let lexbuf = Lexing.from_string s in
      (Imp_parser.buffer Imp_lexer.token lexbuf)
let ast_from_file (f:string) =
  Util.open_in_close f
    (fun c ->
       let lexbuf = Lexing.from_channel c in
       Imp_parser.file Imp_lexer.token lexbuf)

let mdl_from_string (s:string) =
  let lexbuf = Lexing.from_string s in
  List.hd @@ Imp_parser.file Imp_lexer.token lexbuf
exception Load
let load_from_file (s:string) =
    if Filename.check_suffix s "st"
    then
      let st:t = Util.open_in_close s (fun c -> Marshal.from_channel c) in
      st
    else err ("error:load: can't load "^s^". file prefix need to be st")
let save_to_file (st:t) s =
  if Filename.check_suffix s "st"
  then Util.open_out_close s (fun c -> Marshal.to_channel c st [])
  else err "error:load: can't save to s. file prefix need to be st"
