open Types
let _ =
  Util.pnt true "start evo_tkn.exe\n";
  let (c,p,v0):et =
    Util.open_in_close "default.tkn"
      (fun c -> Marshal.from_channel c) in
  let v1 = Imp.evo_tkn v0 (ref c) p in
  Util.open_out_close "default.tkn"
    (fun c -> Marshal.to_channel c v1 []);
  Util.pnt true "exit evo_tkn.exe\n"
