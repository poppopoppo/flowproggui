
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | WC
    | VCT_INI
    | VCT
    | VAL of (
# 17 "imp_parser.mly"
       (string)
# 15 "imp_parser.ml"
  )
    | TYP_VCT
    | TYP_STG
    | TYP_SGN
    | TYP_OPN_VCT
    | SYNT_COPRD
    | STG of (
# 17 "imp_parser.mly"
       (string)
# 25 "imp_parser.ml"
  )
    | SRC_OUT
    | SRC_IL
    | SRC
    | SPL
    | SLH
    | SLF of (
# 18 "imp_parser.mly"
       (int)
# 35 "imp_parser.ml"
  )
    | SGN
    | SEQ
    | SCL
    | S8_STT
    | S8_P
    | S8_END
    | S8_E
    | R_RCD
    | R_PRN
    | R_OPN
    | R_LST
    | R_BLK
    | ROT of (
# 18 "imp_parser.mly"
       (int)
# 52 "imp_parser.ml"
  )
    | RM
    | REG of (
# 17 "imp_parser.mly"
       (string)
# 58 "imp_parser.ml"
  )
    | R64 of (
# 19 "imp_parser.mly"
       (int64)
# 63 "imp_parser.ml"
  )
    | R2 of (
# 20 "imp_parser.mly"
       (bool)
# 68 "imp_parser.ml"
  )
    | PRM of (
# 17 "imp_parser.mly"
       (string)
# 73 "imp_parser.ml"
  )
    | PRJ_IR
    | PRJ
    | PRD_END
    | PRD
    | PLS_NAT
    | PLS
    | OUT_IR
    | OUT of (
# 18 "imp_parser.mly"
       (int)
# 85 "imp_parser.ml"
  )
    | ORD_LEX_COPRD_END
    | ORD_LEX_COPRD
    | ORD_COPRD
    | OP
    | NOT_SPL
    | NOT
    | NL
    | NAT of (
# 18 "imp_parser.mly"
       (int)
# 97 "imp_parser.ml"
  )
    | NAM of (
# 17 "imp_parser.mly"
       (string)
# 102 "imp_parser.ml"
  )
    | N
    | MTC_IR
    | MTC
    | MNS_NAT
    | MNS
    | MLT_NAT
    | MLT
    | MDL_EOP
    | MDL_END
    | MDL
    | MCR
    | L_VCT
    | L_RCD
    | L_PRN
    | L_OPN
    | L_LST_PLS
    | L_LST
    | L_BLK
    | LINE of (
# 17 "imp_parser.mly"
       (string)
# 125 "imp_parser.ml"
  )
    | LET
    | LCE_IR
    | LCE_EXEC
    | LCE_EQ
    | LCE
    | LB
    | ISO
    | IO
    | INT of (
# 18 "imp_parser.mly"
       (int)
# 138 "imp_parser.ml"
  )
    | INJ of (
# 18 "imp_parser.mly"
       (int)
# 143 "imp_parser.ml"
  )
    | INI_IR
    | IN of (
# 18 "imp_parser.mly"
       (int)
# 149 "imp_parser.ml"
  )
    | IMP
    | IDX of (
# 18 "imp_parser.mly"
       (int)
# 155 "imp_parser.ml"
  )
    | GRM
    | FOR_ALL
    | FNT
    | EXP
    | EXN
    | EQ
    | EOP_OUT
    | EOP_EXN
    | EOP
    | EOF
    | ENV
    | DTA_GRM
    | DTA
    | DSH
    | DOT_END
    | DOT
    | DEQ
    | DEF
    | CST
    | COPRD_PTN_END
    | COPRD_PTN
    | COPRD_END
    | COPRD
    | CNS_IR
    | CMM
    | CLN2
    | CLN
    | CHO of (
# 18 "imp_parser.mly"
       (int)
# 187 "imp_parser.ml"
  )
    | BYTE
    | ARR_REV_IN
    | ARR_REV
    | ARR_END
    | ARR
    | APP
    | AGL_TOP
    | AGL_OP of (
# 18 "imp_parser.mly"
       (int)
# 199 "imp_parser.ml"
  )
    | AGL_COD
    | AGL
    | ACT
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState362
  | MenhirState358
  | MenhirState356
  | MenhirState343
  | MenhirState338
  | MenhirState335
  | MenhirState334
  | MenhirState328
  | MenhirState327
  | MenhirState324
  | MenhirState323
  | MenhirState321
  | MenhirState320
  | MenhirState317
  | MenhirState313
  | MenhirState311
  | MenhirState309
  | MenhirState307
  | MenhirState305
  | MenhirState302
  | MenhirState298
  | MenhirState297
  | MenhirState296
  | MenhirState292
  | MenhirState289
  | MenhirState288
  | MenhirState287
  | MenhirState286
  | MenhirState285
  | MenhirState284
  | MenhirState283
  | MenhirState282
  | MenhirState281
  | MenhirState279
  | MenhirState278
  | MenhirState277
  | MenhirState276
  | MenhirState272
  | MenhirState269
  | MenhirState268
  | MenhirState266
  | MenhirState265
  | MenhirState264
  | MenhirState262
  | MenhirState260
  | MenhirState259
  | MenhirState258
  | MenhirState257
  | MenhirState256
  | MenhirState252
  | MenhirState251
  | MenhirState249
  | MenhirState246
  | MenhirState243
  | MenhirState238
  | MenhirState236
  | MenhirState233
  | MenhirState227
  | MenhirState224
  | MenhirState216
  | MenhirState215
  | MenhirState214
  | MenhirState212
  | MenhirState211
  | MenhirState200
  | MenhirState199
  | MenhirState197
  | MenhirState195
  | MenhirState194
  | MenhirState193
  | MenhirState191
  | MenhirState186
  | MenhirState185
  | MenhirState184
  | MenhirState181
  | MenhirState179
  | MenhirState170
  | MenhirState168
  | MenhirState166
  | MenhirState161
  | MenhirState157
  | MenhirState155
  | MenhirState153
  | MenhirState151
  | MenhirState149
  | MenhirState146
  | MenhirState144
  | MenhirState140
  | MenhirState136
  | MenhirState134
  | MenhirState130
  | MenhirState128
  | MenhirState126
  | MenhirState124
  | MenhirState122
  | MenhirState118
  | MenhirState112
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState107
  | MenhirState106
  | MenhirState104
  | MenhirState103
  | MenhirState97
  | MenhirState95
  | MenhirState92
  | MenhirState91
  | MenhirState88
  | MenhirState87
  | MenhirState86
  | MenhirState85
  | MenhirState83
  | MenhirState82
  | MenhirState80
  | MenhirState79
  | MenhirState78
  | MenhirState77
  | MenhirState76
  | MenhirState75
  | MenhirState73
  | MenhirState72
  | MenhirState70
  | MenhirState69
  | MenhirState67
  | MenhirState58
  | MenhirState54
  | MenhirState49
  | MenhirState46
  | MenhirState42
  | MenhirState41
  | MenhirState39
  | MenhirState38
  | MenhirState36
  | MenhirState34
  | MenhirState29
  | MenhirState28
  | MenhirState26
  | MenhirState24
  | MenhirState21
  | MenhirState20
  | MenhirState16
  | MenhirState14
  | MenhirState13
  | MenhirState11
  | MenhirState10
  | MenhirState7
  | MenhirState5
  | MenhirState1
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Lang
  open Types
  open Ast
  open Util

# 378 "imp_parser.ml"

let rec _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState272 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1357 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1355 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 161 "imp_parser.mly"
                     ( _1::_2 )
# 396 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1356)) : 'freshtv1358)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1361 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1359 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_rule_seq = 
# 179 "imp_parser.mly"
                ( Some _2 )
# 413 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1360)) : 'freshtv1362)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1365 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 421 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 425 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1363 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 433 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 437 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 444 "imp_parser.ml"
        ))), (_3 : (
# 17 "imp_parser.mly"
       (string)
# 448 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 133 "imp_parser.mly"
                        (
    Lang.Grm.Cnc(_3,_4) )
# 455 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1364)) : 'freshtv1366)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1343 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1341 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 127 "imp_parser.mly"
                    ( _1::_2 )
# 477 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1342)) : 'freshtv1344)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1353 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1351 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 41 "imp_parser.mly"
      (Lang.Ast.grm)
# 494 "imp_parser.ml"
        ) = 
# 123 "imp_parser.mly"
                    ( _2 )
# 498 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1349) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 41 "imp_parser.mly"
      (Lang.Ast.grm)
# 506 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1347) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 41 "imp_parser.mly"
      (Lang.Ast.grm)
# 514 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1345) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 41 "imp_parser.mly"
      (Lang.Ast.grm)
# 522 "imp_parser.ml"
        )) : (
# 41 "imp_parser.mly"
      (Lang.Ast.grm)
# 526 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 119 "imp_parser.mly"
            ( Gram _1 )
# 531 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1346)) : 'freshtv1348)) : 'freshtv1350)) : 'freshtv1352)) : 'freshtv1354)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_rule : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1339 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState272
    | COPRD_END ->
        _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState272
    | ORD_LEX_COPRD ->
        _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState272
    | ORD_LEX_COPRD_END ->
        _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState272
    | SYNT_COPRD ->
        _menhir_run228 _menhir_env (Obj.magic _menhir_stack) MenhirState272
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState272) : 'freshtv1340)

