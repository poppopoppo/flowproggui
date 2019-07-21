open Types
open Vm4
let _ =
  let a = Sys.time () in
  Util.pnt true "start evo_tkn.exe\n";
  let (c0,p0,v0):et =
    Util.open_in_close "default.tkn"
      (fun c -> Marshal.from_channel c) in
  Util.pnt true ((Print.print_tkn_s v0)^"\n");
  let tb = Core.Hashtbl.create (module Sgn) in
  let (a0,q0) =
    (asm_ini (),plc ()) in
  let (s0p,h0p) = st_ini () in
  let r0p = add_k_r s0p Tkn_Unt in
  let _ = asm_of_code tb a0 q0 (s0p,h0p) r0p c0 p0 in
  Util.pnt true "test3\n";
  let (s0,h0) = st_mk (BatDynArray.length s0p) in
  let k0 = k_rcd_of_tkn_s tb v0 in
  let _ = add_k_rcd_r (s0,h0) k0 in
  Util.pnt true ("asm:\n"^(print_asm a0));
  let k1 = run a0 q0 (s0,h0) (Stack.create ()) in
  let r1 = add_k_rcd_r (s0,h0) k1 in
  let v1 = tkn_s_of_k tb (s0,h0) (Ptr_Reg r1) in
  (* let v1 = Imp.evo_tkn (ref v0) (ref c0) p0 in
     let v1 = !v1 in *)
  Util.open_out_close "default.tkn"
    (fun c -> Marshal.to_channel c (c0,p0,v1) []);
  Util.pnt true ((Print.print_tkn_s v1)^"\n");
  print_float (Sys.time () -. a);
  Util.pnt true "\nexit evo_tkn.exe\n";
  exit 0
