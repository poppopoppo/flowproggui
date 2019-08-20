let pnt (b:bool) s =
  if b
  then (print_string s;flush stdout)
  else ()
let _ = pnt true ""

let rec string_of_list f p l =
  match l with
  | [] -> ""
  | x::[] -> p x
  | x::tl -> (p x)^f^(string_of_list f p tl)
exception OPEN_IN
exception P_F
let open_in_close (s:string) (p:Pervasives.in_channel -> 'a) : 'a =
  let f = (try open_in s with _ -> raise @@ OPEN_IN) in
  let v = (try p f with _ -> raise @@ P_F) in
  close_in f;v
let open_out_close (s:string) (p:Pervasives.out_channel -> 'a) : 'a =
  let f = open_out s in
  let v = p f in
  close_out f;v
let rec assoc_group l =
  ( match l with
    | [] -> []
    | (k0,v0)::tl ->
      let tl0 = assoc_group tl in
      let rec l0 l =
        ( match l with
          | [] -> [(k0,[v0])]
          | (k1,r)::tl1 ->
            if k1=k0 then (k1,v0::r)::tl1
            else (k1,r)::(l0 tl1)
        ) in
      l0 tl0
  )
let err s = raise (Failure s)
let ( *| ) o e =
  ( match o with
    | Some x -> x
    | None -> err e )
let ( |+| ) a b = Array.append a b
let unt () = [| |]
module Sgn :
sig
  type t
  val n : unit -> int
  val ini : unit -> t
  val print : t -> string
  val compare : t -> t -> int
  val eq : t -> t -> bool
  val hash : t -> int
  val sexp_of_t : t -> Core.Sexp.t
end
= struct
  type t = int
  let sgn_N = ref 0
  let n () = !sgn_N
  let ini () =
    let n = !sgn_N in
    sgn_N := n+1;
    n
  let print x = (string_of_int x)
  let compare (x:int) (y:int) = compare x y
  let eq (x:int) (y:int) =  x =y
  let hash (x:int) = x
  let sexp_of_t (_:int) = Core.Sexp.List []
end
let ( =& ) x y = Sgn.eq x y
let sgn = Sgn.ini
let rec sgns n = if n=0 then [] else (Sgn.ini ())::(sgns (n-1))
module SgnSet = Set.Make(struct type t = Sgn.t let compare = compare end)
module StgSet = Set.Make(struct type t = string let compare = compare end)
module SgnMap = Map.Make(struct type t = Sgn.t let compare = Sgn.compare end)
module StgMap = Map.Make(struct type t = string let compare = compare end)
module IntSet = Set.Make(struct type t = int let compare = compare end)
module IntMap = Map.Make(struct type t = int let compare = compare end)
module SgnHash = Hashtbl.Make(
  struct type t=Sgn.t
    let hash x = Sgn.hash x let equal x y = Sgn.eq x y
  end )
let set_of_map m = SgnMap.fold (fun k _ r -> SgnSet.add k r) m SgnSet.empty
let map_of_set s = SgnSet.fold (fun k r -> SgnMap.add k None r) s SgnMap.empty
let set_of m = StgMap.fold (fun k _ r -> StgSet.add k r) m StgSet.empty
let map_of s = StgSet.fold (fun k r -> StgMap.add k None r) s StgMap.empty
