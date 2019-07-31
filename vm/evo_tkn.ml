open Types
open Vmr
let _ =
  let a = Sys.time () in
  Util.pnt true "start evo_tkn.exe\n";
  let (p0,r0,k0):et =
    ( try
        Util.open_in_close "default.tkn"
          (fun c -> Marshal.from_channel c)
      with e -> raise e )  in
  Util.pnt true ((print_rcd_tkn k0)^"\n");
  Util.pnt true (print_asm "" p0);
  let (v0,cs0) = st_ini () in
  Hashtbl.add v0 r0 k0;
  let k1 = run p0 v0 cs0 in
  Util.open_out_close "default.tkn"
    (fun c -> Marshal.to_channel c (p0,r0,k1) []);
  Util.pnt true ((print_rcd_tkn k1)^"\n");
  print_float (Sys.time () -. a);
  Util.pnt true "\nexit evo_tkn.exe\n";
  exit 0
