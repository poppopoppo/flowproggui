open Util
open Lang
type r = int
and ptn = r Rcd_Ptn.t
and st = (int , v) Hashtbl.t
and hp_p = Sgn.t
and hp = (hp_p , v) Hashtbl.t
and p = Hp of hp_p | Reg of r
and code = op array
and c_p = int
and lb = string
and v =
  | Rcd of p array | Rcd_Lb of (lb * p) array
  | Z of int * int | Stg of string | Sgn of Sgn.t
  | CoI of int * p  | GlE of gl_etr | Vct of (int, v) Hashtbl.t
and gl_etr =
  | Pls | Mlt | Mns | Eq | Cmp | Exc | Sgn_Ini | Vct_Ini
  | Gl_Etr of string | Inj of int
and etr = string * ptn
and op =
  | Etr of etr | Gl_Call of gl_etr * ptn * ptn
  | IL_Gl_Call of gl_etr * ptn | Agl of r * etr array
  | Call of r * ptn * ptn | Ret of ptn
  | Id of ptn * ptn array | Ini of v * r

and cs = cs_f Stack.t
and cs_f = c_p * (r * v) list
let puts a s = a := (!a ^ s)
let rec emt a c p =
  if p>=(Array.length c) then ()
  else
    let open Rcd_Ptn in
    puts a ".intel_syntax noprefix\n";
    puts a ".global main\n";
    puts a "main:\n";
    puts a "  mov rax,123\n";
    puts a "  ret\n"
(* ( match c.(p) with
   | Gl_Call(Pls,R[|A i0;A i1|],A i2) -> pls a i0 i1 i2; emt a c (p+1)
   | Gl_Call(Mlt,R[|A i0;A i1|],A i2) -> mlt a i0 i1 i2; emt a c (p+1)
   | Gl_Call(Mns,A i1,A i2) -> mns a i1 i2; emt a c (p+1)
   | Gl_Call(e,r0,r1) -> gl_call a e r0 r1; emt a c (p+1)
   | IL_Gl_Call(e,r0) -> il_gl_call a e r0; emt a c (p+1)
   | Id (r,rs) ->
    let l = Array.length rs in
    Array.fold_left
      (fun i ri ->
         if i=(l-1) then (mov_ptn a r ri; i+1)
         else (rpc_ptn a r ri; i+1 )) 0 rs;
    emt a c p+1
   | Ret r -> ret a r
   | Agl (ra,ps) -> agl a ra ps; emt a c p+1
   | Etr (n,r) -> etr a n r; emt a c p+1
   | _ -> err "emt 0" ) *)
