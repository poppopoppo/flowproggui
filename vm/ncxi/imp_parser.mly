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
%token MCR PLS MLT EOF CMM LET TYP_STG TYP_SGN TYP_VCT TYP_OPN_VCT IMP ORD_LEX_COPRD_END
%token DEQ FNT EXN WC PLS_NAT MNS_NAT MLT_NAT L_VCT L_LST_PLS DSH COPRD_PTN MTC
%token NOT_SPL DTA_GRM ORD_LEX_COPRD ORD_COPRD GRM NOT AGL_TOP AGL_COD DOT_END
%token S8_STT S8_END S8_E S8_P MDL_EOP LCE_EQ LCE_EXEC ENV SYNT_COPRD BYTE SCL
%token ORD_LINE_COPRD ORD_LINE_COPRD_END CUT
%token <string> NAM STG VAL REG PRM LINE
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
%start file_top
%start name_eof
%type <Lang.name> name_eof
%type <Lang.Ast.abs_name> name
%type <Lang.Ast.mdl list> file
%type <Lang.Ast.glb_etr list> file_top
%type <Lang.Ast.line> buffer
%type <Lang.Ast.grm> dta_grm
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
  | NAM { (EndN $1) }
  | PRM { EndN $1 }
  | NAM DOT name { DotN($1,$3) }
  | PRM DOT name { DotN($1,$3) }
  ;
file:
  | EOF { [] }
(*  | LCE WC EQ name EOF { (Some $4,[]) } *)
  | def_mdl file {
    let ms = $2 in
    $1::ms }
  ;
file_top:
  | gl_etr_lst EOF { $1 }
  ;
def_mdl:
  | MDL NAM gl_etr_lst mdl_end { ($2,$3) }
  ;
mdl_end:
  | MDL_END {}
  | MDL_EOP {}
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
pvt:
  | EXP { true }
  | { false }
  ;
mdl_etr:
  | glb_etr { $1 }
  | def_typ { $1 }
  | def_mdl {
    let (n,el) = $1 in Mdl (n,el) }
  | MDL NAM EQ name { Mdl_Eq($2,$4) }
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
  | SLF DOT NAM grm_ord_act {
    Lang.Grm.Act($3,$4)
  }
  | SLF DOT NAM grm_ord {
    Lang.Grm.Cnc($3,$4) }
  ;
grm_ord_act:
  | grm_rule_act_end { [$1] }
  | grm_rule_act grm_ord_act { $1::$2 }
  ;
grm_rule_act:
  | ord grm_ptns grm_prd SCL SRC reg_ptn_src ir_lines grm_ord_act {
    Grm.Act_Seq(($6,ref $7),$1,$2,$3,$8)
  }
  | ord grm_ptns grm_prd SRC reg_ptn_src ir_lines {
    Grm.Act_End(($5,ref $6),$1,$2,$3)
   }
  ;
grm_rule_act_end:
  | ord_end grm_ptns grm_prd SCL SRC reg_ptn_src ir_lines grm_ord_act {
    Grm.Act_Seq(($6,ref $7),$1,$2,$3,$8)
  }
  | ord_end grm_ptns grm_prd SRC reg_ptn_src ir_lines {
    Grm.Act_End(($5,ref $6),$1,$2,$3)
 }
  ;
grm_rule_act_seq:
  | { None }
  | SCL grm_ord_act { Some $2 }
  ;
grm_act:
  | SRC reg_ptn_src ir_lines { ($2,ref $3) }
  ;
grm_ord:
  | grm_rule_end { [$1] }
  | grm_rule grm_ord { $1::$2 }
grm_rule:
  | ord NAM CLN grm_ptns grm_prd grm_rule_seq {
    match $6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN $2,$1,$4,$5,e)
    | None -> Grm.Cnc_End(Grm.CN $2,$1,$4,$5) }
    ;
  | ord grm_ptns grm_prd grm_rule_seq {
    match $4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,$1,$2,$3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,$1,$2,$3) }
  ;
grm_cn:
  | { Grm.CN_A }
  | NAM CLN { Grm.CN $1 }
  ;
grm_rule_seq:
  | { None }
  | SCL grm_ord { Some $2 }
  ;
