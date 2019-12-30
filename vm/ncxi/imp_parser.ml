
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | WC
    | VCT_INI
    | VCT
    | VAL of (
# 18 "imp_parser.mly"
       (string)
# 15 "imp_parser.ml"
  )
    | TYP_VCT
    | TYP_STG
    | TYP_SGN
    | TYP_OPN_VCT
    | SYNT_COPRD
    | STG of (
# 18 "imp_parser.mly"
       (string)
# 25 "imp_parser.ml"
  )
    | SRC_OUT
    | SRC_IL
    | SRC
    | SPL
    | SLH
    | SLF of (
# 19 "imp_parser.mly"
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
# 19 "imp_parser.mly"
       (int)
# 52 "imp_parser.ml"
  )
    | RM
    | REG of (
# 18 "imp_parser.mly"
       (string)
# 58 "imp_parser.ml"
  )
    | R64 of (
# 20 "imp_parser.mly"
       (int64)
# 63 "imp_parser.ml"
  )
    | R2 of (
# 21 "imp_parser.mly"
       (bool)
# 68 "imp_parser.ml"
  )
    | PRM of (
# 18 "imp_parser.mly"
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
# 19 "imp_parser.mly"
       (int)
# 85 "imp_parser.ml"
  )
    | ORD_LINE_COPRD_END
    | ORD_LINE_COPRD
    | ORD_LEX_COPRD_END
    | ORD_LEX_COPRD
    | ORD_COPRD
    | OP
    | NOT_SPL
    | NOT
    | NL
    | NAT of (
# 19 "imp_parser.mly"
       (int)
# 99 "imp_parser.ml"
  )
    | NAM of (
# 18 "imp_parser.mly"
       (string)
# 104 "imp_parser.ml"
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
# 18 "imp_parser.mly"
       (string)
# 127 "imp_parser.ml"
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
# 19 "imp_parser.mly"
       (int)
# 140 "imp_parser.ml"
  )
    | INJ of (
# 19 "imp_parser.mly"
       (int)
# 145 "imp_parser.ml"
  )
    | INI_IR
    | IN of (
# 19 "imp_parser.mly"
       (int)
# 151 "imp_parser.ml"
  )
    | IMP
    | IDX_FMT_D of (
# 19 "imp_parser.mly"
       (int)
# 157 "imp_parser.ml"
  )
    | IDX of (
# 19 "imp_parser.mly"
       (int)
# 162 "imp_parser.ml"
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
    | CUT
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
# 19 "imp_parser.mly"
       (int)
# 195 "imp_parser.ml"
  )
    | BYTE
    | ARR_REV_IN
    | ARR_REV
    | ARR_END
    | ARR
    | APP
    | AGL_TOP
    | AGL_OP of (
# 19 "imp_parser.mly"
       (int)
# 207 "imp_parser.ml"
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
  | MenhirState413
  | MenhirState409
  | MenhirState407
  | MenhirState394
  | MenhirState389
  | MenhirState386
  | MenhirState385
  | MenhirState378
  | MenhirState377
  | MenhirState374
  | MenhirState373
  | MenhirState371
  | MenhirState370
  | MenhirState367
  | MenhirState363
  | MenhirState362
  | MenhirState360
  | MenhirState358
  | MenhirState357
  | MenhirState355
  | MenhirState352
  | MenhirState348
  | MenhirState347
  | MenhirState346
  | MenhirState345
  | MenhirState341
  | MenhirState339
  | MenhirState338
  | MenhirState337
  | MenhirState335
  | MenhirState334
  | MenhirState332
  | MenhirState331
  | MenhirState330
  | MenhirState329
  | MenhirState328
  | MenhirState327
  | MenhirState326
  | MenhirState325
  | MenhirState324
  | MenhirState323
  | MenhirState322
  | MenhirState321
  | MenhirState319
  | MenhirState318
  | MenhirState316
  | MenhirState315
  | MenhirState314
  | MenhirState313
  | MenhirState309
  | MenhirState306
  | MenhirState305
  | MenhirState303
  | MenhirState302
  | MenhirState301
  | MenhirState299
  | MenhirState297
  | MenhirState296
  | MenhirState295
  | MenhirState294
  | MenhirState293
  | MenhirState289
  | MenhirState288
  | MenhirState286
  | MenhirState285
  | MenhirState282
  | MenhirState277
  | MenhirState275
  | MenhirState272
  | MenhirState265
  | MenhirState262
  | MenhirState260
  | MenhirState252
  | MenhirState251
  | MenhirState250
  | MenhirState248
  | MenhirState247
  | MenhirState236
  | MenhirState235
  | MenhirState233
  | MenhirState230
  | MenhirState229
  | MenhirState228
  | MenhirState225
  | MenhirState224
  | MenhirState223
  | MenhirState222
  | MenhirState220
  | MenhirState218
  | MenhirState217
  | MenhirState216
  | MenhirState214
  | MenhirState211
  | MenhirState210
  | MenhirState209
  | MenhirState207
  | MenhirState202
  | MenhirState201
  | MenhirState200
  | MenhirState197
  | MenhirState195
  | MenhirState185
  | MenhirState183
  | MenhirState180
  | MenhirState175
  | MenhirState171
  | MenhirState169
  | MenhirState167
  | MenhirState165
  | MenhirState163
  | MenhirState160
  | MenhirState158
  | MenhirState157
  | MenhirState155
  | MenhirState153
  | MenhirState151
  | MenhirState149
  | MenhirState145
  | MenhirState134
  | MenhirState132
  | MenhirState130
  | MenhirState129
  | MenhirState128
  | MenhirState127
  | MenhirState126
  | MenhirState125
  | MenhirState123
  | MenhirState122
  | MenhirState120
  | MenhirState116
  | MenhirState115
  | MenhirState114
  | MenhirState112
  | MenhirState111
  | MenhirState110
  | MenhirState105
  | MenhirState102
  | MenhirState98
  | MenhirState96
  | MenhirState94
  | MenhirState92
  | MenhirState90
  | MenhirState85
  | MenhirState84
  | MenhirState82
  | MenhirState81
  | MenhirState80
  | MenhirState79
  | MenhirState78
  | MenhirState77
  | MenhirState75
  | MenhirState74
  | MenhirState72
  | MenhirState71
  | MenhirState69
  | MenhirState60
  | MenhirState56
  | MenhirState52
  | MenhirState49
  | MenhirState44
  | MenhirState43
  | MenhirState41
  | MenhirState40
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

# 417 "imp_parser.ml"

let rec _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState309 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1533 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1531 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 168 "imp_parser.mly"
                     ( _1::_2 )
# 435 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1532)) : 'freshtv1534)
    | MenhirState348 | MenhirState318 | MenhirState294 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1537 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1535 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_rule_seq = 
# 186 "imp_parser.mly"
                ( Some _2 )
# 452 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1536)) : 'freshtv1538)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1541 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 460 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 464 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1539 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 472 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 476 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 483 "imp_parser.ml"
        ))), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 487 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 136 "imp_parser.mly"
                        (
    Lang.Grm.Cnc(_3,_4) )
# 494 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1540)) : 'freshtv1542)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_rule : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1529 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState309
    | COPRD_END ->
        _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState309
    | ORD_LEX_COPRD ->
        _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState309
    | ORD_LEX_COPRD_END ->
        _menhir_run268 _menhir_env (Obj.magic _menhir_stack) MenhirState309
    | ORD_LINE_COPRD ->
        _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState309
    | ORD_LINE_COPRD_END ->
        _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState309
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState309) : 'freshtv1530)

and _menhir_goto_grm_rule_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1527) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1525) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_end) : 'tv_grm_rule_end) = _v in
    ((let _v : 'tv_grm_ord = 
# 167 "imp_parser.mly"
                 ( [_1] )
# 538 "imp_parser.ml"
     in
    _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1526)) : 'freshtv1528)

and _menhir_goto_grm_rule_seq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_seq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState314 | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1511 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1509 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule_end = 
# 189 "imp_parser.mly"
                                          (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,_3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2,_3) )
# 561 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1510)) : 'freshtv1512)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1515 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 569 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1513 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 577 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 584 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule = 
# 170 "imp_parser.mly"
                                              (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,_5,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4,_5) )
# 593 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1514)) : 'freshtv1516)
    | MenhirState347 | MenhirState306 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1519 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1517 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule = 
# 175 "imp_parser.mly"
                                      (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,_3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2,_3) )
# 612 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1518)) : 'freshtv1520)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1523 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 620 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1521 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 628 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 635 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule_end = 
# 194 "imp_parser.mly"
                                                  (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,_5,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4,_5) )
# 644 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1522)) : 'freshtv1524)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState352 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1497 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1495 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 130 "imp_parser.mly"
                    ( _1::_2 )
# 666 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1496)) : 'freshtv1498)
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1507 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1505 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 683 "imp_parser.ml"
        ) = 
# 126 "imp_parser.mly"
                    ( _2 )
# 687 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1503) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 695 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1501) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 703 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1499) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 711 "imp_parser.ml"
        )) : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 715 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 122 "imp_parser.mly"
            ( Gram _1 )
# 720 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1500)) : 'freshtv1502)) : 'freshtv1504)) : 'freshtv1506)) : 'freshtv1508)
    | _ ->
        _menhir_fail ()

and _menhir_run331 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState331
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState331 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState331 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState331 _v
    | WC ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState331
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState331

and _menhir_run335 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState335
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState335 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState335 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState335 _v
    | WC ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState335
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState335

and _menhir_run315 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState315
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState315 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState315 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState315 _v
    | WC ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState315
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState315

and _menhir_run319 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState319
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState319 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState319 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState319 _v
    | WC ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState319
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState319

and _menhir_reduce98 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_rule_seq = 
# 185 "imp_parser.mly"
    ( None )
# 815 "imp_parser.ml"
     in
    _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v

and _menhir_run294 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState294
    | COPRD_END ->
        _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState294
    | ORD_LEX_COPRD ->
        _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState294
    | ORD_LEX_COPRD_END ->
        _menhir_run268 _menhir_env (Obj.magic _menhir_stack) MenhirState294
    | ORD_LINE_COPRD ->
        _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState294
    | ORD_LINE_COPRD_END ->
        _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState294
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState294

and _menhir_goto_grm_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1493 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState352 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1491 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 129 "imp_parser.mly"
            ( [_1] )