and _menhir_goto_grm_rule_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1337) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1335) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_end) : 'tv_grm_rule_end) = _v in
    ((let _v : 'tv_grm_ord = 
# 160 "imp_parser.mly"
                 ( [_1] )
# 573 "imp_parser.ml"
     in
    _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1336)) : 'freshtv1338)

and _menhir_goto_grm_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1333 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState302 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1331 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 126 "imp_parser.mly"
            ( [_1] )
# 594 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1332)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState302) : 'freshtv1334)

and _menhir_goto_grm_rule_seq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_seq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState277 | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1317 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1315 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule_end = 
# 182 "imp_parser.mly"
                                          (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2) )
# 621 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1316)) : 'freshtv1318)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1321 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 629 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1319 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 637 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 644 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule = 
# 163 "imp_parser.mly"
                                              (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4) )
# 653 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1320)) : 'freshtv1322)
    | MenhirState298 | MenhirState269 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1325 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1323 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule = 
# 168 "imp_parser.mly"
                                      (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2) )
# 672 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1324)) : 'freshtv1326)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1329 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 680 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1327 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 688 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 695 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule_end = 
# 187 "imp_parser.mly"
                                                  (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4) )
# 704 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1328)) : 'freshtv1330)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1305 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1303 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule_act)) = _menhir_stack in
        let _v : 'tv_grm_ord_act = 
# 138 "imp_parser.mly"
                             ( _1::_2 )
# 726 "imp_parser.ml"
         in
        _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1304)) : 'freshtv1306)
    | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1309 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1307 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_rule_act_seq = 
# 154 "imp_parser.mly"
                    ( Some _2 )
# 743 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1308)) : 'freshtv1310)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1313 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 751 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 755 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1311 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 763 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 767 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 774 "imp_parser.ml"
        ))), (_3 : (
# 17 "imp_parser.mly"
       (string)
# 778 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 130 "imp_parser.mly"
                            (
    Lang.Grm.Act(_3,_4)
  )
# 786 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1312)) : 'freshtv1314)
    | _ ->
        _menhir_fail ()

and _menhir_run278 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState278
    | NAM _v ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
    | REG _v ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
    | WC ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState278
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState278

and _menhir_reduce98 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_rule_seq = 
# 178 "imp_parser.mly"
    ( None )
# 816 "imp_parser.ml"
     in
    _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v

and _menhir_run257 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | COPRD_END ->
        _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | ORD_LEX_COPRD ->
        _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | ORD_LEX_COPRD_END ->
        _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | SYNT_COPRD ->
        _menhir_run228 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1301 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState249
    | L_LST ->
        _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState249
    | L_OPN ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState249
    | MLT ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState249
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _v
    | STG _v ->
        _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState249 _v
    | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
        _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState249
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState249) : 'freshtv1302)

and _menhir_goto_grm_rule_act_seq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_act_seq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1289 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state * 'tv_grm_act) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_act_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1287 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state * 'tv_grm_act) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_grm_rule_act_seq) : 'tv_grm_rule_act_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _, (_4 : 'tv_grm_act)) = _menhir_stack in
        let _v : 'tv_grm_rule_act = 
# 141 "imp_parser.mly"
                                                  (
    match _5 with
    | Some e -> Grm.Act_Seq(_4,_1,_2,e)
    | None -> Grm.Act_End(_4,_1,_2) )
# 889 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1285) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_act) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1283 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | COPRD_END ->
            _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | ORD_LEX_COPRD ->
            _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | ORD_LEX_COPRD_END ->
            _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | SYNT_COPRD ->
            _menhir_run228 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState292) : 'freshtv1284)) : 'freshtv1286)) : 'freshtv1288)) : 'freshtv1290)
    | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1299 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state * 'tv_grm_act) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_act_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1297 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state * 'tv_grm_act) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_grm_rule_act_seq) : 'tv_grm_rule_act_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _, (_4 : 'tv_grm_act)) = _menhir_stack in
        let _v : 'tv_grm_rule_act_end = 
# 147 "imp_parser.mly"
                                                      (
    match _5 with
    | Some e -> Grm.Act_Seq(_4,_1,_2,e)
    | None -> Grm.Act_End(_4,_1,_2) )
# 931 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1295) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_act_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1293) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_act_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1291) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule_act_end) : 'tv_grm_rule_act_end) = _v in
        ((let _v : 'tv_grm_ord_act = 
# 137 "imp_parser.mly"
                     ( [_1] )
# 948 "imp_parser.ml"
         in
        _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1292)) : 'freshtv1294)) : 'freshtv1296)) : 'freshtv1298)) : 'freshtv1300)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1267 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 963 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SLF _ | SYNT_COPRD ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState256) : 'freshtv1268)
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1269 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SLF _ | SYNT_COPRD ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState260) : 'freshtv1270)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1271 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 995 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SYNT_COPRD ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266) : 'freshtv1272)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1273 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SYNT_COPRD ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState269) : 'freshtv1274)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1275 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState277
        | SRC ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState277
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState277
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState277) : 'freshtv1276)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1277 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState285) : 'freshtv1278)
    | MenhirState287 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1279 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState288
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState288) : 'freshtv1280)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1281 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState298
        | SRC ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState298
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SYNT_COPRD ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState298
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState298) : 'freshtv1282)
    | _ ->
        _menhir_fail ()

and _menhir_reduce82 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_prd = 
# 218 "imp_parser.mly"
    ( None )
# 1086 "imp_parser.ml"
     in
    _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run247 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1265) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_prd_flg = 
# 222 "imp_parser.mly"
        ( Peg.And )
# 1100 "imp_parser.ml"
     in
    _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1266)

and _menhir_run248 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1263) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_prd_flg = 
# 223 "imp_parser.mly"
            ( Peg.Not )
# 1114 "imp_parser.ml"
     in
    _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1264)

and _menhir_reduce94 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_rule_act_seq = 
# 153 "imp_parser.mly"
    ( None )
# 1123 "imp_parser.ml"
     in
    _menhir_goto_grm_rule_act_seq _menhir_env _menhir_stack _menhir_s _v

and _menhir_run282 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | COPRD_END ->
        _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | ORD_LEX_COPRD ->
        _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | ORD_LEX_COPRD_END ->
        _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | SYNT_COPRD ->
        _menhir_run228 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState282

and _menhir_goto_mtc_ir_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState279 | MenhirState216 | MenhirState194 | MenhirState191 | MenhirState166 | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1257) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1255) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let _v : 'tv_ir_lines = 
# 312 "imp_parser.mly"
               ( Mtc(_1) )
# 1163 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1256)) : 'freshtv1258)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1261 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1259 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 483 "imp_parser.mly"
                                            ([|((_2,None),_3)|] |+| _4 )
# 1179 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1260)) : 'freshtv1262)
    | _ ->
        _menhir_fail ()

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1249 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 1193 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1247 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 1201 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 1208 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 299 "imp_parser.mly"
                                           ( [_3]@_4 )
# 1214 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1248)) : 'freshtv1250)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1253 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1251 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 282 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 1231 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1252)) : 'freshtv1254)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1241 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1239 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_regs) : 'tv_regs) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 504 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 1254 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1240)) : 'freshtv1242)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1245 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 1262 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1243 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 1270 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_regs) : 'tv_regs) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 1277 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 316 "imp_parser.mly"
                                 ( IR_Id(ref(IR_Id_C(_2,[|_4|] |+| _5)))  )
# 1283 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1244)) : 'freshtv1246)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_eq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_eq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1235 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | ARR ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | COPRD ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | COPRD_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | COPRD_PTN ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | COPRD_PTN_END ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | EOP ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | EOP_EXN ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _v
        | OUT_IR ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _v
        | ROT _v ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191) : 'freshtv1236)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1237 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | ARR ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | COPRD ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | COPRD_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | COPRD_PTN ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | COPRD_PTN_END ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | EOP ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | EOP_EXN ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _v
        | OUT_IR ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _v
        | ROT _v ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState194) : 'freshtv1238)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1229 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1227 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_mtc_ir_tail) : 'tv_mtc_ir_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_mtc_ir_test)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_mtc_ir_tail = 
# 370 "imp_parser.mly"
                                ( _2::_3 )
# 1381 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1228)) : 'freshtv1230)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1233 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1231 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_mtc_ir_tail) : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_mtc_ir_test)) = _menhir_stack in
        let _v : 'tv_ir_ptn_eq = 
# 366 "imp_parser.mly"
                            ( _1::_2 )
# 1397 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1232)) : 'freshtv1234)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1199 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1412 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | SPL ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState246) : 'freshtv1200)
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1203 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1201 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_prd = 
# 219 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1436 "imp_parser.ml"
         in
        _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1202)) : 'freshtv1204)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1207 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1205 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _), _, (_3 : 'tv_grm_ptns)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_ptns = 
# 204 "imp_parser.mly"
                         ( _1::_3 )
# 1449 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1206)) : 'freshtv1208)
    | MenhirState251 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1211 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1209 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_ptns = 
# 203 "imp_parser.mly"
                     ( _1::_2 )
