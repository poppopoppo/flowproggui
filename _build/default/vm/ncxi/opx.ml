let _ =
  let fn = Sys.argv.(1) in
  let cd =
  "nasm -F dwarf -g -f elf64 "^fn^" -o "^fn^".o\n"^
  "gcc "^fn^".o -nostartfiles -no-pie -pg -g -o "^fn^".exe\n" in
  let _ = Sys.command cd in
  ()
