open Util
open Lang
(*let _ =
  let l = Array.length Sys.argv in
  if l<3 then err ("length argv = "^(string_of_int l))
  else
    let s = Util.load_file Sys.argv.(1) in
    let e0 = Sys.argv.(2) in
    let n = Implib.name_from_string e0 in
    let (_,(_,el)) = Implib.mdl_from_string s in
    let (a,_) = emt_exe el n in
    (* pnt true a; *)
    let d = open_out (Sys.argv.(1)^".s") in
    let _ = output_string d a in
    flush_all ();
    let _ = close_out d in
    exit 0 *)
let _ =
    let s = Util.load_file Sys.argv.(1) in
    let (_,(_,el)) = Implib.mdl_from_string s in
    let (a,_) = emt_exe el in
    let d = open_out (Sys.argv.(1)^".s") in
    let _ = output_string d a in
    flush_all ();
    let _ = close_out d in
    exit 0