# 1461 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1210)) : 'freshtv1212)
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1213 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState259
        | SPL ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState259
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState259
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState259) : 'freshtv1214)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1215 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1485 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | SPL ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState265) : 'freshtv1216)
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1217 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | SPL ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState268) : 'freshtv1218)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1219 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState276
        | SPL ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState276
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState276
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState276) : 'freshtv1220)
    | MenhirState283 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1221 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState284
        | SPL ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState284
        | SRC ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState284
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState284) : 'freshtv1222)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1223 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | SPL ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | SRC ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState287) : 'freshtv1224)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1225 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | SPL ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SRC | SYNT_COPRD ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState297) : 'freshtv1226)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op_src : _menhir_env -> 'ttv_tail -> 'tv_reg_ptn_op_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1197 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
    let (_v : 'tv_reg_ptn_op_src) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1195 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
    let ((_3 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 422 "imp_parser.mly"
                                         (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn_src 0" (* Rcd_Ptn.Ro ($2,r)*) )
# 1599 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1196)) : 'freshtv1198)

and _menhir_goto_reg_ptn_lst_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1183 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1181 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn_src)), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst_src = 
# 436 "imp_parser.mly"
                                ( [|_1|] |+| _2 )
# 1616 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1182)) : 'freshtv1184)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1193 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1185) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
            | REG _v ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv1186)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1189) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1187) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 433 "imp_parser.mly"
          ( None )
# 1649 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _v) : 'freshtv1188)) : 'freshtv1190)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1191 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1192)) : 'freshtv1194)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1155 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1671 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1153 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1677 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 1682 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), (_3 : 'tv_typ_def)), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 302 "imp_parser.mly"
                                 ( (_1,fst _3,snd _3,(_2,ref _4)) )
# 1687 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1151) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body_ir) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState41 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1145 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 1700 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
            | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1143 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 1712 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 1717 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 298 "imp_parser.mly"
                            ( [_3] )
# 1723 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1144)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197) : 'freshtv1146)
        | MenhirState39 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1149 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1147 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body_ir)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 283 "imp_parser.mly"
                         ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d) )
# 1740 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1148)) : 'freshtv1150)
        | _ ->
            _menhir_fail ()) : 'freshtv1152)) : 'freshtv1154)) : 'freshtv1156)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1159 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1157 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 310 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 1754 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1158)) : 'freshtv1160)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1163 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1161 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn_end)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 482 "imp_parser.mly"
                                     ( [|((_2,None),_3)|] )
# 1766 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1162)) : 'freshtv1164)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1165 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | COPRD_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | COPRD_PTN ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | COPRD_PTN_END ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv1166)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1169 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1792 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1167 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1798 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 1803 "imp_parser.ml"
        ))), _), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 288 "imp_parser.mly"
                             ( Ast.Etr_Glb(_2,ref _4) )
# 1810 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1168)) : 'freshtv1170)
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1179 * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1177 * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_src)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_act = 
# 157 "imp_parser.mly"
                             ( (_2,ref _3) )
# 1823 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1175) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_act) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState285 | MenhirState277 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1171 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state * 'tv_grm_act) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SCL ->
                _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState281
            | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SLF _ | SYNT_COPRD ->
                _menhir_reduce94 _menhir_env (Obj.magic _menhir_stack) MenhirState281
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState281) : 'freshtv1172)
        | MenhirState298 | MenhirState288 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1173 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state * 'tv_grm_act) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SCL ->
                _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SYNT_COPRD ->
                _menhir_reduce94 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState289) : 'freshtv1174)
        | _ ->
            _menhir_fail ()) : 'freshtv1176)) : 'freshtv1178)) : 'freshtv1180)
    | _ ->
        _menhir_fail ()

and _menhir_reduce172 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 503 "imp_parser.mly"
    ( [||] )
# 1869 "imp_parser.ml"
     in
    _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | NAM _v ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | REG _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | WC ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87

and _menhir_goto_mtc_ir_suc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_suc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState184 | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1137) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1135) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_mtc_ir_tail = 
# 369 "imp_parser.mly"
               ( [] )
# 1907 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1136)) : 'freshtv1138)
    | MenhirState193 | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1141) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1139) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_ir_ptn_eq = 
# 365 "imp_parser.mly"
               ( [] )
# 1922 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1140)) : 'freshtv1142)
    | _ ->
        _menhir_fail ()

and _menhir_run235 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord_end -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 1931 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1131 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1943 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SLF _ | SPL | SYNT_COPRD ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState236) : 'freshtv1132)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | DTA | DTA_GRM | EOF | EXP | LCE | L_LST | L_OPN | MDL | MDL_END | MDL_EOP | MLT | NAM _ | NL | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | PRM _ | SCL | SLF _ | SPL | SRC | STG _ | SYNT_COPRD ->
        _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1133 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1979 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1134)

and _menhir_run263 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 1987 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1127 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1999 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState264 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState264 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState264 _v
        | COPRD | COPRD_END | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SPL | SYNT_COPRD ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState264) : 'freshtv1128)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | EXP | L_LST | L_OPN | MLT | NAM _ | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | PRM _ | SCL | SPL | SRC | STG _ | SYNT_COPRD ->
        _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1129 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2035 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1130)

and _menhir_reduce87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 202 "imp_parser.mly"
    ( [] )
# 2045 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_run234 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 2052 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1125) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 2062 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 2066 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 212 "imp_parser.mly"
        ( Grm.Txt _1 )
# 2071 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1126)

and _menhir_run237 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1123) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 214 "imp_parser.mly"
        ( Grm.Name(EndN "_byt") )
# 2085 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1124)

and _menhir_run238 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState238
    | MLT ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState238
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _v
    | STG _v ->
        _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState238 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState238

and _menhir_run243 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | MLT ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
    | STG _v ->
        _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243

and _menhir_run239 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1121) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 215 "imp_parser.mly"
         ( Grm.Name(EndN "_byt") )
# 2141 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1122)

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | VAL _v ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1119 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | ARR ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | COPRD ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | COPRD_END ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | COPRD_PTN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | COPRD_PTN_END ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | EOP ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | EOP_EXN ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
    | OUT_IR ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState166
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
    | ROT _v ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv1120)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState338 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1113 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2205 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1111 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2213 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 2220 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 227 "imp_parser.mly"
                                        ( [_3]@_4 )
# 2226 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1112)) : 'freshtv1114)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1117 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1115 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 117 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2243 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1116)) : 'freshtv1118)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState136 | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1095 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | NAM _v ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
        | REG _v ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
        | WC ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | OP | R_RCD ->
            _menhir_reduce161 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv1096)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1101 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1097 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv1098)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1099 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1100)) : 'freshtv1102)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1107 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1103 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState149
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState149
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv1104)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1105 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1106)) : 'freshtv1108)
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1109 * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | ARR ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | COPRD ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | COPRD_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | COPRD_PTN ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | COPRD_PTN_END ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | EOP ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | EOP_EXN ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState279 _v
        | OUT_IR ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState279 _v
        | ROT _v ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState279 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState279) : 'freshtv1110)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState278 | MenhirState130 | MenhirState144 | MenhirState136 | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1085 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1083 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_src = 
# 421 "imp_parser.mly"
            ( Rcd_Ptn.A _1 )
# 2385 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1084)) : 'freshtv1086)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1093) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1089) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1087) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (_2 : 'tv_reg_src)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 432 "imp_parser.mly"
                      ( Some _2 )
# 2406 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _v) : 'freshtv1088)) : 'freshtv1090)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1091) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1092)) : 'freshtv1094)
    | _ ->
        _menhir_fail ()

and _menhir_reduce161 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_src = 
# 435 "imp_parser.mly"
    ( [||] )
# 2424 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_src_par_p : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_src_par_p -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1075 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
        | LINE _v ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
        | STG _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
        | S8_P ->
            _menhir_reduce176 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118) : 'freshtv1076)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1081 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1077 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState128
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv1078)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1079 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1080)) : 'freshtv1082)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ret : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ret -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1073) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ret) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1071) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
    ((let _v : 'tv_ir_lines = 
# 309 "imp_parser.mly"
           ( _1 )
# 2499 "imp_parser.ml"
     in
    _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1072)) : 'freshtv1074)

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState54 | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv999 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | NAM _v ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
        | REG _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
        | WC ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | OP | R_RCD ->
            _menhir_reduce159 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54) : 'freshtv1000)
    | MenhirState199 | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1007 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2532 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1001) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | L_RCD ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | N ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | ROT _v ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | SGN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | TYP_STG ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | VAL _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv1002)
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1003) = Obj.magic _menhir_stack in
            ((let _v : 'tv_typ_def = 
# 507 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 2571 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv1004)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1005 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2581 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1006)) : 'freshtv1008)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1013 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2590 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1009 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2600 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv1010)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1011 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2624 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1012)) : 'freshtv1014)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1015 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2633 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce172 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86) : 'freshtv1016)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1017 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce172 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv1018)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1025 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1021 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1019 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 327 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2679 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1020)) : 'freshtv1022)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1023 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1024)) : 'freshtv1026)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1029 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1027 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 305 "imp_parser.mly"
                ( Ret _2 )
# 2699 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1028)) : 'freshtv1030)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1033 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1031 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn_src)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 317 "imp_parser.mly"
                                            ( IR_Exp(_2,_4,_6) )
# 2714 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1032)) : 'freshtv1034)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1037 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1035 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_3 : 'tv_reg_ptn_src)), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 318 "imp_parser.mly"
                                    ( IR_Exp(_2,_3,_5) )
# 2728 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1036)) : 'freshtv1038)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1043 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1039 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv1040)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1041 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1042)) : 'freshtv1044)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1047 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1045 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 325 "imp_parser.mly"
                                    (
     IR_Glb_Call(ref(Lang.Ast.Stt_Axm Lang.Ast.Axm._app),RP.R [|RP.A _2;_4|],_6) )
# 2775 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1046)) : 'freshtv1048)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1061 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2783 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1049 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2793 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161) : 'freshtv1050)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1053 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2815 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1051 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2822 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2827 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 313 "imp_parser.mly"
                        ( IL_Glb_Call(ref(Ast.Stt_Name _1),_2) )
# 2833 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1052)) : 'freshtv1054)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1057 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2841 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1055 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2848 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2853 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 329 "imp_parser.mly"
                         ( IR_Glb_Out(ref(Ast.Stt_Name _1),_2) )
# 2859 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1056)) : 'freshtv1058)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1059 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2869 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1060)) : 'freshtv1062)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1065 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2878 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1063 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2884 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2889 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 324 "imp_parser.mly"
                             ( IR_Glb_Call(ref(Ast.Stt_Name _1),_2,_4) )
# 2895 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1064)) : 'freshtv1066)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1069 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2903 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2907 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1067 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2913 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2917 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 2922 "imp_parser.ml"
        ))), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2926 "imp_parser.ml"
        ))), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_mtc_ir_test = 
