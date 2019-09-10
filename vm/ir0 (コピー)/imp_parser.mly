%{
  open Lang
  open Types
  open Ast

%}

%token SRC ARR DEF CLN L_RCD R_RCD Z ARR_END ISO DTA CNT EMT RM INI_IR SRC_OUT
%token LCE EXP AGL PRD EOP VCT ARR_REV ARR_REV_IN DOT VCT_INI OP LCE_IR
%token L_PRN R_PRN  APP COPRD_END PRD_END MNS APP_EVL PLS_EVL MLT_EVL CST
%token ACT SPL FOR_ALL MDL MDL_END L_BLK R_BLK  COPRD SEQ EQ LB OUT_IR PRJ_IR CNS_IR
%token IO PRJ N SLH L_HLZ R_HLZ M_HLZ  L_OPN R_OPN L_LST R_LST SGN
%token MCR PLS MLT EOF CMM LET TYP_STG TYP_SGN TYP_VCT TYP_OPN_VCT
%token DEQ FNT EXN WC TEST PLS_NAT MNS_NAT MLT_NAT L_VCT L_LST_PLS DSH
%token NOT_SPL DTA_GRM ORD_LEX_COPRD ORD_COPRD GRM NOT AGL_TOP AGL_COD
%token <string> NAM STG VAL
%token <int> INT IN OUT ROT SLF NAT INJ IDX CHO

%nonassoc AGL_PRE
%left FOR_ALL
%left EQ
%left VCT
%left PLS MNS
%left MLT
%left APP
%left CST
%left PRJ
%right IO

%start buffer
%start file

%type <Lang.Ast.mdl list> file
%type <Lang.Ast.line> buffer
%type <Peg.grammar> dta_grm
%%
buffer:
  | exp_top EOF
  {
    ( try
      let (i,a) = Ast.tk_agl $1 in
      Line_Agl (i,a)
      with _ -> Line $1 ) }
  | ARR_END EOF { End }
  ;
file:
  | EOF { [] }
  | def_mdl file { $1::$2 }
  ;
def_mdl:
  | MDL NAM DEF gl_etr_lst MDL_END { ($2,$4) }
  ;
def_arg:
  | { [] }
  | APP args { $2 }
  | APP args_rot { BatList.init $2 (fun n -> "$"^(String.make n '\'')) }
  ;
args_rot:
  | DSH { 1 }
  | DSH args_rot { 1+$2 }
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
  | SLF DOT NAM ISO grm_ord   {
    ( try
      let v = List.find (fun v -> let (n,_,_) = !v in n=$3) !Peg.ns in
      (v := ($3,[],$5); ($3,[],$5))
      with Not_found ->
      let v = ref ($3,[],$5) in
      (Peg.ns := v::!Peg.ns; ($3,[],$5))) }
  ;
grm_ord:
  | grm_rule { [($1,None)] }
  | grm_ord grm_rule  { $1@[($2,None)] }
grm_rule:
  | ord grm_ptns grm_prd { ($1,$2,$3) }
  ;
ord:
  | COPRD { Peg.Synt }
  | ORD_LEX_COPRD { Peg.Lex }
  ;
grm_ptns:
  | { [] }
  | grm_ptns grm_ptn  { $1@[$2] }
  ;
grm_ptn:
  | WC  { Peg.Atm Any }
  | grm_atom { Peg.Atm $1 }
  | L_LST grm_atom R_LST { Peg.List $2 }
  | L_OPN grm_atom R_OPN { Peg.Option $2 }
  ;
grm_atom:
  | STG { (Peg.Text $1) }
  | NAM {
    ( try
      let v = List.find (fun v -> let (n,_,_) = !v in n=$1) !Peg.ns in
      Var v
      with Not_found ->
      let v = ref ($1,[],[]) in
      (Peg.ns := v::!Peg.ns; Var v)) }
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
  | SLF DOT def_typ_body { [$3] }
  | SLF DOT def_typ_body def_typ_clique { [$3]@$4 }
  ;
def_typ_body:
  | NAM def_arg  {
    let v = ref (Ln (Prm(Name $1))) in
    IR.ns_t := ($1,v)::!IR.ns_t;
    Def_Abs ($1,$2) }
  | NAM def_arg ISO def_coprd   {
    ( try
        let _ = List.assoc $1 !IR.ns_t in
        Def_CoPrd ($1,$2,$4)
      with Not_found ->
        let v = newvar () in
        IR.ns_t := ($1,v)::!IR.ns_t;
        Def_CoPrd ($1,$2,$4)) }
  | NAM def_arg ISO def_prd  { Def_Prd ($1,$2,$4) }
  | FNT NAM ISO name_list { Def_Fnt ($2,$4) }
  | NAM def_arg EQ typ  {
    let a = List.map (fun _ -> newvar_q (-1)) $2 in
    let y = abs $4 a in
    let v = ref (Ln y) in
    IR.ns_t := ($1,v)::!IR.ns_t;
    Def_EqT ($1,$2,$4) }
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
  | typs { Rcd(rcd_cl $1) }
  | EXP typ { $2 }
  ;
typ_top_lb:
  | {}
  | NAM LET typ typ_top_lb  {}
typs:
  | { [] }
  | typs typ { $1@[$2] }
  ;
