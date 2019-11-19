(*open Util
open Lang
  type t = Ast.ir_mdl * Ast.st * Ast.ir_code *)
let _ =
  (*let t0 = Sys.time () in
  let (g0,st,p0):t =
    ( try
        Util.open_in_close "default.tkn"
          (fun c -> Marshal.from_channel c)
      with e -> raise e )  in
  let cs = Stack.create () in
  let k1 =
    ( try run g0 p0 st cs
      with Failure e -> err e) in
  let _ = Util.open_out_close "default.tkn"
      (fun c -> Marshal.to_channel c k1 []) in
  let t1 = Sys.time () in
    pnt true "time 0:";print_float (t1-.t0); pnt true "\n";*)
  exit 0
