open Util
open Lang
let rec f1 l as0 i = 
  if l=i then "" else as0.(i)^" "^(f1 l as0 (i+1))
let f0 as0 = 
  let l = Array.length as0 in
  if as0.(1)="-p" then f1 l as0 2 else f1 l as0 1 
let _ =
    Util.pnt true "enter nc\n";
    Util.Log.f := Util.Log.Off;
    let _ = Sys.command ("rm -f NC.mdls\ncat "^(f0 Sys.argv)^" > NC.mdls\n") in 
    let (_,el) = Implib.mdl_from_file "NC.mdls" in
    let (a,_) = emt_exe el in
    if !Util.Log.f=Util.Log.On then Util.Log.pnt ();
    let d = open_out "NC.s" in
    let _ = output_string d a in
    flush_all ();
    let _ = close_out d in
    let cd =
      "yasm -g dwarf2 -f elf64 NC.s -o out.o\n"^
      "gcc out.o -nostartfiles -no-pie -pg -g -o NC.exe\n"^
      "ln -f NC.exe opx\n" in
    let _ = Sys.command cd in
    exit 0
