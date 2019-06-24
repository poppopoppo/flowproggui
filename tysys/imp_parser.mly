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
%token DEQ FNT EXN WC TEST PLS_NAT MNS_NAT MLT_NAT L_VCT
%token NOT_SPL DTA_GRM ORD_LEX_COPRD ORD_COPRD GRM NOT AGL_TOP
%token <string> NAM STG VAL
%token <int> INT IN OUT ROT SLF NAT INJ IDX CHO

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
%type <Peg.grammar> dta_grm
%type <code list> code_coprd_list
%type <opr> exp
%%
buffer:
  | vh_frm_top EOF { Evo (Code_Exp $1) }
  | ARR_END EOF { End }
  ;
file:
  | def_mdl { Util.pnt flg "parse:file\n"; $1 }
  ;
def_mdl:
  | MDL NAM def_arg DEF gl_etr_lst MDL_END { Ty.typing_mdl($2,$3,$5) }
  ;
def_arg:
  | { [] }
  | APP args { $2 }
args:
  | arg { [$1] }
  | arg args { [$1]@$2 }
arg:
  | VAL { Arg_Val (-1) }
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
  | dta_grm { Gram $1 }
  ;
dta_grm:
  | DTA_GRM grm_clq { $2 }
  ;
grm_clq:
  | SLF NAM ISO grm_ord   { [($2,[],$4)] }
  | SLF NAM ISO grm_ord grm_clq { ($2,[],$4)::$5 }
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
  | FNT NAM APP L_BLK INT R_BLK ISO NAM   { Def_Fnt_Dep ($2,$5,$8) }
  | NAM def_arg DEQ typ  { Def_Eqv ($1,$2,$4) }
  ;
def_typ_body_clq:
  | NAM def_arg  { Def_Abs ($1,$2) }
  | NAM def_arg ISO def_coprd   { Def_CoPrd ($1,$2,$4) }
  | NAM def_arg ISO def_prd  { Def_Prd ($1,$2,$4) }
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
  | typ APP typ { Typ_App ($1,$3) }
  | typ PRJ typ { Typ_Vct ($1,$3) }
  | L_OPN typ R_OPN { Typ_App (Typ_Name "‹›",$2) }
  | L_LST typ R_LST { Typ_App (Typ_Name "⟦⟧",$2) }
  | VAL { Typ_Val (-1) }
  | NAM { Typ_Name $1 }
  | Z { Typ_Name "ℤ" }
  | N { Typ_Name "ℕ" }
  | typ IO typ  { Typ_Imp ($1,$3) }
  | SGN { Typ_Name "&" }
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
  | NAM typ_def DEF IN stt_code {
    (* let (scm,(src,dst)) = Ty.typing $5 in *)
  (*  let (src,dst) = (Val (Sgn.ini()),Val (Sgn.ini())) in
    let b = Ty.typing_vh [] (Ty.vh_of_code $5) src dst in *
    ($1,SgnMap.empty,Ty.subst b src,Ty.subst b dst,$5) *)
    ($1,SgnMap.empty,Val (Sgn.ini()),Val(Sgn.ini()),$5)
  }
  ;
typ_def:
  | { (Typ_Val (-1),Typ_Val (-1)) }
  | typ_top SRC typ_top CLN { ($1,$3) }
  ;
stt_code:
  | vh_frm_top code {
      match $2 with
      | None -> Code_Exp $1
      | Some x -> Seq (Code_Exp $1,x) }
  | L_HLZ h_frm_list R_HLZ tail {
    match $4 with
    | None -> Canon $2
    | Some x -> Seq(Canon $2,x)
  }
  | vh_frm_top code_coprd_list COPRD_END tail {
    let c = Code_CoPrd($1,$2) in
    match $4 with
    | None -> c
    | Some x -> Seq(c,x)
   }
  | AGL_TOP exp SPL exp code_coprd_list COPRD_END tail {
     let c = Code_Agl($2,$4,$5) in
     match $7 with
     | None -> c
     | Some x -> Seq(c,x) }
  | vh_frm_top code_prd_list PRD_END tail {
    let c = Code_Prd($1,$2) in
    match $4 with
    | None -> c
    | Some x -> Seq(c,x)
  }
  | vh_frm_top IN stt_code eop tail {
    let c = Code_IO($1,$2,$3) in
    match $5 with
      | None -> c
      | Some x -> (Seq(c,x)) }
  ;
code:
  | eop tail { $2 }
  | ARR vh_frm_top code {
    ( match $3 with
      | None -> Some (Code_Exp $2)
      | Some x -> Some (Seq (Code_Exp $2,x)) ) }
  | ARR L_HLZ h_frm_list R_HLZ tail {
    ( match $5 with
      | None -> Some (Canon $3)
      | Some x -> Some (Seq(Canon $3,x))
      )
  }
  | ARR vh_frm_top code_coprd_list COPRD_END tail {
    let c = Code_CoPrd($2,$3) in
    match $5 with
    | None -> Some c
    | Some x -> Some (Seq(c,x)) }
  | ARR AGL_TOP exp SPL exp code_coprd_list COPRD_END tail {
    let c = Code_Agl($3,$5,$6) in
    match $8 with
    | None -> Some c
    | Some x -> Some(Seq(c,x)) }
  | ARR vh_frm_top code_prd_list PRD_END tail {
    let c = Code_Prd($2,$3) in
    match $5 with
    | None -> Some c
    | Some x -> Some (Seq(c,x))  }
  | ARR vh_frm_top IN stt_code eop tail {
    let c = Code_IO($2,$3,$4) in
    match $6 with
      | None -> Some c
      | Some x -> Some (Seq(c,x)) }
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
  |  { Typ_Val (-1) }
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
  | ROT { Opr_Name "$" }
  | IDX { Prj(Opr_Name "$",$1) }
  | VCT { Opr_Name "#" }
  | INJ { Opr_Inj $1 }
  | CHO { Opr_Cho $1  }
  | NAM  { Opr_Name $1 }
  | SGN { Opr_Name "&" }
  | STG { Opr_Stg $1 }
  | SLF { Opr_Name "@" }
  | exp PLS exp { Opr_App (Opr_Name "+",Opr_Rcd [$1;$3]) }
  | exp MLT exp { Opr_App (Opr_Name "*",Opr_Rcd [$1;$3]) }
  | exp MNS exp { Opr_App (Opr_Name "+",Opr_Rcd [$1;Opr_App (Opr_Name "-",$3)]) }
  | exp CST { Opr_App(Opr_Name "//",$1) }
  | L_PRN MNS exp R_PRN { Opr_App (Opr_Name "-",$3) }
  | exp EQ exp { Opr_App(Opr_Name "=",Opr_Rcd [$1;$3]) }
  | L_PRN exp R_PRN { $2 }
  | exp APP exp { Opr_App ($1,$3) }
  | exp PRJ INT { Prj ($1,$3) }
  | L_RCD exp_lst R_RCD { Opr_Rcd $2 }
  | L_OPN R_OPN { Opr_Name "‹›" }
  | L_OPN exp R_OPN { Opr_App(Opr_Name "‹",$2) }
  | L_LST lst_list R_LST { $2 }
  ;
subst_list:
  | { [] }
  | subst_list CMM exp LET exp { $1@[($3,$5)] }
  ;
lst_list:
  | { Opr_App (Opr_Name "nil",Opr_Rcd []) }
  | exp lst_list { Opr_App (Opr_Name "cns",Opr_Rcd [$1;$2]) }
  ;