# 859 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1492)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState352) : 'freshtv1494)

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1467 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 876 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run294 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SLF _ ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState293) : 'freshtv1468)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1469 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run294 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SLF _ ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState297) : 'freshtv1470)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1471 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 908 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run294 _menhir_env (Obj.magic _menhir_stack) MenhirState303
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState303
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState303) : 'freshtv1472)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1473 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run294 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState306) : 'freshtv1474)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1477 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1475 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState314 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState318
            | COPRD_END ->
                _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState318
            | ORD_LEX_COPRD ->
                _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState318
            | ORD_LEX_COPRD_END ->
                _menhir_run268 _menhir_env (Obj.magic _menhir_stack) MenhirState318
            | ORD_LINE_COPRD ->
                _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState318
            | ORD_LINE_COPRD_END ->
                _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState318
            | SRC ->
                _menhir_run319 _menhir_env (Obj.magic _menhir_stack) MenhirState318
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState318) : 'freshtv1476)
        | SRC ->
            _menhir_run315 _menhir_env (Obj.magic _menhir_stack) MenhirState314
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState314
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState314) : 'freshtv1478)
    | MenhirState325 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1481 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1479 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState326 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                _menhir_run319 _menhir_env (Obj.magic _menhir_stack) MenhirState327
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState327) : 'freshtv1480)
        | SRC ->
            _menhir_run315 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState326) : 'freshtv1482)
    | MenhirState329 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1485 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1483 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState330 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                _menhir_run335 _menhir_env (Obj.magic _menhir_stack) MenhirState334
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState334) : 'freshtv1484)
        | SRC ->
            _menhir_run331 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState330) : 'freshtv1486)
    | MenhirState346 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1489 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1487 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState347 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState348
            | COPRD_END ->
                _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState348
            | ORD_LEX_COPRD ->
                _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState348
            | ORD_LEX_COPRD_END ->
                _menhir_run268 _menhir_env (Obj.magic _menhir_stack) MenhirState348
            | ORD_LINE_COPRD ->
                _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState348
            | ORD_LINE_COPRD_END ->
                _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState348
            | SRC ->
                _menhir_run335 _menhir_env (Obj.magic _menhir_stack) MenhirState348
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState348) : 'freshtv1488)
        | SRC ->
            _menhir_run331 _menhir_env (Obj.magic _menhir_stack) MenhirState347
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END ->
            _menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState347
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState347) : 'freshtv1490)
    | _ ->
        _menhir_fail ()

and _menhir_reduce82 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_prd = 
# 226 "imp_parser.mly"
    ( None )
# 1075 "imp_parser.ml"
     in
    _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run286 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState286
    | L_LST ->
        _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState286
    | L_OPN ->
        _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState286
    | MLT ->
        _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState286
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
    | STG _v ->
        _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
    | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC ->
        _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState286
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1461 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1459 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_regs)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 546 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 1120 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1460)) : 'freshtv1462)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1463 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1128 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv1464)
    | MenhirState229 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1465 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1166 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230) : 'freshtv1466)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState341 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1445 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1443 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule_act)) = _menhir_stack in
        let _v : 'tv_grm_ord_act = 
# 141 "imp_parser.mly"
                             ( _1::_2 )
# 1218 "imp_parser.ml"
         in
        _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1444)) : 'freshtv1446)
    | MenhirState339 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv1449 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv1447 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_10 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let ((((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _), _, (_6 : 'tv_reg_ptn_src)), _, (_8 : 'tv_reg)), _, (_9 : 'tv_ir_lines)) = _menhir_stack in
        let _7 = () in
        let _5 = () in
        let _4 = () in
        let _v : 'tv_grm_rule_act = 
# 144 "imp_parser.mly"
                                                                          (
    Grm.Act_Seq((sgn (),sgn (),sgn(),_8,(_6,ref _9)),_1,_2,_3,_10)
  )
# 1239 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1448)) : 'freshtv1450)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv1453 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv1451 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_10 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let ((((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _), _, (_6 : 'tv_reg_ptn_src)), _, (_8 : 'tv_reg)), _, (_9 : 'tv_ir_lines)) = _menhir_stack in
        let _7 = () in
        let _5 = () in
        let _4 = () in
        let _v : 'tv_grm_rule_act_end = 
# 152 "imp_parser.mly"
                                                                              (
    Grm.Act_Seq((sgn (),sgn (),sgn(),_8,(_6,ref _9)),_1,_2,_3,_10)
  )
# 1260 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1452)) : 'freshtv1454)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1457 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1268 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 1272 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1455 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1280 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 1284 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1291 "imp_parser.ml"
        ))), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 1295 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 133 "imp_parser.mly"
                            (
    Lang.Grm.Act(_3,_4)
  )
# 1303 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1456)) : 'freshtv1458)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_eq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_eq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1439 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207) : 'freshtv1440)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1441 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState210) : 'freshtv1442)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1429 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1427 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_mtc_ir_test)), _, (_3 : 'tv_mtc_ir_tail)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_mtc_ir_tail = 
# 400 "imp_parser.mly"
                                ( _2::_3 )
# 1398 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1428)) : 'freshtv1430)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1433 * _menhir_state * 'tv_mtc_ir_test) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1431 * _menhir_state * 'tv_mtc_ir_test) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mtc_ir_test)), _, (_2 : 'tv_mtc_ir_tail)) = _menhir_stack in
        let _v : 'tv_ir_ptn_eq = 
# 396 "imp_parser.mly"
                            ( _1::_2 )
# 1410 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1432)) : 'freshtv1434)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1435 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1418 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState218 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState218 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState218 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState218) : 'freshtv1436)
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1437 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1456 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState224 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState224 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState224 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState224) : 'freshtv1438)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState275 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1399 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1501 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState285) : 'freshtv1400)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1403 * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1401 * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_prd = 
# 227 "imp_parser.mly"
                 ( Some _2 )
# 1524 "imp_parser.ml"
         in
        _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1402)) : 'freshtv1404)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1407 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1405 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _), _, (_3 : 'tv_grm_ptns)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_ptns = 
# 212 "imp_parser.mly"
                         ( _1::_3 )
# 1537 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1406)) : 'freshtv1408)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1411 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1409 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_ptns = 
# 211 "imp_parser.mly"
                     ( _1::_2 )
# 1549 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1410)) : 'freshtv1412)
    | MenhirState295 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1413 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState296) : 'freshtv1414)
    | MenhirState301 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1415 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1571 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState302) : 'freshtv1416)
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1417 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState305) : 'freshtv1418)
    | MenhirState272 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1419 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState313) : 'freshtv1420)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1421 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState325
        | SCL | SRC ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState325
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState325) : 'freshtv1422)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1423 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState329
        | SCL | SRC ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState329
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState329) : 'freshtv1424)
    | MenhirState345 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1425 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState346
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SRC ->
            _menhir_reduce82 _menhir_env (Obj.magic _menhir_stack) MenhirState346
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState346) : 'freshtv1426)
    | _ ->
        _menhir_fail ()

and _menhir_reduce184 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 545 "imp_parser.mly"
    ( [||] )
# 1662 "imp_parser.ml"
     in
    _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | NAM _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | PRM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1397) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_op_src = 
# 466 "imp_parser.mly"
          ( None )
# 1697 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1398)

and _menhir_run98 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98

and _menhir_goto_grm_rule_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1395 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState341
    | COPRD_END ->
        _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState341
    | ORD_LEX_COPRD ->
        _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState341
    | ORD_LEX_COPRD_END ->
        _menhir_run268 _menhir_env (Obj.magic _menhir_stack) MenhirState341
    | ORD_LINE_COPRD ->
        _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState341
    | ORD_LINE_COPRD_END ->
        _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState341
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState341) : 'freshtv1396)

and _menhir_goto_grm_rule_act_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_act_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1393) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_act_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1391) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_act_end) : 'tv_grm_rule_act_end) = _v in
    ((let _v : 'tv_grm_ord_act = 
# 140 "imp_parser.mly"
                     ( [_1] )
# 1756 "imp_parser.ml"
     in
    _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1392)) : 'freshtv1394)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1385 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1768 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1383 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1776 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1783 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 307 "imp_parser.mly"
                                           ( [_3]@_4 )
# 1789 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1384)) : 'freshtv1386)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1389 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1387 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 290 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 1806 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1388)) : 'freshtv1390)
    | _ ->
        _menhir_fail ()

and _menhir_goto_id_mtc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_id_mtc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1377 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1820 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_id_mtc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1375 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1828 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_id_mtc) : 'tv_id_mtc) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1835 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_src)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_line = 
# 329 "imp_parser.mly"
                           (
    let ms =
      Array.map
        (fun (cn,p,(es,o),lc) ->
          (((ref(!_2),ref(Eq_Agl_N(ref(Ast.Stt_Name cn),p)))::es,o),lc) )
      _4  in
    Mtc ms
  )
# 1848 "imp_parser.ml"
         in
        _menhir_goto_id_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1376)) : 'freshtv1378)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1381 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1856 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_id_mtc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1379 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1864 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_7 : 'tv_id_mtc) : 'tv_id_mtc) = _v in
        ((let (((((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn)), _, (_2 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1871 "imp_parser.ml"
        ))), _, (_4 : 'tv_reg_ptn)), _, (_5 : 'tv_mtc_ir_tail)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_mtc = 
# 521 "imp_parser.mly"
    ( [|(_2,_4,(_5,None),_6)|] |+| _7 )
# 1877 "imp_parser.ml"
         in
        _menhir_goto_id_mtc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1380)) : 'freshtv1382)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState338 | MenhirState332 | MenhirState322 | MenhirState316 | MenhirState252 | MenhirState84 | MenhirState230 | MenhirState224 | MenhirState218 | MenhirState210 | MenhirState207 | MenhirState180 | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1369) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1367) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let _v : 'tv_ir_lines = 
# 321 "imp_parser.mly"
               ( Mtc(_1) )
# 1898 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1368)) : 'freshtv1370)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1373 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1371 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 525 "imp_parser.mly"
                                            ([|((_2,None),_3)|] |+| _4 )
# 1914 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1372)) : 'freshtv1374)
    | _ ->
        _menhir_fail ()

and _menhir_goto_id_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_id_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1365) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_id_line) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1363) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_id_line) : 'tv_id_line) = _v in
    ((let _v : 'tv_ir_lines = 
# 320 "imp_parser.mly"
            ( _1 )
# 1933 "imp_parser.ml"
     in
    _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1364)) : 'freshtv1366)

