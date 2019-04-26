%{

%}

%token SRC ARR DEF CLN L_RCD R_RCD STT
%token TEST CLQ LCE EXP PRD CO_PRD END_PRD END_CO_PRD
%token L_PRN R_PRN  END PRD_STT CO_PRD_STT
%token <string> NAM GL_NAM
%token <int> INT VAL
%token PLS MLT
%token EOF

%left PLS
%left MLT

%start text buffer
%type <unit> text
%type <unit> buffer
%%
buffer:
  | arr EOF { $1 }
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
  | LCE lc_man {  $2 }
  | LCE clq_lst { ModNet.Clq $2 }
  ;
lc_man:
  | NAM CLN typs SRC typs DEF lc_cod { }
  ;
clq_lst:
  | CLQ lc_man { [$2] }
  | clq_lst CLQ lc_man { $1@[$3]}
  ;
typs:
  | { [] }
  | typs nam { $1@[$2] }
  ;
nam:
  | NAM { $1 }
  ;
lc_cod:
  | {}
  | ARR arr lc_cod  {}
  | cprd  {}
  | prd  {}
  ;
arr:
  | canon  {}
  | matr  {}
  | dmatr  {}
  ;
canon:
  | gl_cll_lst  {}
  ;
gl_cll_lst:
  |  {}
  | gl_cll gl_cll_lst  {}
  ;
gl_cll:
  | GL_NAM { ModNet.Gl_nam $1 }
  | ply { ModNet.Ply $1 }
  | L_RCD arr R_RCD {}
  ;
matr:
  | EXP gl_cll_lst  {}
  ;
dmatr:
  | EXP EXP gl_cll  {}
  ;
ply:
  | VAL  { ModNet.Val 0 }
  | INT { ModNet.Int $1 }
  | ply PLS ply { ModNet.Plus ($1,$3) }
  | ply MLT ply { ModNet.Mult ($1,$3) }
  | L_PRN ply R_PRN { $2 }
cprd:
  | cprd_lst END_CO_PRD lc_cod  {}
  ;
cprd_lst:
  | CO_PRD_STT lc_cod {}
  | cprd_lst CO_PRD lc_cod  {}
  ;
prd:
  | prd_lst END_PRD lc_cod  {}
  ;
prd_lst:
  | PRD_STT lc_cod {}
  | prd_lst PRD lc_cod  {}
  ;
