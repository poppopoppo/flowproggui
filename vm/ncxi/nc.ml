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
    Util.Log.f := Util.Log.Off;
    let p = 
      let s = Sys.argv.(1) in 
      if s="-p" then 
        ( Util.Log.f := Util.Log.On; Sys.argv.(2) )
    else s in
    let s = Util.load_file p in
    let (_,el) = Implib.mdl_from_string s in
    let (a,_) = emt_exe el in
    if !Util.Log.f=Util.Log.On then Util.Log.pnt ();
    let d = open_out (p^".s") in
    let _ = output_string d a in
    flush_all ();
    let _ = close_out d in
    let cd =
      "nasm -g -gdwarf -f elf64 "^(p^".s")^" -o out.o\n"^
      "gcc out.o -nostartfiles -no-pie -pg -g -o "^p^".exe\n" in
    let _ = Sys.command cd in
    exit 0
