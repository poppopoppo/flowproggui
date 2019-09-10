open Util
open Lang
open Ast
type t = Ast.et * (Ast.r Rcd_Ptn.t) * pt
let _ =
  let t0 = Sys.time () in
  let ((g0,k0),r0,p0):t =
    ( try
        Util.open_in_close "default.tkn"
          (fun c -> Marshal.from_channel c)
      with e -> raise e )  in
  let st = Hashtbl.create 10 in
  let cs = Stack.create () in
  let _ = set_reg_ptn st r0 k0 in
  let k1 = run g0 p0 st cs in
  let _ = Util.open_out_close "default.tkn"
      (fun c -> Marshal.to_channel c ((g0,p0),r0,k1) []) in
  let t1 = Sys.time () in
  pnt true "time 0:";print_float (t1-.t0); pnt true "\n";
  exit 0
