%{

%}

%token SRC ARR DEF CLN L_RCD R_RCD Z ARR_END ISO DTA CNT EMT IN OUT
%token LCE EXP AGL PRD EOP
%token L_PRN R_PRN  APP COPRD_END PRD_END MNS APP_EVL PLS_EVL MLT_EVL CST
%token ACT SPL FOR_ALL MDL MDL_END L_BLK R_BLK  COPRD SEQ EQ
%token IO PRJ N SLH L_HLZ R_HLZ M_HLZ  L_OPN R_OPN L_LST R_LST SGN
%token NAM MCR VAL STG INT ROT SLF PLS MLT EOF CMM LET TYP_STR TYP_SGN TYP_VCT TYP_OPN_VCT
%token DEQ FNT EXN

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

%type <> file
%type <> buffer
%%
buffer:
  | vh_frm_top EOF {}
  | ARR_END EOF {}
  ;
file:
  | def_mdl {}
  ;
def_mdl:
  | MDL NAM APP args DEF gl_etr_lst MDL_END {}
  ;
args:
  | arg {}
  | arg CMM args {}
arg:
  | VAL {}
  | L_RCD arg_list R_RCD  {}
  ;
arg_list:
  | arg {}
  | arg_list arg  {}
  ;
gl_etr_lst:
  |   {}
  | mdl_etr gl_etr_lst  {}
  ;
mdl_etr:
  | glb_etr {}
  | def_typ {}
  ;
def_typ:
  | DTA def_typ_clique {}
  | DTA def_typ_body {}
  ;
def_typ_clique:
  | SLF def_typ_body {}
  | SLF def_typ_body def_typ_clique {}
  ;
def_typ_body:
  | DTA NAM APP args {}
  | DTA NAM APP args ISO def_coprd   {}
  | DTA NAM APP args ISO def_prd  {}
  | DTA NAM ISO FNT name_list {}
  | DTA NAM APP args DEQ typ  {}
  ;
name_list:
  | NAM {}
  | NAM name_list {}
  ;
def_coprd:
  | COPRD typ_top CLN NAM  {}
  | COPRD typ_top CLN NAM def_coprd  {}
  ;
def_prd:
  | PRD typ_top CLN NAM  {}
  | PRD typ_top CLN NAM def_prd  {}
  ;
typ_top:
  | typs {}
  | EXP typ {}
  ;
typs:
  | {}
  | typs typ {}
  ;
typ:
  | typ APP typ {}
  | SLH typ L_BLK exp R_BLK  {}
  | Z {}
  | N {}
  | typ IO typ  {}
  | NAM FOR_ALL typ {}
  | VAL {}
  | NAM {}
  | L_OPN typ R_OPN {}
  | L_OPN R_OPN {}
  | L_LST typ R_LST {}
  | typ TYP_OPN_VCT typ {}
  | typ TYP_VCT typ {}
  | TYP_SGN {}
  | TYP_STR {}
  | L_RCD typ_top R_RCD {}
  ;
glb_etr:
  | LCE glb_etr_body {}
  | LCE glb_etr_clique {}
  ;
glb_etr_clique:
  | SLF glb_etr_body {}
  | SLF glb_etr_body glb_etr_clique {}
  ;
glb_etr_body:
  | NAM typ_def DEF code {}
  ;
typ_def:
  | {}
  | CLN typ_top SRC typ_top {}
  ;
stt_code:
  | vh_frm_top code
  | L_HLZ h_frm_list R_HLZ tail {}
  | vh_frm_top code_coprd_list COPRD_END tail { }
  | vh_frm_top code_prd_list PRD_END tail { }
  ;
code:
  | OUT tail {}
  | ARR vh_frm_top code {}
  | ARR L_HLZ h_frm_list R_HLZ tail {}
  | ARR vh_frm_top code_coprd_list COPRD_END tail { }
  | ARR vh_frm_top code_prd_list PRD_END tail { }
  | IN vh_frm_top code EOP tail {}
  ;

tail:
  | {}
  | SEQ code {}
  ;

code_coprd_list:
  | {}
  | code_coprd_list COPRD stt_code  {}
  ;

code_prd_list:
  | {}
  | code_prd_list PRD stt_code  {}
  ;

h_frm_list:
  | stt_code {}
  | stt_code M_HLZ h_frm_list {}
  ;

vh_frm_top:
  | typ_ept exp_top {}
  ;
exp_top:
  | exp_lst macro {}
  | EXP exp macro {}
  ;
macro:
  | {}
  | SPL macro_list  {}
  ;
macro_list:
  | {}
  | macro_list CMM exp_lst LET exp_lst  {}
  ;
typ_ept:
  |  {}
  | ACT typ_top CLN {}
  ;

exp_lst:
  | {}
  | exp_lst exp  {}
  ;

exp:
  | AGL exp R_BLK {}
  | INT {}
  | PLS_EVL
  | MLT_EVL
  | APP_EVL
  | EMT
  | CNT
  | EXN
  | ROT {}
  | NAM  {}
  | SGN {}
  | STG {}
  | SLF {}
  | exp PLS exp {}
  | exp MLT exp {}
  | exp MNS exp {}
  | exp CST {}
  | L_PRN MNS exp R_PRN {}
  | exp EQ exp {}
  | L_PRN exp R_PRN {}
  | exp APP exp {}
  | exp PRJ exp {}
  | L_RCD exp_lst R_RCD {}
  | L_OPN R_OPN {}
  | L_OPN exp R_OPN {}
  | L_LST lst_list R_LST {}
  | L_OPN SEQ exp SPL subst_list R_OPN {}
  | L_RCD SEQ exp SPL subst_list R_RCD {}
  ;
subst_list:
  | {}
  | subst_list CMM exp_lst LET exp_lst  {}
  ;
lst_list:
  | {}
  | exp lst_list {}
  ;
