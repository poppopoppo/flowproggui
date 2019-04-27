%{
open Flow
%}

%token SRC ARR DEF CLN L_RCD R_RCD STT CNN L_CNN R_CNN ARR_CNN
%token TEST CLQ LCE EXP PRD CO_PRD END_PRD END_CO_PRD
%token L_PRN R_PRN  END PRD_STT CO_PRD_STT D_EXP
%token <string> NAM GL_NAM EXP_GL_NAM
%token <int> INT VAL DOT_VAL
%token PLS MLT
%token EOF

%left PLS
%left MLT

%start text buffer
%type <unit> text
%type <Flow.Exp.arr> buffer
%%
buffer:
  | arr_base EOF { $1 }
  ;
text:
  | EOF {}
  | gl_cod EOF  {  }
  ;
gl_cod:
(*  | { End } *)
  | gl_etr {  }
  | gl_cod gl_etr {  }
(*  | gl_code def_flow *)
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
typs:
  | { [] }
  | typs nam { $1@[$2] }
  ;
nam:
  | NAM { $1 }
  ;
lc_cod:
  | { Flow.Exp.End }
  | arr_base lc_cod  {Flow.Exp.Seq ($1,$2) }
  | cprd  { Flow.Exp.CoPrd $1 }
  | prd  { Flow.Exp.Prd $1 }
  ;
arr_base:
  | ARR CNN canon_base  { $3 }
  | ARR exp_base { $2 }
  ;
canon_base:
  | arr_lst { Exp.Canon $1 }
  ;
exp_base:
  | gl_cll  { Exp.Exp $1 }
  ;
arr:
  | canon  { $1 }
  | exp  { $1 }
  ;
canon:
  | L_CNN R_RCD   { Flow.Exp.Canon [] }
  | L_CNN arr_lst R_RCD { Flow.Exp.Canon $2 }
  ;
arr_lst:
  | arr { [$1] }
  | arr_lst arr { $1@[$2] }
  ;
gl_cll_lst:
  |  { [] }
  | gl_cll_lst gl_cll { $1@[$2] }
  ;
gl_cll:
  | GL_NAM { (Exp.Ax $1) }
  | poly { (Flow.Exp.Poly $1) }
  | L_RCD gl_cll_lst R_RCD  { Exp.Rcd $2 }
  ;
exp:
  | gl_cll { Exp.Exp $1 }
  ;
poly:
  | val_  { $1 }
  | INT { (Z $1) }
  | poly PLS poly { Exp.Plus ($1,$3) }
  | poly MLT poly { Exp.Mult ($1,$3) }
  | L_PRN poly R_PRN { $2 }
val_:
  | VAL val__ { Exp.Val ($1::$2) }
  ;
val__:
  | { [] }
  | val__ DOT_VAL { $1@[$2] }
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
