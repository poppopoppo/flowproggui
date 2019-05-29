%{
  open Imp
%}

%token SRC ARR DEF CLN L_RCD R_RCD CNN M_CNN Z ARR_END EQV DTA STT_CLN
%token LCE EXP CO_PRD END_CO_PRD AGL AGL_END ARR_STT PRD PRD_STT END_PRD
%token L_PRN R_PRN  CO_PRD_STT  APP R_APP DOT D_EXP
%token TEST ACT SPL END_FLW_LST FOR_ALL MDL CLS_NAM MDL_END L_BLK R_BLK
%token IO END_GL_ETR_LST CLS PRJ  N  SLH CMT
(*
%token EOP PRD TEST PRD_STT R_APP STT END_PRD CLQ STT
*)
%token <string> NAM GL_NAM MCR VAL
%token <int> INT ROT
%token PLS MLT
%token EOF

%left SLH
%left PLS
%left MLT
%left APP
%left PRJ
%right IO

%start buffer
%start file

%type <unit> file
%type <Imp.buffer> buffer
%type <Imp.plc> plc plc_top
%type <Imp.plc list> plcs
%%
buffer:
  | vh_frm_top EOF { Imp.Evo $1 }
  | glb_etr EOF { Imp.Glb_Etr $1 }
  | glb_mode EOF {
      let (n,s,d) = $1 in
      (Imp.Glb_mode_Stt { name=n; src=s; dst=d })
         }
  | def_plc EOF { $1 }
  | ARR_END EOF { Imp.End }
  ;
file:
  | def_mdl {}
  ;
def_mdl:
  | MDL NAM DEF flow_lst gl_etr_lst MDL_END {}
  ;
flow_lst:
  | END_FLW_LST {}
  | def_plc flow_lst  {}
  ;
gl_etr_lst:
  | END_GL_ETR_LST  {}
  | glb_etr END_GL_ETR_LST  {}
  ;
def_plc:
  | DTA def_name EQV def_coprd  {
      Imp.Glb_Etr
      (Def_CoPrd (ref
        { coprd_name=(snd $2); coprd_cns=$4 }))
      }
  | DTA def_name EQV def_prd  {
      Imp.Glb_Etr
        (Def_Prd (ref
        { prd_name=(snd $2); prd_cns=$4 }))
      }
  ;
def_name:
  | NAM  { ([],$1) }
  | NAM R_APP NAM { ([$1],$3) }
  ;
def_coprd:
  | CO_PRD typ_top CLN name  { [($4,$2)] }
  | CO_PRD typ_top CLN name def_coprd  { ($4,$2)::$5 }
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
  | TEST plc L_BLK exp R_BLK  { Imp.DepPlc ($4,$2) }
  | Z { Imp.Plc_Z }
  | N { Imp.Plc_Name "ℕ" }
  | plc IO plc  { Imp.Plc_IO ($1,$3) }
  | FOR_ALL VAL SLH plc { Imp.Plc_For_All (Imp.Class_Type,$2,$4) }
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
  | TEST typ L_BLK typ_const R_BLK { Imp.DepTyp ($4,$2) }
  | Z { Imp.Typ_Z }
  | N { Imp.Typ_Name "ℕ" }
  | typ IO typ  { Imp.Typ_IO ($1,$3) }
  | FOR_ALL VAL SLH typ { Imp.Typ_For_All (Imp.Class_Type,$2,$4) }
  | name { Imp.Typ_Val $1 }
  | L_RCD typ_top R_RCD { $2 }
  ;
typ_const:
  | INT { (Imp.Typ_Z,Imp.Tkn_Z $1) }
name:
  | NAM { $1 }
glb_mode:
  | LCE LCE NAM CLN typ_top SRC typ_top { ($3,$5,$7) }
  ;

glb_etr:
  | LCE NAM typ_def DEF lc_code {
    let (src,dst) = $3 in
    Imp.Etr (ref { gl_name=$2; src=src; dst=dst; code=$5 })
    }
  ;
