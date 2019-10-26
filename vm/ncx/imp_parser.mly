%{
  open Lang
  open Types
  open Ast
  open Util
%}

%token SRC ARR DEF CLN L_RCD R_RCD Z ARR_END ISO DTA RM INI_IR SRC_OUT
%token LCE EXP AGL PRD EOP VCT ARR_REV ARR_REV_IN DOT VCT_INI OP LCE_IR
%token L_PRN R_PRN  APP COPRD_END PRD_END MNS CST SRC_IL COPRD_PTN_END
%token ACT SPL FOR_ALL MDL MDL_END L_BLK R_BLK  COPRD SEQ EQ LB OUT_IR PRJ_IR CNS_IR
%token IO PRJ N SLH L_OPN R_OPN L_LST R_LST SGN NL MTC_IR CLN2 EOP_EXN EOP_OUT
%token MCR PLS MLT EOF CMM LET TYP_STG TYP_SGN TYP_VCT TYP_OPN_VCT IMP
%token DEQ FNT EXN WC PLS_NAT MNS_NAT MLT_NAT L_VCT L_LST_PLS DSH COPRD_PTN MTC
%token NOT_SPL DTA_GRM ORD_LEX_COPRD ORD_COPRD GRM NOT AGL_TOP AGL_COD
%token <string> NAM STG VAL REG
%token <int> INT IN OUT ROT SLF NAT INJ IDX CHO AGL_OP
%token <int64> R64
%token <bool> R2
%nonassoc AGL_PRE
%left FOR_ALL
%left EQ
%left VCT
%left PLS MNS
%left MLT
%left APP
%left CST
%left PRJ
%right IO IMP

%start buffer
%start file
%start name_eof
%type <Lang.name> name_eof
%type <Lang.name option * Lang.Ast.mdl list> file
%type <Lang.Ast.line> buffer
%type <Lang.Grm.t> dta_grm
%type <Lang.Types.t> typ
%%
buffer:
  | exp_top EOF
  {
    Line $1  }
  | ARR_END EOF { End }
  ;
name_eof:
  | name EOF { $1 }
  ;
name:
  | NAM { ([],$1) }
  | NAM DOT name {
    let (lm0,n) = $3 in
    (lm0@[$1],n) }
  ;
file:
  | EOF { (None,[]) }
  | LCE WC EQ name EOF { (Some $4,[]) }
  | def_mdl file {
    let (o,ms) = $2 in
    (o,$1::ms) }
  ;
def_mdl:
  | MDL NAM gl_etr_lst MDL_END { ($2,$3) }
  ;
nl:
  | {}
  | NL {}
  ;
nls:
  | {}
  | nls NL {}
  ;
def_arg:
  | { ([],[]) }
  | APP args { $2 }
  | APP args_rot { ([],BatList.init $2 (fun n -> ("$"^(String.make n '\''),newvar_q (-2)))) }
  ;
args_rot:
  | DSH { 1 }
  | DSH args_rot { 1+$2 }
  ;
args:
  | VAL {
    let v = newvar_q (-1) in
    ([v],[($1,v)]) }
  | VAL CMM args {
    let v = newvar_q (-1) in
    let (vs,l) = $3 in
    (v::vs,($1,v)::l) }
  ;
gl_etr_lst:
  |   { [] }
  | mdl_etr nls gl_etr_lst  { $1::$3 }
  ;
mdl_etr:
  | glb_etr { $1 }
  | def_typ { $1 }
  | def_mdl {
    let (n,el) = $1 in Mdl (n,el) }
  ;
def_typ:
  | DTA def_typ_clique { Flow_Clq $2 }
  | DTA def_typ_body { Flow $2 }
  | dta_grm { Gram $1 }
  | DTA_GRM NAM { Grm_Abs $2 }
  ;
dta_grm:
  | DTA_GRM grm_clq { $2 }
  ;
grm_clq:
  | grm_etr { [$1] }
  | grm_etr grm_clq { $1::$2 }
  ;
grm_etr:
  | SLF DOT NAM grm_ord   {
    let (_,go) =
    List.fold_left
    (fun (i,go) (cn,f,r) ->
      if cn="_" then (i+1,go@[($3^"_"^(string_of_int i),f,r)])
      else (i+1,go@[(cn,f,r)]))
      (0,[]) $4 in
    ($3,go) }
  ;
grm_ord:
  | grm_rule { [$1] }
  | grm_ord grm_rule  { $1@[$2] }
grm_rule:
  | ord NAM CLN grm_ptns grm_prd { ($2,$1,$4) }
  | ord grm_ptns grm_prd { ("_",$1,$2) }
  ;