grm_rule_end:
  | ord_end grm_ptns grm_prd grm_rule_seq {
    match $4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,$1,$2,$3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,$1,$2,$3) }
    ;
  | ord_end NAM CLN grm_ptns grm_prd grm_rule_seq {
    match $6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN $2,$1,$4,$5,e)
    | None -> Grm.Cnc_End(Grm.CN $2,$1,$4,$5) }
  ;
ord:
  | COPRD { Grm.Lex }
  | ORD_LEX_COPRD { Grm.Synt }
  | SYNT_COPRD { Grm.Synt }
  | ORD_LINE_COPRD { Grm.Line }
  ;
ord_end:
  | COPRD_END { Grm.Lex }
  | ORD_LEX_COPRD_END { Grm.Synt }
  | ORD_LINE_COPRD_END { Grm.Line }
  ;
grm_ptns:
  | { [] }
  | grm_ptn grm_ptns { $1::$2 }
  | grm_ptn EXP grm_ptns { $1::$3 }
  ;
grm_ptn:
  | grm_atom { Grm.Atm $1 }
  | L_LST grm_atom R_LST { Grm.Lst $2 }
  | L_OPN grm_atom R_OPN { Grm.Opn $2 }
  ;
grm_atom:
  | STG { Grm.Txt $1 }
  | name { Grm.Name $1 }
  | MLT { Grm.Name(EndN "_byt") }
  | BYTE { Grm.Name(EndN "_byt") }
  ;
grm_prd:
  | { None }
  | CUT grm_ptns { Some $2 }
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
  | PRD NAM CLN typ  { [($4,$2)] }
  | PRD NAM CLN typ def_prd  { ($4,$2)::$5 }
  ;
(*
typ_top_lb:
  | { U_Lb }
  | NAM LET typ typ_top_lb  { Cns_Lb($1,$3,$4) }
*)
typs:
  | { [] }
  | typs typ { $1@[$2] }
  ;
typ:
  | L_PRN typ R_PRN { $2 }
  | L_RCD typs R_RCD { Rcd(rcd_cl $2) }
  (*| L_RCD LB typ_top_lb R_RCD { Rcd_Lb $3 } *)
  | typ APP typ { Types.App($1,$3) }
(*  | typ PRJ typ { App(App(Prm Vct,$1),$3) } *)
(*  | L_OPN typ R_OPN { opn $2 }
  | L_LST typ R_LST { Types.lst $2 } *)
  | VAL { Var(ref(N_Ln (EndN $1,Axm Lang.Types.Axm.v))) }
  | name { Var(ref(N $1)) }
(*  | Z { zn (Lang.Types.Axm.z_u) } *)
  | N { Axm Lang.Types.Axm.nat }
  | ROT rot_dsh { Var (newvar_q (-($2+2))) }
  | typ IMP typ  { Imp($1,$3) }
  | SGN { Axm Lang.Types.Axm.sgn_p }
  | TYP_STG { Axm Lang.Types.Axm.stg }
  ;
rot_dsh:
  | { 0 }
  | rot_dsh DSH { $1+1 }
  ;
glb_etr:
  | LCE EXP NAM DOT WC { Mdl_Ln(false,$3) }
  | LCE NAM DOT WC { Mdl_Ln(true,$2) }
  | LCE glb_etr_clique { Ast.Etr_Clq  $2 }
  | LCE glb_etr_body_ir  { let (a,b,c,d) = $2 in Ast.Etr(a,b,c,d) }
  | LCE NAM CLN typ SRC typ {
    Ast.Etr_Abs($2,$4,$6) }
  | LCE NAM CLN typ SRC_OUT { Ast.Etr_Out_Abs($2,$4) }
  | LCE NAM EQ eq_def { Ast.Etr_Eq($2,$4) }
  | LCE NAM ARR_REV ir_lines { Ast.Etr_Glb($2,ref $4) }
  ;
eq_def:
  | name { EqLn $1 }
  | STG { Cst(Cst.S8 $1) }
  | R64 { Cst(Cst.R64 $1) }
  | IDX { SttArg $1 }
  | ENV STG { ExStg $2 }
  | ENV IDX { ExStgArg $2 }
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
(*  | MTC reg_ptn mtc_ir COPRD_END { Mtc($2,$3) } *)
  | mtc_ir_end { Mtc($1) }
  | name reg_ptn SRC_IL { IL_Glb_Call(ref(Ast.Stt_Name $1),$2) }
  ;
