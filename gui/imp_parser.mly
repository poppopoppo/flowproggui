%{
  open Types
  open Imp_parser_header
%}

%token SRC ARR DEF CLN L_RCD R_RCD Z ARR_END ISO DTA CNT EMT IN OUT
%token LCE EXP AGL PRD EOP
%token L_PRN R_PRN  APP COPRD_END PRD_END MNS APP_EVL PLS_EVL MLT_EVL CST
%token ACT SPL FOR_ALL MDL MDL_END L_BLK R_BLK  COPRD SEQ EQ
%token IO PRJ N SLH L_HLZ R_HLZ M_HLZ  L_OPN R_OPN L_LST R_LST SGN
%token MCR VAL STG INT ROT SLF PLS MLT EOF CMM LET TYP_STR TYP_SGN TYP_VCT TYP_OPN_VCT
%token DEQ FNT EXN

%token <string> NAM VAL STG
%token <int> INT IN OUT ROT SLF
%token PLS MLT
%token EOF

%left FOR_ALL
%left EQ
%left PLS MNS
%left MLT
%left APP
%left CST
%left PRJ
%left TYP_VCT TYP_OPN_VCT
%right IO

%start buffer
%start file

%type <Types.mdl> file
%type <Types.buffer> buffer
%%
buffer:
  | vh_frm_top EOF { let (t,o) = $1 in Evo (Seq (t,o,Rtn 0)) }
  | ARR_END EOF { End }
  ;
file:
  | def_mdl { $1 }
  ;
def_mdl:
  | MDL NAM APP args DEF gl_etr_lst MDL_END { ($2,$4,$6) }
  ;
args:
  | arg { [$1] }
  | arg CMM args { [$1]@$3 }
arg:
  | VAL { Arg_Val $1 }
  | L_RCD arg_list R_RCD  { $2 }
  ;
arg_list:
  | arg { [$1] }
  | arg_list arg  { $1@[$2] }
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
  | DTA def_typ_clique { Etr_Clq $2 }
  | DTA def_typ_body { Etr $2 }
  ;
def_typ_clique:
  | SLF def_typ_body { [$2] }
  | SLF def_typ_body def_typ_clique { [$2]@$3 }
  ;
def_typ_body:
  | DTA NAM APP args { Def_Abs ($2,$4) }
  | DTA NAM APP args ISO def_coprd   { Def_CoPrd ($2,$4,$6) }
  | DTA NAM APP args ISO def_prd  { Def_Prd ($2,$4,$6) }
  | DTA NAM ISO FNT name_list { Def_Fnt ($2,$5) }
  | DTA NAM APP args DEQ typ  { Def_Eqv $2,$4,$6) }
  ;
name_list:
  | NAM { $1 }
  | NAM name_list { $1::$2 }
  ;
def_coprd:
  | COPRD typ_top CLN NAM  { ($2,$4) }
  | COPRD typ_top CLN NAM def_coprd  { ($2,$4)::$5 }
  ;
def_prd:
  | PRD typ_top CLN NAM  { ($2,$4) }
  | PRD typ_top CLN NAM def_prd  { ($2,$4)::$5 }
  ;
typ_top:
  | typs { Typ_Rcd $1 }
  | EXP typ { $2 }
  ;
typs:
  | { [] }
  | typs typ { $1@$2 }
  ;