ord:
  | COPRD { Grm.Lex }
  | ORD_LEX_COPRD { Grm.Synt }
  ;
grm_ptns:
  | { [] }
  | grm_ptn grm_ptns { $1::$2 }
  ;
grm_ptn:
  | grm_atom { Grm.Atm $1 }
  | L_LST grm_atom R_LST { Grm.Lst $2 }
  | L_OPN grm_atom R_OPN { Grm.Opn $2 }
  ;
grm_atom:
  | STG { Grm.Txt $1 }
  | name { Grm.Name $1 }
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
  | NAM def_arg  { Def_Abs ($1,snd $2) }
  | NAM def_arg def_coprd   {
    Def_CoPrd ($1,snd $2,$3) }
  | NAM def_arg def_prd  { Def_Prd ($1,snd $2,$3) }
  | FNT NAM ISO name_list { Def_Fnt ($2,$4) }
  | NAM def_arg EQ typ  { Def_EqT ($1,snd $2,$4) }
  ;
name_list:
  | NAM { [$1] }
  | NAM name_list { $1::$2 }
  ;
def_coprd:
  | COPRD NAM CLN typ { [($4,$2)] }
  | COPRD NAM CLN typ def_coprd  { ($4,$2)::$5 }
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
  | { U_Lb }
  | NAM LET typ typ_top_lb  { Cns_Lb($1,$3,$4) }
typs:
  | { [] }
  | typs typ { $1@[$2] }
  ;
typ:
  | L_PRN typ R_PRN { $2 }
  | L_RCD typ_top R_RCD { $2 }
  | L_RCD LB typ_top_lb R_RCD { Rcd_Lb $3 }
  | typ APP typ { Types.App($1,$3) }
  | typ PRJ typ { App(App(Prm Vct,$1),$3) }
  | L_OPN typ R_OPN { opn $2 }
  | L_LST typ R_LST { lst $2 }
  | VAL { Prm(EqT $1) }
  | name { Prm (Name $1) }
  | Z { zn (Prm Z_u) }
  | N { Prm N }
  | ROT rot_dsh { Var (newvar_q (-($2+2))) }
  | typ IMP typ  { Imp($1,$3) }
  | SGN { Prm Sgn }
  | TYP_STG { Prm Stg }
  ;
rot_dsh:
  | { 0 }
  | rot_dsh DSH { $1+1 }
  ;
glb_etr:
  | LCE glb_etr_clique { Ast.Etr_Clq  $2 }
  | LCE glb_etr_body_ir  { let (a,b,c,d) = $2 in Ast.Etr(a,b,c,d) }
  | LCE NAM CLN typ SRC typ {
    Ast.Etr_Abs($2,$4,$6) }
  ;
  | LCE NAM CLN typ SRC_OUT { Ast.Etr_Out_Abs($2,$4) }
glb_etr_clique:
  | SLF DOT glb_etr_body_ir { [$3] }
  | SLF DOT glb_etr_body_ir glb_etr_clique { [$3]@$4 }
  ;
glb_etr_body_ir:
  | NAM reg_ptn typ_def ir_lines { ($1,fst $3,snd $3,($2,ref $4)) }
  ;
ir_ret:
  | EOP reg_ptn { Ret $2 }
  | EOP_EXN reg { Exn $2 }
  ;
ir_lines:
  | ir_ret { $1 }
  | ir_line ir_lines { Seq($1,$2) }
  | MTC reg_ptn mtc_ir COPRD_END { Mtc($2,$3) }
  | MTC reg_ptn mtc_ir_end { Mtc($2,$3) }
  | name reg_ptn SRC_IL { IL_Glb_Call($1,$2) }
  ;
ir_line:
  | ROT reg_ptn SRC reg_ptn regs { IR_Id($2,[|$4|] |+| $5)  }
  | ARR exp INI_IR reg_ptn_src SRC reg_ptn  { IR_Exp($2,$4,$6) }
  | ARR exp reg_ptn_src SRC reg_ptn { IR_Exp($2,$3,$5) }
  | name reg_ptn SRC reg_ptn { IR_Glb_Call($1,$2,$4) }
  | APP reg CMM reg_ptn SRC reg_ptn {
     IR_Call(($2,$4),$6) }
  | OUT_IR reg reg_ptn SRC_OUT {
    IR_Out($2,$3) }
  | name reg_ptn SRC_OUT { IR_Glb_Out($1,$2) }
  ;