ir_line:
  | ROT reg_ptn SRC reg_ptn regs { IR_Id(ref(IR_Id_C($2,[|$4|] |+| $5)))  }
  | ARR exp INI_IR reg_ptn_src SRC reg_ptn  { IR_Exp($2,$4,$6) }
  | ARR exp reg_ptn_src SRC reg_ptn { IR_Exp($2,$3,$5) }
  | ARR S8_E WC SRC reg s8_ptn S8_P {
    IR_S8(ref(IR_S8_C($6,[||],[|$5|]))) }
  | ARR S8_E src_par_p (*S8_STT*) s8_ptn S8_P {
      let (l0,l1) = $3 in
      IR_S8(ref(IR_S8_C($4,l0,l1))) }
  | name reg_ptn SRC reg_ptn { IR_Glb_Call(ref(Ast.Stt_Name $1),$2,$4) }
  | APP reg CMM reg_ptn SRC reg_ptn {
     IR_Glb_Call(ref(Lang.Ast.Stt_Axm Lang.Ast.Axm._app),RP.R [|RP.A $2;$4|],$6) }
  | OUT_IR reg reg_ptn SRC_OUT {
    IR_Out($2,$3) }
  | name reg_ptn SRC_OUT { IR_Glb_Out(ref(Ast.Stt_Name $1),$2) }
  ;
src_par_p:
  | reg_dst SRC reg CMM reg { ([|$1|],[|$3;$5|]) }
  | reg_dst CMM src_par_p CMM reg {
      let (l0,l1) = $3 in
      ([|$1|] |+| l0,l1 |+| [|$5|]) }
  ;
s8_ptn:
  | { [] }
  | LINE s8_ptn { (S8_Txt $1)::$2 }
  | STG s8_ptn { (S8_Txt $1)::$2 }
  | IDX s8_ptn { (S8_Var $1)::$2 }
  | name s8_ptn { (S8_Name(ref(Ast.Stt_Name $1)))::$2 }
  | IDX MLT STG s8_ptn { (S8_For_Txt($1,$3))::$4 }
  ;
ir_ptn:
  | ir_ptn_atm { Rcd_Ptn.A $1 }
  | L_RCD ir_ptn_lst ir_ptn_op {
    match $3 with
    | None ->  Rcd_Ptn.R $2
    | Some _ -> err "ir_ptn 0" (* Rcd_Ptn.Ro ($2,r) *) }
(*  | L_RCD LB ir_ptn_lst_lb ir_ptn_op {
    match $4 with
    | None -> Rcd_Ptn.R_Lb $3
    | Some r -> Rcd_Ptn.Ro_Lb ($3,r) } *)
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
  | mtc_ir_suc { [] }
  | mtc_ir_test mtc_ir_tail { $1::$2 }
  ;
mtc_ir_tail:
  | mtc_ir_suc { [] }
  | SCL mtc_ir_test mtc_ir_tail { $2::$3 }
  ;
mtc_ir_test:
  | NAM SRC name APP reg_ptn {
    (ref(R_N $1),ref(Eq_Agl_N(ref(Ast.Stt_Name $3),$5)))
    }
  | VAL EQ ir_ptn_cst {
    (ref(R_N $1),ref(P_Cst $3)) }
  | VAL EQ VAL {
    (ref(R_N $1),ref(Eq_V(ref(R_N $3)))) }
  ;
ir_ptn_cst:
  | STG { P_Stg $1 }
  | INT { P_Z $1 }
  | R64 { P_R64 $1 }
  | R2 { P_R2 $1 }
  | name { P_N(ref(Ast.Stt_Name $1)) }
  ;
ir_ptn_atm:
  | WC { ref(R_Ax(R_WC (sgn ()))) }
  | VAL { ref(R_N($1)) }
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
  | NAM { ref(R_N $1) }
  | REG { ref(R_N $1) }
  ;
reg_ptn_src:
  | WC { Rcd_Ptn.R [||] }
  | reg_src { Rcd_Ptn.A $1 }
  | L_RCD reg_ptn_lst_src reg_ptn_op_src {
    match $3 with
    | None ->  Rcd_Ptn.R $2
    | Some _ -> err "reg_ptn_src 0" (* Rcd_Ptn.Ro ($2,r)*) }
