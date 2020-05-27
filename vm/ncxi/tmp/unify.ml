open Util
type 'p tm =
  | Prm of 'p
  | Val of Sgn.t
  | App of 'p tm * 'p tm
type prm =
  | Imp | Tpl | Prd | Prd_U | CoPrd | CoPrd_U | Vct | Opn | Zn | N | Sgn | Stg
  | Ul | Ur | In | Out | Iso | Z_n of int | Axm of Sgn.t
type 'p cxt = ('p tm) SgnMap.t
let (<+) x y = App(x,y)
let (-*) x y = (Prm Imp)<+x<+y
let ( ** ) x y = (Prm Tpl)<+x<+y
let vsgn () = Val (sgn ())
let psgn () = Prm (Axm (sgn ()))
let cxt_ini : cxt = SgnMap.empty
let cxt_add (i:_) (e:_) c = SgnMap.add i e c
let ( +~ ) c (i,e) = cxt_add i e c
let rec subst s e =
  ( match e with
    | Prm _ -> e
    | Val i -> ( try SgnMap.find i s with _ -> e)
    | App(e1,e2) -> App(subst s e1,subst s e2)
  )
let ( <* ) = subst
let ( *~ ) s0 s1 =
  SgnMap.merge
    (fun _ oa ob ->
       match oa,ob with
       | None,_ -> ob
       | Some a,_ -> Some (s1<*a))
    s0 s1
let subst_c s c = List.map (fun (e0,e1) -> (s<*e0,s<*e1)) c
let (<*~) s c = subst_c s c
let rec ftvs (e:tm) : SgnSet.t =
  let s0 = SgnSet.empty in
  ( match e with
    | Prm _ -> s0
    | Val i -> SgnSet.add i s0
    | App (e1,e2) -> SgnSet.union (ftvs e1) (ftvs e2)
  )
let ftv j e = SgnSet.mem j (ftvs e)

let rec unify w (c:c) : cxt =
  (pnt false ("enter unify:"^(print_c c)^"\n"));
  let c =
    ( match c with
      | [] -> SgnMap.empty
      | (e0,e1)::tl ->
        ( match e0,e1 with
          | Prm p0,Prm p1 ->
            if p0=p1 then unify w tl else raise @@ Failure "unify:0"
          | Val v0,Val v1 ->
            let (vf0,vf1) = (SgnSet.mem v0 w,SgnSet.mem v1 w) in
            if vf0&&vf1 then if v0=v1 then unify w tl else raise @@ Failure "unify:5"
            else if vf0&&(not vf1) then
              let s0 = cxt_ini+~(v1,Val v0) in
              s0*~(unify w (s0<*~tl))
            else if vf1&&(not vf0) then
              let s0 = cxt_ini+~(v0,Val v1) in
              s0*~(unify w (s0<*~tl))
            else
              let v2 = sgn() in
              let s0 = cxt_ini+~(v0,(Val v2))+~(v1,Val v2) in
              s0*~(unify w (s0<*~tl))
          | Val v0,_ ->
            if SgnSet.mem v0 w then (raise @@ Failure "unify:9")
            else if (ftv v0 e1) then (raise @@ Failure "unify:1")
            else
              let s0 = cxt_ini+~(v0,e1) in
              s0*~(unify w (s0<*~tl))
          | _,Val v1 ->
            if SgnSet.mem v1 w then (raise @@ Failure "unify:10")
            else if (ftv v1 e0) then (raise @@ Failure "unify:2")
            else
              let s0 = cxt_ini+~(v1,e0) in
              s0*~(unify w (s0<*~tl))
          | App(e1,e2),App(e3,e4) -> unify w ((e1,e3)::(e2,e4)::tl)
          | _ -> raise @@ Failure ("unify:3:"^(print_tm e0)^"~"^(print_tm e1))
        )
    ) in
  (pnt false ("return unify:"^(print_cxt c)^"\n"));
  c

let rec unifys_cxt l =
  ( match l with
    | [] -> []
    | _::[] -> []
    | h1::h2::tl -> (h1,h2)::(unifys_cxt (h2::tl))
  )
let unifys w l = unify w (unifys_cxt l)
