open Util
open Lang
open IR
type t = et
let print (_,_,_,k) = Tkn.print k
let init_st () : t =
  let iv = PtMap.empty in
  let p0 = DName(sgn ()) in
  let p1 = DName(sgn ()) in
  let r0 = (sgn ()) in
  let iv = PtMap.add p0 (Seq(Ini(r0,Rcd [||]),p1)) iv in
  let iv = PtMap.add p1 (Ret (P_A r0)) iv in
  { flow = []; grm = []; ir_vct = iv; rm = SgnMap.empty; ns_t = StgMap.empty },
  p1,(Rcd_Ptn.P_A r0),Tkn.Rcd [||]
let mk_st g k =
  let m0 = Lang.ir_of_ast g in
  let p0 = DName(sgn ()) in
  let p1 = DName(sgn ()) in
  let r0 = (sgn ()) in
  let iv = PtMap.add p0 (Seq(Ini(r0,Rcd [||]),p1)) m0.ir_vct in
  let iv = PtMap.add p1 (Ret (P_A r0)) iv in
  let rm = init_rm m0.rm iv in
  { m0 with ir_vct = iv; rm = rm },
  p1,(Rcd_Ptn.P_A r0),k
let evo ((g,p0,r0,k):t) (b:Ast.line) =
  let _ = Timer.init () in
  ( match b with
    | Ast.Line_Agl (i,e) ->
      let (iv,p1,r1) = vh_of_exp_ptn g.ir_vct p0 r0 e in
      Timer.pnt "t0";
      let rm = init_rm g.rm iv in
      Timer.pnt "t1";
      let g0 = { g with ir_vct = iv; rm = rm } in
      let _ = Typing.slv g0 0 p0 in
      Timer.pnt "t2";
      let et = (Sgn.get_env (),g0,p0,r0,k) in
      let fd = Unix.fork () in
      ( match fd with
        | 0 ->
          Util.open_out_close "default.tkn" (fun c -> Marshal.to_channel c et []);
          let _ = Unix.execve
              "evo_tkn.exe"
              (Array.make 0 "")
              (Array.make 0 "") in
          exit 0
        | _ ->
          let (_,x) = Unix.wait () in
          ( match x with
            | WEXITED 0 ->
              let ((_,_,_,k1):t) =
                ( try
                    Util.open_in_close "default.tkn"
                      (fun c -> Marshal.from_channel c)
                  with _ -> err "err1.2") in
              let (j,ki) = Tkn.get_agl i k1 in
              let yi = Types.path i (get_rm_ptn g0.rm r1) in
              let yi = Types.get_agl_i j yi in
              let ri = sgn () in
              let rp = Rcd_Ptn.set_path i r1 (P_A ri) in
              let rm = SgnMap.add ri (Types.Var (ref (Types.Ln yi))) g0.rm in
              let g0 = { g0 with rm = rm } in
              (g0,p1,rp,ki)
            | _ -> err "err1.3.a"
          ))
    | Ast.Line e ->
      let (iv,p1,r1) = vh_of_exp_ptn g.ir_vct p0 r0 e in
      Timer.pnt "t0";
      let rm = init_rm g.rm iv in
      Timer.pnt "t1";
      let g0 = { g with ir_vct = iv; rm = rm } in
      let _ = Typing.slv g0 0 p0 in
      Timer.pnt "t2";
      let et = (g0,p0,r0,k) in
      let fd = Unix.fork () in
      ( match fd with
        | 0 ->
          Util.open_out_close "default.tkn" (fun c -> Marshal.to_channel c et []);
          let _ = Unix.execve
              "evo_tkn.exe"
              (Array.make 0 "")
              (Array.make 0 "") in
          exit 0
        | _ ->
          let (_,x) = Unix.wait () in
          ( match x with
            | WEXITED 0 ->
              let ((_,_,_,k1):t) =
                ( try
                    Util.open_in_close "default.tkn"
                      (fun c -> Marshal.from_channel c)
                  with _ -> err "err1.2") in
              (g0,p1,r1,k1)
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
