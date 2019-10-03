%{
  open Lang
  open Types
  open Ast
  open Util
%}

%token SRC ARR DEF CLN L_RCD R_RCD Z ARR_END ISO DTA RM INI_IR SRC_OUT
%token LCE EXP AGL PRD EOP VCT ARR_REV ARR_REV_IN DOT VCT_INI OP LCE_IR
%token L_PRN R_PRN  APP COPRD_END PRD_END MNS CST SRC_IL
%token ACT SPL FOR_ALL MDL MDL_END L_BLK R_BLK  COPRD SEQ EQ LB OUT_IR PRJ_IR CNS_IR
%token IO PRJ N SLH L_OPN R_OPN L_LST R_LST SGN NL
%token MCR PLS MLT EOF CMM LET TYP_STG TYP_SGN TYP_VCT TYP_OPN_VCT
%token DEQ FNT EXN WC PLS_NAT MNS_NAT MLT_NAT L_VCT L_LST_PLS DSH
%token NOT_SPL DTA_GRM ORD_LEX_COPRD ORD_COPRD GRM NOT AGL_TOP AGL_COD
%token <string> NAM STG VAL
%token <int> INT IN OUT ROT SLF NAT INJ IDX CHO
%token <int64> R64
%token <bool> R2
%nonassoc AGL_PRE
%left FOR_ALL
%left EQ
%left VCT
%left PLS MNS
%left MLT
%left APP
%left CST
%left PRJ
%right IO

%start buffer
%start file

%type <Lang.Ast.mdl list> file
%type <Lang.Ast.line> buffer
%type <Peg.grammar> dta_grm
%type <Lang.Types.t> typ
%%
buffer:
  | exp_top EOF
  {
    ( try
      let (i,a) = Ast.tk_agl $1 in
      Line_Agl (i,a)
      with _ -> Line $1 ) }
  | ARR_END EOF { End }
  ;
file:
  | EOF { [] }
  | def_mdl file { $1::$2 }
  ;
def_mdl:
  | MDL NAM gl_etr_lst MDL_END { ($2,$3) }
  ;
def_arg:
  | { [] }
  | APP args { $2 }
  | APP args_rot { BatList.init $2 (fun n -> "$"^(String.make n '\'')) }
  ;
args_rot:
  | DSH { 1 }
  | DSH args_rot { 1+$2 }
  ;
args:
  | VAL { [$1] }
  | VAL CMM args { $1::$3 }
  ;
gl_etr_lst:
  |   { [] }
  | mdl_etr gl_etr_lst  { $1::$2 }
  ;
mdl_etr:
  | glb_etr { $1 }
  | def_typ { $1 }
  ;
def_typ:
  | DTA def_typ_clique { Flow_Clq $2 }
  | DTA def_typ_body { Flow $2 }
  | dta_grm { Gram $1 }
  ;
dta_grm:
  | DTA_GRM grm_clq { $2 }
  ;
grm_clq:
  | grm_etr { [$1] }
  | grm_etr grm_clq { $1::$2 }
  ;
grm_etr:
  | SLF DOT NAM ISO grm_ord   { ($3,[],$5) }
  ;
grm_ord:
  | grm_rule { [($1,None)] }
  | grm_ord grm_rule  { $1@[($2,None)] }
grm_rule:
  | ord grm_ptns grm_prd { ($1,$2,$3) }
  ;
ord:
  | COPRD { Peg.Synt }
  | ORD_LEX_COPRD { Peg.Lex }
  ;
grm_ptns:
  | { [] }
  | grm_ptns grm_ptn  { $1@[$2] }
  ;
grm_ptn:
  | WC  { Peg.Atm Peg.Any }
  | grm_atom { Peg.Atm $1 }
  | L_LST grm_atom R_LST { Peg.List $2 }
  | L_OPN grm_atom R_OPN { Peg.Option $2 }
  ;
grm_atom:
  | STG { (Peg.Text $1) }
  | NAM { Peg.Name $1 }
  ;
grm_prd:
  | { None }
  | prd_flg grm_ptns { Some ($1,$2) }
  ;
prd_flg:
  | SPL { Peg.And }
  | NOT_SPL { Peg.Not }
  ;
def_typ_clique:
  | SLF DOT def_typ_body { [$3] }
  | SLF DOT def_typ_body def_typ_clique { [$3]@$4 }
  ;
def_typ_body:
  | NAM def_arg  { Def_Abs ($1,$2) }
  | NAM def_arg ISO def_coprd   { Def_CoPrd ($1,$2,$4) }
  | NAM def_arg ISO def_prd  { Def_Prd ($1,$2,$4) }
  | FNT NAM ISO name_list { Def_Fnt ($2,$4) }
  | NAM def_arg EQ typ  { Def_EqT ($1,$2,$4) }
  ;
name_list:
  | NAM { [$1] }
  | NAM name_list { $1::$2 }
  ;