ir_ptn:
  | ir_ptn_atm { Rcd_Ptn.A $1 }
  | L_RCD ir_ptn_lst ir_ptn_op {
    match $3 with
    | None ->  Rcd_Ptn.R $2
    | Some r -> Rcd_Ptn.Ro ($2,r) }
  | L_RCD LB ir_ptn_lst_lb ir_ptn_op {
    match $4 with
    | None -> Rcd_Ptn.R_Lb $3
    | Some r -> Rcd_Ptn.Ro_Lb ($3,r) }
  (* | L_LST lst_list_ptn R_LST { $2 } *)
  ;
ir_ptn_op:
  | OP ir_ptn_atm R_RCD  { Some $2 }
  | R_RCD { None }
  ;
ir_ptn_lst:
  | { [||] }
  | ir_ptn ir_ptn_lst { [|$1|] |+| $2 }
  ;
ir_ptn_eq:
  | { [] }
  | CMM VAL EQ name APP ir_ptn ir_ptn_eq {
        let v = newvar () in
        Types.rm := ($2,v)::!Types.rm;
    (v,Mtc.Eq_Agl_N($4,$6))::$7
    }
  | CMM VAL EQ ir_ptn_cst ir_ptn_eq {
        let v = newvar () in
        Types.rm := ($2,v)::!Types.rm;
    (v,Mtc.P_Cst $4)::$5 }
  ;
ir_ptn_cst:
  | STG { Mtc.P_Stg $1 }
  | INT { Mtc.P_Z $1 }
  | R64 { Mtc.P_R64 $1 }
  | R2 { Mtc.P_R2 $1 }
  | name { Mtc.P_N $1 }
  ;
ir_ptn_atm:
  | WC {
    let v = newvar () in Types.rm := ("_",v)::!Types.rm; v}
  | VAL {
        let v = newvar () in
        Types.rm := ($1,v)::!Types.rm;
        v  }
  ;
lst_list_ptn:
  | { P_Agl_N("nil",Rcd_Ptn.R [||]) }
  | ir_ptn OP WC {
    let v = newvar () in rm := ("_",v)::!rm;
    P_Agl_N("cns",Rcd_Ptn.R [|$1;Rcd_Ptn.A(P_WC v)|]) }
  | ir_ptn OP VAL {
    let v = newvar () in rm := ($3,v)::!rm;
    P_Agl_N("cns",Rcd_Ptn.R [|$1;Rcd_Ptn.A(P_Reg v)|]) }
  | ir_ptn lst_list_ptn {
    P_Agl_N("cns",Rcd_Ptn.R [|$1;Rcd_Ptn.A $2|]) }
  ;
ir_ptn_lst_lb:
  | { [||] }
  | NAM LET ir_ptn ir_ptn_lst_lb { [|($1,$3)|] |+| $4 }
  ;
names:
  | {  }
  | NAM names {}
names_lb:
  | {}
  | lb_let names {}
ir_tkn:
  | INT  {}
  | NAM   {}
  ;
reg_src:
  | NAM {
     let v = newvar () in rm := ($1,v)::!rm; v }
  | REG {
      let v = newvar () in rm := ($1,v)::!rm; v }
  ;
reg_ptn_src:
  | WC { Rcd_Ptn.R [||] }
  | reg_src { Rcd_Ptn.A $1 }
  | L_RCD reg_ptn_lst_src reg_ptn_op_src {
    match $3 with
    | None ->  Rcd_Ptn.R $2
    | Some r -> Rcd_Ptn.Ro ($2,r) }
  | L_RCD LB reg_ptn_lst_lb_src reg_ptn_op_src {
    match $4 with
    | None -> Rcd_Ptn.R_Lb $3
    | Some r -> Rcd_Ptn.Ro_Lb ($3,r) }
  ;
reg_ptn_op_src:
  | OP reg_src R_RCD  { Some $2 }
  | R_RCD { None }
reg_ptn_lst_src:
  | { [||] }
  | reg_ptn_src reg_ptn_lst_src { [|$1|] |+| $2 }
  ;
reg_ptn_lst_lb_src:
  | { [||] }
  | NAM LET reg_ptn_src reg_ptn_lst_lb_src { [|($1,$3)|] |+| $4 }
  ;
reg:
  | WC { let v = newvar () in rm := ("_",v)::!rm; v}
  | NAM {
     let v = newvar () in rm := ($1,v)::!rm; v }
  | REG { let v = newvar () in rm := ($1,v)::!rm; v }
  ;
