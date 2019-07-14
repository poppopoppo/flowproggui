open Types
let _ =
  let a = Sys.time () in
  Util.pnt true "start evo_tkn.exe\n";
  let (c0,p0,v0):et =
    Util.open_in_close "default.tkn"
      (fun c -> Marshal.from_channel c) in
  Util.pnt true ((Print.print_tkn_s v0)^"\n");
  let tb = Hashtbl.create 10 in
  let (a0,s0,q0,r0) = (Vm2.asm_ini (),Vm2.st_ini(),sgn (),sgn ()) in
  let _ = Vm2.asm_of_code tb a0 q0 r0 c0 p0 in
  let k0 = Vm2.k_rcd_of_tkn_s tb v0 in
  Vm2.set_k_rcd s0 r0 k0;
  let k1 = Vm2.run a0 q0 s0 (Stack.create ()) in
  let r1 = sgn () in
  Vm2.set_k_rcd s0 r1 k1;
  let v1 = Vm2.tkn_s_of_k tb s0 r1 in
  (* let v1 = Imp.evo_tkn (ref v0) (ref c0) p0 in
     let v1 = !v1 in *)
  Util.open_out_close "default.tkn"
    (fun c -> Marshal.to_channel c (c0,p0,v1) []);
  Util.pnt true ((Print.print_tkn_s v1)^"\n");
  print_float (Sys.time () -. a);
  Util.pnt true "\nexit evo_tkn.exe\n";
  exit 0