# 373 "imp_parser.mly"
                             (
    (ref(R_N _1),ref(Eq_Agl_N(ref(Ast.Stt_Name _3),_5)))
    )
# 2935 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1068)) : 'freshtv1070)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv997 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_reg_ptn_op) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv995 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_reg_ptn = 
# 452 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn 0" (* Rcd_Ptn.Ro ($2,r)  *) )
# 2957 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv996)) : 'freshtv998)

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv989 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv981) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState49
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv982)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv985) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv983) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 463 "imp_parser.mly"
          ( None )
# 2997 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv984)) : 'freshtv986)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv987 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv988)) : 'freshtv990)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv993 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv991 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 466 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 3016 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv992)) : 'freshtv994)
    | _ ->
        _menhir_fail ()

and _menhir_run169 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 3025 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv977 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3037 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | INT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv963) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState170 in
            let (_v : (
# 18 "imp_parser.mly"
       (int)
# 3049 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv961) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 18 "imp_parser.mly"
       (int)
# 3058 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (int)
# 3062 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 381 "imp_parser.mly"
        ( P_Z _1 )
# 3067 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv962)) : 'freshtv964)
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
        | R2 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv967) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState170 in
            let (_v : (
# 20 "imp_parser.mly"
       (bool)
# 3081 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv965) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 20 "imp_parser.mly"
       (bool)
# 3090 "imp_parser.ml"
            )) : (
# 20 "imp_parser.mly"
       (bool)
# 3094 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 383 "imp_parser.mly"
       ( P_R2 _1 )
# 3099 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv966)) : 'freshtv968)
        | R64 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv971) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState170 in
            let (_v : (
# 19 "imp_parser.mly"
       (int64)
# 3109 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv969) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 19 "imp_parser.mly"
       (int64)
# 3118 "imp_parser.ml"
            )) : (
# 19 "imp_parser.mly"
       (int64)
# 3122 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 382 "imp_parser.mly"
        ( P_R64 _1 )
# 3127 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv970)) : 'freshtv972)
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv975) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState170 in
            let (_v : (
# 17 "imp_parser.mly"
       (string)
# 3137 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv973) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 3146 "imp_parser.ml"
            )) : (
# 17 "imp_parser.mly"
       (string)
# 3150 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 380 "imp_parser.mly"
        ( P_Stg _1 )
# 3155 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)) : 'freshtv976)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv978)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv979 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3169 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv980)

and _menhir_run177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv959) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 487 "imp_parser.mly"
        ()
# 3184 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv960)

and _menhir_run178 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 3191 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv955 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3203 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179) : 'freshtv956)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv957 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3223 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv958)

and _menhir_run183 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv953) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 488 "imp_parser.mly"
            ()
# 3238 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv954)

and _menhir_goto_ord_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv947 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState233
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState233
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState233
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState233
        | NAM _v ->
            _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState233 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState233 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState233 _v
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | SCL | SLF _ | SPL | SRC ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState233
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState233) : 'freshtv948)
    | MenhirState272 | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv949 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | NAM _v ->
            _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SLF _ | SPL | SYNT_COPRD ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState258) : 'freshtv950)
    | MenhirState292 | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv951 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState283
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState283
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState283
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState283
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState283 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState283 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState283 _v
        | NOT_SPL | SPL | SRC ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState283
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState283) : 'freshtv952)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState272 | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv941 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState262
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState262
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState262
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState262
        | NAM _v ->
            _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _v
        | COPRD | COPRD_END | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SPL | SYNT_COPRD ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState262
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState262) : 'freshtv942)
    | MenhirState292 | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv943 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
        | NOT_SPL | SPL | SRC ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286) : 'freshtv944)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv945 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | NAM _v ->
            _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
        | COPRD | COPRD_END | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SPL | SRC | SYNT_COPRD ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState296) : 'freshtv946)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nls : _menhir_env -> 'ttv_tail -> 'tv_nls -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv939 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState343
    | DTA_GRM ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState343
    | LCE ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState343
    | MDL ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState343
    | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv937 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState343 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv935 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, (_1 : 'tv_nls)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_nls = 
# 82 "imp_parser.mly"
           ()
# 3441 "imp_parser.ml"
         in
        _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv936)) : 'freshtv938)
    | EOF | MDL_END | MDL_EOP ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState343
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState343) : 'freshtv940)

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv929 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3459 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv927 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3467 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3474 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 97 "imp_parser.mly"
                 (
    let v = newvar_q (-1) in
    let (vs,l) = _3 in
    (v::vs,(_1,v)::l) )
# 3483 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)) : 'freshtv930)
    | MenhirState309 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv933) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv931) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 86 "imp_parser.mly"
             ( _2 )
# 3499 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv932)) : 'freshtv934)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv921 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv919 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 91 "imp_parser.mly"
                 ( 1+_2 )
# 3522 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv920)) : 'freshtv922)
    | MenhirState309 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv925) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv923) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 87 "imp_parser.mly"
                 ( ([],BatList.init _2 (fun n -> ("$"^(String.make n '\''),newvar_q (-2)))) )
# 3538 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv924)) : 'freshtv926)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState335 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv913 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3552 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv911 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3560 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3567 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 239 "imp_parser.mly"
                  ( _1::_2 )
# 3572 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv912)) : 'freshtv914)
    | MenhirState334 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv917 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 3580 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv915 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 3588 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 3595 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 234 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3602 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv909 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState251
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv907 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState251 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | L_LST ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | L_OPN ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | MLT ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
        | STG _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SLF _ | SPL | SRC | SYNT_COPRD ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState252) : 'freshtv908)
    | L_LST ->
        _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState251
    | L_OPN ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState251
    | MLT ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState251
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState251 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState251 _v
    | STG _v ->
        _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState251 _v
    | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | SCL | SLF _ | SPL | SRC | SYNT_COPRD ->
        _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState251
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState251) : 'freshtv910)

and _menhir_goto_mtc_ir_test : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_test -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState193 | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv903 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState184
        | SCL ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState184
        | SPL ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState184
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184) : 'freshtv904)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv905 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | SCL ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | SPL ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186) : 'freshtv906)
    | _ ->
        _menhir_fail ()

and _menhir_goto_s8_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_s8_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv873 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 3713 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv871 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 3719 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 3724 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 341 "imp_parser.mly"
               ( (S8_Var _1)::_2 )
# 3729 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv872)) : 'freshtv874)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv877 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3737 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv875 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3743 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3748 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 342 "imp_parser.mly"
                ( (S8_Name(ref(Ast.Stt_Name _1)))::_2 )
# 3753 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv876)) : 'freshtv878)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv881 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3761 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv879 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3767 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3772 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 339 "imp_parser.mly"
                ( (S8_Txt _1)::_2 )
# 3777 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv880)) : 'freshtv882)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv885 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3785 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv883 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3791 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3796 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 340 "imp_parser.mly"
               ( (S8_Txt _1)::_2 )
# 3801 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv884)) : 'freshtv886)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv893 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv889 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv887 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), _), _), _, (_5 : 'tv_reg)), _, (_6 : 'tv_s8_ptn)) = _menhir_stack in
            let _7 = () in
            let _4 = () in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 319 "imp_parser.mly"
                                    (
    IR_S8(ref(IR_S8_C(_6,[||],[|_5|]))) )
# 3826 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv888)) : 'freshtv890)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv891 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv892)) : 'freshtv894)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv901 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv897 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv895 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_src_par_p)), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
            let _5 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 321 "imp_parser.mly"
                                              (
      let (l0,l1) = _3 in
      IR_S8(ref(IR_S8_C(_4,l0,l1))) )
# 3857 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv896)) : 'freshtv898)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv899 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv900)) : 'freshtv902)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv865 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 3878 "imp_parser.ml"
        ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 3882 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv863 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 3890 "imp_parser.ml"
        ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 3894 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 3901 "imp_parser.ml"
        ))), _, (_4 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 3905 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 243 "imp_parser.mly"
                                 ( (_4,_2)::_5 )
# 3912 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv864)) : 'freshtv866)
    | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv869 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3920 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv867 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3928 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3935 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 231 "imp_parser.mly"
                            (
    Def_CoPrd (_1,snd _2,_3) )
# 3941 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv868)) : 'freshtv870)
    | _ ->
        _menhir_fail ()

and _menhir_run325 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv859 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 3959 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv855 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 3970 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState327
            | L_RCD ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState327
            | N ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState327
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState327 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState327 _v
            | ROT _v ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState327 _v
            | SGN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState327
            | TYP_STG ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState327
            | VAL _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState327 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState327) : 'freshtv856)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv857 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4004 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv858)) : 'freshtv860)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv861 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv862)

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState307 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv849 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4025 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run306 _menhir_env (Obj.magic _menhir_stack) MenhirState338 _v
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv847 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4037 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 4042 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 226 "imp_parser.mly"
                         ( [_3] )