and _menhir_goto_mtc_ir_suc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_suc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState223 | MenhirState217 | MenhirState200 | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1357) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1355) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_mtc_ir_tail = 
# 399 "imp_parser.mly"
               ( [] )
# 1952 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1356)) : 'freshtv1358)
    | MenhirState209 | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1361) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1359) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_ir_ptn_eq = 
# 395 "imp_parser.mly"
               ( [] )
# 1967 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1360)) : 'freshtv1362)
    | _ ->
        _menhir_fail ()

and _menhir_run274 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord_end -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 1976 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1351 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1988 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState275
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState275
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState275
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState275
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState275 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState275 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState275 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState275
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState275) : 'freshtv1352)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | EXP | LCE | L_LST | L_OPN | MDL | MDL_END | MDL_EOP | MLT | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRM _ | SCL | SLF _ | SRC | STG _ ->
        _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1353 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2024 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1354)

and _menhir_run300 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 2032 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1347 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2044 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState301) : 'freshtv1348)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | CUT | EXP | L_LST | L_OPN | MLT | NAM _ | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRM _ | SCL | SRC | STG _ ->
        _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1349 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2080 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1350)

and _menhir_reduce87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 210 "imp_parser.mly"
    ( [] )
# 2090 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_run273 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 2097 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1345) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 2107 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 2111 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 220 "imp_parser.mly"
        ( Grm.Txt _1 )
# 2116 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1346)

and _menhir_run276 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1343) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 222 "imp_parser.mly"
        ( Grm.Name(EndN "_byt") )
# 2130 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1344)

and _menhir_run277 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState277
    | MLT ->
        _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState277
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState277 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState277 _v
    | STG _v ->
        _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState277 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState277

and _menhir_run282 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | MLT ->
        _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
    | STG _v ->
        _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState282

and _menhir_run278 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1341) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 223 "imp_parser.mly"
         ( Grm.Name(EndN "_byt") )
# 2186 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1342)

and _menhir_run201 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v
    | VAL _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201

and _menhir_goto_reg_ptn_op_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_op_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1335 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op_src) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1333 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_reg_ptn_src = 
# 455 "imp_parser.mly"
                                         (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn_src 0" (* Rcd_Ptn.Ro ($2,r)*) )
# 2225 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1334)) : 'freshtv1336)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1339 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op_src) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1337 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_id_src = 
# 340 "imp_parser.mly"
                                         (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn_src 0" (* Rcd_Ptn.Ro ($2,r)*) )
# 2245 "imp_parser.ml"
         in
        _menhir_goto_id_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1338)) : 'freshtv1340)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1331 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | ARR ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | COPRD ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | COPRD_END ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | COPRD_PTN ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | COPRD_PTN_END ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | EOP ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | EOP_EXN ->
        _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
    | OUT_IR ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
    | ROT _v ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv1332)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState389 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1325 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2296 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1323 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2304 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 2311 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 235 "imp_parser.mly"
                                        ( [_3]@_4 )
# 2317 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1324)) : 'freshtv1326)
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1329 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1327 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 120 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2334 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1328)) : 'freshtv1330)
    | _ ->
        _menhir_fail ()

and _menhir_goto_src_par_p : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_src_par_p -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1315 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | IDX_FMT_D _v ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | LINE _v ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | STG _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | S8_P ->
            _menhir_reduce188 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145) : 'freshtv1316)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1321 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1317 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv1318)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1319 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1320)) : 'freshtv1322)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState56 | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1257 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | NAM _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | PRM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | OP | R_RCD ->
            _menhir_reduce170 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv1258)
    | MenhirState235 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1265 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2433 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1259) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv1260)
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1261) = Obj.magic _menhir_stack in
            ((let _v : 'tv_typ_def = 
# 549 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 2472 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv1262)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1263 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2482 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1264)) : 'freshtv1266)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1267 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2491 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce184 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv1268)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1269 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce184 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112) : 'freshtv1270)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1277 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1273 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1271 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 355 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2537 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1272)) : 'freshtv1274)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1275 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1276)) : 'freshtv1278)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1281 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1279 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 313 "imp_parser.mly"
                ( Ret _2 )
# 2557 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1280)) : 'freshtv1282)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1285 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1283 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn_src)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 345 "imp_parser.mly"
                                            ( IR_Exp(_2,_4,_6) )
# 2572 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1284)) : 'freshtv1286)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1289 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1287 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_3 : 'tv_reg_ptn_src)), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 346 "imp_parser.mly"
                                    ( IR_Exp(_2,_3,_5) )
# 2586 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1288)) : 'freshtv1290)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1295 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1291 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState169
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState169
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169) : 'freshtv1292)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1293 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1294)) : 'freshtv1296)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1299 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1297 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 353 "imp_parser.mly"
                                    (
     IR_Glb_Call(ref(Lang.Ast.Stt_Axm Lang.Ast.Axm._app),RP.R [|RP.A _2;_4|],_6) )
# 2635 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1298)) : 'freshtv1300)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1303 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2643 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1301 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2649 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2654 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn_src)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 352 "imp_parser.mly"
                                 ( IR_Glb_Call(ref(Ast.Stt_Name _1),_2,_4) )
# 2660 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1302)) : 'freshtv1304)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1307 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2668 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2672 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1305 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2678 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2682 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 2687 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2691 "imp_parser.ml"
        ))), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_mtc_ir_test = 
# 403 "imp_parser.mly"
                             (
    (ref(R_N _1),ref(Eq_Agl_N(ref(Ast.Stt_Name _3),_5)))
    )
# 2700 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1306)) : 'freshtv1308)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1309 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2708 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | SCL ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | SPL ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217) : 'freshtv1310)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1311 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2728 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState223
        | SCL ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState223
        | SPL ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState223
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState223) : 'freshtv1312)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1313 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2748 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState229
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce184 _menhir_env (Obj.magic _menhir_stack) MenhirState229
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState229) : 'freshtv1314)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1255 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_reg_ptn_op) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1253 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_reg_ptn = 
# 488 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn 0" (* Rcd_Ptn.Ro ($2,r)  *) )
# 2780 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1254)) : 'freshtv1256)

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1247 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1239) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv1240)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1243) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1241) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 499 "imp_parser.mly"
          ( None )
# 2822 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv1242)) : 'freshtv1244)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1245 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1246)) : 'freshtv1248)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1251 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1249 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 502 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 2841 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1250)) : 'freshtv1252)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1233 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1231 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn_src)), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst_src = 
# 469 "imp_parser.mly"
                                ( [|_1|] |+| _2 )
# 2860 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1232)) : 'freshtv1234)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1235 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | R_RCD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv1236)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1237 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState102
        | R_RCD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState102
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102) : 'freshtv1238)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1179 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2903 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1177 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2909 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 2914 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_src)), _, (_4 : 'tv_reg_ptn)), _, (_5 : 'tv_regs)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_line = 
# 327 "imp_parser.mly"
                                          (
    Seq(IR_Id(ref(IR_Id_C(RP.A _2,[|_4|] |+| _5))),_6)  )
# 2921 "imp_parser.ml"
         in
        _menhir_goto_id_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1178)) : 'freshtv1180)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1183 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1181 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 318 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 2933 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1182)) : 'freshtv1184)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1187 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1185 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn_end)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 524 "imp_parser.mly"
                                     ( [|((_2,None),_3)|] )
# 2945 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1186)) : 'freshtv1188)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1189 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState211
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState211
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState211
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState211
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211) : 'freshtv1190)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1193 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2971 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1191 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2977 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn_end)), _, (_2 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2982 "imp_parser.ml"
        ))), _, (_4 : 'tv_reg_ptn)), _, (_5 : 'tv_mtc_ir_tail)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_mtc = 
# 519 "imp_parser.mly"
    ( [|(_2,_4,(_5,None),_6)|] )
# 2988 "imp_parser.ml"
         in
        _menhir_goto_id_mtc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1192)) : 'freshtv1194)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1195 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2996 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState225) : 'freshtv1196)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1199 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3018 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1197 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3024 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 3029 "imp_parser.ml"
        ))), _, (_2 : 'tv_id_src)), _, (_4 : 'tv_reg_ptn)), _, (_5 : 'tv_regs)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_line = 
# 325 "imp_parser.mly"
                                         (
  Seq(IR_Id(ref(IR_Id_C(_2,[|_4|] |+| _5))),_6)  )
# 3036 "imp_parser.ml"
         in
        _menhir_goto_id_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1198)) : 'freshtv1200)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1213 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3044 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1211 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3050 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3055 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), (_3 : 'tv_typ_def)), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 310 "imp_parser.mly"
                                 ( (_1,fst _3,snd _3,(_2,ref _4)) )
# 3060 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1209) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body_ir) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState43 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1203 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3073 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState233 _v
            | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1201 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3085 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 3090 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 306 "imp_parser.mly"
                            ( [_3] )
# 3096 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1202)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState233) : 'freshtv1204)
        | MenhirState41 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1207 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1205 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body_ir)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 291 "imp_parser.mly"
                         ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d) )
# 3113 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1206)) : 'freshtv1208)
        | _ ->
            _menhir_fail ()) : 'freshtv1210)) : 'freshtv1212)) : 'freshtv1214)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1217 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3123 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1215 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3129 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 3134 "imp_parser.ml"
        ))), _), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 296 "imp_parser.mly"
                             ( Ast.Etr_Glb(_2,ref _4) )
# 3141 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1216)) : 'freshtv1218)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1221 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1219 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _, (_5 : 'tv_reg_ptn_src)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_grm_rule_act_end = 
# 155 "imp_parser.mly"
                                                      (
    Grm.Act_End((sgn (),sgn (),sgn(),ref(R_Ax(R_WC(sgn()))),(_5,ref _6)),_1,_2,_3)
 )
