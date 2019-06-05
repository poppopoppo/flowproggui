%{
  open Types
  open Imp_parser_header
%}

%token SRC ARR DEF CLN L_RCD R_RCD CNN M_CNN Z ARR_END EQV ISO DTA STT_CLN CNT EMT ARG IN OUT
%token LCE EXP CO_PRD END_CO_PRD AGL AGL_END ARR_STT PRD END_PRD IO_STT
%token L_PRN R_PRN  APP R_APP COPRD_END PRD_END MNS APP_EVL PLS_EVL MLT_EVL CST
%token ACT SPL FOR_ALL MDL CLS_NAM MDL_END L_BLK R_BLK  COPRD SEQ EOP EQ
%token IO CLS PRJ N SLH L_HLZ R_HLZ M_HLZ R_HLZ_TAIL L_OPN R_OPN L_LST R_LST SGN

%token <string> NAM MCR VAL STG
%token <int> INT ROT SLF
%token PLS MLT
%token EOF

%left FOR_ALL
%left EQ
%left PLS MNS
%left MLT
%left APP
%left PRJ
%right IO

%start buffer
%start file

%type <Types.mdl> file
%type <Types.buffer> buffer
%%
buffer:
  | vh_frm_top EOF { Evo $1 }
  | ARR_END EOF { End }
  ;
file:
  | def_mdl {
    Util.pnt flg "parse:file\n";
    $1 }
  ;
def_mdl:
  | MDL NAM DEF gl_etr_lst MDL_END {
    Util.pnt flg ("parse:def_mdl:"^(Util.string_of_list "\n" Print.string_of_glb_etr $4)^"_n");
    ($2,$4) }
  ;
gl_etr_lst:
  |   { [] }
  | mdl_etr gl_etr_lst  {
    $1::$2
    }
  ;
mdl_etr:
  | glb_etr { $1 }
  | def_typ { $1 }
  ;
def_typ:
  | DTA def_name ISO def_coprd  {
      Def_CoPrd (snd $2,$4)
      }
  | DTA def_name ISO def_prd  {
        Def_Prd (snd $2,$4)
      }
  ;
def_name:
  | NAM  { ([],$1) }
  | NAM APP VAL { ([$3],$1) }
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
  | typ APP typ { Typ_App ($1,$3) }
  | SLH typ L_BLK exp R_BLK  { DepTyp ($4,$2) }
  | Z { Typ_Z }
  | N { Typ_Name "ℕ" }
  | typ IO typ  { Typ_IO ($1,$3) }
  | NAM FOR_ALL typ { Typ_For_All ($1,$3) }
  | VAL { Typ_Val $1 }
  | NAM { Typ_Name $1 }
  | L_RCD typ_top R_RCD { $2 }
  ;

glb_etr:
  | LCE NAM typ_def DEF ARR_STT vh_frm_code {
    let (src,dst) = $3 in
    Etr ($2,src,dst,$6)
    }
  ;
typ_def:
  | { (Typ_Top,Typ_Top) }
  | CLN typ_top SRC typ_top { ($2,$4) }
  ;

vh_frm_code:
  | vh_frm_top tail_code
    {
      match $2 with
      | `None -> $1
      | `Some t ->
        Util.pnt true ("parse:vh_frm_code"^(Print.string_of_code 0 $1));
        Seq ($1,t)
      | `CoPrd (x,_) ->
        let c = Code_CoPrd ($1,x) in
        Util.pnt true ("parser:vh_frm_code"^(Print.string_of_code 0 c));
        c
      | `Prd (x,_) ->
        Seq ($1,Code_Prd (x,(Id Typ_Top)))
      | `H_FRM c -> Seq ($1,c)
    }
  ;
tail_code:
  | ARR_END { `None }
  | ARR vh_frm_code { `Some $2 }
  | coprd { $1 }
  | prd { $1 }
  | h_frm { $1 }
  | io { `None }
  ;
io:
  | IO_STT vh_frm_code EOP { }
  ;
coprd:
  | coprd_list COPRD_END coprd_tail
    {  `CoPrd ($1,$3) }
  ;
coprd_list:
  | { [] }
  | coprd_list COPRD vh_frm_code  { $1@[$3] }
  ;
coprd_tail:
  | {}
  | SEQ ARR vh_frm_code { }
  ;
prd:
  | prd_list PRD_END prd_tail
    {  `Prd ($1,$3) }
  ;
prd_list:
  |  {[] }
  | prd_list PRD vh_frm_code  { $1@[$3] }
  ;
prd_tail:
  |  { }
  | SEQ ARR vh_frm_code {}
  ;
h_frm:
  | L_HLZ h_frm_list R_HLZ  { `H_FRM (Canon $2) }
  | L_HLZ h_frm_list R_HLZ_TAIL vh_frm_code { `H_FRM(Canon $2) }
  ;
h_frm_list:
  | vh_frm_code { [$1] }
  | vh_frm_code M_HLZ h_frm_list { [$1]@$3 }
  ;
vh_frm_top:
  | typ_ept exp_top { Opr ($1,$2) }
  ;
exp_top:
  | exp_lst macro { Opr_Rcd $1 }
  | EXP exp macro { $2 }
  ;
macro:
  | { }
  | SPL macros  { }
  ;
macros:
  | MCR DEF exp  { }
  | MCR DEF exp macros { }
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
  | AGL exp AGL_END { Agl $2 }
  | const { $1 }
  | exp PLS exp { Plus ($1,$3) }
  | exp MLT exp { Mult ($1,$3) }
  | exp MNS exp { Plus ($1,Minus $3) }
  | L_PRN MNS exp R_PRN { Minus $3 }
  | exp EQ exp { Eq ($1,$3) }
  | L_PRN exp R_PRN { $2 }
  | exp APP exp { App ($1,$3) }
  | exp PRJ exp { Prj ($1,$3) }
  | L_RCD exp_lst R_RCD { Opr_Rcd $2 }
  | L_OPN R_OPN { App (Opr_Name "none",Opr_Rcd []) }
  | L_OPN exp R_OPN { App (Opr_Name "some",$2) }
  | L_LST lst_list R_LST { $2 }
(*  | ARR_STT lc_code { Opr_IO $2 } *)
  | MCR { Opr_Name ("%"^$1) }
  ;
lst_list:
  | { App(Opr_Name "nil",Opr_Rcd []) }
  | exp lst_list { App(Opr_Name "cns",Opr_Rcd [$1;$2]) }
  ;
const:
  | INT { Opr_Z $1 }
  | ROT { Root }
  | NAM  { Opr_Name $1 }
  | SGN { Opr_Sgn_Ini }
  | STG { Opr_Stg $1 }
  ;
