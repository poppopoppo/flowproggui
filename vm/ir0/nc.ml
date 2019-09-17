open Vgpp
let _ =
  let s = ref "" in
  emt s [||] (-1);
  let f = open_out "test.s" in
  let _ = output_string f !s in
  let _ = close_out f in
  exit 1