typ:
  | typ APP typ {Typ_App ($1,$3) }
  | SLH typ L_BLK exp R_BLK  { DepTyp ($4,$2) }
  | Z { Typ_Z }
  | N { Typ_Name "ℕ"}
  | typ IO typ  { Typ_App ($1,$3) }
  | NAM FOR_ALL typ { Typ_For_All ($1,$3) }
  | VAL { Typ_Val $1 }
  | NAM { Typ_Name $1 }
  | L_OPN typ R_OPN { Typ_Opn $2 }
  | L_LST typ R_LST { Typ_App (Typ_Name "list",$2) }
  | typ TYP_OPN_VCT typ { Typ_Opn_Vct ($1,$3) }
  | typ TYP_VCT typ { Typ_Vct ($1,$3) }
  | TYP_SGN { Typ_Sgn }
  | TYP_STR { Typ_Name "ℾ" }
  | L_RCD typ_top R_RCD { Typ_Rcd #2 }
  ;
glb_etr:
  | LCE glb_etr_body { Etr $2 }
  | LCE glb_etr_clique { Etr_Clq $2 }
  ;
glb_etr_clique:
  | SLF glb_etr_body { [$2] }
  | SLF glb_etr_body glb_etr_clique { [$2]@$3 }
  ;
glb_etr_body:
  | NAM typ_def DEF code { let (src,dst) =$2 in ($1,src,dst,$4) }
  ;
typ_def:
  | { (Typ_Btm,Typ_Top) }
  | CLN typ_top SRC typ_top { ($2,$4) }
  ;
stt_code:
  | vh_frm_top code { let (t,o) = $1 in Seq (t,o,$2) }
  | L_HLZ h_frm_list R_HLZ tail { Canon ($2,$4) }
  | vh_frm_top code_coprd_list COPRD_END tail {
    let (t,o) = $1 in Code_CoPrd(t,o,$2,$4) }
  | vh_frm_top code_prd_list PRD_END tail {
    let (t,o) = $1 in Code_Prd(t,o,$2,$4) }
  ;
code:
  | OUT tail { $2 }
  | ARR vh_frm_top code { Seq ($2,$3) }
  | ARR L_HLZ h_frm_list R_HLZ tail { Canon ($3,$5) }
  | ARR vh_frm_top code_coprd_list COPRD_END tail {
    Code_CoPrd($2,$3,$5) }
  | ARR vh_frm_top code_prd_list PRD_END tail {
    Code_Prd($2,$3,$5) }
  | IN vh_frm_top code EOP tail { Code_IO($2,$3,$5) }
  ;

tail:
  | { Rtn 0 }
  | SEQ code { $2 }
  ;

code_coprd_list:
  | { [] }
  | code_coprd_list COPRD stt_code  { $1@[3] }
  ;

code_prd_list:
  | { [] }
  | code_prd_list PRD stt_code  { $1@[$3] }
  ;

h_frm_list:
  | stt_code { [$1] }
  | stt_code M_HLZ h_frm_list { $1::$3 }
  ;

vh_frm_top:
  | typ_ept exp_top { let (e,m) = $2 in ($1,e,m) }
  ;
exp_top:
  | exp_lst macro { (Opr_Rcd $1,$2) }
  | EXP exp macro { ($2,$3) }
  ;
macro:
  | { [] }
  | SPL macro_list  { $2 }
  ;
macro_list:
  | { [] }
  | macro_list CMM exp_lst LET exp_lst  { $1::($3,$5) }
  ;
typ_ept:
  |  { Typ_Top }
  | ACT typ_top CLN { $2 }
  ;

exp_lst:
  | { [] }
  | exp_lst exp  { $1[2] }
  ;

exp:
  | AGL exp R_BLK { Opr_Agl $2 }
  | INT { Opr_Z $1 }
  | PLS_EVL { Opr_Name "+" }
  | MLT_EVL { Opr_Name "*" }
  | APP_EVL { Opr_Name "◂" }
  | EMT { Opr_Name "⋎" }
  | CNT { Opr_Name "⋏" }
  | EXN { Opr_Exn }
  | ROT { Root $1 }
  | NAM  { Opr_Name $1 }
  | SGN { Opr_Name "&" }
  | STG { Opr_Stg $1 }
  | SLF { Self $1 }
  | exp PLS exp { App (Opr_Name "+", Opr_Rcd [$1;$3]) }
  | exp MLT exp { App (Opr_Name "*",Opr_Rcd [$1;$3]) }
  | exp MNS exp { App (Opr_Name "+",Opr_Rcd [$1;App (Opr_Name "-",$3)]) }
  | exp CST { Cast $1 }
  | L_PRN MNS exp R_PRN { App (Opr_Name "-",$3) }
  | exp EQ exp { App(Opr_Name "=",Opr_Rcd [$1;$3]) }
  | L_PRN exp R_PRN { $2 }
  | exp APP exp { App ($1,$3) }
  | exp PRJ exp { Prj ($1,$3) }
  | L_RCD exp_lst R_RCD { Opr_Rcd $2 }
  | L_OPN R_OPN { Opr_None }
  | L_OPN exp R_OPN { Opr_Some $2 }
  | L_LST lst_list R_LST { $2 }
  | L_OPN SEQ exp SPL subst_list R_OPN { raise @@ Failure "macro:0" }
  | L_RCD SEQ exp SPL subst_list R_RCD { raise @@ Failure "macro:1" }
  ;
subst_list:
  | {}
  | subst_list CMM exp_lst LET exp_lst  {}
  ;
lst_list:
  | { App (Opr_Name "nil",Opr_Rcd []) }
  | exp lst_list { App (Opr_Name "cns",Opr_Rcd [$1,$2]) }
  ;