# 3156 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1220)) : 'freshtv1222)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv1223 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | COPRD_END ->
            _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | ORD_LEX_COPRD ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | ORD_LEX_COPRD_END ->
            _menhir_run268 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | ORD_LINE_COPRD ->
            _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | ORD_LINE_COPRD_END ->
            _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState323) : 'freshtv1224)
    | MenhirState332 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1227 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1225 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _, (_5 : 'tv_reg_ptn_src)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_grm_rule_act = 
# 147 "imp_parser.mly"
                                                  (
    Grm.Act_End((sgn (),sgn (),sgn (),ref(R_Ax(R_WC(sgn()))),(_5,ref _6)),_1,_2,_3)
   )
# 3193 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1226)) : 'freshtv1228)
    | MenhirState338 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv1229 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | COPRD_END ->
            _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | ORD_LEX_COPRD ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | ORD_LEX_COPRD_END ->
            _menhir_run268 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | ORD_LINE_COPRD ->
            _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | ORD_LINE_COPRD_END ->
            _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState339) : 'freshtv1230)
    | _ ->
        _menhir_fail ()

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 3224 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1173 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3236 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | INT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1155) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState185 in
            let (_v : (
# 19 "imp_parser.mly"
       (int)
# 3248 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1153) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 19 "imp_parser.mly"
       (int)
# 3257 "imp_parser.ml"
            )) : (
# 19 "imp_parser.mly"
       (int)
# 3261 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 413 "imp_parser.mly"
        ( P_Z _1 )
# 3266 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1154)) : 'freshtv1156)
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | R2 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1159) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState185 in
            let (_v : (
# 21 "imp_parser.mly"
       (bool)
# 3280 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1157) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 21 "imp_parser.mly"
       (bool)
# 3289 "imp_parser.ml"
            )) : (
# 21 "imp_parser.mly"
       (bool)
# 3293 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 415 "imp_parser.mly"
       ( P_R2 _1 )
# 3298 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1158)) : 'freshtv1160)
        | R64 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1163) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState185 in
            let (_v : (
# 20 "imp_parser.mly"
       (int64)
# 3308 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1161) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 3317 "imp_parser.ml"
            )) : (
# 20 "imp_parser.mly"
       (int64)
# 3321 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 414 "imp_parser.mly"
        ( P_R64 _1 )
# 3326 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1162)) : 'freshtv1164)
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1167) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState185 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 3336 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1165) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 3345 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (string)
# 3349 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 412 "imp_parser.mly"
        ( P_Stg _1 )
# 3354 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1166)) : 'freshtv1168)
        | VAL _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1171 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3362 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState185 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 3368 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1169 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3375 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_3 : (
# 18 "imp_parser.mly"
       (string)
# 3381 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (string)
# 3385 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3390 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_mtc_ir_test = 
# 408 "imp_parser.mly"
               (
    (ref(R_N _1),ref(Eq_V(ref(R_N _3)))) )
# 3397 "imp_parser.ml"
             in
            _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1170)) : 'freshtv1172)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185) : 'freshtv1174)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1175 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3411 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1176)

and _menhir_run193 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1151) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 529 "imp_parser.mly"
        ()
# 3426 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1152)

and _menhir_run194 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 3433 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1147 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3445 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState195 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState195 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv1148)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1149 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3465 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1150)

and _menhir_run199 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1145) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 530 "imp_parser.mly"
            ()
# 3480 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1146)

and _menhir_goto_reg_dst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_dst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1143 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1137 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
        | PRM _v ->
            _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
        | REG _v ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv1138)
    | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1139 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
        | PRM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv1140)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1141 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1142)) : 'freshtv1144)

and _menhir_goto_ord_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1131 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | NAM _v ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState272 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState272 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState272 _v
        | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState272) : 'freshtv1132)
    | MenhirState348 | MenhirState318 | MenhirState309 | MenhirState294 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1133 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | NAM _v ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState295) : 'freshtv1134)
    | MenhirState341 | MenhirState339 | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1135 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
        | CUT | SCL | SRC ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState324) : 'freshtv1136)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState348 | MenhirState318 | MenhirState309 | MenhirState294 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1125 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState299
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState299
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState299
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState299
        | NAM _v ->
            _menhir_run300 _menhir_env (Obj.magic _menhir_stack) MenhirState299 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState299 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState299 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState299
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState299) : 'freshtv1126)
    | MenhirState341 | MenhirState339 | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1127 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState328 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState328 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState328 _v
        | CUT | SCL | SRC ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState328) : 'freshtv1128)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1129 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState345
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState345
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState345
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState345
        | NAM _v ->
            _menhir_run300 _menhir_env (Obj.magic _menhir_stack) MenhirState345 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState345 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState345 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SRC ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState345
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState345) : 'freshtv1130)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState360 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1115 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3712 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1113 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3720 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3727 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 99 "imp_parser.mly"
                 (
    let v = newvar_q (-1) in
    let (vs,l) = _3 in
    (v::vs,(_1,v)::l) )
# 3736 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1114)) : 'freshtv1116)
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1119 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1117 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 88 "imp_parser.mly"
             ( _2 )
# 3753 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1118)) : 'freshtv1120)
    | MenhirState358 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1123) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1121) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_args) : 'tv_args) = _v in
        ((let _v : 'tv_def_arg = 
# 87 "imp_parser.mly"
         ( _1 )
# 3768 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1122)) : 'freshtv1124)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState363 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1107 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1105 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 93 "imp_parser.mly"
                 ( 1+_2 )
# 3791 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1106)) : 'freshtv1108)
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1111 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1109 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 89 "imp_parser.mly"
                 ( ([],BatList.init _2 (fun n -> ("$"^(String.make n '\''),newvar_q (-2)))) )
# 3808 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1110)) : 'freshtv1112)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState386 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1099 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3822 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1097 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3830 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3837 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 247 "imp_parser.mly"
                  ( _1::_2 )
# 3842 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1098)) : 'freshtv1100)
    | MenhirState385 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1103 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3850 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1101 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3858 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 3865 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 242 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3872 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1102)) : 'freshtv1104)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1095 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1093 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState288 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState289
        | L_LST ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState289
        | L_OPN ->
            _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState289
        | MLT ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState289
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState289 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState289 _v
        | STG _v ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState289 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC ->
            _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState289
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState289) : 'freshtv1094)
    | L_LST ->
        _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | L_OPN ->
        _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | MLT ->
        _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _v
    | STG _v ->
        _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _v
    | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC ->
        _menhir_reduce87 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState288) : 'freshtv1096)

and _menhir_goto_nls : _menhir_env -> 'ttv_tail -> 'tv_nls -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1091 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run355 _menhir_env (Obj.magic _menhir_stack) MenhirState394
    | DTA_GRM ->
        _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState394
    | LCE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState394
    | MDL ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState394
    | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1089 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState394 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1087 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, (_1 : 'tv_nls)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_nls = 
# 83 "imp_parser.mly"
           ()
# 3964 "imp_parser.ml"
         in
        _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv1088)) : 'freshtv1090)
    | EOF | MDL_END | MDL_EOP ->
        _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) MenhirState394
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState394) : 'freshtv1092)

and _menhir_goto_mtc_ir_test : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_test -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState209 | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1083 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | SCL ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | SPL ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200) : 'freshtv1084)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1085 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | SCL ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | SPL ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202) : 'freshtv1086)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState90 | MenhirState94 | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1039 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | NAM _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | PRM _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | REG _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | WC ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | OP | R_RCD ->
            _menhir_reduce172 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv1040)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1045 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1041 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160) : 'freshtv1042)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1043 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1044)) : 'freshtv1046)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1051 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1047 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState163 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState163 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState163 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState163) : 'freshtv1048)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1049 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1050)) : 'freshtv1052)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1065 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4110 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1053 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4120 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState175
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState175
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175) : 'freshtv1054)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1057 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4144 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1055 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4151 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4156 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn_src)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 322 "imp_parser.mly"
                            ( IL_Glb_Call(ref(Ast.Stt_Name _1),_2) )
# 4162 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1056)) : 'freshtv1058)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1061 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4170 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1059 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4177 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4182 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn_src)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 357 "imp_parser.mly"
                             ( IR_Glb_Out(ref(Ast.Stt_Name _1),_2) )
# 4188 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1060)) : 'freshtv1062)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1063 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4198 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1064)) : 'freshtv1066)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1067 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState316) : 'freshtv1068)
    | MenhirState319 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1073 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv1069 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState321 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState321 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState321 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState321
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState321) : 'freshtv1070)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv1071 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1072)) : 'freshtv1074)
    | MenhirState331 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1075 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState332 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState332 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState332 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState332) : 'freshtv1076)
    | MenhirState335 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1081 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv1077 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState337
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState337) : 'freshtv1078)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv1079 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1080)) : 'freshtv1082)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState335 | MenhirState331 | MenhirState319 | MenhirState315 | MenhirState171 | MenhirState157 | MenhirState158 | MenhirState90 | MenhirState94 | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1023 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1021 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_src = 
# 454 "imp_parser.mly"
            ( Rcd_Ptn.A _1 )
# 4348 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1022)) : 'freshtv1024)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1031 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1027 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1025 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_src)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 465 "imp_parser.mly"
                      ( Some _2 )
# 4369 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1026)) : 'freshtv1028)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1029 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1030)) : 'freshtv1032)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1037 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4384 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1033 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4394 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | COPRD_END ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | COPRD_PTN ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | COPRD_PTN_END ->
                _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105) : 'freshtv1034)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1035 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4428 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1036)) : 'freshtv1038)
    | _ ->
        _menhir_fail ()

and _menhir_goto_s8_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_s8_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv983 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4444 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4448 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv981 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4454 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4458 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4463 "imp_parser.ml"
        ))), _), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 4467 "imp_parser.ml"
        ))), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_s8_ptn = 
# 372 "imp_parser.mly"
                       ( (S8_For_Txt(_1,_3))::_4 )
# 4473 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv982)) : 'freshtv984)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv987 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4481 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv985 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4487 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4492 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 371 "imp_parser.mly"
                ( (S8_Name(ref(Ast.Stt_Name _1)))::_2 )
# 4497 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv986)) : 'freshtv988)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv991 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4505 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv989 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4511 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4516 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 369 "imp_parser.mly"
               ( (S8_Var _1)::_2 )
# 4521 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv990)) : 'freshtv992)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv995 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4529 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv993 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4535 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4540 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 370 "imp_parser.mly"
                     ( (S8_Var_D _1)::_2 )
# 4545 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv994)) : 'freshtv996)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv999 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4553 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv997 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4559 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4564 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 367 "imp_parser.mly"
                ( (S8_Txt _1)::_2 )
# 4569 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv998)) : 'freshtv1000)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1003 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4577 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1001 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4583 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4588 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 368 "imp_parser.mly"
               ( (S8_Txt _1)::_2 )