(*  | L_RCD LB reg_ptn_lst_lb_src reg_ptn_op_src {
    match $4 with
    | None -> Rcd_Ptn.R_Lb $3
    | Some r -> Rcd_Ptn.Ro_Lb ($3,r) } *)
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
  | WC { ref(R_Ax(R_WC (sgn ()))) }
  | reg_dst { $1 }
  ;
reg_dst:
  | NAM { ref(R_N $1) }
  | REG { ref(R_N $1) }
  ;
reg_ptn:
  | reg { Rcd_Ptn.A $1 }
  | L_RCD reg_ptn_lst reg_ptn_op {
    match $3 with
    | None ->  Rcd_Ptn.R $2
    | Some _ -> err "reg_ptn 0" (* Rcd_Ptn.Ro ($2,r)  *) }
  (*)| L_RCD LB reg_ptn_lst_lb reg_ptn_op {
    match $4 with
    | None -> Rcd_Ptn.R_Lb $3
    | Some r -> Rcd_Ptn.Ro_Lb ($3,r) } *)
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
  (*
mtc_ir:
  | COPRD_PTN ir_ptn ir_ptn_eq SRC ir_lines { [|(($2,$3,None),$5)|] }
  | COPRD_PTN ir_ptn ir_ptn_eq SRC ir_lines mtc_ir {[|(($2,$3,None),$5)|] |+| $6 }
  ;
  *)
mtc_ir_end:
  | coprd_ptn_end ir_ptn_eq ir_lines { [|(($2,None),$3)|] }
  | coprd_ptn ir_ptn_eq ir_lines mtc_ir_end {[|(($2,None),$3)|] |+| $4 }
  ;
mtc_ir_suc:
  (*| SRC {} *)
  | SPL {}
  | DOT_END {}
  ;
coprd_ptn:
  | COPRD_PTN {}
  | COPRD {}
  ;
coprd_ptn_end:
  | COPRD_PTN_END {}
  | COPRD_END {}
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
(* | LB exp_lst_lb { Rcd_Lb(None,Array.of_list $2) }
  | DOT LB exp_lst_lb { Rcd_Lb(Some Rot,Array.of_list $3) } *)
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
(*  | INT { Atm(Z $1) } *)
(*  | ROT { Rot } *)
(*  | IDX { Prj(Rot,Rcd_Ptn.Idx($1,Rcd_Ptn.End)) }
  | VAL { Prj(Rot,Rcd_Ptn.Lb($1,Rcd_Ptn.End)) } *)
(*  | VCT_INI { App(Atm (Name ([],"#")),Rcd [||])  } *)
(*  | exp VCT exp { App(Atm (Name ([],"⊵")),Rcd [|$1;$3|]) } *)
  | name  { Name(ref(Ast.Stt_Name $1)) }
  | STG { ExpCst(Cst.S8 $1) }
  | L_PRN exp R_PRN { $2 }
  | R64 { ExpCst(Cst.R64 $1) }
(*  | R2 { ExpCst(Cst.R2 $1) } *)
  | exp APP exp { App($1,$3) }
  (*| exp PRJ INT { Prj($1,Rcd_Ptn.Idx($3,Rcd_Ptn.End)) }
  | exp PRJ NAM { Prj($1,Rcd_Ptn.Lb($3,Rcd_Ptn.End)) } *)
  | L_RCD exp_lst R_RCD { Rcd (Array.of_list $2) }
  (*| L_RCD exp_lst OP exp R_RCD { Rcd (Array.of_list $2) }
  | L_RCD LB exp_lst_lb R_RCD { Rcd_Lb (None,Array.of_list $3) }
  | L_RCD LB exp_lst_lb OP exp R_RCD { Rcd_Lb (Some $5,Array.of_list $3) } *)
  | L_OPN R_OPN { App(Name(ref(Stt_Axm Ast.Axm._none)),Rcd [||]) }
  | L_OPN exp R_OPN { App(Name(ref(Stt_Axm Ast.Axm._some)),$2) }
  | L_LST lst_list R_LST { $2 }
  ;
lst_list:
  | { App(Name(ref(Stt_Axm Ast.Axm._nil)),Rcd [||]) }
  | exp lst_list { App(Name(ref(Stt_Axm Ast.Axm._cns)),Rcd [|$1;$2|]) }
  ;
