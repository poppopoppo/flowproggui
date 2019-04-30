%{
open Flow
%}

%token SRC ARR DEF CLN L_RCD R_RCD STT CNN M_CNN
%token TEST CLQ LCE EXP PRD CO_PRD END_PRD END_CO_PRD R_APP AGL
%token L_PRN R_PRN PRD_STT CO_PRD_STT  APP L_APP DOT ROT
%token <string> NAM GL_NAM
%token <int> INT
%token PLS MLT
%token EOF

%left DOT
%left PLS
%left MLT
%left L_APP

%start buffer

%type <Flow.Exp.buf> buffer
%%
buffer:
  | arr_base EOF { Evo $1 }
  | glb_etr EOF { Glb $1 }
  ;
glb_etr:
  | LCE NAM typ DEF lc_code { ($2,$5) }
  ;
lc_code:
  | arr_base { $1 }
  ;
typ:
  | {}
  | CLN typs SRC typs {}
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
typs:
  | { [] }
  | typs nam { $1@[$2] }
  ;
nam:
  | NAM { $1 }
  ;
(*
lc_cod:
  | { Flow.Exp.End }
  | arr_base ARR lc_cod  {Flow.Exp.Seq ($1,$3) }
  | cprd  { Flow.Exp.CoPrd $1 }
  | prd  { Flow.Exp.Prd $1 }
  ;
  *)
arr_base:
  | arr { $1 }
  | arr ARR arr_base  { $1 }
  ;
cprd:
  | CO_PRD_STT arr_base CO_PRD arr_base END_CO_PRD{ Exp.CoPrd ($2,$4) }
  ;
arr:
  | CNN cnn_lst { Exp.Canon $2 }
  | exp_lst { Exp.Rcd $1 }
  | EXP exp { $2 }
  ;
cnn_lst:
  | exp_str { [$1] }
  | cnn_lst exp_str { $1}
  ;
exp_lst:
  | { [] }
  | exp_lst exp_str  { $1@[$2] }
  ;
exp_str:
  | cprd { $1 }
  | L_RCD arr_base R_RCD  { $2 }
  | exp { $1 }
  | AGL exp { Exp.Agl $2 }
exp:
  | const { $1 }
  | APP exp DOT exp { Exp.App ($2,$4) }
  | exp PLS exp { Exp.Plus ($1,$3) }
  | exp MLT exp { Exp.Mult ($1,$3) }
  | L_PRN exp R_PRN { $2 }
  | exp L_APP exp { Exp.L_App ($1,$3) }
  ;
const:
  | INT { Exp.Z $1 }
  | ROT { Exp.Root }
  | GL_NAM  { Exp.Gl_call $1 }
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
