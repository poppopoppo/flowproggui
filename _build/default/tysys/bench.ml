let rec tak x y z =
  if x <= y then z
  else
    tak (tak (x - 1) y z) (tak (y - 1) z x) (tak (z - 1) x y)
(* 
let _ =
  let a = Sys.time () in
  print_string "start bench.exe\n";
  let _ = tak 22 11 0 in
  print_float (Sys.time () -. a);
  print_string "\nexit bench.exe\n";
  exit 0
*)
let _ = 
	tak 22 11 0

