let ( *| ) x y = (Prm coprd)<+x<+y
let coprd_unv u x y = ((Prm unv_coprd)<+u<+x<+y)
let ( *|=) x y = coprd_unv (Prm typ_inj) x y
let ( *& ) x y = (Prm prd)<+x<+y
let coprd_cl l = List.fold_right (fun x r -> x*|r) l (Prm coprd_end)
let coprd_cl_unv u l =
  List.fold_right (fun x r -> coprd_unv u x r) l (Prm coprd_end)
let coprd_cl_inj l = coprd_cl_unv (Prm typ_inj) l
let coprd_op l = List.fold_right (fun x r -> x*|r) l (vsgn())
let coprd_op_unv u l =
  List.fold_right (fun x r -> coprd_unv u x r) l (vsgn())
let coprd_op_inj l = coprd_op_unv (Prm typ_inj) l
let prd_cl l = List.fold_right (fun x r -> x*&r) l (Prm prd_end)
let prd_op l = List.fold_right (fun x r -> x*&r) l (vsgn())
let pZ_ini y = (Prm unfld)<+(rcd_cl [y;pZ])
type typ_gma = (tm * tm) SgnMap.t
type typ_env = (tm * tm) list
type name = string
type mdl_glb = ((tm * tm) SgnMap.t) * ((tm * tm) StgMap.t)
type mdl = name * args * (glb_etr list)
and mdl_scm = mdl_scm_hd * tm
and mdl_scm_hd = (tm option) SgnMap.t
and mdl_gma = mdl_scm StgMap.t
and glb_etr =
  | Etr of mdl_scm_hd * etr_body
  | Flow of flow
  | Etr_Clq of mdl_scm_hd * (etr_body list)
  | Flow_Clq of flow list
  | Gram of Peg.grammar
and etr_body = string * tm * tm * code
and flow =
  | Def_Abs of name * args
  | Def_Prd of name * args * ((tm * name) list)
  | Def_CoPrd of name * args * ((tm * name) list)
  | Def_Fnt of name * (name list)
  | Def_Eqv of name * args * tm
and args = tm list
and etr = string * mdl_scm_hd * tm * tm * code
(* <name> : [scm_hd]∀ <src> ⊢ <dst> ≒ <code> *)
and gl_st = glb_etr list
and code =
  | C_E of exp
  | C_V of code * code
  | C_H of (code list)
  | C_CoP of exp * (code list)
  | C_P of exp * (code list)
  | C_IO of exp * int * code
and exp = exp_rcd * ((name * exp_rcd) list)
and exp_rcd =
  | Exp_Rot
  | Exp_Rcd of exp_rcd array
  | Exp_App of exp_atm * exp_rcd
  | Exp_Prj of exp_rcd * int
  | Exp_Agl of exp_atm
  | Exp_Atm of exp_atm
and exp_atm =
  | Opr_Z of int
  | Opr_Pls
  | Opr_Mlt
  | Opr_Mns
  | Opr_Cmp
  | Opr_Eq
  | Opr_Fix
  | Opr_Exn
  | Opr_Name of string
  | Opr_Inj of int
  | Opr_Cho of int
  | Opr_Stg of string
let id = E (Exp_Name "$")
type buffer =
  | Evo of opr
  | End
exception End
let rec path p e : tm option =
  ( match p with
    | [] -> Some e
    | hd::tl ->
      let e1 = rcd_nth hd e in
      path tl e1
  )
and rcd_nth n e =
  ( match e with
    | App(App(Prm p,e1),e2) ->
      if p=tpl then if n=0 then e1 else rcd_nth (n-1) e2
      else raise @@ Failure "rcd_nth:1"
    | _ -> raise @@ Failure "rcd_nth:2"
  )
let ini_code () = SgnHash.create 10
let add_code c p v =
  SgnHash.remove c p;
  SgnHash.add c p v;
  c
let get_code c p =
  SgnHash.find c p
type 'a rcd_ptn =
  | P_R of ('a rcd_ptn ) array * 'a
  | P_A of 'a
type reg = Reg of Sgn.t
type regs = reg array
type reg_ptn = reg rcd_ptn
let ( ~= ) x y = ()
type scm = (SgnSet.t * tm)
