open Types
let _ =
  let (p0,r0,v0,k0) =
    ( try
        Util.open_in_close "default.tkn"
          (fun c -> Marshal.from_channel c)
      with e -> raise e )  in
  let (_,cs0) = st_ini () in
  set_r v0 r0 k0;
  let k1 = run p0 v0 cs0 in
  Util.open_out_close "default.tkn"
    (fun c -> Marshal.to_channel c (p0,r0,v0,k1) []);
  exit 0
