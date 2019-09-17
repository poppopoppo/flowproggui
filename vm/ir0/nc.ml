open Util
open Lang
let _ =
  let l = Array.length Sys.argv in
  if l<2 then err ("length argv = "^(string_of_int l))
  else
    let s = Util.load_file Sys.argv.(1) in
    let (n,el) = Implib.mdl_from_string s in
    let m = mk_ir_mdl el in
    let a = emt m in
    pnt true a;
    let d = open_out (n^".s") in
    let _ = output_string d a in
    flush_all ();
    let _ = close_out d in
    exit 1