typ:
  | L_PRN typ R_PRN { $2 }
  | L_RCD typ_top R_RCD { $2 }
  | L_RCD LB typ_top_lb R_RCD { $2 }
  | typ APP typ { App($1,$3) }
  | typ PRJ typ { App(App(Prm Vct,$1),$3) }
  | L_OPN typ R_OPN { opn $2 }
  | L_LST typ R_LST { lst $2 }
  | VAL { Var (newvar ()) }
  | NAM {
    ( try
        let v = List.assoc $1 !IR.ns_t in
        Var v
      with Not_found ->
        let v = newvar () in
        IR.ns_t := ($1,v)::!IR.ns_t; Var v ) }
  | Z { zn (Prm Z_u) }
  | N { Prm N }
  | ROT rot_dsh { Var (newvar_q (-($2+2))) }
  | typ IO typ  { Imp($1,$3) }
  | SGN { Prm Sgn }
  | TYP_STG { Prm Stg }
  ;
rot_dsh:
  | { 0 }
  | rot_dsh DSH { $1+1 }
  ;
glb_etr:
  | LCE glb_etr_body { let (a,b,c,d) = $2 in Ast.Etr(a,b,c,d)  }
  | LCE glb_etr_clique { Ast.Etr_Clq  $2 }
  | LCE_IR glb_etr_body_ir  {}
  ;
glb_etr_clique:
  | SLF DOT glb_etr_body { [$3] }
  | SLF DOT glb_etr_body glb_etr_clique { [$3]@$4 }
  ;
glb_etr_body:
  | NAM typ_def DEF IN stt_code { ($1,fst $2,snd $2,$5) }
  ;
glb_etr_body_ir:
  | NAM typ_def DEF ir_code { }
  ;
ir_code:
  | ir_etr ir_lines ir_ret {}
  ;
ir_etr:
  | IN reg_ptn {}
  ;
ir_ret:
  | EOP reg_ptn {}
  ;
ir_lines:
  | {}
  | ir_line ir_lines {}
  ;
ir_line:
  | ROT NAM SRC NAM regs {}
  | RM NAM {}
  | INI_IR ir_tkn SRC NAM  {}
  | NAM reg_ptn SRC reg_ptn {}
  | COPRD_END reg_ptn SRC reg_ptn coprd_ir {}
  | APP NAM CMM reg_ptn SRC reg_ptn {}
  | PRJ_IR NAM SRC NAM names OP NAM  {}
  | CNS_IR NAM names OP NAM SRC NAM  {}
  | PRJ_IR LB NAM SRC lb_let names_lb OP NAM  {}
  | CNS_IR LB lb_let names_lb OP NAM SRC NAM {}
  | OUT_IR NAM reg_ptn SRC_OUT {}
  | NAM reg_ptn SRC_OUT {}
  ;
names:
  | {}
  | NAM names {}
names_lb:
  | {}
  | lb_let names {}
ir_tkn:
  | INT  {}
  | NAM   {}
  ;
reg:
  | WC {}
  | NAM {}
  ;
reg_ptn:
  | reg {}
  | L_RCD reg_ptn_lst reg_ptn_op {}
  | L_RCD LB reg_ptn_lst_lb reg_ptn_op {}
  ;
reg_ptn_op:
  | OP NAM R_RCD  {}
  | R_RCD {}
reg_ptn_lst:
  | {}
  | reg_ptn reg_ptn_lst {}
  ;
reg_ptn_lst_lb:
  | {}
  | NAM LET reg_ptn reg_ptn_lst_lb {}
  ;
lb_let:
  | NAM LET NAM {}
  ;
coprd_ir:
  | COPRD reg_ptn ir_lines LET reg_ptn {}
  ;
regs:
  | {}
  | CMM NAM regs {}
  ;

typ_def:
  | { (Var (newvar()),Var (newvar())) }
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
    let c = Ast.P($1,$2) in
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
    let c = Ast.P($2,$3) in
    match $5 with
    | None -> Some c
    | Some x -> Some (V(c,x))  }
  | ARR exp_top IN stt_code eop tail {
    let c = Ast.F($2,$3,$4) in
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
  | LB exp_lst_lb { }
  | exp LB exp_lst_lb {}
  | DOT LB exp_lst_lb {}
  | EXP exp { $2 }
  ;
exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;
exp_lst_lb:
  | { [] }
  | exp_lst_lb NAM LET exp { $1@[($2,$4)] }
  | exp_lst_lb NAM RM {}
exp:
  | AGL exp %prec AGL_PRE { Agl_Op $2 }
  | INT { Atm(Z $1) }
  | EXN { Atm Exn }
  | ROT { Rot }
  | IDX { Prj(Rot,$1) }
  | VAL { }
  | VCT_INI { App(Atm (Name "#"),Rcd [||])  }
  | exp VCT exp { App(Atm (Name "⊵"),Rcd [|$1;$3|]) }
  | INJ { Atm(Inj $1) }
  | CHO { Atm(Cho $1)  }
  | NAM  { Atm (Name $1) }
  | NAM DOT NAM { Atm(Name ($1^"."^$3)) }
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
  | L_RCD LB exp_lst_lb R_RCD { Rcd_Lb (Array.of_list $3) }
  | L_RCD exp LB exp_lst_lb R_RCD {}
  | L_OPN R_OPN { App(Atm(Name "‹›"),Rcd [||]) }
  | L_OPN exp R_OPN { App(Atm (Name "‹"),$2) }
  | L_LST lst_list R_LST { $2 }
  ;
lst_list:
  | { App(Atm (Name "⟦⟧"),Rcd [||]) }
  | exp lst_list { App(Atm (Name "⟦"),Rcd [|$1;$2|]) }
  ;