def_coprd:
  | COPRD typ_top CLN NAM  { [($2,$4)] }
  | COPRD typ_top CLN NAM def_coprd  { ($2,$4)::$5 }
  ;
def_prd:
  | PRD typ_top CLN NAM  { [($2,$4)] }
  | PRD typ_top CLN NAM def_prd  { ($2,$4)::$5 }
  ;
typ_top:
  | typs { Rcd(rcd_cl $1) }
  | EXP typ { $2 }
  ;
typ_top_lb:
  | { U_Lb }
  | NAM LET typ typ_top_lb  { Cns_Lb($1,$3,$4) }
typs:
  | { [] }
  | typs typ { $1@[$2] }
  ;
typ:
  | L_PRN typ R_PRN { $2 }
  | L_RCD typ_top R_RCD { $2 }
  | L_RCD LB typ_top_lb R_RCD { Rcd_Lb $3 }
  | typ APP typ { Types.App($1,$3) }
  | typ PRJ typ { App(App(Prm Vct,$1),$3) }
  | L_OPN typ R_OPN { opn $2 }
  | L_LST typ R_LST { lst $2 }
  | VAL { Var (newvar ()) }
  | NAM { Prm (Name $1) }
  | Z { zn (Prm Z_u) }
  | N { Prm N }
  | ROT rot_dsh { Var (newvar_q (-($2+2))) }
  | typ IO typ  { Imp($1,$3) }
  | SGN { Prm Sgn }
  | TYP_STG { Prm Stg }
  ;
rot_dsh:
  | { 0 }
  | rot_dsh DSH { $1+1 }
  ;
glb_etr:
  | LCE glb_etr_clique { Ast.Etr_Clq  $2 }
  | LCE glb_etr_body_ir  { let (a,b,c,d) = $2 in Ast.Etr(a,b,c,d) }
  ;
glb_etr_clique:
  | SLF DOT glb_etr_body_ir { [$3] }
  | SLF DOT glb_etr_body_ir glb_etr_clique { [$3]@$4 }
  ;
glb_etr_body_ir:
  | NAM reg_ptn typ_def ir_lines { ($1,fst $3,snd $3,($2,ref $4)) }
  ;
ir_code:
  | ir_etr ir_lines { ($1,ref $2) }
  ;
ir_etr:
  | IN reg_ptn { $2 }
  ;
ir_ret:
  | EOP reg_ptn { Ret $2 }
  ;
ir_lines:
  | ir_ret  { $1 }
  | ir_line ir_lines { Seq($1,$2) }
  | AGL reg coprd_ir COPRD_END {
     Agl($2,$3) }
  | NAM reg_ptn SRC_IL { IL_Glb_Call((Tkn.Etr_N $1),$2) }
  ;
ir_line:
  | ROT reg_ptn SRC reg_ptn regs { IR_Id($2,[|$4|] |+| $5)  }
  | ARR exp INI_IR reg_ptn_src SRC reg_ptn  { IR_Exp($2,$4,$6) }
  | NAM reg_ptn SRC reg_ptn { IR_Glb_Call(Tkn.Etr_N $1,$2,$4) }
  | APP reg CMM reg_ptn SRC reg_ptn {
     IR_Call(($2,$4),$6) }
  | OUT_IR reg reg_ptn SRC_OUT {
    IR_Out($2,$3) }
  | NAM reg_ptn SRC_OUT { IR_Glb_Out($1,$2) }
  ;
names:
  | {  }
  | NAM names {}
names_lb:
  | {}
  | lb_let names {}
ir_tkn:
  | INT  {}
  | NAM   {}
  ;
reg_src:
  | NAM {
     let v = newvar () in rm := ($1,v)::!rm; v }
  ;
reg_ptn_src:
  | WC { Rcd_Ptn.R [||] }
  | reg_src { Rcd_Ptn.A $1 }
  | L_RCD reg_ptn_lst_src reg_ptn_op_src {
    match $3 with
    | None ->  Rcd_Ptn.R $2
    | Some r -> Rcd_Ptn.Ro ($2,r) }
  | L_RCD LB reg_ptn_lst_lb_src reg_ptn_op_src {
    match $4 with
    | None -> Rcd_Ptn.R_Lb $3
    | Some r -> Rcd_Ptn.Ro_Lb ($3,r) }
  ;
reg_ptn_op_src:
  | OP reg_src R_RCD  { Some $2 }
  | R_RCD { None }
reg_ptn_lst_src:
  | { [||] }
  | reg_ptn_src reg_ptn_lst_src { [|$1|] |+| $2 }
  ;
reg_ptn_lst_lb_src:
  | { [||] }
  | NAM LET reg_ptn_src reg_ptn_lst_lb_src { [|($1,$3)|] |+| $4 }
  ;
reg:
  | WC { let v = newvar () in rm := ("_",v)::!rm; v}
  | NAM {
     let v = newvar () in rm := ($1,v)::!rm; v }
  ;
