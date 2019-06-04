%{
  open Imp
  open Imp_parser_header
%}

%token SRC ARR DEF CLN L_RCD R_RCD CNN M_CNN Z ARR_END EQV ISO DTA STT_CLN CNT EMT ARG IN OUT
%token LCE EXP CO_PRD END_CO_PRD AGL AGL_END ARR_STT PRD PRD_STT END_PRD IO_STT
%token L_PRN R_PRN  APP R_APP COPRD_END PRD_END HOGE
%token TEST ACT SPL  FOR_ALL MDL CLS_NAM MDL_END L_BLK R_BLK  COPRD SEQ EOP EQ
%token IO CLS PRJ  N  SLH L_HLZ R_HLZ M_HLZ R_HLZ_TAIL L_OPN R_OPN L_LST R_LST SGN

%token <string> NAM MCR VAL
%token <int> INT ROT
%token PLS MLT
%token EOF

%left FOR_ALL
%left EQ
%left PLS
%left MLT
%left APP
%left PRJ
%right IO

%start buffer
%start file

%type <Imp.mdl> file
%type <Imp.buffer> buffer
%type <Imp.plc> plc plc_top
%type <Imp.plc list> plcs
%%
buffer:
  | vh_frm_top EOF { Imp.Evo $1 }
  | ARR_END EOF { Imp.End }
  ;
file:
  | def_mdl {
    Util.pnt flg "parse:file\n";
    $1 }
  ;
def_mdl:
  | MDL NAM DEF gl_etr_lst MDL_END {
    Util.pnt flg ("parse:def_mdl:"^(Util.string_of_list "\n" Imp.string_of_glb_etr $4)^"_n");
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
  | def_plc { $1 }
  ;
def_plc:
  | DTA def_name ISO def_coprd  {
      (Def_CoPrd (ref
        { coprd_name=(snd $2); coprd_cns=$4 }))
      }
  | DTA def_name ISO def_prd  {
        (Def_Prd (ref
        { prd_name=(snd $2); prd_cns=$4 }))
      }
  ;
def_name:
  | NAM  { ([],$1) }
  | NAM APP VAL { ([$3],$1) }
  ;
def_coprd:
  | COPRD typ_top CLN name  { [($4,$2)] }
  | COPRD typ_top CLN name def_coprd  { ($4,$2)::$5 }
  ;
def_prd:
  | PRD typ_top CLN name  { [($4,$2)] }
  | PRD typ_top CLN name def_prd  { ($4,$2)::$5 }
  ;
plc_top:
  | plcs { Imp.Plc_Rcd $1 }
  | EXP plc { $2 }
  ;
plcs:
  | { [] }
  | plcs plc { $1@[$2] }
  ;
plc:
  | plc APP plc { Imp.Plc_App ($1,$3) }
  | SLH plc L_BLK exp R_BLK  { Imp.DepPlc ($4,$2) }
  | Z { Imp.Plc_Z }
  | N { Imp.Plc_Name "ℕ" }
  | plc IO plc  { Imp.Plc_IO ($1,$3) }
  | NAM FOR_ALL plc { Imp.Plc_For_All ($1,$3) }
  | name { Imp.Plc_Val $1 }
  | L_RCD plc_top R_RCD { $2 }
  ;

typ_top:
  | typs { Imp.Typ_Rcd $1 }
  | EXP typ { $2 }
  ;
typs:
  | { [] }
  | typs typ { $1@[$2] }
  ;
typ:
  | typ APP typ { Imp.Typ_App ($1,$3) }
  | SLH typ L_BLK typ_const R_BLK { Imp.DepTyp ($4,$2) }
  | Z { Imp.Typ_Z }
  | N { Imp.Typ_Name "ℕ" }
  | typ IO typ  { Imp.Typ_IO ($1,$3) }
  | NAM FOR_ALL typ { Imp.Typ_For_All ($1,$3) }
  | VAL { Imp.Typ_Val $1 }
  | NAM { Imp.Typ_Name $1 }
  | L_RCD typ_top R_RCD { $2 }
  ;
typ_const:
  | INT { (Imp.Typ_Z,Imp.Tkn_Z $1) }
name:
  | NAM { $1 }

glb_etr:
  | LCE NAM typ_def DEF ARR_STT vh_frm_code {
    let (src,dst) = $3 in
    Imp.Etr (ref { gl_name=$2; src=src; dst=dst; code=$6 })
    }
  ;
typ_def:
  | { (Imp.Typ_Top,Imp.Typ_Top) }
  | CLN typ_top SRC typ_top { ($2,$4) }
  ;

vh_frm_code:
  | vh_frm_top tail_code
    {
      match $2 with
      | `None -> $1
      | `Some t ->
        Util.pnt true ("parse:vh_frm_code"^(Imp.string_of_code $1));
        Imp.Seq ($1,t)
      | `CoPrd (x,_) ->
        let c = Imp.Code_CoPrd{ pre=$1; post=x } in
        Util.pnt true ("parser:vh_frm_code"^(Imp.string_of_code c));
        c
      | `Prd (x,_) ->
        Imp.Seq ($1,Imp.Code_Prd { pre=x; post=(Id Plc_Top)})
      | `H_FRM c -> Imp.Seq ($1,c)
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
  | plc_ept exp_top { Imp.Opr { src=Plc_Top; dst=$1; opr=$2 } }
  ;
exp_top:
  | exp_lst macro { Imp.Opr_Rcd $1 }
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
plc_ept:
  |  { Imp.Plc_Top }
  | ACT plc_top CLN { $2 }
  ;

exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;

exp:
  | AGL exp AGL_END { Imp.Agl $2 }
  | const { $1 }
  | exp PLS exp { Imp.Plus ($1,$3) }
  | exp MLT exp { Imp.Mult ($1,$3) }
  | exp EQ exp { Imp.Eq ($1,$3) }
  | L_PRN exp R_PRN { $2 }
  | exp APP exp { Imp.App ($1,$3) }
  | exp PRJ exp { Imp.Prj ($1,$3) }
  | L_RCD exp_lst R_RCD { Imp.Opr_Rcd $2 }
(*  | ARR_STT lc_code { Imp.Opr_IO $2 } *)
  | MCR { Imp.Gl_call ("%"^$1) }
  ;
const:
  | INT { Imp.Opr_Z $1 }
  | ROT { Imp.Root $1 }
  | NAM  { Imp.Gl_call $1 }
  | SGN { Imp.Opr_Sgn }
  ;
