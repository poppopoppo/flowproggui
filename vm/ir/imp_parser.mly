%{
  open Lang
  open Ast
  open Imp_parser_header
%}

%token SRC ARR DEF CLN L_RCD R_RCD Z ARR_END ISO DTA CNT EMT
%token LCE EXP AGL PRD EOP VCT ARR_REV ARR_REV_IN DOT
%token L_PRN R_PRN  APP COPRD_END PRD_END MNS APP_EVL PLS_EVL MLT_EVL CST
%token ACT SPL FOR_ALL MDL MDL_END L_BLK R_BLK  COPRD SEQ EQ
%token IO PRJ N SLH L_HLZ R_HLZ M_HLZ  L_OPN R_OPN L_LST R_LST SGN
%token MCR PLS MLT EOF CMM LET TYP_STG TYP_SGN TYP_VCT TYP_OPN_VCT
%token DEQ FNT EXN WC TEST PLS_NAT MNS_NAT MLT_NAT L_VCT L_LST_PLS
%token NOT_SPL DTA_GRM ORD_LEX_COPRD ORD_COPRD GRM NOT AGL_TOP AGL_COD
%token <string> NAM STG VAL
%token <int> INT IN OUT ROT SLF NAT INJ IDX CHO

%nonassoc AGL_PRE
%left FOR_ALL
%left EQ
%left PLS MNS
%left MLT
%left APP
%left CST
%left PRJ
%right IO

%start buffer
%start file

%type <Lang.Ast.mdl> file
%type <Lang.Ast.line> buffer
%type <Peg.grammar> dta_grm
%%
buffer:
  | exp_top EOF { Line $1 }
  | ARR_END EOF { End }
  ;
file:
  | def_mdl { Util.pnt flg "parse:file\n"; $1 }
  ;
def_mdl:
  | MDL NAM DEF gl_etr_lst MDL_END { ($2,$4) }
  ;
def_arg:
  | { [] }
  | APP args { $2 }
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
  | SLF NAM ISO grm_ord   { ($2,[],$4) }
  | SLF NAM EQ grm_ptns grm_prd { ($2,[],[((Peg.Synt,$4,$5),None)]) }
  ;
grm_ord:
  | grm_rule { [($1,None)] }
  | grm_ord grm_rule  { $1@[($2,None)] }
grm_rule:
  | ord grm_ptns grm_prd { ($1,$2,$3) }
  ;
ord:
  | ORD_COPRD { Peg.Synt }
  | ORD_LEX_COPRD { Peg.Lex }
  ;
grm_ptns:
  | { [] }
  | grm_ptns grm_ptn  { $1@[$2] }
  ;
grm_ptn:
  | grm_atom { $1 }
  | L_LST grm_atom R_LST { Peg.List $2 }
  | L_LST_PLS grm_atom R_LST { Peg.List $2 }
  | L_OPN grm_atom R_OPN { Peg.Option $2 }
  ;
grm_atom:
  | STG { Peg.Text $1 }
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
  | SLF def_typ_body_clq { [$2] }
  | SLF def_typ_body_clq def_typ_clique { [$2]@$3 }
  ;
def_typ_body:
  | NAM def_arg  { Def_Abs ($1,$2) }
  | NAM def_arg ISO def_coprd   { Def_CoPrd ($1,$2,$4) }
  | NAM def_arg ISO def_prd  { Def_Prd ($1,$2,$4) }
  | FNT NAM ISO name_list { Def_Fnt ($2,$4) }
  | NAM def_arg EQ typ  { Def_EqT ($1,$2,Var (ref Types.WC)) }
  ;
def_typ_body_clq:
  | NAM def_arg  { Def_Abs ($1,$2) }
  | NAM def_arg ISO def_coprd   {
    let a = $2 in
    Def_CoPrd ($1,a,List.map (fun (y,n) -> (y,n)) $4) }
  | NAM def_arg ISO def_prd  { Def_Prd ($1,$2,$4) }
  | NAM def_arg EQ typ  { Def_EqT ($1,$2,Var (ref Types.WC)) }
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
  | typs { Var (ref Types.WC) }
  | EXP typ { Var (ref Types.WC) }
  ;
typs:
  | { }
  | typs typ { }
  ;
typ:
  | L_RCD typ_top R_RCD {  }
  | typ APP typ {  }
  | typ PRJ typ {  }
  | L_OPN typ R_OPN {  }
  | L_LST typ R_LST {  }
  | VAL { }
  | NAM { }
  | Z { }
  | N {  }
  | typ IO typ  { }
  | SGN { }
  | TYP_STG { }
  ;