# 4593 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1002)) : 'freshtv1004)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1011 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv1007 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv1005 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), _), _), _, (_5 : 'tv_reg)), _, (_6 : 'tv_s8_ptn)) = _menhir_stack in
            let _7 = () in
            let _4 = () in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 347 "imp_parser.mly"
                                    (
    IR_S8(ref(IR_S8_C(_6,[||],[|_5|]))) )
# 4618 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1006)) : 'freshtv1008)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv1009 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1010)) : 'freshtv1012)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1019 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1015 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1013 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_src_par_p)), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
            let _5 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 349 "imp_parser.mly"
                                              (
      let (l0,l1) = _3 in
      IR_S8(ref(IR_S8_C(_4,l0,l1))) )
# 4649 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1014)) : 'freshtv1016)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1017 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1018)) : 'freshtv1020)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState378 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv975 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4670 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4674 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv973 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4682 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4686 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4693 "imp_parser.ml"
        ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4697 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 251 "imp_parser.mly"
                                 ( (_4,_2)::_5 )
# 4704 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)) : 'freshtv976)
    | MenhirState367 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv979 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4712 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv977 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4720 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4727 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 239 "imp_parser.mly"
                            (
    Def_CoPrd (_1,snd _2,_3) )
# 4733 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv978)) : 'freshtv980)
    | _ ->
        _menhir_fail ()

and _menhir_run375 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv969 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 4751 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv965 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4762 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState377
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState377
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState377
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState377 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState377 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState377 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState377
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState377
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState377 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState377) : 'freshtv966)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv967 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4796 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv968)) : 'freshtv970)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv971 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv972)

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState357 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv959 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4817 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run356 _menhir_env (Obj.magic _menhir_stack) MenhirState389 _v
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv957 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4829 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4834 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 234 "imp_parser.mly"
                         ( [_3] )
# 4840 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv958)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState389) : 'freshtv960)
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv963 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv961 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 121 "imp_parser.mly"
                     ( Flow _2 )
# 4857 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv962)) : 'freshtv964)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState371 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv951 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4871 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4875 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv949 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4883 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4887 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4894 "imp_parser.ml"
        ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4898 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 255 "imp_parser.mly"
                             ( (_4,_2)::_5 )
# 4905 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv950)) : 'freshtv952)
    | MenhirState367 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv955 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4913 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv953 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4921 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4928 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 241 "imp_parser.mly"
                         ( Def_Prd (_1,snd _2,_3) )
# 4933 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv954)) : 'freshtv956)
    | _ ->
        _menhir_fail ()

and _menhir_run368 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv945 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 4951 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv941 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4962 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState370
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState370
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState370
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState370 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState370 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState370 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState370
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState370
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState370 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState370) : 'freshtv942)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv943 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4996 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv944)) : 'freshtv946)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv947 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv948)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv939 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5015 "imp_parser.ml"
    )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | ARR ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_END ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_PTN ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_PTN_END ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | EOP ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | EOP_EXN ->
        _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | OUT_IR ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | ROT _v ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv940)

and _menhir_run74 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5052 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PRN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | ROT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | SGN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | TYP_STG ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | VAL _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74

and _menhir_run77 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5085 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PRN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | ROT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | SGN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | TYP_STG ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | VAL _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv937 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv933 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv931 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 5133 "imp_parser.ml"
        ) = 
# 47 "imp_parser.mly"
  (
    Line _1  )
# 5138 "imp_parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv932)) : 'freshtv934)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv935 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv936)) : 'freshtv938)

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
        let (_menhir_stack : ('freshtv925 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv921 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv919 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 587 "imp_parser.mly"
                         ( _2 )
# 5198 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv920)) : 'freshtv922)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv923 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv924)) : 'freshtv926)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv929 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv927 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 591 "imp_parser.mly"
                 ( App(Name(ref(Stt_Axm Ast.Axm._cns)),Rcd [|_1;_2|]) )
# 5217 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)) : 'freshtv930)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_end : _menhir_env -> 'ttv_tail -> 'tv_mdl_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv917 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 5229 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_mdl_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv915 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 5236 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_mdl_end) : 'tv_mdl_end) = _v in
    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 5242 "imp_parser.ml"
    ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_mdl = 
# 71 "imp_parser.mly"
                               ( (_2,_3) )
# 5248 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv913) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_mdl) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState409 | MenhirState38 | MenhirState40 | MenhirState394 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv909 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv907 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : 'tv_mdl_etr = 
# 115 "imp_parser.mly"
            (
    let (n,el) = _1 in Mdl (n,el) )
# 5266 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv908)) : 'freshtv910)
    | MenhirState407 | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv911 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            _menhir_run405 _menhir_env (Obj.magic _menhir_stack) MenhirState407
        | MDL ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState407
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState407) : 'freshtv912)
    | _ ->
        _menhir_fail ()) : 'freshtv914)) : 'freshtv916)) : 'freshtv918)

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv873) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv869) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv867) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (_2 : 'tv_reg)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 498 "imp_parser.mly"
                  ( Some _2 )
# 5308 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv868)) : 'freshtv870)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv871) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv872)) : 'freshtv874)
    | MenhirState235 | MenhirState44 | MenhirState228 | MenhirState222 | MenhirState216 | MenhirState105 | MenhirState197 | MenhirState175 | MenhirState167 | MenhirState169 | MenhirState163 | MenhirState160 | MenhirState120 | MenhirState116 | MenhirState111 | MenhirState49 | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv877 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv875 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 487 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 5327 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv876)) : 'freshtv878)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv879 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | NAM _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | PRM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv880)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv881 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | IDX_FMT_D _v ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | LINE _v ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | STG _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | S8_P ->
            _menhir_reduce188 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv882)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv887 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv883 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv884)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv885 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv886)) : 'freshtv888)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv891 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv889 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)), _, (_3 : 'tv_reg)), _, (_5 : 'tv_reg)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_src_par_p = 
# 360 "imp_parser.mly"
                            ( ([|_1|],[|_3;_5|]) )
# 5416 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv890)) : 'freshtv892)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv895 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv893 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)), _, (_3 : 'tv_src_par_p)), _, (_5 : 'tv_reg)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_src_par_p = 
# 361 "imp_parser.mly"
                                  (
      let (l0,l1) = _3 in
      ([|_1|] |+| l0,l1 |+| [|_5|]) )
# 5432 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv901 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv897 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167) : 'freshtv898)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv899 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv900)) : 'freshtv902)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv903 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState322) : 'freshtv904)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv905 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState338 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState338 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState338 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState338) : 'freshtv906)
    | _ ->
        _menhir_fail ()

and _menhir_reduce170 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 501 "imp_parser.mly"
    ( [||] )
# 5544 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv865 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5555 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv859 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv857 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 285 "imp_parser.mly"
                ( _1+1 )
# 5571 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv858)) : 'freshtv860)
    | APP | COPRD | DTA | DTA_GRM | EOF | IMP | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv861 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5579 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 5584 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5589 "imp_parser.ml"
        ) = 
# 278 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 5593 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv862)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv863 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5603 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv864)) : 'freshtv866)

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv855 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PRN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | ROT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv853 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState69 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv851 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_typs)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5642 "imp_parser.ml"
        ) = 
# 268 "imp_parser.mly"
                     ( Rcd(rcd_cl _2) )
# 5646 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv852)) : 'freshtv854)
    | SGN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TYP_STG ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | VAL _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv856)

and _menhir_goto_id_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_id_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv849 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5667 "imp_parser.ml"
    )) * _menhir_state * 'tv_id_src) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv845 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5677 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState228
        | NAM _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _v
        | PRM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState228
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228) : 'freshtv846)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv847 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5703 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv848)) : 'freshtv850)

and _menhir_reduce172 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_src = 
# 468 "imp_parser.mly"
    ( [||] )
# 5713 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_ir_ret : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ret -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv843) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ret) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv841) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
    ((let _v : 'tv_ir_lines = 
# 317 "imp_parser.mly"
           ( _1 )
# 5730 "imp_parser.ml"
     in
    _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv842)) : 'freshtv844)

and _menhir_goto_coprd_ptn_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState322 | MenhirState338 | MenhirState332 | MenhirState316 | MenhirState252 | MenhirState84 | MenhirState230 | MenhirState224 | MenhirState218 | MenhirState114 | MenhirState210 | MenhirState211 | MenhirState207 | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv837 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | NAM _v ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | SPL ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | VAL _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183) : 'freshtv838)
    | MenhirState225 | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv839 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214) : 'freshtv840)
    | _ ->
        _menhir_fail ()

and _menhir_goto_coprd_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState322 | MenhirState338 | MenhirState332 | MenhirState316 | MenhirState252 | MenhirState84 | MenhirState230 | MenhirState224 | MenhirState218 | MenhirState114 | MenhirState180 | MenhirState210 | MenhirState211 | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv833 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | NAM _v ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState209 _v
        | SPL ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | VAL _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState209 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209) : 'freshtv834)
    | MenhirState225 | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv835 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv836)
    | _ ->
        _menhir_fail ()

and _menhir_run142 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5815 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv831) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 5825 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 5829 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 484 "imp_parser.mly"
        ( ref(R_N _1) )
# 5834 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv832)

and _menhir_run143 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5841 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv829) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 5851 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 5855 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 482 "imp_parser.mly"
        ( ref(R_N _1) )
# 5860 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv830)

and _menhir_run144 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5867 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv827) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 5877 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 5881 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 483 "imp_parser.mly"
        ( ref(R_N _1) )
# 5886 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv828)

and _menhir_run266 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv825) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 207 "imp_parser.mly"
                       ( Grm.Line )
# 5900 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)

and _menhir_run267 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv823) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 202 "imp_parser.mly"
                   ( Grm.Line )
# 5914 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv824)

and _menhir_run268 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv821) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 206 "imp_parser.mly"
                      ( Grm.Synt )
# 5928 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)

and _menhir_run269 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv819) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 201 "imp_parser.mly"
                  ( Grm.Synt )
# 5942 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv820)

and _menhir_run270 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv817) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 205 "imp_parser.mly"
              ( Grm.Lex )
# 5956 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)

and _menhir_run271 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv815) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 200 "imp_parser.mly"
          ( Grm.Lex )