# 4048 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv848)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState338) : 'freshtv850)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv853 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv851 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 118 "imp_parser.mly"
                     ( Flow _2 )
# 4065 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv852)) : 'freshtv854)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv841 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4079 "imp_parser.ml"
        ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 4083 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv839 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4091 "imp_parser.ml"
        ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 4095 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 4102 "imp_parser.ml"
        ))), _, (_4 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 4106 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 247 "imp_parser.mly"
                             ( (_4,_2)::_5 )
# 4113 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv840)) : 'freshtv842)
    | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv845 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4121 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv843 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4129 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 4136 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 233 "imp_parser.mly"
                         ( Def_Prd (_1,snd _2,_3) )
# 4141 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv844)) : 'freshtv846)
    | _ ->
        _menhir_fail ()

and _menhir_run318 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv835 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 4159 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv831 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4170 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState320
            | L_RCD ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState320
            | N ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState320
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState320 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState320 _v
            | ROT _v ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState320 _v
            | SGN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState320
            | TYP_STG ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState320
            | VAL _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState320 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState320) : 'freshtv832)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv833 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4204 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv834)) : 'freshtv836)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv837 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv838)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv829 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4223 "imp_parser.ml"
    )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | ARR ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | COPRD ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | COPRD_END ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | COPRD_PTN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | COPRD_PTN_END ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | EOP ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | EOP_EXN ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | OUT_IR ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | ROT _v ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv830)

and _menhir_run72 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 4260 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PRN ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | L_RCD ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | N ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | ROT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | SGN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | TYP_STG ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | VAL _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72

and _menhir_run75 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 4293 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PRN ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | L_RCD ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | N ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | ROT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | SGN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | TYP_STG ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | VAL _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv827) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 420 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 4333 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv828)

and _menhir_run132 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 4340 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv825) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 4350 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 4354 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 417 "imp_parser.mly"
        ( ref(R_N _1) )
# 4359 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 4366 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv823) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 4376 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 4380 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 416 "imp_parser.mly"
        ( ref(R_N _1) )
# 4385 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv824)

and _menhir_run134 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | NAM _v ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
    | REG _v ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
    | WC ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | OP | R_RCD ->
        _menhir_reduce161 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv821 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv817 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv815 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 40 "imp_parser.mly"
      (Lang.Ast.line)
# 4428 "imp_parser.ml"
        ) = 
# 46 "imp_parser.mly"
  (
    Line _1  )
# 4433 "imp_parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv816)) : 'freshtv818)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv819 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv820)) : 'freshtv822)

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | R64 _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv809 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv805 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv803 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 545 "imp_parser.mly"
                         ( _2 )
# 4493 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv804)) : 'freshtv806)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv807 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv808)) : 'freshtv810)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv813 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv811 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 549 "imp_parser.mly"
                 ( App(Name(ref(Stt_Axm Ast.Axm._cns)),Rcd [|_1;_2|]) )
# 4512 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv812)) : 'freshtv814)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_end : _menhir_env -> 'ttv_tail -> 'tv_mdl_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv801 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4524 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_mdl_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv799 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4531 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_mdl_end) : 'tv_mdl_end) = _v in
    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 4537 "imp_parser.ml"
    ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_mdl = 
# 70 "imp_parser.mly"
                               ( (_2,_3) )
# 4543 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv797) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_mdl) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState358 | MenhirState38 | MenhirState343 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv793 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv791 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : 'tv_mdl_etr = 
# 113 "imp_parser.mly"
            (
    let (n,el) = _1 in Mdl (n,el) )
# 4561 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)) : 'freshtv794)
    | MenhirState356 | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv795 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            _menhir_run354 _menhir_env (Obj.magic _menhir_stack) MenhirState356
        | MDL ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState356
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState356) : 'freshtv796)
    | _ ->
        _menhir_fail ()) : 'freshtv798)) : 'freshtv800)) : 'freshtv802)

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv757) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv753) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv751) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (_2 : 'tv_reg)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 462 "imp_parser.mly"
                  ( Some _2 )
# 4603 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv752)) : 'freshtv754)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv755) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv756)) : 'freshtv758)
    | MenhirState199 | MenhirState42 | MenhirState181 | MenhirState157 | MenhirState161 | MenhirState153 | MenhirState155 | MenhirState149 | MenhirState146 | MenhirState97 | MenhirState92 | MenhirState83 | MenhirState85 | MenhirState87 | MenhirState46 | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv761 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv759 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 451 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 4622 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)) : 'freshtv762)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv763 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | NAM _v ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
        | REG _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
        | WC ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92) : 'freshtv764)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv767 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv765 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 306 "imp_parser.mly"
                ( Exn _2 )
# 4653 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv766)) : 'freshtv768)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv769 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | LINE _v ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | STG _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | S8_P ->
            _menhir_reduce176 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107) : 'freshtv770)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv775 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv771 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState124 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv772)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv773 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv774)) : 'freshtv776)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv779 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv777 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)), _, (_3 : 'tv_reg)), _, (_5 : 'tv_reg)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_src_par_p = 
# 332 "imp_parser.mly"
                            ( ([|_1|],[|_3;_5|]) )
# 4718 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv778)) : 'freshtv780)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv783 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv781 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)), _, (_3 : 'tv_src_par_p)), _, (_5 : 'tv_reg)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_src_par_p = 
# 333 "imp_parser.mly"
                                  (
      let (l0,l1) = _3 in
      ([|_1|] |+| l0,l1 |+| [|_5|]) )
# 4734 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv782)) : 'freshtv784)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv789 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv786)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv787 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)) : 'freshtv790)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_dst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_dst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState199 | MenhirState42 | MenhirState181 | MenhirState157 | MenhirState161 | MenhirState153 | MenhirState155 | MenhirState151 | MenhirState149 | MenhirState146 | MenhirState128 | MenhirState124 | MenhirState122 | MenhirState106 | MenhirState97 | MenhirState95 | MenhirState92 | MenhirState91 | MenhirState83 | MenhirState85 | MenhirState87 | MenhirState46 | MenhirState54 | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv741 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv739 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)) = _menhir_stack in
        let _v : 'tv_reg = 
# 444 "imp_parser.mly"
            ( _1 )
# 4784 "imp_parser.ml"
         in
        _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv740)) : 'freshtv742)
    | MenhirState126 | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv749 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv743 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv744)
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv745 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState122
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv746)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv747 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv748)) : 'freshtv750)
    | _ ->
        _menhir_fail ()

and _menhir_reduce159 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 465 "imp_parser.mly"
    ( [||] )
# 4838 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv737 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4849 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv731 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv729 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 277 "imp_parser.mly"
                ( _1+1 )
# 4865 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv730)) : 'freshtv732)
    | APP | COPRD | DTA | DTA_GRM | EOF | IMP | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv733 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4873 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 4878 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 4883 "imp_parser.ml"
        ) = 
# 270 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 4887 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv734)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv735 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4897 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv736)) : 'freshtv738)

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv727 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PRN ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | L_RCD ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | N ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | ROT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv725 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState67 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv723 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_typs)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 4936 "imp_parser.ml"
        ) = 
# 260 "imp_parser.mly"
                     ( Rcd(rcd_cl _2) )
# 4940 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv724)) : 'freshtv726)
    | SGN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | TYP_STG ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | VAL _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv728)

and _menhir_goto_coprd_ptn_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv721 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_END ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | NAM _v ->
        _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _v
    | SPL ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | VAL _v ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168) : 'freshtv722)

and _menhir_goto_coprd_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv719 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_END ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState193
    | NAM _v ->
        _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _v
    | SPL ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState193
    | VAL _v ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193) : 'freshtv720)

and _menhir_run228 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv717) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 195 "imp_parser.mly"
               ( Grm.Synt )
# 5006 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv718)

and _menhir_run229 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv715) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 199 "imp_parser.mly"
                      ( Grm.Synt )
# 5020 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv716)

and _menhir_run230 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv713) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 194 "imp_parser.mly"
                  ( Grm.Synt )
# 5034 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv714)

and _menhir_run231 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv711) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 198 "imp_parser.mly"
              ( Grm.Lex )
# 5048 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv712)

and _menhir_run232 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv709) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 193 "imp_parser.mly"
          ( Grm.Lex )
# 5062 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv710)

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv707 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv705) = Obj.magic _menhir_stack in
    ((let _v : 'tv_nls = 
# 81 "imp_parser.mly"
    ()
# 5076 "imp_parser.ml"
     in
    _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv706)) : 'freshtv708)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv703 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5087 "imp_parser.ml"
    )) * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run325 _menhir_env (Obj.magic _menhir_stack) MenhirState317
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv699 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5099 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState317 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PRN ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | L_RCD ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | N ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState323 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState323 _v
        | ROT _v ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState323 _v
        | SGN ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | TYP_STG ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | VAL _v ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState323 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState323) : 'freshtv700)
    | PRD ->
        _menhir_run318 _menhir_env (Obj.magic _menhir_stack) MenhirState317
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv701 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5135 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 5140 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 230 "imp_parser.mly"
                 ( Def_Abs (_1,snd _2) )