reg_ptn:
  | reg { Rcd_Ptn.A $1 }
  | L_RCD reg_ptn_lst reg_ptn_op {
    match $3 with
    | None ->  Rcd_Ptn.R $2
    | Some r -> Rcd_Ptn.Ro ($2,r) }
  | L_RCD LB reg_ptn_lst_lb reg_ptn_op {
    match $4 with
    | None -> Rcd_Ptn.R_Lb $3
    | Some r -> Rcd_Ptn.Ro_Lb ($3,r) }
  ;
reg_ptn_op:
  | OP reg R_RCD  { Some $2 }
  | R_RCD { None }
reg_ptn_lst:
  | { [||] }
  | reg_ptn reg_ptn_lst { [|$1|] |+| $2 }
  ;
reg_ptn_lst_lb:
  | { [||] }
  | NAM LET reg_ptn reg_ptn_lst_lb { [|($1,$3)|] |+| $4 }
  ;
lb_let:
  | NAM LET NAM {}
  ;
mtc_ir:
  | COPRD_PTN ir_ptn ir_ptn_eq MTC_IR ir_lines { [|(($2,$3),$5)|] }
  | COPRD_PTN ir_ptn ir_ptn_eq MTC_IR ir_lines mtc_ir {[|(($2,$3),$5)|] |+| $6 }
  ;
mtc_ir_end:
  | COPRD_PTN_END ir_ptn ir_ptn_eq MTC_IR ir_lines { [|(($2,$3),$5)|] }
  | COPRD_PTN ir_ptn ir_ptn_eq MTC_IR ir_lines mtc_ir_end {[|(($2,$3),$5)|] |+| $6 }
  ;
coprd_ir:
  | COPRD reg_ptn ir_lines { [|($2,$3)|] }
  | COPRD reg_ptn ir_lines coprd_ir { [|($2,$3)|] |+| $4 }
  ;
regs:
  | { [||] }
  | CMM reg_ptn regs { [|$2|] |+| $3 }
  ;
typ_def:
  | { (Var (newvar()),Var (newvar())) }
  | CLN typ SRC typ SPL { ($2,$4) }
  ;
exp_top:
  | exp_lst { Rcd (Array.of_list $1) }
  | LB exp_lst_lb { Rcd_Lb(None,Array.of_list $2) }
  | DOT LB exp_lst_lb { Rcd_Lb(Some Rot,Array.of_list $3) }
  | EXP exp { $2 }
  ;
exp_lst:
  | { [] }
  | exp_lst exp  { $1@[$2] }
  ;
exp_lst_lb:
  | { [] }
  | exp_lst_lb NAM LET exp { $1@[($2,Some $4)] }
  | exp_lst_lb NAM RM { $1@[($2,None)] }
exp:
  | INT { Atm(Z $1) }
  | ROT { Rot }
  | IDX { Prj(Rot,Rcd_Ptn.Idx($1,Rcd_Ptn.End)) }
  | VAL { Prj(Rot,Rcd_Ptn.Lb($1,Rcd_Ptn.End)) }
  | VCT_INI { App(Atm (Name ([],"#")),Rcd [||])  }
  | exp VCT exp { App(Atm (Name ([],"⊵")),Rcd [|$1;$3|]) }
  | name  { Atm (Name $1) }
  | STG { Atm (Stg $1) }
  | L_PRN exp R_PRN { $2 }
  | R64 { Atm(R64 $1) }
  | R2 { Atm(R2 $1) }
  | exp APP exp { App($1,$3) }
  | exp PRJ INT { Prj($1,Rcd_Ptn.Idx($3,Rcd_Ptn.End)) }
  | exp PRJ NAM { Prj($1,Rcd_Ptn.Lb($3,Rcd_Ptn.End)) }
  | L_RCD exp_lst R_RCD { Rcd (Array.of_list $2) }
  | L_RCD exp_lst OP exp R_RCD { Rcd (Array.of_list $2) }
  | L_RCD LB exp_lst_lb R_RCD { Rcd_Lb (None,Array.of_list $3) }
  | L_RCD LB exp_lst_lb OP exp R_RCD { Rcd_Lb (Some $5,Array.of_list $3) }
  | L_OPN R_OPN { App(Atm(Name ([],"none")),Rcd [||]) }
  | L_OPN exp R_OPN { App(Atm (Name ([],"some")),$2) }
  | L_LST lst_list R_LST { $2 }
  ;
lst_list:
  | { App(Atm (Name ([],"nil")),Rcd [||]) }
  | exp lst_list { App(Atm (Name ([],"cns")),Rcd [|$1;$2|]) }
  ;
