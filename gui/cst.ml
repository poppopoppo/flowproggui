type tyV = int
and tmV = int
and tmP = int
and tyP = int
and tm =
	| App of tm * tm
	| Val of tmV
	| Prm of tmP
	| Abs of tmV * tm
	| Let of tmV * tm * tm
and ty =
	| TyVal of tyV
	| TyPrm of tyP
	| Imp of ty * ty
	| FAll of (tyV list) * cst * ty
and cxt = (ty option) list
and prm = tyP list
and cst =
	| Unf of ty list
	| Ex of (tyV list) * cst
	| And of cst list
and hyp = prm * cxt * tm * ty
let tyVN = ref 0
let get_tyV () =
  let v = !tyVN in
  tyVN := tyVN+1;
  v
let rec add_cxt c i y =
  ( match c with
    | [] -> if i=0 then [Some (i,y)] else None::(add_cxt (i-1) y)
    | hd::tl -> if i=0 then [Some (i,y)]@tl else hd::(add_cxt (i-1) y)
  )
let gen_cst (h:hyp) : cst =
	let (p,x,e,y) = h in
	( match h with
   | (_,_,Prm i,_) -> Unf [TyPrm (List.nth p i);y]
   | (_,_,Val i,_) -> Unf [List.nth x i;y]
   | (_,_,Abs(v,m),_) ->
     let a0 = get_tyV () in
     let a1 = get_tyV () in
     Ex ([a0;a1],And [gen_cst (p,add_cxt x v a0,m,a1);(Unf[y;(Imp(TyV a0,TyV a1))))
   | (_,_,App(e0,e1),_) ->
     let a0 = get_tyV () in
     Ex ([a0],And [(gen_cst (p,x,e0,Imp(TyV a0,y)));(gen_cst (p,x,e1,TyV a0))])
  )
     ( match Unf [TyVal (Lis)