# 5145 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv702)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState317) : 'freshtv704)

and _menhir_run310 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 5156 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv693 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5168 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run310 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState311) : 'freshtv694)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv695 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5184 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 5189 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 94 "imp_parser.mly"
        (
    let v = newvar_q (-1) in
    ([v],[(_1,v)]) )
# 5196 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv697 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5206 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv698)

and _menhir_run313 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run313 _menhir_env (Obj.magic _menhir_stack) MenhirState313
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv691 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 90 "imp_parser.mly"
        ( 1 )
# 5227 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv692)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState313

and _menhir_run335 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 5238 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run335 _menhir_env (Obj.magic _menhir_stack) MenhirState335 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv689 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5252 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 5257 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 238 "imp_parser.mly"
        ( [_1] )
# 5262 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv690)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState335

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv675 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv671 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv669 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 209 "imp_parser.mly"
                         ( Grm.Opn _2 )
# 5297 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)) : 'freshtv672)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv673 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv674)) : 'freshtv676)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv683 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv679 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv677 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 208 "imp_parser.mly"
                         ( Grm.Lst _2 )
# 5325 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv678)) : 'freshtv680)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv681 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv682)) : 'freshtv684)
    | MenhirState296 | MenhirState233 | MenhirState286 | MenhirState283 | MenhirState236 | MenhirState262 | MenhirState264 | MenhirState258 | MenhirState249 | MenhirState251 | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv687 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv685 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 207 "imp_parser.mly"
             ( Grm.Atm _1 )
# 5344 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv686)) : 'freshtv688)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_cst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_cst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv667 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5356 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv665 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5364 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_ir_ptn_cst) : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 5371 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_mtc_ir_test = 
# 376 "imp_parser.mly"
                      (
    (ref(R_N _1),ref(P_Cst _3)) )
# 5378 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv666)) : 'freshtv668)

and _menhir_reduce176 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_s8_ptn = 
# 338 "imp_parser.mly"
    ( [] )
# 5387 "imp_parser.ml"
     in
    _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 5394 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | LINE _v ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | STG _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | S8_P ->
        _menhir_reduce176 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108

and _menhir_run109 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 5421 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | LINE _v ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | STG _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | S8_P ->
        _menhir_reduce176 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109

and _menhir_run110 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 5448 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | LINE _v ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | STG _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | S8_P ->
        _menhir_reduce176 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5475 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5485 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv615 * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5499 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState70 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv613 * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5507 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5513 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5520 "imp_parser.ml"
            ) = 
# 259 "imp_parser.mly"
                    ( _2 )
# 5524 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv614)) : 'freshtv616)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv618)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv621 * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5536 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5540 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | APP | COPRD | DTA | DTA_GRM | EOF | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv619 * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5552 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5556 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5561 "imp_parser.ml"
            ))), _), _, (_3 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5565 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5571 "imp_parser.ml"
            ) = 
# 271 "imp_parser.mly"
                 ( Imp(_1,_3) )
# 5575 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv622)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv625 * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5587 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5591 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | APP | COPRD | DTA | DTA_GRM | EOF | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv623 * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5603 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5607 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5612 "imp_parser.ml"
            ))), _), _, (_3 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5616 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5622 "imp_parser.ml"
            ) = 
# 262 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 5626 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv624)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv626)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv629 * 'tv_typs) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5638 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | L_PRN | L_RCD | N | NAM _ | PRM _ | ROT _ | R_RCD | SGN | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv627 * 'tv_typs) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5652 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : 'tv_typs)), _, (_2 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5657 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 256 "imp_parser.mly"
             ( _1@[_2] )
# 5662 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv628)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv630)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv633) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5674 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv631) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5688 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState78 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState79
            | L_RCD ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState79
            | N ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState79
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
            | ROT _v ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
            | SGN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState79
            | TYP_STG ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState79
            | VAL _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv632)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv634)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv639) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5726 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5730 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv637) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5744 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5748 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState80 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv635) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5756 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5760 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _, (_2 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5766 "imp_parser.ml"
            ))), _), _, (_4 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5770 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 508 "imp_parser.mly"
                        ( (_2,_4) )
# 5778 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv636)) : 'freshtv638)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv640)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv647 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5790 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5794 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv641 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5808 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5812 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState212 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState214
            | L_RCD ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState214
            | N ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState214
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
            | ROT _v ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
            | SGN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState214
            | TYP_STG ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState214
            | VAL _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214) : 'freshtv642)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv645 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5846 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5850 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState212 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv643 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5858 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5862 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 5868 "imp_parser.ml"
            ))), _), _, (_4 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5872 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 286 "imp_parser.mly"
                            ( Ast.Etr_Out_Abs(_2,_4) )
# 5880 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv644)) : 'freshtv646)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212) : 'freshtv648)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv651 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5892 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5896 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5900 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState215
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState215
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv649 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 5914 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5918 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5922 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 5927 "imp_parser.ml"
            ))), _), _, (_4 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5931 "imp_parser.ml"
            ))), _), _, (_6 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5935 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 284 "imp_parser.mly"
                            (
    Ast.Etr_Abs(_2,_4,_6) )
# 5944 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv650)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState215) : 'freshtv652)
    | MenhirState320 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv655 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 5956 "imp_parser.ml"
        ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5960 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState321
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState321
        | PRD ->
            _menhir_run318 _menhir_env (Obj.magic _menhir_stack) MenhirState321
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv653 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 5976 "imp_parser.ml"
            ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5980 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 5985 "imp_parser.ml"
            ))), _, (_4 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 5989 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_prd = 
# 246 "imp_parser.mly"
                     ( [(_4,_2)] )
# 5996 "imp_parser.ml"
             in
            _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState321) : 'freshtv656)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv659 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 6008 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6012 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv657 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 6026 "imp_parser.ml"
            )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6030 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 6035 "imp_parser.ml"
            ))), (_2 : 'tv_def_arg)), _), _, (_4 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6039 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 235 "imp_parser.mly"
                        ( Def_EqT (_1,snd _2,_4) )
# 6045 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState324) : 'freshtv660)
    | MenhirState327 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv663 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 6057 "imp_parser.ml"
        ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6061 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | COPRD ->
            _menhir_run325 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | IMP ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv661 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 6077 "imp_parser.ml"
            ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6081 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 6086 "imp_parser.ml"
            ))), _, (_4 : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6090 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 242 "imp_parser.mly"
                      ( [(_4,_2)] )
# 6097 "imp_parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv662)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState328) : 'freshtv664)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv607 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | L_OPN ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | R64 _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv605 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState11 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv603 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 539 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 6145 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)) : 'freshtv606)
        | STG _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv608)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv611 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_OPN ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | R64 _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | STG _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv609 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 511 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 6183 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv610)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv612)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState20 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv573 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | L_LST ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | L_OPN ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | R64 _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | STG _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | R_LST ->
            _menhir_reduce122 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv574)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv577 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv575 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 536 "imp_parser.mly"
                ( App(_1,_3) )
# 6237 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)) : 'freshtv578)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv583 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv581 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState24 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv579 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 544 "imp_parser.mly"
                    ( App(Name(ref(Stt_Axm Ast.Axm._some)),_2) )
# 6262 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv580)) : 'freshtv582)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv584)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState26 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv585 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 533 "imp_parser.mly"
                    ( _2 )
# 6291 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)) : 'freshtv588)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv590)
    | MenhirState34 | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv593 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | EOF | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | PRM _ | R64 _ | R_RCD | STG _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv591 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 518 "imp_parser.mly"
                 ( _1@[_2] )
# 6313 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv594)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv595 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 514 "imp_parser.mly"
            ( _2 )
# 6336 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv596)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv598)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv601 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv599 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState130 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | NAM _v ->
                _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
            | REG _v ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
            | WC ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv600)
        | L_RCD ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | NAM _v ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
        | REG _v ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
        | WC ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130) : 'freshtv602)
    | _ ->
        _menhir_fail ()

and _menhir_reduce122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 548 "imp_parser.mly"
    ( App(Name(ref(Stt_Axm Ast.Axm._nil)),Rcd [||]) )
# 6391 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6398 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6409 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6417 "imp_parser.ml"
        )) : (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6421 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv566)) : 'freshtv568)
    | MenhirState356 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv571 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6431 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv569 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6439 "imp_parser.ml"
        )) : (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6443 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6449 "imp_parser.ml"
        ) = 
# 62 "imp_parser.mly"
                 (
    let ms = _2 in
    _1::ms )
# 6455 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState343 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv537 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv535 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), (_2 : 'tv_nls)), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 104 "imp_parser.mly"
                            ( _1::_3 )
# 6474 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv536)) : 'freshtv538)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv549 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 6482 "imp_parser.ml"
        )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv541) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv539) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 73 "imp_parser.mly"
            ()
# 6497 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv540)) : 'freshtv542)
        | MDL_EOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv545) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv543) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 74 "imp_parser.mly"
            ()
# 6510 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv544)) : 'freshtv546)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv547 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 6520 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv548)) : 'freshtv550)
    | MenhirState358 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv563 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv559 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv557 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6540 "imp_parser.ml"
            ) = 
# 67 "imp_parser.mly"
                   ( _1 )