# 5970 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv816)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv813 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5981 "imp_parser.ml"
    )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run375 _menhir_env (Obj.magic _menhir_stack) MenhirState367
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv809 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5993 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState367 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PRN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | L_RCD ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | N ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState373 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState373 _v
        | ROT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState373 _v
        | SGN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | TYP_STG ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | VAL _v ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState373 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState373) : 'freshtv810)
    | PRD ->
        _menhir_run368 _menhir_env (Obj.magic _menhir_stack) MenhirState367
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv811 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6029 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 6034 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 238 "imp_parser.mly"
                 ( Def_Abs (_1,snd _2) )
# 6039 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv812)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState367) : 'freshtv814)

and _menhir_run359 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6050 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv803 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6062 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run359 _menhir_env (Obj.magic _menhir_stack) MenhirState360 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState360) : 'freshtv804)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv805 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6078 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 6083 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 96 "imp_parser.mly"
        (
    let v = newvar_q (-1) in
    ([v],[(_1,v)]) )
# 6090 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv806)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv807 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6100 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv808)

and _menhir_run363 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run363 _menhir_env (Obj.magic _menhir_stack) MenhirState363
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv801 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 92 "imp_parser.mly"
        ( 1 )
# 6121 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv802)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState363

and _menhir_run386 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6132 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run386 _menhir_env (Obj.magic _menhir_stack) MenhirState386 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv799 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6146 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 6151 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 246 "imp_parser.mly"
        ( [_1] )
# 6156 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv800)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState386

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv781 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv779 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 217 "imp_parser.mly"
                         ( Grm.Opn _2 )
# 6191 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)) : 'freshtv782)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv784)) : 'freshtv786)
    | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv793 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv789 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv787 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 216 "imp_parser.mly"
                         ( Grm.Lst _2 )
# 6219 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv788)) : 'freshtv790)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv791 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv792)) : 'freshtv794)
    | MenhirState345 | MenhirState272 | MenhirState328 | MenhirState324 | MenhirState275 | MenhirState299 | MenhirState301 | MenhirState295 | MenhirState286 | MenhirState288 | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv797 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv795 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 215 "imp_parser.mly"
             ( Grm.Atm _1 )
# 6238 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv796)) : 'freshtv798)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv777 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv775) = Obj.magic _menhir_stack in
    ((let _v : 'tv_nls = 
# 82 "imp_parser.mly"
    ()
# 6254 "imp_parser.ml"
     in
    _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv776)) : 'freshtv778)

and _menhir_goto_ir_ptn_cst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_cst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv773 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6264 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv771 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6272 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_ir_ptn_cst) : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 6279 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_mtc_ir_test = 
# 406 "imp_parser.mly"
                      (
    (ref(R_N _1),ref(P_Cst _3)) )
# 6286 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv772)) : 'freshtv774)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv769) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 453 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 6300 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv770)

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6307 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv767) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 6317 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 6321 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 450 "imp_parser.mly"
        ( ref(R_N _1) )
# 6326 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv768)

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6333 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv765) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 6343 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 6347 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 448 "imp_parser.mly"
        ( ref(R_N _1) )
# 6352 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv766)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6359 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv763) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 6369 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 6373 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 449 "imp_parser.mly"
        ( ref(R_N _1) )
# 6378 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv764)

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
    | WC ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | OP | R_RCD ->
        _menhir_reduce172 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92

and _menhir_reduce188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_s8_ptn = 
# 366 "imp_parser.mly"
    ( [] )
# 6410 "imp_parser.ml"
     in
    _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6417 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | IDX_FMT_D _v ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | LINE _v ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | STG _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | S8_P ->
        _menhir_reduce188 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127

and _menhir_run128 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6446 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
    | IDX_FMT_D _v ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
    | LINE _v ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
    | STG _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
    | S8_P ->
        _menhir_reduce188 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 6475 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | IDX_FMT_D _v ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | LINE _v ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | STG _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | S8_P ->
        _menhir_reduce188 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129

and _menhir_run130 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 6504 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
    | IDX_FMT_D _v ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
    | LINE _v ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
    | MLT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv761 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 6522 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState130 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv757 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 6534 "imp_parser.ml"
            )) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 6539 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDX _v ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
            | IDX_FMT_D _v ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
            | LINE _v ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
            | STG _v ->
                _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
            | S8_P ->
                _menhir_reduce188 _menhir_env (Obj.magic _menhir_stack) MenhirState132
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132) : 'freshtv758)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv759 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 6570 "imp_parser.ml"
            )) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv760)) : 'freshtv762)
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
    | STG _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
    | S8_P ->
        _menhir_reduce188 _menhir_env (Obj.magic _menhir_stack) MenhirState130
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6590 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv709 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6600 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv707 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6614 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState72 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv705 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6622 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6628 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6635 "imp_parser.ml"
            ) = 
# 267 "imp_parser.mly"
                    ( _2 )
# 6639 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv706)) : 'freshtv708)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72) : 'freshtv710)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv713 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6651 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6655 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | APP | COPRD | DTA | DTA_GRM | EOF | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv711 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6667 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6671 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6676 "imp_parser.ml"
            ))), _), _, (_3 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6680 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6686 "imp_parser.ml"
            ) = 
# 279 "imp_parser.mly"
                 ( Imp(_1,_3) )
# 6690 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv712)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv714)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv717 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6702 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6706 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | APP | COPRD | DTA | DTA_GRM | EOF | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv715 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6718 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6722 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6727 "imp_parser.ml"
            ))), _), _, (_3 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6731 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6737 "imp_parser.ml"
            ) = 
# 270 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 6741 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv716)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv718)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv721 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6753 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | L_PRN | L_RCD | N | NAM _ | PRM _ | ROT _ | R_RCD | SGN | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv719 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6767 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : 'tv_typs)), _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6772 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 264 "imp_parser.mly"
             ( _1@[_2] )
# 6777 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv720)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv722)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv725) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6789 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv723) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6803 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState80 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv724)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv726)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv731) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6841 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6845 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv729) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6859 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6863 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState82 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv727) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6871 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6875 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6881 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6885 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 550 "imp_parser.mly"
                        ( (_2,_4) )
# 6893 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv728)) : 'freshtv730)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv732)
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv739 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6905 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6909 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv733 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6923 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6927 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState248 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState250
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState250
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState250
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState250 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState250 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState250 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState250
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState250
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState250 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState250) : 'freshtv734)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv737 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6961 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6965 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState248 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv735 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6973 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6977 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6983 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6987 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 294 "imp_parser.mly"
                            ( Ast.Etr_Out_Abs(_2,_4) )
# 6995 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)) : 'freshtv738)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState248) : 'freshtv740)
    | MenhirState250 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv743 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7007 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7011 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7015 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState251
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState251
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv741 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7029 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7033 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7037 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 7042 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7046 "imp_parser.ml"
            ))), _), _, (_6 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7050 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 292 "imp_parser.mly"
                            (
    Ast.Etr_Abs(_2,_4,_6) )
# 7059 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv742)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState251) : 'freshtv744)
    | MenhirState370 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv747 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7071 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7075 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState371
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState371
        | PRD ->
            _menhir_run368 _menhir_env (Obj.magic _menhir_stack) MenhirState371
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv745 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7091 "imp_parser.ml"
            ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7095 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 7100 "imp_parser.ml"
            ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7104 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_prd = 
# 254 "imp_parser.mly"
                     ( [(_4,_2)] )
# 7111 "imp_parser.ml"
             in
            _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv746)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState371) : 'freshtv748)
    | MenhirState373 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv751 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7123 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7127 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState374
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState374
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv749 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7141 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7145 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 7150 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7154 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 243 "imp_parser.mly"
                        ( Def_EqT (_1,snd _2,_4) )
# 7160 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv750)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState374) : 'freshtv752)
    | MenhirState377 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv755 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7172 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7176 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState378
        | COPRD ->
            _menhir_run375 _menhir_env (Obj.magic _menhir_stack) MenhirState378
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState378
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv753 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7192 "imp_parser.ml"
            ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7196 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 7201 "imp_parser.ml"
            ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7205 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 250 "imp_parser.mly"
                      ( [(_4,_2)] )
# 7212 "imp_parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv754)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState378) : 'freshtv756)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv699 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv697 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState11 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv695 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 581 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 7260 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)) : 'freshtv698)
        | STG _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv700)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv703 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : 'freshtv701 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 553 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 7298 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv702)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv704)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState20 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv665 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            _menhir_reduce129 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv666)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv669 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv667 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 578 "imp_parser.mly"
                ( App(_1,_3) )
# 7352 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv668)) : 'freshtv670)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv675 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv673 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState24 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv671 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 586 "imp_parser.mly"
                    ( App(Name(ref(Stt_Axm Ast.Axm._some)),_2) )
# 7377 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv672)) : 'freshtv674)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv676)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv681 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv679 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState26 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv677 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 575 "imp_parser.mly"
                    ( _2 )
# 7406 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv678)) : 'freshtv680)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv682)
    | MenhirState34 | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv685 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | EOF | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | PRM _ | R64 _ | R_RCD | STG _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv683 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 560 "imp_parser.mly"
                 ( _1@[_2] )
# 7428 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv686)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv689 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv687 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 556 "imp_parser.mly"
            ( _2 )
# 7451 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv690)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv693 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv691 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState157 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | NAM _v ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | PRM _v ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | REG _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | WC ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158) : 'freshtv692)
        | L_RCD ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | NAM _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
        | PRM _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
        | REG _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
        | WC ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157) : 'freshtv694)
    | _ ->
        _menhir_fail ()

and _menhir_reduce129 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 590 "imp_parser.mly"
    ( App(Name(ref(Stt_Axm Ast.Axm._nil)),Rcd [||]) )
# 7510 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7517 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv659) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7528 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv657) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7536 "imp_parser.ml"
        )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7540 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv658)) : 'freshtv660)
    | MenhirState407 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv663 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7550 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv661 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7558 "imp_parser.ml"
        )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7562 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7568 "imp_parser.ml"
        ) = 
# 63 "imp_parser.mly"
                 (
    let ms = _2 in
    _1::ms )
# 7574 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv662)) : 'freshtv664)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState394 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv629 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv627 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), (_2 : 'tv_nls)), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 106 "imp_parser.mly"
                            ( _1::_3 )
# 7593 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv628)) : 'freshtv630)
    | MenhirState38 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv641 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7601 "imp_parser.ml"
        )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv633) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv631) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 74 "imp_parser.mly"
            ()
