open Util
open Lang
open IR
let _ =
  let ((g0,p0,r0,k0):IR.et) =
    ( try
        Util.open_in_close "default.tkn"
          (fun c -> Marshal.from_channel c)
      with e -> raise e )  in
  let st = SgnMap.empty in
  let cs = Stack.create () in
  let st = set_reg_ptn st r0 k0 in
  let k1 = run g0 p0 st cs in
  let _ = Util.open_out_close "default.tkn"
      (fun c -> Marshal.to_channel c (g0,p0,r0,k1) []) in
  exit 0