# 6544 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv555) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6552 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv553) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6560 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv551) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 39 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6568 "imp_parser.ml"
            )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6572 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv552)) : 'freshtv554)) : 'freshtv556)) : 'freshtv558)) : 'freshtv560)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv561 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv562)) : 'freshtv564)
    | _ ->
        _menhir_fail ()

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 6588 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 6600 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv529) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState41 in
            let (_v : (
# 17 "imp_parser.mly"
       (string)
# 6612 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv530)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv532)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv533 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 6641 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv534)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv527) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg = 
# 443 "imp_parser.mly"
       ( ref(R_Ax(R_WC (sgn ()))) )
# 6656 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv528)

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 6663 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv525) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 6673 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 6677 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 448 "imp_parser.mly"
        ( ref(R_N _1) )
# 6682 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv526)

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 6689 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv523) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 6699 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 6703 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 447 "imp_parser.mly"
        ( ref(R_N _1) )
# 6708 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv524)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | NAM _v ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | REG _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | WC ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | OP | R_RCD ->
        _menhir_reduce159 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_goto_eq_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eq_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv521 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 6739 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_eq_def) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv519 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 6747 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_4 : 'tv_eq_def) : 'tv_eq_def) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 6754 "imp_parser.ml"
    ))), _) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_glb_etr = 
# 287 "imp_parser.mly"
                      ( Ast.Etr_Eq(_2,_4) )
# 6761 "imp_parser.ml"
     in
    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)) : 'freshtv522)

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 6768 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv517) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 6778 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 6782 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6787 "imp_parser.ml"
    ) = 
# 266 "imp_parser.mly"
        ( Var(ref(N_Ln (EndN _1,Axm Lang.Types.Axm.v))) )
# 6791 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)

and _menhir_run60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv515) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6805 "imp_parser.ml"
    ) = 
# 273 "imp_parser.mly"
            ( Axm Lang.Types.Axm.stg )
# 6809 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv513) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6823 "imp_parser.ml"
    ) = 
# 272 "imp_parser.mly"
        ( Axm Lang.Types.Axm.sgn_p )
# 6827 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv514)

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 6834 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv511) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 276 "imp_parser.mly"
    ( 0 )
# 6844 "imp_parser.ml"
     in
    _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv512)

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv509) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 6858 "imp_parser.ml"
    ) = 
# 269 "imp_parser.mly"
      ( Axm Lang.Types.Axm.nat )
# 6862 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv510)

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv507) = Obj.magic _menhir_stack in
    ((let _v : 'tv_typs = 
# 255 "imp_parser.mly"
    ( [] )
# 6875 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv508)

and _menhir_run69 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PRN ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | L_RCD ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | N ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | ROT _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | SGN ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TYP_STG ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | VAL _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 6911 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | NAM _v ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | REG _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | WC ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | REG _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | WC ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91

and _menhir_run95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
    | REG _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
    | WC ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState95
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | NAM _v ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | REG _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | WC ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97

and _menhir_run99 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv505) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 495 "imp_parser.mly"
                  ()
# 6994 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv503) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 491 "imp_parser.mly"
              ()
# 7008 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv501) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 496 "imp_parser.mly"
              ()
# 7022 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv502)

and _menhir_run102 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv499) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 492 "imp_parser.mly"
          ()
# 7036 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)

and _menhir_run103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | R64 _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | S8_E ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv497 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState103 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
        | REG _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
        | WC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv495 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState104 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv491 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
                | REG _v ->
                    _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
                | WC ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState106
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv492)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv493 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv494)) : 'freshtv496)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv498)
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

and _menhir_run151 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
    | REG _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
    | WC ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState151
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv489) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv487) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 111 "imp_parser.mly"
            ( _1 )
# 7144 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)) : 'freshtv490)

and _menhir_run225 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 7151 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv483 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 7163 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv479 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 7173 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 17 "imp_parser.mly"
       (string)
# 7178 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | COPRD_END ->
                _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | ORD_LEX_COPRD ->
                _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | ORD_LEX_COPRD_END ->
                _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | SYNT_COPRD ->
                _menhir_run228 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState227) : 'freshtv480)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv481 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 7205 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv482)) : 'freshtv484)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv485 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 7216 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv486)

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv475) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 112 "imp_parser.mly"
            ( _1 )
# 7234 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv476)) : 'freshtv478)

and _menhir_run306 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 7241 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv471 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 7253 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run332 _menhir_env (Obj.magic _menhir_stack) MenhirState307
        | NAM _v ->
            _menhir_run308 _menhir_env (Obj.magic _menhir_stack) MenhirState307 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState307) : 'freshtv472)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv473 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 7273 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv474)

and _menhir_run308 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 7281 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv465) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run313 _menhir_env (Obj.magic _menhir_stack) MenhirState309
        | VAL _v ->
            _menhir_run310 _menhir_env (Obj.magic _menhir_stack) MenhirState309 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState309) : 'freshtv466)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv467) = Obj.magic _menhir_stack in
        ((let _v : 'tv_def_arg = 
# 85 "imp_parser.mly"
    ( ([],[]) )
# 7308 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv468)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv469 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7318 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)

and _menhir_run332 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 7335 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv457 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7346 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run335 _menhir_env (Obj.magic _menhir_stack) MenhirState334 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState334) : 'freshtv458)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv459 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7364 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv460)) : 'freshtv462)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv463 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)

and _menhir_goto_name : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7379 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv407 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7389 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7393 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv405 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7399 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7403 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 7408 "imp_parser.ml"
        ))), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7412 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7418 "imp_parser.ml"
        ) = 
# 56 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 7422 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv406)) : 'freshtv408)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv411 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7430 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7434 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv409 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7440 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7444 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 7449 "imp_parser.ml"
        ))), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7453 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7459 "imp_parser.ml"
        ) = 
# 57 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 7463 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv410)) : 'freshtv412)
    | MenhirState103 | MenhirState34 | MenhirState1 | MenhirState11 | MenhirState13 | MenhirState14 | MenhirState20 | MenhirState21 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv415 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7471 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv413 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7477 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7482 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 531 "imp_parser.mly"
          ( Name(ref(Ast.Stt_Name _1)) )
# 7487 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
    | MenhirState327 | MenhirState323 | MenhirState320 | MenhirState211 | MenhirState214 | MenhirState58 | MenhirState79 | MenhirState67 | MenhirState69 | MenhirState75 | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv419 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7495 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv417 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7501 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7506 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 7511 "imp_parser.ml"
        ) = 
# 267 "imp_parser.mly"
         ( Var(ref(N _1)) )
# 7515 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)) : 'freshtv420)
    | MenhirState118 | MenhirState107 | MenhirState108 | MenhirState109 | MenhirState112 | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv421 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7523 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
        | LINE _v ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
        | STG _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
        | S8_P ->
            _menhir_reduce176 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112) : 'freshtv422)
    | MenhirState279 | MenhirState216 | MenhirState194 | MenhirState191 | MenhirState166 | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv423 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7549 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | NAM _v ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
        | REG _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
        | WC ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157) : 'freshtv424)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv427 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7571 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv425 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7577 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7582 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_ir_ptn_cst = 
# 384 "imp_parser.mly"
         ( P_N(ref(Ast.Stt_Name _1)) )
# 7587 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)) : 'freshtv428)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv433 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7595 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7599 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv429 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7609 "imp_parser.ml"
            ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7613 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | NAM _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
            | REG _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
            | WC ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState181) : 'freshtv430)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv431 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7637 "imp_parser.ml"
            ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7641 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv432)) : 'freshtv434)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv437 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7650 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv435 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7656 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7661 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_eq_def = 
# 291 "imp_parser.mly"
         ( EqLn _1 )
# 7666 "imp_parser.ml"
         in
        _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv436)) : 'freshtv438)
    | MenhirState296 | MenhirState286 | MenhirState283 | MenhirState233 | MenhirState262 | MenhirState264 | MenhirState258 | MenhirState251 | MenhirState252 | MenhirState249 | MenhirState236 | MenhirState243 | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv441 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7674 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv439 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7680 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7685 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_grm_atom = 
# 213 "imp_parser.mly"
         ( Grm.Name _1 )
# 7690 "imp_parser.ml"
         in
        _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv440)) : 'freshtv442)
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv455 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7698 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv451 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7708 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv449 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7714 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7719 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.name)
# 7725 "imp_parser.ml"
            ) = 
# 51 "imp_parser.mly"
             ( _1 )
# 7729 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv447) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 36 "imp_parser.mly"
      (Lang.name)
# 7737 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv445) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 36 "imp_parser.mly"
      (Lang.name)
# 7745 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv443) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 36 "imp_parser.mly"
      (Lang.name)
# 7753 "imp_parser.ml"
            )) : (
# 36 "imp_parser.mly"
      (Lang.name)
# 7757 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv444)) : 'freshtv446)) : 'freshtv448)) : 'freshtv450)) : 'freshtv452)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv453 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7767 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)) : 'freshtv456)
    | _ ->
        _menhir_fail ()

and _menhir_reduce137 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7777 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 7783 "imp_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7788 "imp_parser.ml"
    ) = 
# 54 "imp_parser.mly"
        ( (EndN _1) )
# 7792 "imp_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7799 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_reduce49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 517 "imp_parser.mly"
    ( [] )
# 7819 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 7826 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv403) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 7836 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 7840 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 532 "imp_parser.mly"
        ( ExpCst(Cst.S8 _1) )
# 7845 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv404)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int64)
# 7852 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 19 "imp_parser.mly"
       (int64)