lc_code:
  | vh_frm_code { $1 }
  ;
typ_def:
  | { (Imp.Typ_Top,Imp.Typ_Top) }
  | CLN typ_top SRC typ_top { ($2,$4) }
  ;
(*
text:
  | EOF {}
  | gl_cod EOF  {  }
  ;
gl_cod:

  | gl_etr {  }
  | gl_cod gl_etr {  }
  | gl_code def_flow
  ;
gl_etr:
  | LCE lc_man {   }
  | LCE clq_lst {  }
  ;

lc_man:
  | NAM CLN typs SRC typs DEF lc_cod { }
  ;

clq_lst:
  | CLQ lc_man {  }
  | clq_lst CLQ lc_man { }
  ;
*)

(*
lc_cod:
  | { Imp.Imp.End }
  | arr_base ARR lc_cod  {Imp.Imp.Seq ($1,$3) }
  | cprd  { Imp.Imp.CoPrd $1 }
  | prd  { Imp.Imp.Prd $1 }
  ;
  *)
vh_frm_code:
  | vh_frm_top tail_code
    {
      match $2 with
      | `None -> $1
      | `Some t -> Imp.Seq ($1,t)
      | `CoPrd c -> Code_CoPrd { pre=$1; post=c }
    }
  ;
tail_code:
  | ARR_END { `None }
  | ARR vh_frm_code { `Some $2 }
  | coprd { $1 }
  ;
coprd:
  | CO_PRD_STT vh_frm_code coprd_tail END_CO_PRD vh_frm_code
    {  `CoPrd ([$2]@$3@[$5]) }
  ;

coprd_tail:
  | { [] }
  | coprd_tail CO_PRD vh_frm_code { $1@[$3] }
  ;
vh_frm_top:
  | CNN vh_frm_lst  { Imp.Canon $2 }
  | plc_ept exp_top { Imp.Opr { src=Plc_Top; dst=$1; opr=$2 } }
  ;
exp_top:
  | exp_lst macro { Imp.Opr_Rcd $1 }
  | EXP exp macro { $2 }
  | D_EXP exp macro { Imp.App ($2,Imp.Root 0) }
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
vh_frm_lst:
  | vh_frm  { [$1] }
  | vh_frm_lst M_CNN vh_frm { $1@[$3] }
  ;
vh_frm:
  | h_frm tail
    {
      match $2 with
      | `None -> $1
      | `Some t -> Imp.Seq ($1,t)
      | `CoPrd c -> Code_CoPrd { pre=$1; post=c }
    }
  ;
h_frm:
  | exp { Imp.Opr { src=Imp.Plc_Top; dst=Imp.Plc_Top; opr=$1} }
  | L_RCD CNN vh_frm_lst R_RCD  { Imp.Canon $3 }
  ;
tail:
  | ARR_END { `None }
  | ARR vh_frm { `Some $2 }
  | CO_PRD_STT vh_frm CO_PRD vh_frm END_CO_PRD  { `CoPrd [$2;$4] }
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
  | L_PRN exp R_PRN { $2 }
  | exp APP exp { Imp.App ($1,$3) }
  | exp PRJ exp { Imp.Prj ($1,$3) }
  | L_RCD exp_lst R_RCD { Imp.Opr_Rcd $2 }
  | ARR_STT lc_code { Imp.Opr_IO $2 }
  | MCR { Imp.Gl_call ("%"^$1) }
  ;
const:
  | INT { Imp.Opr_Z $1 }
  | ROT { Imp.Root $1 }
  | GL_NAM  { Imp.Gl_call $1 }
  ;
(*
cprd:
  | cprd_lst END_CO_PRD lc_cod  { [] }
  ;
cprd_lst:
  | CO_PRD_STT lc_cod {}
  | cprd_lst CO_PRD lc_cod  {}
  ;
prd:
  | prd_lst END_PRD lc_cod  { [] }
  ;
prd_lst:
  | PRD_STT lc_cod {}
  | prd_lst PRD lc_cod  {}
  ;
*)
