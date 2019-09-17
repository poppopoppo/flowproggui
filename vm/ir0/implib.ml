open Util
open Lang
open Ast
type t = et * Types.t
type st = ir_mdl * Ast.st * ir_code
let print ((_,k),y) = (Tkn.print k)^" : "^(Types.print (ref []) y)
let init_st () : t =
  ({ ns_v = []; ns =[]; ns_e = []; ns_t = [] },Tkn.Rcd [||])
,Types.Rcd Types.U
let mk_st g =
  let m0 = Lang.mk_ir_mdl g in
  (m0,Tkn.Rcd [||]),Types.Rcd Types.U
let evo ((g,k),y0) (b:Ast.line) =
  let _ = Timer.init () in
  let r0 = Rcd_Ptn.A (ref (Types.Ln y0)) in
  ( match b with
    | Ast.Line_Agl (i,e) ->
      let r1 = Rcd_Ptn.A (Types.newvar ()) in
      let l = ir_of_exp r0 r1 e in
      let p0 = List.fold_right (fun n p0 -> Seq(n,p0)) l (Ret r1) in
      let y1 = slv g 0 p0 in
      let st = VHash.create 10 in
      let _ = set_reg_ptn st r0 k in
      let st = (g,st,p0) in
      let fd = Unix.fork () in
      ( match fd with
        | 0 ->
          Util.open_out_close "default.tkn" (fun c -> Marshal.to_channel c st []);
          let _ = Unix.execve "evo_tkn.exe" [||] [||] in
          exit 0
        | _ ->
          let (_,x) = Unix.wait () in
          ( match x with
            | Unix.WEXITED 0 ->
              let (k1:Ast.tkn) =
                Util.open_in_close "default.tkn" (fun c -> Marshal.from_channel c) in
              let (j,ki) = Tkn.get_agl i k1 in
              let yi = Types.path i y1 in
              let yi = Types.get_agl_i j yi in
              ((g,ki),yi)
            | _ -> err "err1.3.a"
          ))
    | Ast.Line e ->
      let r1 = Rcd_Ptn.A (Types.newvar ()) in
      let l = ir_of_exp r0 r1 e in
      let p0 = List.fold_right (fun n p0 -> Seq(n,p0)) l (Ret r1) in
      let y1 = slv g 0 p0 in
      Util.pnt true (print_ir p0);
      let st = VHash.create 10 in
      let _ = set_reg_ptn st r0 k in
      Util.pnt true ((print_st st)^"\n");
      let fd = Unix.fork () in
      let et = (g,st,p0) in
      ( match fd with
        | 0 ->
          Util.open_out_close "default.tkn" (fun c -> Marshal.to_channel c et [Marshal.Closures]);
          let _ = Unix.execve "evo_tkn.exe" [||] [||] in
          exit 0
        | _ ->
          let (_,x) = Unix.wait () in
          ( match x with
            | Unix.WEXITED 0 ->
              let (k1:Ast.tkn) =
                Util.open_in_close "default.tkn" (fun c -> Marshal.from_channel c) in
              ((g,k1),y1)
            | _ -> err "err1.3"
          ))
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