# 7862 "imp_parser.ml"
    )) : (
# 19 "imp_parser.mly"
       (int64)
# 7866 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 534 "imp_parser.mly"
        ( ExpCst(Cst.R64 _1) )
# 7871 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv402)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | R64 _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | R64 _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | R_OPN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState14 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv397 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 543 "imp_parser.mly"
                ( App(Name(ref(Stt_Axm Ast.Axm._none)),Rcd [||]) )
# 7942 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)) : 'freshtv400)
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | R64 _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | R_LST ->
        _menhir_reduce122 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 40 "imp_parser.mly"
      (Lang.Ast.line)
# 7984 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.line)
# 7993 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv393) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 40 "imp_parser.mly"
      (Lang.Ast.line)
# 8001 "imp_parser.ml"
    )) : (
# 40 "imp_parser.mly"
      (Lang.Ast.line)
# 8005 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv394)) : 'freshtv396)

and _menhir_run354 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv391) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8018 "imp_parser.ml"
    ) = 
# 60 "imp_parser.mly"
        ( [] )
# 8022 "imp_parser.ml"
     in
    _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)

and _menhir_reduce56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 103 "imp_parser.mly"
      ( [] )
# 8031 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 8047 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | DTA_GRM ->
            _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LCE ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL_END | MDL_EOP ->
            _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv388)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv345 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState39 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv341 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 17 "imp_parser.mly"
       (string)
# 8095 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv337 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8106 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | WC ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv333 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8116 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv331 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8123 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), (_3 : (
# 17 "imp_parser.mly"
       (string)
# 8128 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : 'tv_glb_etr = 
# 280 "imp_parser.mly"
                       ( Mdl_Ln(false,_3) )
# 8137 "imp_parser.ml"
                     in
                    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)) : 'freshtv334)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv335 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8147 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)) : 'freshtv338)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv339 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8158 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)) : 'freshtv342)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv343 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)) : 'freshtv346)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState39 in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 8176 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR_REV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv347 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8187 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState199 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | ARR ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | COPRD ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | COPRD_END ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | COPRD_PTN ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | COPRD_PTN_END ->
                _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EOP ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EOP_EXN ->
                _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | OUT_IR ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | ROT _v ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216) : 'freshtv348)
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv349 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8227 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState199 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | L_RCD ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | N ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | ROT _v ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | SGN ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | TYP_STG ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | VAL _v ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211) : 'freshtv350)
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv357 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8261 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState199 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | WC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv353 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8273 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv351 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8280 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 8285 "imp_parser.ml"
                ))), _) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_glb_etr = 
# 281 "imp_parser.mly"
                   ( Mdl_Ln(true,_2) )
# 8293 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)) : 'freshtv354)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv355 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8303 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv356)) : 'freshtv358)
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv383 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8312 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState199 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ENV ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv369) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState200 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDX _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv361 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 18 "imp_parser.mly"
       (int)
# 8333 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv359 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 18 "imp_parser.mly"
       (int)
# 8341 "imp_parser.ml"
                    )) : (
# 18 "imp_parser.mly"
       (int)
# 8345 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 296 "imp_parser.mly"
            ( ExStgArg _2 )
# 8352 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)) : 'freshtv362)
                | STG _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv365 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 17 "imp_parser.mly"
       (string)
# 8361 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv363 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 17 "imp_parser.mly"
       (string)
# 8369 "imp_parser.ml"
                    )) : (
# 17 "imp_parser.mly"
       (string)
# 8373 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 295 "imp_parser.mly"
            ( ExStg _2 )
# 8380 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)) : 'freshtv366)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv367 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv368)) : 'freshtv370)
            | IDX _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv373) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState200 in
                let (_v : (
# 18 "imp_parser.mly"
       (int)
# 8397 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 18 "imp_parser.mly"
       (int)
# 8406 "imp_parser.ml"
                )) : (
# 18 "imp_parser.mly"
       (int)
# 8410 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 294 "imp_parser.mly"
        ( SttArg _1 )
# 8415 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)) : 'freshtv374)
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
            | R64 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv377) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState200 in
                let (_v : (
# 19 "imp_parser.mly"
       (int64)
# 8429 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv375) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 19 "imp_parser.mly"
       (int64)
# 8438 "imp_parser.ml"
                )) : (
# 19 "imp_parser.mly"
       (int64)
# 8442 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 293 "imp_parser.mly"
        ( Cst(Cst.R64 _1) )
# 8447 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)) : 'freshtv378)
            | STG _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv381) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState200 in
                let (_v : (
# 17 "imp_parser.mly"
       (string)
# 8457 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv379) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 8466 "imp_parser.ml"
                )) : (
# 17 "imp_parser.mly"
       (string)
# 8470 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 292 "imp_parser.mly"
        ( Cst(Cst.S8 _1) )
# 8475 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)) : 'freshtv382)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200) : 'freshtv384)
        | L_RCD ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | NAM _v ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
        | REG _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
        | WC ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199) : 'freshtv386)
    | SLF _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run224 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState224 in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 8514 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv327 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 17 "imp_parser.mly"
       (string)
# 8523 "imp_parser.ml"
        )) : (
# 17 "imp_parser.mly"
       (string)
# 8527 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 120 "imp_parser.mly"
                ( Grm_Abs _2 )
# 8534 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)) : 'freshtv330)
    | SLF _v ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState224 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState224

and _menhir_run305 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run332 _menhir_env (Obj.magic _menhir_stack) MenhirState305
    | NAM _v ->
        _menhir_run308 _menhir_env (Obj.magic _menhir_stack) MenhirState305 _v
    | SLF _v ->
        _menhir_run306 _menhir_env (Obj.magic _menhir_stack) MenhirState305 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState305

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv28)
    | MenhirState358 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv30)
    | MenhirState356 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState343 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState338 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 8587 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState335 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8596 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState334 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8605 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8614 "imp_parser.ml"
        ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 8618 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState327 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8627 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8636 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 8640 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8649 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv49 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8658 "imp_parser.ml"
        ))) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 8662 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState320 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8671 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8680 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8694 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState309 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv60)
    | MenhirState307 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 8707 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv67 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv75 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state * 'tv_grm_act) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv77 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState287 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState283 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv91 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state * 'tv_grm_act) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState272 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState269 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv103 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv107 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8826 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv109 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8835 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv111 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8844 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv123 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8878 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state * 'tv_grm_ptn) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState251 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv131 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8902 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv137 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8921 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv141 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 8935 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 8939 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv145 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8953 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv147 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8962 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 8966 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 8970 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv149 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8979 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 8983 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv151 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8992 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 8996 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv153 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9005 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9014 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9023 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9032 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv161 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv169 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv175 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9076 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9080 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9089 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv179 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9098 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv181 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9117 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9126 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv189 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv191 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv195 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv197 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv199 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv202)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv209 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv213 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv215 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv217 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9209 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9218 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9227 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9236 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv227 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv229 * _menhir_state) * _menhir_state) * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv237 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv239 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv243 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv247 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9295 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv249 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9304 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9313 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv253 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9322 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv255) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9331 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9335 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv257) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9344 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9353 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv261 * 'tv_typs) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9362 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv263 * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9371 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9375 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9384 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv267 * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9393 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9397 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9406 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * _menhir_state) * _menhir_state * (
# 42 "imp_parser.mly"
      (Lang.Types.t)
# 9415 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv275 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv278)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv282)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9452 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv287 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9461 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9475 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv294)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv297 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv299 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv301 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv303 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv305 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv313 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv315 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv319 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9548 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9557 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv323 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv326)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 9574 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9586 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv22)
    | APP | BYTE | COPRD | COPRD_END | DOT_END | DTA | DTA_GRM | EOF | EXP | IDX _ | IMP | INI_IR | LCE | LINE _ | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | MLT | N | NAM _ | NL | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | PRD | PRM _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | S8_P | SCL | SGN | SLF _ | SPL | SRC | SRC_OUT | STG _ | SYNT_COPRD | TYP_STG | VAL _ | WC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9604 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 9609 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 37 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9614 "imp_parser.ml"
        ) = 
# 55 "imp_parser.mly"
        ( EndN _1 )
# 9618 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9628 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 9636 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | APP | BYTE | COPRD | COPRD_END | DOT_END | DTA | DTA_GRM | EOF | EXP | IDX _ | IMP | INI_IR | LCE | LINE _ | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | MLT | N | NAM _ | NL | NOT_SPL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | PRD | PRM _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | S8_P | SCL | SGN | SLF _ | SPL | SRC | SRC_OUT | STG _ | SYNT_COPRD | TYP_STG | VAL _ | WC ->
        _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9654 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and _menhir_init : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> _menhir_env =
  fun lexer lexbuf ->
    let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and buffer : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 40 "imp_parser.mly"
      (Lang.Ast.line)
# 9684 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv17) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : (
# 40 "imp_parser.mly"
      (Lang.Ast.line)
# 9712 "imp_parser.ml"
            ) = 
# 48 "imp_parser.mly"
                ( End )
# 9716 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)) : 'freshtv10)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)) : 'freshtv14)
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | L_OPN ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | R64 _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | STG _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv16)
    | EOF | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | PRM _ | R64 _ | STG _ ->
        _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv18))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 38 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 9764 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run354 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MDL ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv6))

and file_top : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 39 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 9785 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState358
    | DTA_GRM ->
        _menhir_run224 _menhir_env (Obj.magic _menhir_stack) MenhirState358
    | LCE ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState358
    | MDL ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState358
    | EOF ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState358
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState358) : 'freshtv4))

and name_eof : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 36 "imp_parser.mly"
      (Lang.name)
# 9812 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState362 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState362 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState362) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 9833 "imp_parser.ml"