reg_ptn:
  | reg { Rcd_Ptn.A $1 }
  | L_RCD reg_ptn_lst reg_ptn_op {
    match $3 with
    | None ->  Rcd_Ptn.R $2
    | Some r -> Rcd_Ptn.Ro ($2,r) }
  | L_RCD LB reg_ptn_lst_lb reg_ptn_op {
    match $4 with
    | None -> Rcd_Ptn.R_Lb $3
    | Some r -> Rcd_Ptn.Ro_Lb ($3,r) }
  ;
reg_ptn_op:
  | OP reg R_RCD  { Some $2 }
  | R_RCD { None }
reg_ptn_lst:
  | { [||] }
  | reg_ptn reg_ptn_lst { [|$1|] |+| $2 }
  ;
reg_ptn_lst_lb:
  | { [||] }
  | NAM LET reg_ptn reg_ptn_lst_lb { [|($1,$3)|] |+| $4 }
  ;
lb_let:
  | NAM LET NAM {}
  ;
coprd_ir:
  | COPRD reg_ptn ir_lines { [|($2,$3)|] }
  | COPRD reg_ptn ir_lines coprd_ir { [|($2,$3)|] |+| $4 }
  ;
regs:
  | { [||] }
  | CMM reg_ptn regs { [|$2|] |+| $3 }
  ;

typ_def:
  | { (Var (newvar()),Var (newvar())) }
  | CLN typ SRC typ DOT { ($2,$4) }
  ;
exp_top:
  | exp_lst { Rcd (Array.of_list $1) }
  | LB exp_lst_lb { Rcd_Lb(None,Array.of_list $2) }
  | DOT LB exp_lst_lb { Rcd_Lb(Some Rot,Array.of_list $3) }
  | EXP exp { $2 }
  ;
exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;
exp_lst_lb:
  | { [] }
  | exp_lst_lb NAM LET exp { $1@[($2,Some $4)] }
  | exp_lst_lb NAM RM { $1@[($2,None)] }
exp:
  | AGL exp %prec AGL_PRE { Agl_Op $2 }
  | INT { Atm(Z $1) }
  | EXN { Atm (Fnc Tkn.Exn_Ini) }
  | ROT { Rot }
  | IDX { Prj(Rot,Rcd_Ptn.Idx($1,Rcd_Ptn.End)) }
  | VAL { Prj(Rot,Rcd_Ptn.Lb($1,Rcd_Ptn.End)) }
  | VCT_INI { App(Atm (Name "#"),Rcd [||])  }
  | exp VCT exp { App(Atm (Name "⊵"),Rcd [|$1;$3|]) }
  | INJ { Atm(Fnc(Tkn.Inj $1)) }
  | CHO { Atm(Fnc(Tkn.Cho $1))  }
  | NAM  { Atm (Name $1) }
  | NAM DOT NAM { Atm(Name ($1^"."^$3)) }
  | SGN { App(Atm (Name "&"),Rcd [||]) }
  | STG { Atm (Stg $1) }
  | SLF { Atm(Fnc Tkn.Fix) }
  | exp PLS exp { App(Atm(Fnc Tkn.Pls),Rcd [|$1;$3|]) }
  | exp MLT exp { App(Atm(Fnc Tkn.Mlt),Rcd [|$1;$3|]) }
  | exp MNS exp { App(Atm(Fnc Tkn.Pls),Rcd [|$1;App(Atm(Fnc Tkn.Mns),$3)|]) }
  | L_PRN MNS exp R_PRN { App(Atm(Fnc Tkn.Mns),$3) }
  | exp EQ exp { App(Atm(Fnc Tkn.Eq),Rcd [|$1;$3|]) }
  | L_PRN exp R_PRN { $2 }
  | R64 { Atm(R64 $1) }
  | R2 { Atm(R2 $1) }
  | exp APP exp { App($1,$3) }
  | exp PRJ INT { Prj($1,Rcd_Ptn.Idx($3,Rcd_Ptn.End)) }
  | exp PRJ NAM { Prj($1,Rcd_Ptn.Lb($3,Rcd_Ptn.End)) }
  | L_RCD exp_lst R_RCD { Rcd (Array.of_list $2) }
  | L_RCD exp_lst OP exp R_RCD { Rcd (Array.of_list $2) }
  | L_RCD LB exp_lst_lb R_RCD { Rcd_Lb (None,Array.of_list $3) }
  | L_RCD LB exp_lst_lb OP exp R_RCD { Rcd_Lb (Some $5,Array.of_list $3) }
  | L_OPN R_OPN { App(Atm(Name "‹›"),Rcd [||]) }
  | L_OPN exp R_OPN { App(Atm (Name "‹"),$2) }
  | L_LST lst_list R_LST { $2 }
  ;
lst_list:
  | { App(Atm (Name "⟦⟧"),Rcd [||]) }
  | exp lst_list { App(Atm (Name "⟦"),Rcd [|$1;$2|]) }
  ;
