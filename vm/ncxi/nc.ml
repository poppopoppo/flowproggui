open Util
open Lang
let _ =
    Util.pnt true "enter nc\n";
    Util.Log.f := Util.Log.Off;
    let p = 
      let s = Sys.argv.(1) in 
      if s="-p" then 
        ( Util.Log.f := Util.Log.On; Sys.argv.(2) )
    else s in
    (*let s = Util.load_file p in*)
    let (_,el) = Implib.mdl_from_file p in
    let (a,_) = emt_exe el in
    if !Util.Log.f=Util.Log.On then Util.Log.pnt ();
    let d = open_out (p^".s") in
    let _ = output_string d a in
    flush_all ();
    let _ = close_out d in
    let cd =
      "yasm -g dwarf2 -f elf64 "^(p^".s")^" -o out.o\n"^
      "gcc out.o -nostartfiles -no-pie -pg -g -o "^p^".exe\n"^
      "cp syntax.mdls.exe opx\n" in
    let _ = Sys.command cd in
    exit 0