# 7616 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv632)) : 'freshtv634)
        | MDL_EOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv637) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv635) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 75 "imp_parser.mly"
            ()
# 7629 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv636)) : 'freshtv638)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv639 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7639 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv640)) : 'freshtv642)
    | MenhirState409 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv655 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv651 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv649 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7659 "imp_parser.ml"
            ) = 
# 68 "imp_parser.mly"
                   ( _1 )
# 7663 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv647) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7671 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv645) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7679 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv643) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7687 "imp_parser.ml"
            )) : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7691 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv644)) : 'freshtv646)) : 'freshtv648)) : 'freshtv650)) : 'freshtv652)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv653 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv654)) : 'freshtv656)
    | _ ->
        _menhir_fail ()

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7707 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv623 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7719 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv621) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState43 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 7731 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv622)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv624)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv625 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7762 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv626)

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv619) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg = 
# 476 "imp_parser.mly"
       ( ref(R_Ax(R_WC (sgn ()))) )
# 7777 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7784 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv617) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7794 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7798 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg = 
# 479 "imp_parser.mly"
        ( ref(R_N _1) )
# 7803 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv618)

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7810 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv615) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7820 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7824 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg = 
# 478 "imp_parser.mly"
        ( ref(R_N _1) )
# 7829 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv616)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7836 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv613) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7846 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7850 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg = 
# 477 "imp_parser.mly"
        ( ref(R_N _1) )
# 7855 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv614)

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | NAM _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | PRM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | OP | R_RCD ->
        _menhir_reduce170 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_goto_eq_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eq_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv611 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7888 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_eq_def) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv609 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7896 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_4 : 'tv_eq_def) : 'tv_eq_def) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 7903 "imp_parser.ml"
    ))), _) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_glb_etr = 
# 295 "imp_parser.mly"
                      ( Ast.Etr_Eq(_2,_4) )
# 7910 "imp_parser.ml"
     in
    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv610)) : 'freshtv612)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7917 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv607) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7927 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7931 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7936 "imp_parser.ml"
    ) = 
# 274 "imp_parser.mly"
        ( Var(ref(N_Ln (EndN _1,Axm Lang.Types.Axm.v))) )
# 7940 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv608)

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv605) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7954 "imp_parser.ml"
    ) = 
# 281 "imp_parser.mly"
            ( Axm Lang.Types.Axm.stg )
# 7958 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv606)

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv603) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7972 "imp_parser.ml"
    ) = 
# 280 "imp_parser.mly"
        ( Axm Lang.Types.Axm.sgn_p )
# 7976 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7983 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv601) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 284 "imp_parser.mly"
    ( 0 )
# 7993 "imp_parser.ml"
     in
    _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv602)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv599) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 8007 "imp_parser.ml"
    ) = 
# 277 "imp_parser.mly"
      ( Axm Lang.Types.Axm.nat )
# 8011 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv600)

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv597) = Obj.magic _menhir_stack in
    ((let _v : 'tv_typs = 
# 263 "imp_parser.mly"
    ( [] )
# 8024 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv598)

and _menhir_run71 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PRN ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | ROT _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | SGN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | TYP_STG ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | VAL _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 8060 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv591) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState85 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | NAM _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
        | PRM _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
        | REG _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
        | WC ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | OP | R_RCD ->
            _menhir_reduce172 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv592)
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | WC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv595) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState85 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv593) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : 'tv_id_src = 
# 339 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 8109 "imp_parser.ml"
         in
        _menhir_goto_id_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)) : 'freshtv596)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run115 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | PRM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState115
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115

and _menhir_run119 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv589) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ir_ret = 
# 314 "imp_parser.mly"
            ( Exn (ref(R_Ax(R_A(Util.sgn ())))) )
# 8146 "imp_parser.ml"
     in
    _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv590)

and _menhir_run120 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | NAM _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | PRM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120

and _menhir_run106 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv587) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 537 "imp_parser.mly"
                  ()
# 8181 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)

and _menhir_run107 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv585) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 533 "imp_parser.mly"
              ()
# 8195 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv583) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 538 "imp_parser.mly"
              ()
# 8209 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)

and _menhir_run109 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv581) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 534 "imp_parser.mly"
          ()
# 8223 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv582)

and _menhir_run122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
    | R64 _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
    | S8_E ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv579 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | PRM _v ->
            _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | REG _v ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | WC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv577 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState123 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv573 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
                | PRM _v ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
                | REG _v ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
                | WC ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState125
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv574)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv575 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv576)) : 'freshtv578)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv580)
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122

and _menhir_run165 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
    | PRM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState165
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv571) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 113 "imp_parser.mly"
            ( _1 )
# 8337 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)

and _menhir_run263 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 8344 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv565 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8356 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv561 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8366 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8371 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | COPRD_END ->
                _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | ORD_LEX_COPRD ->
                _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | ORD_LEX_COPRD_END ->
                _menhir_run268 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | ORD_LINE_COPRD ->
                _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | ORD_LINE_COPRD_END ->
                _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState265) : 'freshtv562)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv563 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8400 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv564)) : 'freshtv566)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8411 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv568)

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv559) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv557) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 114 "imp_parser.mly"
            ( _1 )
# 8429 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv558)) : 'freshtv560)

and _menhir_run356 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 8436 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv553 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8448 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run383 _menhir_env (Obj.magic _menhir_stack) MenhirState357
        | NAM _v ->
            _menhir_run358 _menhir_env (Obj.magic _menhir_stack) MenhirState357 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState357) : 'freshtv554)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv555 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8468 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv556)

and _menhir_run358 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 8476 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState358 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run363 _menhir_env (Obj.magic _menhir_stack) MenhirState362
        | VAL _v ->
            _menhir_run359 _menhir_env (Obj.magic _menhir_stack) MenhirState362 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState362) : 'freshtv550)
    | VAL _v ->
        _menhir_run359 _menhir_env (Obj.magic _menhir_stack) MenhirState358 _v
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv551) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState358 in
        ((let _v : 'tv_def_arg = 
# 86 "imp_parser.mly"
    ( ([],[]) )
# 8508 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState358

and _menhir_run383 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv545 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8528 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv541 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8539 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run386 _menhir_env (Obj.magic _menhir_stack) MenhirState385 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState385) : 'freshtv542)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv543 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8557 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv544)) : 'freshtv546)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv547 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv548)

and _menhir_goto_name : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8572 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv475 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8582 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8586 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv473 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8592 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8596 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 8601 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8605 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8611 "imp_parser.ml"
        ) = 
# 57 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 8615 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv474)) : 'freshtv476)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv479 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8623 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8627 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv477 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8633 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8637 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 8642 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8646 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8652 "imp_parser.ml"
        ) = 
# 58 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 8656 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)) : 'freshtv480)
    | MenhirState122 | MenhirState34 | MenhirState1 | MenhirState11 | MenhirState13 | MenhirState14 | MenhirState20 | MenhirState21 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv483 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8664 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv481 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8670 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8675 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 573 "imp_parser.mly"
          ( Name(ref(Ast.Stt_Name _1)) )
# 8680 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv482)) : 'freshtv484)
    | MenhirState377 | MenhirState373 | MenhirState370 | MenhirState247 | MenhirState250 | MenhirState60 | MenhirState81 | MenhirState69 | MenhirState71 | MenhirState77 | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv487 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8688 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv485 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8694 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8699 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 8704 "imp_parser.ml"
        ) = 
# 275 "imp_parser.mly"
         ( Var(ref(N _1)) )
# 8708 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
    | MenhirState145 | MenhirState126 | MenhirState127 | MenhirState128 | MenhirState129 | MenhirState130 | MenhirState134 | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv489 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8716 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | IDX_FMT_D _v ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | LINE _v ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | STG _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | S8_P ->
            _menhir_reduce188 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134) : 'freshtv490)
    | MenhirState338 | MenhirState332 | MenhirState322 | MenhirState316 | MenhirState252 | MenhirState84 | MenhirState230 | MenhirState224 | MenhirState218 | MenhirState210 | MenhirState207 | MenhirState180 | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv491 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8744 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | NAM _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
        | PRM _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
        | REG _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
        | WC ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171) : 'freshtv492)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv495 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8768 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv493 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8774 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8779 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_ir_ptn_cst = 
# 416 "imp_parser.mly"
         ( P_N(ref(Ast.Stt_Name _1)) )
# 8784 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv494)) : 'freshtv496)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv501 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8792 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8796 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv497 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8806 "imp_parser.ml"
            ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8810 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState197
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState197
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197) : 'freshtv498)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv499 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8836 "imp_parser.ml"
            ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8840 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv500)) : 'freshtv502)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv507 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8849 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv503 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8859 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216) : 'freshtv504)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv505 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8885 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv506)) : 'freshtv508)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv513 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8894 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv509 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8904 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | NAM _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
            | PRM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222) : 'freshtv510)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv511 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8930 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv512)) : 'freshtv514)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv517 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8939 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8945 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8950 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_eq_def = 
# 299 "imp_parser.mly"
         ( EqLn _1 )
# 8955 "imp_parser.ml"
         in
        _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)) : 'freshtv518)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv521 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8963 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8967 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv519 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8973 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8977 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 8982 "imp_parser.ml"
        ))), _), _, (_4 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8986 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_mdl_etr = 
# 117 "imp_parser.mly"
                    ( Mdl_Eq(_2,_4) )
# 8993 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)) : 'freshtv522)
    | MenhirState345 | MenhirState328 | MenhirState324 | MenhirState272 | MenhirState299 | MenhirState301 | MenhirState295 | MenhirState288 | MenhirState289 | MenhirState286 | MenhirState275 | MenhirState282 | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv525 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9001 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv523 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9007 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9012 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_grm_atom = 
# 221 "imp_parser.mly"
         ( Grm.Name _1 )
# 9017 "imp_parser.ml"
         in
        _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv524)) : 'freshtv526)
    | MenhirState413 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv539 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9025 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv535 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9035 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv533 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9041 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9046 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 9052 "imp_parser.ml"
            ) = 
# 52 "imp_parser.mly"
             ( _1 )
# 9056 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv531) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 9064 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv529) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 9072 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv527) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 37 "imp_parser.mly"
      (Lang.name)