glb_etr:
  | LCE glb_etr_body { let (a,b,c,d) = $2 in Ast.Etr(a,b,c,d)  }
  | LCE glb_etr_clique { Ast.Etr_Clq  $2 }
  ;
glb_etr_clique:
  | SLF glb_etr_body { [$2] }
  | SLF glb_etr_body glb_etr_clique { [$2]@$3 }
  ;
glb_etr_body:
  | NAM typ_def DEF IN stt_code { ($1,fst $2,snd $2,$5) }
  ;
typ_def:
  | { (Var (ref Types.WC),Var (ref Types.WC)) }
  | CLN typ_top SRC typ_top { ($2,$4) }
  ;
stt_code:
  | exp_top code {
      match $2 with
      | None -> E $1
      | Some x -> V(E $1,x) }
  | L_HLZ h_frm_list R_HLZ tail {
    match $4 with
    | None -> H $2
    | Some x -> V(H $2,x)
  }
  | exp_top code_coprd_list COPRD_END tail {
    let (i,a) = Ast.tk_agl $1 in
    let c = A(a,i,$2) in
    match $4 with
    | None -> c
    | Some x -> V(c,x)
   }
  | exp_top code_prd_list PRD_END tail {
    let c = P($1,$2) in
    match $4 with
    | None -> c
    | Some x -> V(c,x)
  }
  | exp_top IN stt_code eop tail {
    let c = F($1,$2,$3) in
    match $5 with
      | None -> c
      | Some x -> V(c,x) }
  ;
code:
  | eop tail { $2 }
  | ARR exp_top code {
    ( match $3 with
      | None -> Some (Ast.E $2)
      | Some x -> Some (Ast.V(Ast.E $2,x)) ) }
  | ARR L_HLZ h_frm_list R_HLZ tail {
    ( match $5 with
      | None -> Some (H $3)
      | Some x -> Some (V(H $3,x))
      )
  }
  | ARR exp_top code_coprd_list COPRD_END tail {
    let (i,a) = Ast.tk_agl $2 in
    let c = A(a,i,$3) in
    match $5 with
    | None -> Some c
    | Some x -> Some (V(c,x)) }
  | ARR exp_top code_prd_list PRD_END tail {
    let c = P($2,$3) in
    match $5 with
    | None -> Some c
    | Some x -> Some (V(c,x))  }
  | ARR exp_top IN stt_code eop tail {
    let c = F($2,$3,$4) in
    match $6 with
      | None -> Some c
      | Some x -> Some (V(c,x)) }
  ;
eop:
  | EOP {}
  | OUT {}
  ;
tail:
  | { None  }
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
exp_top:
  | exp_lst { Rcd (Array.of_list $1) }
  | EXP exp { $2 }
  ;
exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;

exp:
  | AGL exp %prec AGL_PRE { $2 }
  | INT { Atm(Z $1) }
  | EXN { Atm Exn }
  | ROT { Rot }
  | IDX { Prj(Rot,$1) }
  | VCT { Atm (Name "#")  }
  | INJ { Atm(Inj $1) }
  | CHO { Atm(Cho $1)  }
  | NAM  { Atm (Name $1) }
  | SGN { App(Atm (Name "&"),Rcd [||]) }
  | STG { Atm (Stg $1) }
  | SLF { Atm Fix }
  | exp PLS exp { App(Atm Pls,Rcd [|$1;$3|]) }
  | exp MLT exp { App(Atm Mlt,Rcd [|$1;$3|]) }
  | exp MNS exp { App(Atm Pls,Rcd [|$1;App(Atm Mns,$3)|]) }
  | L_PRN MNS exp R_PRN { App(Atm Mns,$3) }
  | exp EQ exp { App(Atm Eq,Rcd [|$1;$3|]) }
  | L_PRN exp R_PRN { $2 }
  | exp APP exp { App($1,$3) }
  | exp PRJ INT { Prj($1,$3) }
  | L_RCD exp_lst R_RCD { Rcd (Array.of_list $2) }
  | L_OPN R_OPN { Atm (Name "‹›") }
  | L_OPN exp R_OPN { App(Atm (Name "‹"),$2) }
  | L_LST lst_list R_LST { $2 }
  ;
lst_list:
  | { App(Atm (Name "nil"),Rcd [||]) }
  | exp lst_list { App(Atm (Name "cns"),Rcd [|$1;$2|]) }
  ;
