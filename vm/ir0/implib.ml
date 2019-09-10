open Util
open Lang
open Ast
type t = et * r Rcd_Ptn.t * pt
let print ((_,k),_,_) = Tkn.print k
let init_st () : t =
  let r0 = Rcd_Ptn.R [||] in
  let p0 = ref (Ret r0) in
  ({ ns_v = []; ns =[]; ns_e = []; ns_t = [] },Tkn.Rcd [||])
  ,r0,p0
let mk_st g k =
  let r0 = Rcd_Ptn.R [||] in
  let p0 = ref (Ret r0) in
  let m0 = Lang.mk_ir_mdl g in
  (m0,k),r0,p0
let evo ((g,k),r0,p0) (b:Ast.line) =
  let _ = Timer.init () in
  ( match b with
    | Ast.Line_Agl (i,e) ->
      let (p1,r1) = ir_of_exp p0 r0 e in
      let _ = slv g 0 p0 in
      let fd = Unix.fork () in
      let et = ((g,k),r0,p0) in
      ( match fd with
        | 0 ->
          Util.open_out_close "default.tkn" (fun c -> Marshal.to_channel c et []);
          let _ = Unix.execve "evo_tkn.exe" [||] [||] in
          exit 0
        | _ ->
          let (_,x) = Unix.wait () in
          ( match x with
            | WEXITED 0 ->
              let (((_,k1),_,_):t) =
                Util.open_in_close "default.tkn" (fun c -> Marshal.from_channel c) in
              let (j,ki) = Tkn.get_agl i k1 in
              let yi = Types.path i (get_rm_ptn r1) in
              let yi = Types.get_agl_i j yi in
              let ri = ref (Types.Ln yi) in
              let rp = Rcd_Ptn.set_path i r1 (Rcd_Ptn.A ri) in
              ((g,ki),rp,p1)
            | _ -> err "err1.3.a"
          ))
    | Ast.Line e ->
      let (p1,r1) = ir_of_exp p0 r0 e in
      let _ = slv g 0 p0 in
      let fd = Unix.fork () in
      let et = ((g,k),r0,p0) in
      ( match fd with
        | 0 ->
          Util.open_out_close "default.tkn" (fun c -> Marshal.to_channel c et [Marshal.Closures]);
          let _ = Unix.execve "evo_tkn.exe" [||] [||] in
          exit 0
        | _ ->
          let (_,x) = Unix.wait () in
          ( match x with
            | WEXITED 0 ->
              let (((_,k1),_,_):t) =
                Util.open_in_close "default.tkn" (fun c -> Marshal.from_channel c) in
              ((g,k1),r1,p1)
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