# 9080 "imp_parser.ml"
            )) : (
# 37 "imp_parser.mly"
      (Lang.name)
# 9084 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv528)) : 'freshtv530)) : 'freshtv532)) : 'freshtv534)) : 'freshtv536)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv537 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9094 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)) : 'freshtv540)
    | _ ->
        _menhir_fail ()

and _menhir_reduce146 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9104 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 9110 "imp_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9115 "imp_parser.ml"
    ) = 
# 55 "imp_parser.mly"
        ( (EndN _1) )
# 9119 "imp_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9126 "imp_parser.ml"
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

and _menhir_reduce50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 559 "imp_parser.mly"
    ( [] )
# 9146 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 9153 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv471) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 9163 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 9167 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 574 "imp_parser.mly"
        ( ExpCst(Cst.S8 _1) )
# 9172 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv472)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "imp_parser.mly"
       (int64)
# 9179 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv469) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 9189 "imp_parser.ml"
    )) : (
# 20 "imp_parser.mly"
       (int64)
# 9193 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 576 "imp_parser.mly"
        ( ExpCst(Cst.R64 _1) )
# 9198 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv470)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState10

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
        let (_menhir_stack : 'freshtv467 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState14 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv465 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 585 "imp_parser.mly"
                ( App(Name(ref(Stt_Axm Ast.Axm._none)),Rcd [||]) )
# 9269 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv466)) : 'freshtv468)
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
        _menhir_reduce129 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 9311 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv463) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 9320 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv461) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 9328 "imp_parser.ml"
    )) : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 9332 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv462)) : 'freshtv464)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv457 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9348 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run355 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | DTA_GRM ->
            _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LCE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL_END | MDL_EOP ->
            _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv458)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv459 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv460)

and _menhir_run405 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv455) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 9385 "imp_parser.ml"
    ) = 
# 61 "imp_parser.mly"
        ( [] )
# 9389 "imp_parser.ml"
     in
    _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv456)

and _menhir_reduce57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 105 "imp_parser.mly"
      ( [] )
# 9398 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9414 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run355 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | DTA_GRM ->
            _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv449 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9429 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState40 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState260) : 'freshtv450)
        | LCE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MDL ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MDL_END | MDL_EOP ->
            _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv452)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv453 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState41 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9482 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv399 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9493 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | WC ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv395 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9503 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv393 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9510 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 9515 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : 'tv_glb_etr = 
# 288 "imp_parser.mly"
                       ( Mdl_Ln(false,_3) )
# 9524 "imp_parser.ml"
                     in
                    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)) : 'freshtv396)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv397 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9534 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv398)) : 'freshtv400)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv401 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9545 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv402)) : 'freshtv404)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv405 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)) : 'freshtv408)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv447 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState41 in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9563 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR_REV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv409 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9574 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState235 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | ARR ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | COPRD ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | COPRD_END ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | COPRD_PTN ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | COPRD_PTN_END ->
                _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | EOP ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | EOP_EXN ->
                _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
            | OUT_IR ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState252
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
            | ROT _v ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState252) : 'freshtv410)
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv411 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9614 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState235 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState247) : 'freshtv412)
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv419 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9648 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState235 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | WC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv415 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9660 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv413 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9667 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 9672 "imp_parser.ml"
                ))), _) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_glb_etr = 
# 289 "imp_parser.mly"
                   ( Mdl_Ln(true,_2) )
# 9680 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv417 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9690 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv418)) : 'freshtv420)
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv445 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9699 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState235 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ENV ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState236 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDX _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv423 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 19 "imp_parser.mly"
       (int)
# 9720 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv421 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 19 "imp_parser.mly"
       (int)
# 9728 "imp_parser.ml"
                    )) : (
# 19 "imp_parser.mly"
       (int)
# 9732 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 304 "imp_parser.mly"
            ( ExStgArg _2 )
# 9739 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv422)) : 'freshtv424)
                | STG _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv427 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9748 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv425 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 18 "imp_parser.mly"
       (string)
# 9756 "imp_parser.ml"
                    )) : (
# 18 "imp_parser.mly"
       (string)
# 9760 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 303 "imp_parser.mly"
            ( ExStg _2 )
# 9767 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)) : 'freshtv428)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv429 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)) : 'freshtv432)
            | IDX _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv435) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState236 in
                let (_v : (
# 19 "imp_parser.mly"
       (int)
# 9784 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv433) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 19 "imp_parser.mly"
       (int)
# 9793 "imp_parser.ml"
                )) : (
# 19 "imp_parser.mly"
       (int)
# 9797 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 302 "imp_parser.mly"
        ( SttArg _1 )
# 9802 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)) : 'freshtv436)
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v
            | R64 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv439) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState236 in
                let (_v : (
# 20 "imp_parser.mly"
       (int64)
# 9816 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv437) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 9825 "imp_parser.ml"
                )) : (
# 20 "imp_parser.mly"
       (int64)
# 9829 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 301 "imp_parser.mly"
        ( Cst(Cst.R64 _1) )
# 9834 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)) : 'freshtv440)
            | STG _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv443) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState236 in
                let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9844 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv441) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 9853 "imp_parser.ml"
                )) : (
# 18 "imp_parser.mly"
       (string)
# 9857 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 300 "imp_parser.mly"
        ( Cst(Cst.S8 _1) )
# 9862 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)) : 'freshtv444)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState236) : 'freshtv446)
        | L_RCD ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState235
        | NAM _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState235 _v
        | PRM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState235 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState235 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState235
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState235) : 'freshtv448)
    | SLF _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run262 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState262 in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9903 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 18 "imp_parser.mly"
       (string)
# 9912 "imp_parser.ml"
        )) : (
# 18 "imp_parser.mly"
       (string)
# 9916 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 123 "imp_parser.mly"
                ( Grm_Abs _2 )
# 9923 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)) : 'freshtv392)
    | SLF _v ->
        _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState262

and _menhir_run355 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run383 _menhir_env (Obj.magic _menhir_stack) MenhirState355
    | NAM _v ->
        _menhir_run358 _menhir_env (Obj.magic _menhir_stack) MenhirState355 _v
    | SLF _v ->
        _menhir_run356 _menhir_env (Obj.magic _menhir_stack) MenhirState355 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState355

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState413 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv28)
    | MenhirState409 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv30)
    | MenhirState407 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState394 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState389 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9976 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState386 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9985 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState385 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9994 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState378 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10003 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10007 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState377 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10016 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState374 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10025 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10029 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState373 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10038 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState371 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv49 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10047 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10051 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState370 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10060 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState367 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10069 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState363 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState360 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10088 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState358 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10097 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState357 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10106 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState352 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState348 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv69 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState347 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState346 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv73 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState345 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState341 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState339 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv79 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState338 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv81 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv83 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState335 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv85 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState334 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState332 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv89 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState331 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv91 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState329 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState327 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv99 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState326 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState325 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((((('freshtv107 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((((('freshtv109 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv111 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState319 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv113 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState318 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv115 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv117 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv119 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState314 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState309 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState306 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv131 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10280 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv133 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10289 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState301 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv135 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10298 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv139 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState295 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState294 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv147 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10332 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149 * _menhir_state * 'tv_grm_ptn) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv155 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10356 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState275 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv161 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10375 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState272 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10389 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 10393 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv167 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10407 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv171 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10416 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState251 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv173 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10425 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10429 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10433 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState250 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv175 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10442 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10446 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv177 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10455 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10459 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10468 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10477 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10486 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10495 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv187 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10504 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState229 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv189 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10513 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv191 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10522 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv193 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10531 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv195 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10540 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv197 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10549 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv199 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10558 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv203 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10572 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv205 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10581 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv207 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10590 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv211 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv217 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv225 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10639 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10643 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10652 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10661 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv235 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10680 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv237 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10689 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv239 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv241 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv245 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv247 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv249 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv251 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv253 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv257 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv261 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv263 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10758 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv265 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10767 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10771 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10780 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10789 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10798 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10807 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv275 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv277 * _menhir_state) * _menhir_state) * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv279 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv285 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv289 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10851 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv295 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10870 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv297 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10879 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv299 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv303 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10918 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv313 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10927 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv315) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10936 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10940 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv317) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10949 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv319) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10958 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10967 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv323 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10976 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10980 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10989 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv327 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10998 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 11002 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv329 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 11011 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 11020 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv335 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv338)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv339 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv342)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv343 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv345 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 11057 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv347 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 11066 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv349 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv351 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 11080 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv352)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv353 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 11089 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv354)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv355) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv356)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv359 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv360)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv361 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv362)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv363 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv365 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv367 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv368)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv370)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv372)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv374)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv377 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv380)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv381 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 11162 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv383 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 11171 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv384)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv388)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 11188 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 11200 "imp_parser.ml"
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
    | APP | BYTE | COPRD | COPRD_END | CUT | DOT_END | DTA | DTA_GRM | EOF | EXP | IDX _ | IDX_FMT_D _ | IMP | INI_IR | LCE | LINE _ | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | MLT | N | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRD | PRM _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | S8_P | SCL | SGN | SLF _ | SPL | SRC | SRC_OUT | STG _ | TYP_STG | VAL _ | WC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 11218 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 11223 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 11228 "imp_parser.ml"
        ) = 
# 56 "imp_parser.mly"
        ( EndN _1 )
# 11232 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 11242 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 11250 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | APP | BYTE | COPRD | COPRD_END | CUT | DOT_END | DTA | DTA_GRM | EOF | EXP | IDX _ | IDX_FMT_D _ | IMP | INI_IR | LCE | LINE _ | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | MLT | N | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRD | PRM _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | S8_P | SCL | SGN | SLF _ | SPL | SRC | SRC_OUT | STG _ | TYP_STG | VAL _ | WC ->
        _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 11268 "imp_parser.ml"
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
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 11298 "imp_parser.ml"
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
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 11326 "imp_parser.ml"
            ) = 
# 49 "imp_parser.mly"
                ( End )
# 11330 "imp_parser.ml"
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
        _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv18))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 11378 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run405 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MDL ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv6))

and file_top : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 11399 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run355 _menhir_env (Obj.magic _menhir_stack) MenhirState409
    | DTA_GRM ->
        _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState409
    | LCE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState409
    | MDL ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState409
    | EOF ->
        _menhir_reduce57 _menhir_env (Obj.magic _menhir_stack) MenhirState409
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState409) : 'freshtv4))

and name_eof : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 37 "imp_parser.mly"
      (Lang.name)
# 11426 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState413 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState413 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState413) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 11447 "imp_parser.ml"
