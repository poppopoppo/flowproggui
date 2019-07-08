open Types
let _ =
  let a = Sys.time () in
  Util.pnt true "start evo_tkn.exe\n";
  let (c0,p0,v0):et =
    Util.open_in_close "default.tkn"
      (fun c -> Marshal.from_channel c) in
  Util.pnt true ((Print.print_tkn_s v0)^"\n");
  let v1 = Imp.evo_tkn v0 (ref c0) p0 in
  Util.open_out_close "default.tkn"
    (fun c -> Marshal.to_channel c (c0,p0,v1) []);
  Util.pnt true ((Print.print_tkn_s v1)^"\n");
  print_float (Sys.time () -. a);
  Util.pnt true "\nexit evo_tkn.exe\n";
  exit 0
