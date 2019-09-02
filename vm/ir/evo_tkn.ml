open Util
open Lang
open IR
let _ =
  pnt true "evo_tkn:-1\n";
  let t0 = Sys.time () in
  let ((g0,p0,r0,k0):IR.et) =
    ( try
        Util.open_in_close "default.tkn"
          (fun c -> Marshal.from_channel c)
      with e -> raise e )  in
  let st = SgnMap.empty in
  let cs = Stack.create () in
  pnt true "evo_tkn:0\n";
  let st = set_reg_ptn st r0 k0 in
  pnt true "evo_tkn:1\n";
  let k1 = run g0 p0 st cs in
  let _ = Util.open_out_close "default.tkn"
      (fun c -> Marshal.to_channel c (g0,p0,r0,k1) []) in
  let t1 = Sys.time () in
  pnt true "time 0:";print_float (t1-.t0); pnt true "\n";
  exit 0
