%{
  open Types
  open Imp_parser_header
%}

%token SRC ARR DEF CLN L_RCD R_RCD Z ARR_END ISO DTA CNT EMT
%token LCE EXP AGL PRD EOP VCT
%token L_PRN R_PRN  APP COPRD_END PRD_END MNS APP_EVL PLS_EVL MLT_EVL CST
%token ACT SPL FOR_ALL MDL MDL_END L_BLK R_BLK  COPRD SEQ EQ
%token IO PRJ N SLH L_HLZ R_HLZ M_HLZ  L_OPN R_OPN L_LST R_LST SGN
%token MCR PLS MLT EOF CMM LET TYP_STG TYP_SGN TYP_VCT TYP_OPN_VCT
%token DEQ FNT EXN WC TEST INJ CHO

%token <string> NAM VAL STG
%token <int> INT IN OUT ROT SLF

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
%type <code list> code_coprd_list
%type <opr> exp
%%
buffer:
  | vh_frm_top EOF { Evo (Seq ($1,Rtn 0)) }
  | ARR_END EOF { End }
  ;
file:
  | def_mdl { Util.pnt flg "parse:file\n"; $1 }
  ;
def_mdl:
  | MDL NAM def_arg DEF gl_etr_lst MDL_END { ($2,$3,$5) }
  ;
def_arg:
  | { [] }
  | APP args { $2 }
args:
  | arg { [$1] }
  | arg CMM args { [$1]@$3 }
arg:
  | VAL { Arg_Val $1 }
  | L_RCD arg_list R_RCD  { Arg_Rcd $2 }
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
  | DTA def_typ_clique { Flow_Clq $2 }
  | DTA def_typ_body { Flow $2 }
  ;
def_typ_clique:
  | SLF def_typ_body { [$2] }
  | SLF def_typ_body def_typ_clique { [$2]@$3 }
  ;
def_typ_body:
  | NAM def_arg  { Def_Abs ($1,$2) }
  | NAM def_arg ISO def_coprd   { Def_CoPrd ($1,$2,$4) }
  | NAM def_arg ISO def_prd  { Def_Prd ($1,$2,$4) }
  | FNT NAM ISO name_list { Def_Fnt ($2,$4) }
  | NAM def_arg DEQ typ  { Def_Eqv ($1,$2,$4) }
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
  | typs { Typ_Rcd $1 }
  | EXP typ { $2 }
  ;
typs:
  | { [] }
  | typs typ { $1@[$2] }
  ;
typ:
  | L_RCD typ_top R_RCD { $2 }
  | typ APP typ {Typ_App ($1,$3) }
  | typ APP L_BLK exp R_BLK  { DepTyp ($4,$1) }
  | typ PRJ typ { Typ_Vct ($1,$3) }
  | L_OPN typ R_OPN { Typ_Opn $2 }
  | L_LST typ R_LST { Typ_App (Typ_Name "list",$2) }
  | typ TYP_OPN_VCT typ { Typ_Opn_Vct ($1,$3) }
  | VAL { Typ_Val $1 }
  | NAM { Typ_Name $1 }
  | Z { Typ_Z }
  | N { Typ_Name "ℕ"}
  | typ IO typ  { Typ_App ($1,$3) }
  | NAM FOR_ALL typ { Typ_For_All ($1,$3) }
  | SGN { Typ_Sgn }
  | TYP_STG { Typ_Name "ℾ" }
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
  | NAM typ_def DEF IN stt_code { let (src,dst) =$2 in ($1,src,dst,$5) }
  ;
typ_def:
  | { (Typ_Btm,Typ_Top) }
  | CLN typ_top SRC typ_top { ($2,$4) }
  ;
stt_code:
  | vh_frm_top code { Seq ($1,$2) }
  | L_HLZ h_frm_list R_HLZ tail { Canon ($2,$4) }
  | vh_frm_top code_coprd_list COPRD_END tail {
    Code_CoPrd($1,$2,$4) }
  | vh_frm_top code_prd_list PRD_END tail {
    Code_Prd($1,$2,$4) }
  ;
code:
  | eop tail { $2 }
  | ARR vh_frm_top code { Seq ($2,$3) }
  | ARR L_HLZ h_frm_list R_HLZ tail { Canon ($3,$5) }
  | ARR vh_frm_top code_coprd_list COPRD_END tail {
    Code_CoPrd($2,$3,$5) }
  | ARR vh_frm_top code_prd_list PRD_END tail {
    Code_Prd($2,$3,$5) }
  | IN vh_frm_top code eop tail { Code_IO($1,$2,$3,$5) }
  ;
eop:
  | EOP {}
  | OUT {}
  ;
tail:
  | { Rtn 0 }
  | SEQ code { $2 }
  ;

code_coprd_list:
  | { [] }
  | code_coprd_list COPRD stt_code  { $1@[$3] }
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
  | macro_list CMM NAM LET exp  { $1@[($3,$5)] }
  ;
typ_ept:
  |  { Typ_Top }
  | ACT typ_top CLN { $2 }
  ;

exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;

exp:
  | AGL exp R_BLK { Agl $2 }
  | INT { Opr_Z $1 }
  | PLS_EVL { Opr_Name "+" }
  | MLT_EVL { Opr_Name "*" }
  | APP_EVL { Opr_Name "◂" }
  | EMT { Opr_Name "⋎" }
  | CNT { Opr_Name "⋏" }
  | EXN { Opr_Name "?" }
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
  | exp lst_list { App (Opr_Name "cns",Opr_Rcd [$1;$2]) }
  ;
