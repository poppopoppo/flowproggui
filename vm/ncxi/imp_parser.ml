
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
    | IDX of (
# 19 "imp_parser.mly"
       (int)
# 157 "imp_parser.ml"
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
# 190 "imp_parser.ml"
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
# 202 "imp_parser.ml"
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
  | MenhirState404
  | MenhirState400
  | MenhirState398
  | MenhirState385
  | MenhirState380
  | MenhirState377
  | MenhirState376
  | MenhirState370
  | MenhirState369
  | MenhirState366
  | MenhirState365
  | MenhirState363
  | MenhirState362
  | MenhirState359
  | MenhirState355
  | MenhirState353
  | MenhirState351
  | MenhirState349
  | MenhirState347
  | MenhirState344
  | MenhirState340
  | MenhirState339
  | MenhirState338
  | MenhirState337
  | MenhirState333
  | MenhirState331
  | MenhirState330
  | MenhirState329
  | MenhirState328
  | MenhirState326
  | MenhirState325
  | MenhirState324
  | MenhirState323
  | MenhirState322
  | MenhirState321
  | MenhirState320
  | MenhirState319
  | MenhirState318
  | MenhirState317
  | MenhirState316
  | MenhirState315
  | MenhirState314
  | MenhirState312
  | MenhirState311
  | MenhirState310
  | MenhirState309
  | MenhirState305
  | MenhirState302
  | MenhirState301
  | MenhirState299
  | MenhirState298
  | MenhirState297
  | MenhirState295
  | MenhirState293
  | MenhirState292
  | MenhirState291
  | MenhirState290
  | MenhirState289
  | MenhirState285
  | MenhirState284
  | MenhirState282
  | MenhirState281
  | MenhirState278
  | MenhirState273
  | MenhirState271
  | MenhirState268
  | MenhirState260
  | MenhirState257
  | MenhirState255
  | MenhirState247
  | MenhirState246
  | MenhirState245
  | MenhirState243
  | MenhirState242
  | MenhirState231
  | MenhirState230
  | MenhirState228
  | MenhirState225
  | MenhirState224
  | MenhirState223
  | MenhirState220
  | MenhirState219
  | MenhirState218
  | MenhirState217
  | MenhirState215
  | MenhirState213
  | MenhirState212
  | MenhirState211
  | MenhirState209
  | MenhirState206
  | MenhirState205
  | MenhirState204
  | MenhirState202
  | MenhirState197
  | MenhirState196
  | MenhirState195
  | MenhirState192
  | MenhirState190
  | MenhirState180
  | MenhirState178
  | MenhirState175
  | MenhirState170
  | MenhirState166
  | MenhirState164
  | MenhirState162
  | MenhirState160
  | MenhirState158
  | MenhirState155
  | MenhirState153
  | MenhirState152
  | MenhirState150
  | MenhirState148
  | MenhirState146
  | MenhirState144
  | MenhirState140
  | MenhirState133
  | MenhirState131
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
  | MenhirState51
  | MenhirState48
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

# 408 "imp_parser.ml"

let rec _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1505 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1503 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 167 "imp_parser.mly"
                     ( _1::_2 )
# 426 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1504)) : 'freshtv1506)
    | MenhirState340 | MenhirState314 | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1509 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1507 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_rule_seq = 
# 185 "imp_parser.mly"
                ( Some _2 )
# 443 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1508)) : 'freshtv1510)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1513 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 451 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 455 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1511 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 463 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 467 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 474 "imp_parser.ml"
        ))), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 478 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 135 "imp_parser.mly"
                        (
    Lang.Grm.Cnc(_3,_4) )
# 485 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1512)) : 'freshtv1514)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_rule : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1501 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState305
    | COPRD_END ->
        _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState305
    | ORD_LEX_COPRD ->
        _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState305
    | ORD_LEX_COPRD_END ->
        _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState305
    | ORD_LINE_COPRD ->
        _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState305
    | ORD_LINE_COPRD_END ->
        _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState305
    | SYNT_COPRD ->
        _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState305
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState305) : 'freshtv1502)

and _menhir_goto_grm_rule_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1499) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1497) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_end) : 'tv_grm_rule_end) = _v in
    ((let _v : 'tv_grm_ord = 
# 166 "imp_parser.mly"
                 ( [_1] )
# 531 "imp_parser.ml"
     in
    _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1498)) : 'freshtv1500)

and _menhir_goto_grm_rule_seq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_seq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState310 | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1483 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1481 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule_end = 
# 188 "imp_parser.mly"
                                          (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,_3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2,_3) )
# 554 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1482)) : 'freshtv1484)
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1487 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 562 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1485 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 570 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 577 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule = 
# 169 "imp_parser.mly"
                                              (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,_5,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4,_5) )
# 586 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1486)) : 'freshtv1488)
    | MenhirState339 | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1491 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1489 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule = 
# 174 "imp_parser.mly"
                                      (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,_3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2,_3) )
# 605 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1490)) : 'freshtv1492)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1495 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 613 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1493 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 621 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 628 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule_end = 
# 193 "imp_parser.mly"
                                                  (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,_5,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4,_5) )
# 637 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1494)) : 'freshtv1496)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState344 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1469 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1467 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 129 "imp_parser.mly"
                    ( _1::_2 )
# 659 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1468)) : 'freshtv1470)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1479 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1477 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 676 "imp_parser.ml"
        ) = 
# 125 "imp_parser.mly"
                    ( _2 )
# 680 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1475) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 688 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1473) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 696 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1471) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 704 "imp_parser.ml"
        )) : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 708 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 121 "imp_parser.mly"
            ( Gram _1 )
# 713 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1472)) : 'freshtv1474)) : 'freshtv1476)) : 'freshtv1478)) : 'freshtv1480)
    | _ ->
        _menhir_fail ()

and _menhir_run325 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState325
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState325 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState325 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState325 _v
    | WC ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState325
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState325

and _menhir_run329 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState329
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState329 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState329 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState329 _v
    | WC ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState329
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState329

and _menhir_run311 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState311
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
    | WC ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState311
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState311

and _menhir_run315 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state -> _menhir_state -> 'ttv_return =
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

and _menhir_reduce97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_rule_seq = 
# 184 "imp_parser.mly"
    ( None )
# 808 "imp_parser.ml"
     in
    _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v

and _menhir_run290 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | COPRD_END ->
        _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | ORD_LEX_COPRD ->
        _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | ORD_LEX_COPRD_END ->
        _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | ORD_LINE_COPRD ->
        _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | ORD_LINE_COPRD_END ->
        _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | SYNT_COPRD ->
        _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState290

and _menhir_goto_grm_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1465 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run258 _menhir_env (Obj.magic _menhir_stack) MenhirState344 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1463 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 128 "imp_parser.mly"
            ( [_1] )
# 854 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1464)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState344) : 'freshtv1466)

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1439 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 871 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState289
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SLF _ | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState289
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState289) : 'freshtv1440)
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1441 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SLF _ | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState293) : 'freshtv1442)
    | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1443 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 903 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState299
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState299
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState299) : 'freshtv1444)
    | MenhirState301 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1445 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState302) : 'freshtv1446)
    | MenhirState309 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1449 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1447 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState310 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | COPRD_END ->
                _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | ORD_LEX_COPRD ->
                _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | ORD_LEX_COPRD_END ->
                _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | ORD_LINE_COPRD ->
                _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | ORD_LINE_COPRD_END ->
                _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | SRC ->
                _menhir_run315 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | SYNT_COPRD ->
                _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState314) : 'freshtv1448)
        | SRC ->
            _menhir_run311 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState310) : 'freshtv1450)
    | MenhirState319 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1453 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1451 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState320 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                _menhir_run315 _menhir_env (Obj.magic _menhir_stack) MenhirState321
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState321) : 'freshtv1452)
        | SRC ->
            _menhir_run311 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState320) : 'freshtv1454)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1457 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1455 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState324 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                _menhir_run329 _menhir_env (Obj.magic _menhir_stack) MenhirState328
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState328) : 'freshtv1456)
        | SRC ->
            _menhir_run325 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState324) : 'freshtv1458)
    | MenhirState338 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1461 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1459 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState339 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState340
            | COPRD_END ->
                _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState340
            | ORD_LEX_COPRD ->
                _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState340
            | ORD_LEX_COPRD_END ->
                _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState340
            | ORD_LINE_COPRD ->
                _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState340
            | ORD_LINE_COPRD_END ->
                _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState340
            | SRC ->
                _menhir_run329 _menhir_env (Obj.magic _menhir_stack) MenhirState340
            | SYNT_COPRD ->
                _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState340
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState340) : 'freshtv1460)
        | SRC ->
            _menhir_run325 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState339) : 'freshtv1462)
    | _ ->
        _menhir_fail ()

and _menhir_reduce81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_prd = 
# 226 "imp_parser.mly"
    ( None )
# 1074 "imp_parser.ml"
     in
    _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run282 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | L_LST ->
        _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | L_OPN ->
        _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | MLT ->
        _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
    | STG _v ->
        _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
    | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
        _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState282
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState282

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1433 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1431 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_regs)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 542 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 1119 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1432)) : 'freshtv1434)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1435 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1127 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState114
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv1436)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1437 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1165 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState225 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState225
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState225 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState225 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState225) : 'freshtv1438)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState333 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1417 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1415 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule_act)) = _menhir_stack in
        let _v : 'tv_grm_ord_act = 
# 140 "imp_parser.mly"
                             ( _1::_2 )
# 1217 "imp_parser.ml"
         in
        _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1416)) : 'freshtv1418)
    | MenhirState331 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1421 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1419 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_8 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _), _, (_6 : 'tv_reg_ptn_src)), _, (_7 : 'tv_ir_lines)) = _menhir_stack in
        let _5 = () in
        let _4 = () in
        let _v : 'tv_grm_rule_act = 
# 143 "imp_parser.mly"
                                                                  (
    Grm.Act_Seq((sgn (),sgn (),sgn(),(_6,ref _7)),_1,_2,_3,_8)
  )
# 1237 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1420)) : 'freshtv1422)
    | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1425 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1423 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_8 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _), _, (_6 : 'tv_reg_ptn_src)), _, (_7 : 'tv_ir_lines)) = _menhir_stack in
        let _5 = () in
        let _4 = () in
        let _v : 'tv_grm_rule_act_end = 
# 151 "imp_parser.mly"
                                                                      (
    Grm.Act_Seq((sgn (),sgn (),sgn(),(_6,ref _7)),_1,_2,_3,_8)
  )
# 1257 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1424)) : 'freshtv1426)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1429 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1265 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 1269 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1427 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1277 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 1281 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1288 "imp_parser.ml"
        ))), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 1292 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 132 "imp_parser.mly"
                            (
    Lang.Grm.Act(_3,_4)
  )
# 1300 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1428)) : 'freshtv1430)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_eq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_eq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1411 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState202
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202) : 'freshtv1412)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1413 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv1414)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1401 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1399 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_mtc_ir_test)), _, (_3 : 'tv_mtc_ir_tail)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_mtc_ir_tail = 
# 399 "imp_parser.mly"
                                ( _2::_3 )
# 1395 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1400)) : 'freshtv1402)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1405 * _menhir_state * 'tv_mtc_ir_test) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1403 * _menhir_state * 'tv_mtc_ir_test) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mtc_ir_test)), _, (_2 : 'tv_mtc_ir_tail)) = _menhir_stack in
        let _v : 'tv_ir_ptn_eq = 
# 395 "imp_parser.mly"
                            ( _1::_2 )
# 1407 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1404)) : 'freshtv1406)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1407 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1415 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213) : 'freshtv1408)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1409 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1453 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState219 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState219 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState219 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219) : 'freshtv1410)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1371 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1498 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState281
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState281
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState281) : 'freshtv1372)
    | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1375 * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1373 * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_prd = 
# 227 "imp_parser.mly"
                 ( Some _2 )
# 1521 "imp_parser.ml"
         in
        _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1374)) : 'freshtv1376)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1379 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1377 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _), _, (_3 : 'tv_grm_ptns)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_ptns = 
# 212 "imp_parser.mly"
                         ( _1::_3 )
# 1534 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1378)) : 'freshtv1380)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1383 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1381 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_ptns = 
# 211 "imp_parser.mly"
                     ( _1::_2 )
# 1546 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1382)) : 'freshtv1384)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1385 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState292) : 'freshtv1386)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1387 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1568 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState298
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState298
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState298) : 'freshtv1388)
    | MenhirState295 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1389 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState301) : 'freshtv1390)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1391 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState309
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState309
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState309) : 'freshtv1392)
    | MenhirState318 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1393 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | SCL | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState319) : 'freshtv1394)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1395 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | SCL | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState323) : 'freshtv1396)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1397 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run282 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SRC | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState338) : 'freshtv1398)
    | _ ->
        _menhir_fail ()

and _menhir_reduce181 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 541 "imp_parser.mly"
    ( [||] )
# 1659 "imp_parser.ml"
     in
    _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | NAM _v ->
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
    let (_menhir_stack : 'freshtv1369) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_op_src = 
# 465 "imp_parser.mly"
          ( None )
# 1692 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1370)

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
    let (_menhir_stack : 'freshtv1367 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | COPRD_END ->
        _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | ORD_LEX_COPRD ->
        _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | ORD_LEX_COPRD_END ->
        _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | ORD_LINE_COPRD ->
        _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | ORD_LINE_COPRD_END ->
        _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | SYNT_COPRD ->
        _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState333) : 'freshtv1368)

and _menhir_goto_grm_rule_act_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_act_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1365) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_act_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1363) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_act_end) : 'tv_grm_rule_act_end) = _v in
    ((let _v : 'tv_grm_ord_act = 
# 139 "imp_parser.mly"
                     ( [_1] )
# 1753 "imp_parser.ml"
     in
    _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1364)) : 'freshtv1366)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1357 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1765 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1355 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1773 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1780 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 307 "imp_parser.mly"
                                           ( [_3]@_4 )
# 1786 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1356)) : 'freshtv1358)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1361 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1359 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 290 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 1803 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1360)) : 'freshtv1362)
    | _ ->
        _menhir_fail ()

and _menhir_goto_id_mtc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_id_mtc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1349 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1817 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_id_mtc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1347 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1825 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_id_mtc) : 'tv_id_mtc) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1832 "imp_parser.ml"
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
# 1845 "imp_parser.ml"
         in
        _menhir_goto_id_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1348)) : 'freshtv1350)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1353 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1853 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_id_mtc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1351 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1861 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_7 : 'tv_id_mtc) : 'tv_id_mtc) = _v in
        ((let (((((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn)), _, (_2 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 1868 "imp_parser.ml"
        ))), _, (_4 : 'tv_reg_ptn)), _, (_5 : 'tv_mtc_ir_tail)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_mtc = 
# 517 "imp_parser.mly"
    ( [|(_2,_4,(_5,None),_6)|] |+| _7 )
# 1874 "imp_parser.ml"
         in
        _menhir_goto_id_mtc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1352)) : 'freshtv1354)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState330 | MenhirState326 | MenhirState316 | MenhirState312 | MenhirState247 | MenhirState84 | MenhirState225 | MenhirState219 | MenhirState213 | MenhirState205 | MenhirState202 | MenhirState175 | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1341) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1339) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let _v : 'tv_ir_lines = 
# 321 "imp_parser.mly"
               ( Mtc(_1) )
# 1895 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1340)) : 'freshtv1342)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1345 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1343 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 521 "imp_parser.mly"
                                            ([|((_2,None),_3)|] |+| _4 )
# 1911 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1344)) : 'freshtv1346)
    | _ ->
        _menhir_fail ()

and _menhir_goto_id_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_id_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1337) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_id_line) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1335) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_id_line) : 'tv_id_line) = _v in
    ((let _v : 'tv_ir_lines = 
# 320 "imp_parser.mly"
            ( _1 )
# 1930 "imp_parser.ml"
     in
    _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1336)) : 'freshtv1338)

and _menhir_goto_mtc_ir_suc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_suc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState218 | MenhirState212 | MenhirState195 | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1329) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1327) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_mtc_ir_tail = 
# 398 "imp_parser.mly"
               ( [] )
# 1949 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1328)) : 'freshtv1330)
    | MenhirState204 | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1333) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1331) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_ir_ptn_eq = 
# 394 "imp_parser.mly"
               ( [] )
# 1964 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1332)) : 'freshtv1334)
    | _ ->
        _menhir_fail ()

and _menhir_run270 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord_end -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 1973 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1323 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1985 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState271) : 'freshtv1324)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | EXP | LCE | L_LST | L_OPN | MDL | MDL_END | MDL_EOP | MLT | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRM _ | SCL | SLF _ | SRC | STG _ | SYNT_COPRD ->
        _menhir_reduce145 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1325 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2021 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1326)

and _menhir_run296 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 2029 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1319 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2041 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState297 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState297 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState297 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState297) : 'freshtv1320)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | CUT | EXP | L_LST | L_OPN | MLT | NAM _ | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRM _ | SCL | SRC | STG _ | SYNT_COPRD ->
        _menhir_reduce145 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1321 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2077 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1322)

and _menhir_reduce86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 210 "imp_parser.mly"
    ( [] )
# 2087 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_run269 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 2094 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1317) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 2104 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 2108 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 220 "imp_parser.mly"
        ( Grm.Txt _1 )
# 2113 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1318)

and _menhir_run272 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1315) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 222 "imp_parser.mly"
        ( Grm.Name(EndN "_byt") )
# 2127 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1316)

and _menhir_run273 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState273
    | MLT ->
        _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState273
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState273 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState273 _v
    | STG _v ->
        _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState273 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState273

and _menhir_run278 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState278
    | MLT ->
        _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState278
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
    | STG _v ->
        _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState278

and _menhir_run274 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1313) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 223 "imp_parser.mly"
         ( Grm.Name(EndN "_byt") )
# 2183 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1314)

and _menhir_run196 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
    | VAL _v ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196

and _menhir_goto_reg_ptn_op_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_op_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1307 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op_src) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1305 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_reg_ptn_src = 
# 454 "imp_parser.mly"
                                         (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn_src 0" (* Rcd_Ptn.Ro ($2,r)*) )
# 2222 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1306)) : 'freshtv1308)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1311 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op_src) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1309 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
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
# 2242 "imp_parser.ml"
         in
        _menhir_goto_id_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1310)) : 'freshtv1312)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1303 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | ARR ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | COPRD ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | COPRD_END ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | COPRD_PTN ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | COPRD_PTN_END ->
        _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | EOP ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | EOP_EXN ->
        _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
    | OUT_IR ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState175
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
    | ROT _v ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175) : 'freshtv1304)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState380 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1297 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2293 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1295 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2301 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 2308 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 235 "imp_parser.mly"
                                        ( [_3]@_4 )
# 2314 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1296)) : 'freshtv1298)
    | MenhirState347 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1301 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1299 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 119 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2331 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1300)) : 'freshtv1302)
    | _ ->
        _menhir_fail ()

and _menhir_goto_src_par_p : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_src_par_p -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1287 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | LINE _v ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | STG _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | S8_P ->
            _menhir_reduce185 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv1288)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1293 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1289 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState150
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv1290)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1291 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1292)) : 'freshtv1294)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState56 | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1229 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | OP | R_RCD ->
            _menhir_reduce167 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv1230)
    | MenhirState230 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1237 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2424 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1231) = Obj.magic _menhir_stack in
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv1232)
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1233) = Obj.magic _menhir_stack in
            ((let _v : 'tv_typ_def = 
# 545 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 2463 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv1234)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1235 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2473 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1236)) : 'freshtv1238)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1239 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2482 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce181 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv1240)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1241 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce181 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112) : 'freshtv1242)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1249 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1245 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1243 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 355 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2528 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1244)) : 'freshtv1246)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1247 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1248)) : 'freshtv1250)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1253 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1251 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 313 "imp_parser.mly"
                ( Ret _2 )
# 2548 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1252)) : 'freshtv1254)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1257 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1255 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn_src)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 345 "imp_parser.mly"
                                            ( IR_Exp(_2,_4,_6) )
# 2563 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1256)) : 'freshtv1258)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1261 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1259 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_3 : 'tv_reg_ptn_src)), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 346 "imp_parser.mly"
                                    ( IR_Exp(_2,_3,_5) )
# 2577 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1260)) : 'freshtv1262)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1267 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1263 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState164
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164) : 'freshtv1264)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1265 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1266)) : 'freshtv1268)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1271 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1269 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 353 "imp_parser.mly"
                                    (
     IR_Glb_Call(ref(Lang.Ast.Stt_Axm Lang.Ast.Axm._app),RP.R [|RP.A _2;_4|],_6) )
# 2624 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1270)) : 'freshtv1272)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1275 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2632 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1273 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2638 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2643 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn_src)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 352 "imp_parser.mly"
                                 ( IR_Glb_Call(ref(Ast.Stt_Name _1),_2,_4) )
# 2649 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1274)) : 'freshtv1276)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1279 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2657 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2661 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1277 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2667 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2671 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 2676 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2680 "imp_parser.ml"
        ))), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_mtc_ir_test = 
# 402 "imp_parser.mly"
                             (
    (ref(R_N _1),ref(Eq_Agl_N(ref(Ast.Stt_Name _3),_5)))
    )
# 2689 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1278)) : 'freshtv1280)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1281 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2697 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | SCL ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | SPL ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212) : 'freshtv1282)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1283 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2717 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | SCL ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | SPL ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState218) : 'freshtv1284)
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1285 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2737 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce181 _menhir_env (Obj.magic _menhir_stack) MenhirState224
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState224) : 'freshtv1286)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1227 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_reg_ptn_op) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1225 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_reg_ptn = 
# 484 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn 0" (* Rcd_Ptn.Ro ($2,r)  *) )
# 2769 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1226)) : 'freshtv1228)

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1219 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1211) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv1212)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1215) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1213) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 495 "imp_parser.mly"
          ( None )
# 2809 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv1214)) : 'freshtv1216)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1217 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1218)) : 'freshtv1220)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1223 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1221 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 498 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 2828 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1222)) : 'freshtv1224)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1205 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1203 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn_src)), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst_src = 
# 468 "imp_parser.mly"
                                ( [|_1|] |+| _2 )
# 2847 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1204)) : 'freshtv1206)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1207 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv1208)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1209 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102) : 'freshtv1210)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1151 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2890 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1149 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2896 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 2901 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_src)), _, (_4 : 'tv_reg_ptn)), _, (_5 : 'tv_regs)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_line = 
# 327 "imp_parser.mly"
                                          (
    Seq(IR_Id(ref(IR_Id_C(RP.A _2,[|_4|] |+| _5))),_6)  )
# 2908 "imp_parser.ml"
         in
        _menhir_goto_id_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1150)) : 'freshtv1152)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1155 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1153 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 318 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 2920 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1154)) : 'freshtv1156)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1159 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1157 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn_end)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 520 "imp_parser.mly"
                                     ( [|((_2,None),_3)|] )
# 2932 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1158)) : 'freshtv1160)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1161 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206) : 'freshtv1162)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1165 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2958 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1163 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2964 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn_end)), _, (_2 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2969 "imp_parser.ml"
        ))), _, (_4 : 'tv_reg_ptn)), _, (_5 : 'tv_mtc_ir_tail)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_mtc = 
# 515 "imp_parser.mly"
    ( [|(_2,_4,(_5,None),_6)|] )
# 2975 "imp_parser.ml"
         in
        _menhir_goto_id_mtc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1164)) : 'freshtv1166)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1167 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2983 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv1168)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1171 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3005 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1169 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3011 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 3016 "imp_parser.ml"
        ))), _, (_2 : 'tv_id_src)), _, (_4 : 'tv_reg_ptn)), _, (_5 : 'tv_regs)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_id_line = 
# 325 "imp_parser.mly"
                                         (
  Seq(IR_Id(ref(IR_Id_C(_2,[|_4|] |+| _5))),_6)  )
# 3023 "imp_parser.ml"
         in
        _menhir_goto_id_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1170)) : 'freshtv1172)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1185 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3031 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1183 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3037 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3042 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), (_3 : 'tv_typ_def)), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 310 "imp_parser.mly"
                                 ( (_1,fst _3,snd _3,(_2,ref _4)) )
# 3047 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1181) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body_ir) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState43 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1175 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3060 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _v
            | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1173 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3072 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 3077 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 306 "imp_parser.mly"
                            ( [_3] )
# 3083 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1174)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228) : 'freshtv1176)
        | MenhirState41 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1179 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1177 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body_ir)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 291 "imp_parser.mly"
                         ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d) )
# 3100 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1178)) : 'freshtv1180)
        | _ ->
            _menhir_fail ()) : 'freshtv1182)) : 'freshtv1184)) : 'freshtv1186)
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1189 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3110 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1187 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3116 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 3121 "imp_parser.ml"
        ))), _), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 296 "imp_parser.mly"
                             ( Ast.Etr_Glb(_2,ref _4) )
# 3128 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1188)) : 'freshtv1190)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1193 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1191 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _, (_5 : 'tv_reg_ptn_src)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_grm_rule_act_end = 
# 154 "imp_parser.mly"
                                                      (
    Grm.Act_End((sgn (),sgn (),sgn(),(_5,ref _6)),_1,_2,_3)
 )
# 3143 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1192)) : 'freshtv1194)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1195 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | COPRD_END ->
            _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | ORD_LEX_COPRD ->
            _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | ORD_LEX_COPRD_END ->
            _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | ORD_LINE_COPRD ->
            _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | ORD_LINE_COPRD_END ->
            _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | SYNT_COPRD ->
            _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState317) : 'freshtv1196)
    | MenhirState326 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1199 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1197 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _, (_5 : 'tv_reg_ptn_src)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_grm_rule_act = 
# 146 "imp_parser.mly"
                                                  (
    Grm.Act_End((sgn (),sgn (),sgn (),(_5,ref _6)),_1,_2,_3)
   )
# 3182 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1198)) : 'freshtv1200)
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1201 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | COPRD_END ->
            _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | ORD_LEX_COPRD ->
            _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | ORD_LEX_COPRD_END ->
            _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | ORD_LINE_COPRD ->
            _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | ORD_LINE_COPRD_END ->
            _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | SYNT_COPRD ->
            _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState331) : 'freshtv1202)
    | _ ->
        _menhir_fail ()

and _menhir_run179 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 3215 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1145 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3227 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | INT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1127) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState180 in
            let (_v : (
# 19 "imp_parser.mly"
       (int)
# 3239 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1125) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 19 "imp_parser.mly"
       (int)
# 3248 "imp_parser.ml"
            )) : (
# 19 "imp_parser.mly"
       (int)
# 3252 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 412 "imp_parser.mly"
        ( P_Z _1 )
# 3257 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1126)) : 'freshtv1128)
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
        | R2 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1131) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState180 in
            let (_v : (
# 21 "imp_parser.mly"
       (bool)
# 3271 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1129) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 21 "imp_parser.mly"
       (bool)
# 3280 "imp_parser.ml"
            )) : (
# 21 "imp_parser.mly"
       (bool)
# 3284 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 414 "imp_parser.mly"
       ( P_R2 _1 )
# 3289 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1130)) : 'freshtv1132)
        | R64 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1135) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState180 in
            let (_v : (
# 20 "imp_parser.mly"
       (int64)
# 3299 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1133) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 3308 "imp_parser.ml"
            )) : (
# 20 "imp_parser.mly"
       (int64)
# 3312 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 413 "imp_parser.mly"
        ( P_R64 _1 )
# 3317 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1134)) : 'freshtv1136)
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1139) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState180 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 3327 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1137) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 3336 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (string)
# 3340 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 411 "imp_parser.mly"
        ( P_Stg _1 )
# 3345 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1138)) : 'freshtv1140)
        | VAL _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1143 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3353 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState180 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 3359 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1141 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3366 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_3 : (
# 18 "imp_parser.mly"
       (string)
# 3372 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (string)
# 3376 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3381 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_mtc_ir_test = 
# 407 "imp_parser.mly"
               (
    (ref(R_N _1),ref(Eq_V(ref(R_N _3)))) )
# 3388 "imp_parser.ml"
             in
            _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1142)) : 'freshtv1144)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv1146)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1147 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3402 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1148)

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1123) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 525 "imp_parser.mly"
        ()
# 3417 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1124)

and _menhir_run189 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 3424 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1119 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3436 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190) : 'freshtv1120)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1121 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3456 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1122)

and _menhir_run194 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1117) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 526 "imp_parser.mly"
            ()
# 3471 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1118)

and _menhir_goto_ord_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1111 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | NAM _v ->
            _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState268 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState268 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState268 _v
        | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState268) : 'freshtv1112)
    | MenhirState340 | MenhirState314 | MenhirState305 | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1113 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | NAM _v ->
            _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState291 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState291 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState291 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState291) : 'freshtv1114)
    | MenhirState333 | MenhirState331 | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1115 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState318
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState318
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState318
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState318
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState318 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState318 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState318 _v
        | CUT | SCL | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState318
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState318) : 'freshtv1116)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState340 | MenhirState314 | MenhirState305 | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1105 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | NAM _v ->
            _menhir_run296 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState295 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState295) : 'freshtv1106)
    | MenhirState333 | MenhirState331 | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1107 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
        | CUT | SCL | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState322
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState322) : 'freshtv1108)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1109 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | NAM _v ->
            _menhir_run296 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SRC | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState337) : 'freshtv1110)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState353 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1099 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3653 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1097 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3661 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3668 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 98 "imp_parser.mly"
                 (
    let v = newvar_q (-1) in
    let (vs,l) = _3 in
    (v::vs,(_1,v)::l) )
# 3677 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1098)) : 'freshtv1100)
    | MenhirState351 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1103) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1101) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 87 "imp_parser.mly"
             ( _2 )
# 3693 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv1102)) : 'freshtv1104)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1091 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1089 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 92 "imp_parser.mly"
                 ( 1+_2 )
# 3716 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1090)) : 'freshtv1092)
    | MenhirState351 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1095) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1093) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 88 "imp_parser.mly"
                 ( ([],BatList.init _2 (fun n -> ("$"^(String.make n '\''),newvar_q (-2)))) )
# 3732 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv1094)) : 'freshtv1096)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState377 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1083 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3746 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1081 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3754 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3761 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 247 "imp_parser.mly"
                  ( _1::_2 )
# 3766 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1082)) : 'freshtv1084)
    | MenhirState376 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1087 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3774 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1085 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3782 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 3789 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 242 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3796 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1086)) : 'freshtv1088)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1079 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState284
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1077 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState284 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run274 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | L_LST ->
            _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | L_OPN ->
            _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | MLT ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
        | STG _v ->
            _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState285) : 'freshtv1078)
    | L_LST ->
        _menhir_run278 _menhir_env (Obj.magic _menhir_stack) MenhirState284
    | L_OPN ->
        _menhir_run273 _menhir_env (Obj.magic _menhir_stack) MenhirState284
    | MLT ->
        _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState284
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState284 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState284 _v
    | STG _v ->
        _menhir_run269 _menhir_env (Obj.magic _menhir_stack) MenhirState284 _v
    | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
        _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState284
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState284) : 'freshtv1080)

and _menhir_goto_nls : _menhir_env -> 'ttv_tail -> 'tv_nls -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1075 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run347 _menhir_env (Obj.magic _menhir_stack) MenhirState385
    | DTA_GRM ->
        _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState385
    | LCE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState385
    | MDL ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState385
    | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1073 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState385 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1071 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, (_1 : 'tv_nls)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_nls = 
# 83 "imp_parser.mly"
           ()
# 3888 "imp_parser.ml"
         in
        _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv1072)) : 'freshtv1074)
    | EOF | MDL_END | MDL_EOP ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState385
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState385) : 'freshtv1076)

and _menhir_goto_mtc_ir_test : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_test -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState204 | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1067 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | SCL ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | SPL ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState195
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv1068)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1069 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | SCL ->
            _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | SPL ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197) : 'freshtv1070)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState90 | MenhirState94 | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1031 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
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
            _menhir_reduce169 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv1032)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1037 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1033 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState155
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv1034)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1035 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1036)) : 'freshtv1038)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1043 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1039 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState158
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158) : 'freshtv1040)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1041 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1042)) : 'freshtv1044)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1057 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4030 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1045 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4040 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState170
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState170
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv1046)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1049 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4062 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1047 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4069 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4074 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn_src)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 322 "imp_parser.mly"
                            ( IL_Glb_Call(ref(Ast.Stt_Name _1),_2) )
# 4080 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1048)) : 'freshtv1050)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1053 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4088 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1051 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4095 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4100 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn_src)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 357 "imp_parser.mly"
                             ( IR_Glb_Out(ref(Ast.Stt_Name _1),_2) )
# 4106 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1052)) : 'freshtv1054)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1055 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4116 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1056)) : 'freshtv1058)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1059 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState312) : 'freshtv1060)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1061 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState316
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState316) : 'freshtv1062)
    | MenhirState325 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1063 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState326 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState326 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState326 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState326) : 'freshtv1064)
    | MenhirState329 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1065 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | ARR ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | COPRD ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | COPRD_END ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | COPRD_PTN ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | COPRD_PTN_END ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | EOP ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | EOP_EXN ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState330 _v
        | OUT_IR ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState330
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState330 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState330 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState330) : 'freshtv1066)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState329 | MenhirState325 | MenhirState315 | MenhirState311 | MenhirState166 | MenhirState152 | MenhirState153 | MenhirState90 | MenhirState94 | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1015 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1013 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_src = 
# 453 "imp_parser.mly"
            ( Rcd_Ptn.A _1 )
# 4272 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1014)) : 'freshtv1016)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1023 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1019 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1017 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_src)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 464 "imp_parser.mly"
                      ( Some _2 )
# 4293 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1018)) : 'freshtv1020)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1021 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1022)) : 'freshtv1024)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1029 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4308 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1025 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4318 "imp_parser.ml"
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
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105) : 'freshtv1026)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1027 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4350 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1028)) : 'freshtv1030)
    | _ ->
        _menhir_fail ()

and _menhir_goto_s8_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_s8_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv979 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4366 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4370 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv977 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4376 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4380 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4385 "imp_parser.ml"
        ))), _), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 4389 "imp_parser.ml"
        ))), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_s8_ptn = 
# 371 "imp_parser.mly"
                       ( (S8_For_Txt(_1,_3))::_4 )
# 4395 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv978)) : 'freshtv980)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv983 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4403 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv981 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4409 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4414 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 370 "imp_parser.mly"
                ( (S8_Name(ref(Ast.Stt_Name _1)))::_2 )
# 4419 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv982)) : 'freshtv984)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv987 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4427 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv985 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4433 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4438 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 369 "imp_parser.mly"
               ( (S8_Var _1)::_2 )
# 4443 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv986)) : 'freshtv988)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv991 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4451 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv989 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4457 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4462 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 367 "imp_parser.mly"
                ( (S8_Txt _1)::_2 )
# 4467 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv990)) : 'freshtv992)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv995 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4475 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv993 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4481 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4486 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 368 "imp_parser.mly"
               ( (S8_Txt _1)::_2 )
# 4491 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv994)) : 'freshtv996)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1003 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv999 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv997 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
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
# 4516 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv998)) : 'freshtv1000)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv1001 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1002)) : 'freshtv1004)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1011 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1007 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1005 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_src_par_p)), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
            let _5 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 349 "imp_parser.mly"
                                              (
      let (l0,l1) = _3 in
      IR_S8(ref(IR_S8_C(_4,l0,l1))) )
# 4547 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1006)) : 'freshtv1008)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1009 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1010)) : 'freshtv1012)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState370 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv971 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4568 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4572 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv969 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4580 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4584 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4591 "imp_parser.ml"
        ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4595 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 251 "imp_parser.mly"
                                 ( (_4,_2)::_5 )
# 4602 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv970)) : 'freshtv972)
    | MenhirState359 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv975 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4610 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv973 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4618 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4625 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 239 "imp_parser.mly"
                            (
    Def_CoPrd (_1,snd _2,_3) )
# 4631 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)) : 'freshtv976)
    | _ ->
        _menhir_fail ()

and _menhir_run367 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv965 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 4649 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv961 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4660 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState369
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState369
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState369
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState369 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState369 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState369 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState369
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState369
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState369 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState369) : 'freshtv962)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv963 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4694 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv964)) : 'freshtv966)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv967 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv968)

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState349 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv955 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4715 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run348 _menhir_env (Obj.magic _menhir_stack) MenhirState380 _v
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv953 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4727 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4732 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 234 "imp_parser.mly"
                         ( [_3] )
# 4738 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv954)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState380) : 'freshtv956)
    | MenhirState347 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv959 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv957 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 120 "imp_parser.mly"
                     ( Flow _2 )
# 4755 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv958)) : 'freshtv960)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState363 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv947 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4769 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4773 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv945 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4781 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4785 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4792 "imp_parser.ml"
        ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4796 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 255 "imp_parser.mly"
                             ( (_4,_2)::_5 )
# 4803 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv946)) : 'freshtv948)
    | MenhirState359 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv951 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4811 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv949 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4819 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4826 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 241 "imp_parser.mly"
                         ( Def_Prd (_1,snd _2,_3) )
# 4831 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv950)) : 'freshtv952)
    | _ ->
        _menhir_fail ()

and _menhir_run360 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv941 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 4849 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv937 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4860 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState362
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState362
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState362
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState362 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState362 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState362 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState362
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState362
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState362 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState362) : 'freshtv938)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv939 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4894 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv940)) : 'freshtv942)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv943 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv944)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv935 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4913 "imp_parser.ml"
    )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState84
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv936)

and _menhir_run74 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4950 "imp_parser.ml"
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
# 4983 "imp_parser.ml"
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
    let (_menhir_stack : 'freshtv933 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv929 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv927 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 5031 "imp_parser.ml"
        ) = 
# 47 "imp_parser.mly"
  (
    Line _1  )
# 5036 "imp_parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)) : 'freshtv930)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv931 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv932)) : 'freshtv934)

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
        let (_menhir_stack : ('freshtv921 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv917 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv915 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 583 "imp_parser.mly"
                         ( _2 )
# 5096 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv919 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv920)) : 'freshtv922)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv925 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv923 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 587 "imp_parser.mly"
                 ( App(Name(ref(Stt_Axm Ast.Axm._cns)),Rcd [|_1;_2|]) )
# 5115 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv924)) : 'freshtv926)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_end : _menhir_env -> 'ttv_tail -> 'tv_mdl_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv913 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 5127 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_mdl_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv911 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 5134 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_mdl_end) : 'tv_mdl_end) = _v in
    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 5140 "imp_parser.ml"
    ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_mdl = 
# 71 "imp_parser.mly"
                               ( (_2,_3) )
# 5146 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv909) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_mdl) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState400 | MenhirState38 | MenhirState40 | MenhirState385 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv905 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv903 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : 'tv_mdl_etr = 
# 114 "imp_parser.mly"
            (
    let (n,el) = _1 in Mdl (n,el) )
# 5164 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv904)) : 'freshtv906)
    | MenhirState398 | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv907 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            _menhir_run396 _menhir_env (Obj.magic _menhir_stack) MenhirState398
        | MDL ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState398
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState398) : 'freshtv908)
    | _ ->
        _menhir_fail ()) : 'freshtv910)) : 'freshtv912)) : 'freshtv914)

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState51 ->
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
# 494 "imp_parser.mly"
                  ( Some _2 )
# 5206 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv868)) : 'freshtv870)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv871) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv872)) : 'freshtv874)
    | MenhirState230 | MenhirState44 | MenhirState223 | MenhirState217 | MenhirState211 | MenhirState105 | MenhirState192 | MenhirState170 | MenhirState162 | MenhirState164 | MenhirState158 | MenhirState155 | MenhirState120 | MenhirState116 | MenhirState111 | MenhirState48 | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv877 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv875 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 483 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 5225 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv876)) : 'freshtv878)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv879 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | NAM _v ->
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
            _menhir_reduce185 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv882)
    | MenhirState144 ->
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
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv884)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv885 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv886)) : 'freshtv888)
    | MenhirState146 ->
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
# 5308 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv890)) : 'freshtv892)
    | MenhirState150 ->
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
# 5324 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)
    | MenhirState160 ->
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
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState162
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState162
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv898)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv899 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv900)) : 'freshtv902)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_dst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_dst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState230 | MenhirState44 | MenhirState223 | MenhirState217 | MenhirState211 | MenhirState105 | MenhirState192 | MenhirState170 | MenhirState162 | MenhirState164 | MenhirState160 | MenhirState158 | MenhirState155 | MenhirState150 | MenhirState146 | MenhirState144 | MenhirState125 | MenhirState120 | MenhirState116 | MenhirState115 | MenhirState111 | MenhirState48 | MenhirState56 | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv857 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv855 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)) = _menhir_stack in
        let _v : 'tv_reg = 
# 476 "imp_parser.mly"
            ( _1 )
# 5374 "imp_parser.ml"
         in
        _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv856)) : 'freshtv858)
    | MenhirState148 | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv865 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv859 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState148 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState148 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148) : 'freshtv860)
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv861 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv862)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv863 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv864)) : 'freshtv866)
    | _ ->
        _menhir_fail ()

and _menhir_reduce167 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 497 "imp_parser.mly"
    ( [||] )
# 5428 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv853 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5439 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv847 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv845 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 285 "imp_parser.mly"
                ( _1+1 )
# 5455 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv846)) : 'freshtv848)
    | APP | COPRD | DTA | DTA_GRM | EOF | IMP | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv849 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5463 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 5468 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5473 "imp_parser.ml"
        ) = 
# 278 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 5477 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv850)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv851 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5487 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv852)) : 'freshtv854)

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv843 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
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
        let (_menhir_stack : ('freshtv841 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState69 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv839 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_typs)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5526 "imp_parser.ml"
        ) = 
# 268 "imp_parser.mly"
                     ( Rcd(rcd_cl _2) )
# 5530 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv840)) : 'freshtv842)
    | SGN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TYP_STG ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | VAL _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv844)

and _menhir_goto_id_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_id_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv837 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5551 "imp_parser.ml"
    )) * _menhir_state * 'tv_id_src) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv833 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5561 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState223
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState223 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState223 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState223
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState223) : 'freshtv834)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv835 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5585 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv836)) : 'freshtv838)

and _menhir_reduce169 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_src = 
# 467 "imp_parser.mly"
    ( [||] )
# 5595 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_ir_ret : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ret -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv831) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ret) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv829) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
    ((let _v : 'tv_ir_lines = 
# 317 "imp_parser.mly"
           ( _1 )
# 5612 "imp_parser.ml"
     in
    _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv830)) : 'freshtv832)

and _menhir_goto_coprd_ptn_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState316 | MenhirState330 | MenhirState326 | MenhirState312 | MenhirState247 | MenhirState84 | MenhirState225 | MenhirState219 | MenhirState213 | MenhirState114 | MenhirState205 | MenhirState206 | MenhirState202 | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv825 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | NAM _v ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
        | SPL ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | VAL _v ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178) : 'freshtv826)
    | MenhirState220 | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv827 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState209 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState209 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209) : 'freshtv828)
    | _ ->
        _menhir_fail ()

and _menhir_goto_coprd_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState316 | MenhirState330 | MenhirState326 | MenhirState312 | MenhirState247 | MenhirState84 | MenhirState225 | MenhirState219 | MenhirState213 | MenhirState114 | MenhirState175 | MenhirState205 | MenhirState206 | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv821 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | NAM _v ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState204 _v
        | SPL ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | VAL _v ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState204 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204) : 'freshtv822)
    | MenhirState220 | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv823 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState215 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState215 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState215) : 'freshtv824)
    | _ ->
        _menhir_fail ()

and _menhir_run261 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv819) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 201 "imp_parser.mly"
               ( Grm.Synt )
# 5704 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv820)

and _menhir_run262 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv817) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 207 "imp_parser.mly"
                       ( Grm.Line )
# 5718 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)

and _menhir_run263 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv815) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 202 "imp_parser.mly"
                   ( Grm.Line )
# 5732 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv816)

and _menhir_run264 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv813) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 206 "imp_parser.mly"
                      ( Grm.Synt )
# 5746 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)

and _menhir_run265 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv811) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 200 "imp_parser.mly"
                  ( Grm.Synt )
# 5760 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv812)

and _menhir_run266 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv809) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 205 "imp_parser.mly"
              ( Grm.Lex )
# 5774 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)

and _menhir_run267 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv807) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 199 "imp_parser.mly"
          ( Grm.Lex )
# 5788 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv805 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5799 "imp_parser.ml"
    )) * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run367 _menhir_env (Obj.magic _menhir_stack) MenhirState359
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv801 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5811 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState359 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PRN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState365
        | L_RCD ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState365
        | N ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState365
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState365 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState365 _v
        | ROT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState365 _v
        | SGN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState365
        | TYP_STG ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState365
        | VAL _v ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState365 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState365) : 'freshtv802)
    | PRD ->
        _menhir_run360 _menhir_env (Obj.magic _menhir_stack) MenhirState359
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv803 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5847 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5852 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 238 "imp_parser.mly"
                 ( Def_Abs (_1,snd _2) )
# 5857 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv804)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState359) : 'freshtv806)

and _menhir_run352 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5868 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv795 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5880 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run352 _menhir_env (Obj.magic _menhir_stack) MenhirState353 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState353) : 'freshtv796)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv797 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5896 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5901 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 95 "imp_parser.mly"
        (
    let v = newvar_q (-1) in
    ([v],[(_1,v)]) )
# 5908 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv799 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5918 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv800)

and _menhir_run355 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run355 _menhir_env (Obj.magic _menhir_stack) MenhirState355
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv793 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 91 "imp_parser.mly"
        ( 1 )
# 5939 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv794)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState355

and _menhir_run377 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5950 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run377 _menhir_env (Obj.magic _menhir_stack) MenhirState377 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv791 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5964 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5969 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 246 "imp_parser.mly"
        ( [_1] )
# 5974 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState377

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv777 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv773 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv771 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 217 "imp_parser.mly"
                         ( Grm.Opn _2 )
# 6009 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv772)) : 'freshtv774)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv775 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv776)) : 'freshtv778)
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv781 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv779 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 216 "imp_parser.mly"
                         ( Grm.Lst _2 )
# 6037 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)) : 'freshtv782)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv784)) : 'freshtv786)
    | MenhirState337 | MenhirState268 | MenhirState322 | MenhirState318 | MenhirState271 | MenhirState295 | MenhirState297 | MenhirState291 | MenhirState282 | MenhirState284 | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv789 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv787 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 215 "imp_parser.mly"
             ( Grm.Atm _1 )
# 6056 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv788)) : 'freshtv790)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv769 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv767) = Obj.magic _menhir_stack in
    ((let _v : 'tv_nls = 
# 82 "imp_parser.mly"
    ()
# 6072 "imp_parser.ml"
     in
    _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv768)) : 'freshtv770)

and _menhir_goto_ir_ptn_cst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_cst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv765 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6082 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv763 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6090 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_ir_ptn_cst) : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 6097 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_mtc_ir_test = 
# 405 "imp_parser.mly"
                      (
    (ref(R_N _1),ref(P_Cst _3)) )
# 6104 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv764)) : 'freshtv766)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv761) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 452 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 6118 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6125 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv759) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 6135 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 6139 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 449 "imp_parser.mly"
        ( ref(R_N _1) )
# 6144 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6151 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv757) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 6161 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 6165 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 447 "imp_parser.mly"
        ( ref(R_N _1) )
# 6170 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv758)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6177 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv755) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 6187 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 6191 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 448 "imp_parser.mly"
        ( ref(R_N _1) )
# 6196 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv756)

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
        _menhir_reduce169 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92

and _menhir_reduce185 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_s8_ptn = 
# 366 "imp_parser.mly"
    ( [] )
# 6228 "imp_parser.ml"
     in
    _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6235 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
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
        _menhir_reduce185 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127

and _menhir_run128 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 6262 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
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
        _menhir_reduce185 _menhir_env (Obj.magic _menhir_stack) MenhirState128
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 6289 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | LINE _v ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | MLT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv753 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 6305 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState129 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv749 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 6317 "imp_parser.ml"
            )) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 6322 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDX _v ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
            | LINE _v ->
                _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
            | STG _v ->
                _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
            | S8_P ->
                _menhir_reduce185 _menhir_env (Obj.magic _menhir_stack) MenhirState131
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131) : 'freshtv750)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv751 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 6351 "imp_parser.ml"
            )) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv752)) : 'freshtv754)
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | STG _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | S8_P ->
        _menhir_reduce185 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6371 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv701 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6381 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv699 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6395 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState72 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv697 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6403 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6409 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6416 "imp_parser.ml"
            ) = 
# 267 "imp_parser.mly"
                    ( _2 )
# 6420 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv698)) : 'freshtv700)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72) : 'freshtv702)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv705 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6432 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6436 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | APP | COPRD | DTA | DTA_GRM | EOF | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv703 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6448 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6452 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6457 "imp_parser.ml"
            ))), _), _, (_3 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6461 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6467 "imp_parser.ml"
            ) = 
# 279 "imp_parser.mly"
                 ( Imp(_1,_3) )
# 6471 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv704)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv706)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv709 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6483 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6487 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | APP | COPRD | DTA | DTA_GRM | EOF | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv707 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6499 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6503 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6508 "imp_parser.ml"
            ))), _), _, (_3 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6512 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6518 "imp_parser.ml"
            ) = 
# 270 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 6522 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv708)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv710)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv713 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6534 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv711 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6548 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : 'tv_typs)), _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6553 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 264 "imp_parser.mly"
             ( _1@[_2] )
# 6558 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv712)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv714)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv717) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6570 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv715) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6584 "imp_parser.ml"
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv716)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv718)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv723) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6622 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6626 "imp_parser.ml"
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
            let (_menhir_stack : ((('freshtv721) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6640 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6644 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState82 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv719) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6652 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6656 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6662 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6666 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 546 "imp_parser.mly"
                        ( (_2,_4) )
# 6674 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv720)) : 'freshtv722)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv724)
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv731 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6686 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6690 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv725 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6704 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6708 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState243 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState245
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState245
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState245
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState245
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState245
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState245) : 'freshtv726)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv729 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6742 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6746 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState243 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv727 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6754 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6758 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6764 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6768 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 294 "imp_parser.mly"
                            ( Ast.Etr_Out_Abs(_2,_4) )
# 6776 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv728)) : 'freshtv730)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243) : 'freshtv732)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv735 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6788 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6792 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6796 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv733 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6810 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6814 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6818 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6823 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6827 "imp_parser.ml"
            ))), _), _, (_6 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6831 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 292 "imp_parser.mly"
                            (
    Ast.Etr_Abs(_2,_4,_6) )
# 6840 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv734)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState246) : 'freshtv736)
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv739 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6852 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6856 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState363
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState363
        | PRD ->
            _menhir_run360 _menhir_env (Obj.magic _menhir_stack) MenhirState363
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv737 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6872 "imp_parser.ml"
            ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6876 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6881 "imp_parser.ml"
            ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6885 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_prd = 
# 254 "imp_parser.mly"
                     ( [(_4,_2)] )
# 6892 "imp_parser.ml"
             in
            _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv738)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState363) : 'freshtv740)
    | MenhirState365 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv743 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6904 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6908 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState366
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState366
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv741 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6922 "imp_parser.ml"
            )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6926 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 6931 "imp_parser.ml"
            ))), (_2 : 'tv_def_arg)), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6935 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 243 "imp_parser.mly"
                        ( Def_EqT (_1,snd _2,_4) )
# 6941 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv742)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState366) : 'freshtv744)
    | MenhirState369 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv747 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6953 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6957 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState370
        | COPRD ->
            _menhir_run367 _menhir_env (Obj.magic _menhir_stack) MenhirState370
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState370
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv745 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6973 "imp_parser.ml"
            ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6977 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6982 "imp_parser.ml"
            ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6986 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 250 "imp_parser.mly"
                      ( [(_4,_2)] )
# 6993 "imp_parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv746)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState370) : 'freshtv748)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv691 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv689 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState11 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv687 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 577 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 7041 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)) : 'freshtv690)
        | STG _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv692)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv695 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : 'freshtv693 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 549 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 7079 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv694)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv696)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState20 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv657 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv658)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv661 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv659 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 574 "imp_parser.mly"
                ( App(_1,_3) )
# 7133 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv660)) : 'freshtv662)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv667 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv665 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState24 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv663 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 582 "imp_parser.mly"
                    ( App(Name(ref(Stt_Axm Ast.Axm._some)),_2) )
# 7158 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv664)) : 'freshtv666)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv668)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv673 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv671 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState26 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv669 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 571 "imp_parser.mly"
                    ( _2 )
# 7187 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)) : 'freshtv672)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv674)
    | MenhirState34 | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv677 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | EOF | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | PRM _ | R64 _ | R_RCD | STG _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv675 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 556 "imp_parser.mly"
                 ( _1@[_2] )
# 7209 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv676)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv678)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv681 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv679 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 552 "imp_parser.mly"
            ( _2 )
# 7232 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv680)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv682)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv685 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv683 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState152 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | NAM _v ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
            | PRM _v ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
            | REG _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
            | WC ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv684)
        | L_RCD ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | NAM _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState152 _v
        | PRM _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState152 _v
        | REG _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState152 _v
        | WC ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState152
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152) : 'freshtv686)
    | _ ->
        _menhir_fail ()

and _menhir_reduce128 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 586 "imp_parser.mly"
    ( App(Name(ref(Stt_Axm Ast.Axm._nil)),Rcd [||]) )
# 7291 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7298 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv651) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7309 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv649) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7317 "imp_parser.ml"
        )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7321 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv650)) : 'freshtv652)
    | MenhirState398 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv655 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7331 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv653 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7339 "imp_parser.ml"
        )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7343 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7349 "imp_parser.ml"
        ) = 
# 63 "imp_parser.mly"
                 (
    let ms = _2 in
    _1::ms )
# 7355 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)) : 'freshtv656)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState385 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv621 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv619 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), (_2 : 'tv_nls)), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 105 "imp_parser.mly"
                            ( _1::_3 )
# 7374 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)) : 'freshtv622)
    | MenhirState38 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv633 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7382 "imp_parser.ml"
        )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv625) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv623) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 74 "imp_parser.mly"
            ()
# 7397 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv624)) : 'freshtv626)
        | MDL_EOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv629) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv627) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 75 "imp_parser.mly"
            ()
# 7410 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv628)) : 'freshtv630)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv631 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7420 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv632)) : 'freshtv634)
    | MenhirState400 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv647 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv643 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv641 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7440 "imp_parser.ml"
            ) = 
# 68 "imp_parser.mly"
                   ( _1 )
# 7444 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv639) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7452 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv637) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7460 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv635) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7468 "imp_parser.ml"
            )) : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 7472 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv636)) : 'freshtv638)) : 'freshtv640)) : 'freshtv642)) : 'freshtv644)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv645 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv646)) : 'freshtv648)
    | _ ->
        _menhir_fail ()

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7488 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv615 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7500 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv613) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState43 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 7512 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv614)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv616)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv617 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7541 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv618)

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv611) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg = 
# 475 "imp_parser.mly"
       ( ref(R_Ax(R_WC (sgn ()))) )
# 7556 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7563 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv609) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7573 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7577 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 480 "imp_parser.mly"
        ( ref(R_N _1) )
# 7582 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv610)

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7589 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv607) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7599 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7603 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 479 "imp_parser.mly"
        ( ref(R_N _1) )
# 7608 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv608)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | OP | R_RCD ->
        _menhir_reduce167 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_goto_eq_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eq_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv605 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7639 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_eq_def) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv603 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7647 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_4 : 'tv_eq_def) : 'tv_eq_def) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 7654 "imp_parser.ml"
    ))), _) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_glb_etr = 
# 295 "imp_parser.mly"
                      ( Ast.Etr_Eq(_2,_4) )
# 7661 "imp_parser.ml"
     in
    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)) : 'freshtv606)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7668 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv601) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7678 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7682 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7687 "imp_parser.ml"
    ) = 
# 274 "imp_parser.mly"
        ( Var(ref(N_Ln (EndN _1,Axm Lang.Types.Axm.v))) )
# 7691 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv602)

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv599) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7705 "imp_parser.ml"
    ) = 
# 281 "imp_parser.mly"
            ( Axm Lang.Types.Axm.stg )
# 7709 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv600)

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv597) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7723 "imp_parser.ml"
    ) = 
# 280 "imp_parser.mly"
        ( Axm Lang.Types.Axm.sgn_p )
# 7727 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv598)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7734 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv595) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 284 "imp_parser.mly"
    ( 0 )
# 7744 "imp_parser.ml"
     in
    _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv596)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv593) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7758 "imp_parser.ml"
    ) = 
# 277 "imp_parser.mly"
      ( Axm Lang.Types.Axm.nat )
# 7762 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv591) = Obj.magic _menhir_stack in
    ((let _v : 'tv_typs = 
# 263 "imp_parser.mly"
    ( [] )
# 7775 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv592)

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
# 7811 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv585) = Obj.magic _menhir_stack in
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
            _menhir_reduce169 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv586)
    | NAM _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | PRM _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | REG _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | WC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv589) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState85 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv587) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : 'tv_id_src = 
# 339 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 7860 "imp_parser.ml"
         in
        _menhir_goto_id_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)) : 'freshtv590)
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
    let (_menhir_stack : 'freshtv583) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ir_ret = 
# 314 "imp_parser.mly"
            ( Exn (ref(R_Ax(R_A(Util.sgn ())))) )
# 7895 "imp_parser.ml"
     in
    _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)

and _menhir_run120 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | NAM _v ->
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
    let (_menhir_stack : 'freshtv581) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 533 "imp_parser.mly"
                  ()
# 7928 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv582)

and _menhir_run107 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv579) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 529 "imp_parser.mly"
              ()
# 7942 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv580)

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv577) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 534 "imp_parser.mly"
              ()
# 7956 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)

and _menhir_run109 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv575) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 530 "imp_parser.mly"
          ()
# 7970 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)

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
        let (_menhir_stack : 'freshtv573 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState122 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | WC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv571 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState123 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv567 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
                | REG _v ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
                | WC ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState125
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv568)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv569 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv570)) : 'freshtv572)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv574)
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122

and _menhir_run160 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState160
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv563) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 112 "imp_parser.mly"
            ( _1 )
# 8078 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv564)) : 'freshtv566)

and _menhir_run258 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 8085 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv559 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8097 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv555 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8107 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8112 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState260
            | COPRD_END ->
                _menhir_run266 _menhir_env (Obj.magic _menhir_stack) MenhirState260
            | ORD_LEX_COPRD ->
                _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState260
            | ORD_LEX_COPRD_END ->
                _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState260
            | ORD_LINE_COPRD ->
                _menhir_run263 _menhir_env (Obj.magic _menhir_stack) MenhirState260
            | ORD_LINE_COPRD_END ->
                _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState260
            | SYNT_COPRD ->
                _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState260
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState260) : 'freshtv556)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv557 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8143 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv558)) : 'freshtv560)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv561 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8154 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv562)

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv553) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv551) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 113 "imp_parser.mly"
            ( _1 )
# 8172 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)) : 'freshtv554)

and _menhir_run348 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 8179 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv547 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8191 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run374 _menhir_env (Obj.magic _menhir_stack) MenhirState349
        | NAM _v ->
            _menhir_run350 _menhir_env (Obj.magic _menhir_stack) MenhirState349 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState349) : 'freshtv548)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 8211 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv550)

and _menhir_run350 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 8219 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv541) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run355 _menhir_env (Obj.magic _menhir_stack) MenhirState351
        | VAL _v ->
            _menhir_run352 _menhir_env (Obj.magic _menhir_stack) MenhirState351 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState351) : 'freshtv542)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv543) = Obj.magic _menhir_stack in
        ((let _v : 'tv_def_arg = 
# 86 "imp_parser.mly"
    ( ([],[]) )
# 8246 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv544)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv545 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8256 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv546)

and _menhir_run374 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv537 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8273 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv533 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8284 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run377 _menhir_env (Obj.magic _menhir_stack) MenhirState376 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState376) : 'freshtv534)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv535 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8302 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv536)) : 'freshtv538)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv539 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv540)

and _menhir_goto_name : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8317 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv467 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8327 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8331 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv465 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8337 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8341 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 8346 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8350 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8356 "imp_parser.ml"
        ) = 
# 57 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 8360 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv466)) : 'freshtv468)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv471 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8368 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8372 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv469 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8378 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8382 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 8387 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8391 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8397 "imp_parser.ml"
        ) = 
# 58 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 8401 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv470)) : 'freshtv472)
    | MenhirState122 | MenhirState34 | MenhirState1 | MenhirState11 | MenhirState13 | MenhirState14 | MenhirState20 | MenhirState21 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv475 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8409 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv473 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8415 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8420 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 569 "imp_parser.mly"
          ( Name(ref(Ast.Stt_Name _1)) )
# 8425 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv474)) : 'freshtv476)
    | MenhirState369 | MenhirState365 | MenhirState362 | MenhirState242 | MenhirState245 | MenhirState60 | MenhirState81 | MenhirState69 | MenhirState71 | MenhirState77 | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv479 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8433 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8439 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8444 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 8449 "imp_parser.ml"
        ) = 
# 275 "imp_parser.mly"
         ( Var(ref(N _1)) )
# 8453 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)) : 'freshtv480)
    | MenhirState140 | MenhirState126 | MenhirState127 | MenhirState128 | MenhirState129 | MenhirState133 | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv481 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8461 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
        | LINE _v ->
            _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
        | STG _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
        | S8_P ->
            _menhir_reduce185 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133) : 'freshtv482)
    | MenhirState330 | MenhirState326 | MenhirState316 | MenhirState312 | MenhirState247 | MenhirState84 | MenhirState225 | MenhirState219 | MenhirState213 | MenhirState205 | MenhirState202 | MenhirState175 | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv483 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8487 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | NAM _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
        | PRM _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
        | REG _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
        | WC ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv484)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv487 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8511 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv485 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8517 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8522 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_ir_ptn_cst = 
# 415 "imp_parser.mly"
         ( P_N(ref(Ast.Stt_Name _1)) )
# 8527 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv493 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8535 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8539 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv489 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8549 "imp_parser.ml"
            ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8553 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState192
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState192
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState192) : 'freshtv490)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv491 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8577 "imp_parser.ml"
            ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8581 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv492)) : 'freshtv494)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv499 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8590 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv495 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8600 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211) : 'freshtv496)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv497 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8624 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv498)) : 'freshtv500)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv505 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8633 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv501 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8643 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217) : 'freshtv502)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv503 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8667 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv504)) : 'freshtv506)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv509 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8676 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv507 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8682 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8687 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_eq_def = 
# 299 "imp_parser.mly"
         ( EqLn _1 )
# 8692 "imp_parser.ml"
         in
        _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv508)) : 'freshtv510)
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv513 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8700 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8704 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv511 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8710 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8714 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 8719 "imp_parser.ml"
        ))), _), _, (_4 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8723 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_mdl_etr = 
# 116 "imp_parser.mly"
                    ( Mdl_Eq(_2,_4) )
# 8730 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv512)) : 'freshtv514)
    | MenhirState337 | MenhirState322 | MenhirState318 | MenhirState268 | MenhirState295 | MenhirState297 | MenhirState291 | MenhirState284 | MenhirState285 | MenhirState282 | MenhirState271 | MenhirState278 | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv517 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8738 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8744 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8749 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_grm_atom = 
# 221 "imp_parser.mly"
         ( Grm.Name _1 )
# 8754 "imp_parser.ml"
         in
        _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)) : 'freshtv518)
    | MenhirState404 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8762 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv527 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8772 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv525 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8778 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8783 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8789 "imp_parser.ml"
            ) = 
# 52 "imp_parser.mly"
             ( _1 )
# 8793 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv523) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8801 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv521) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8809 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv519) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8817 "imp_parser.ml"
            )) : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8821 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv520)) : 'freshtv522)) : 'freshtv524)) : 'freshtv526)) : 'freshtv528)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv529 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8831 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv530)) : 'freshtv532)
    | _ ->
        _menhir_fail ()

and _menhir_reduce145 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8841 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 8847 "imp_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8852 "imp_parser.ml"
    ) = 
# 55 "imp_parser.mly"
        ( (EndN _1) )
# 8856 "imp_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8863 "imp_parser.ml"
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
# 555 "imp_parser.mly"
    ( [] )
# 8883 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 8890 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv463) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 8900 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 8904 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 570 "imp_parser.mly"
        ( ExpCst(Cst.S8 _1) )
# 8909 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv464)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "imp_parser.mly"
       (int64)
# 8916 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv461) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 8926 "imp_parser.ml"
    )) : (
# 20 "imp_parser.mly"
       (int64)
# 8930 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 572 "imp_parser.mly"
        ( ExpCst(Cst.R64 _1) )
# 8935 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)

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
        let (_menhir_stack : 'freshtv459 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState14 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv457 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 581 "imp_parser.mly"
                ( App(Name(ref(Stt_Axm Ast.Axm._none)),Rcd [||]) )
# 9006 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv458)) : 'freshtv460)
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
        _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 9048 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv455) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 9057 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv453) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 9065 "imp_parser.ml"
    )) : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 9069 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv454)) : 'freshtv456)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv449 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9085 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run347 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | DTA_GRM ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LCE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL_END | MDL_EOP ->
            _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv450)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv452)

and _menhir_run396 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv447) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 9122 "imp_parser.ml"
    ) = 
# 61 "imp_parser.mly"
        ( [] )
# 9126 "imp_parser.ml"
     in
    _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv448)

and _menhir_reduce56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 104 "imp_parser.mly"
      ( [] )
# 9135 "imp_parser.ml"
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
        let (_menhir_stack : 'freshtv443 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9151 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run347 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | DTA_GRM ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv441 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9166 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState40 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState255 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState255 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState255) : 'freshtv442)
        | LCE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MDL ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MDL_END | MDL_EOP ->
            _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv444)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv445 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv446)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState41 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv395 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9219 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv391 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9230 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | WC ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv387 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9240 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv385 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9247 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 9252 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : 'tv_glb_etr = 
# 288 "imp_parser.mly"
                       ( Mdl_Ln(false,_3) )
# 9261 "imp_parser.ml"
                     in
                    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)) : 'freshtv388)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv389 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9271 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)) : 'freshtv392)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv393 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9282 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)) : 'freshtv396)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv397 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv398)) : 'freshtv400)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv439 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState41 in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9300 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR_REV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv401 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9311 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState230 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | ARR ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | COPRD ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | COPRD_END ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | COPRD_PTN ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | COPRD_PTN_END ->
                _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | EOP ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | EOP_EXN ->
                _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
            | OUT_IR ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState247
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
            | ROT _v ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState247) : 'freshtv402)
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9351 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState230 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState242
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState242
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState242
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState242
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState242
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState242) : 'freshtv404)
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv411 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9385 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState230 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | WC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv407 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9397 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv405 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9404 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 9409 "imp_parser.ml"
                ))), _) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_glb_etr = 
# 289 "imp_parser.mly"
                   ( Mdl_Ln(true,_2) )
# 9417 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv406)) : 'freshtv408)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv409 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9427 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv410)) : 'freshtv412)
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9436 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState230 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ENV ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv423) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState231 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDX _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv415 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 19 "imp_parser.mly"
       (int)
# 9457 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv413 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 19 "imp_parser.mly"
       (int)
# 9465 "imp_parser.ml"
                    )) : (
# 19 "imp_parser.mly"
       (int)
# 9469 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 304 "imp_parser.mly"
            ( ExStgArg _2 )
# 9476 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
                | STG _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv419 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9485 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv417 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 18 "imp_parser.mly"
       (string)
# 9493 "imp_parser.ml"
                    )) : (
# 18 "imp_parser.mly"
       (string)
# 9497 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 303 "imp_parser.mly"
            ( ExStg _2 )
# 9504 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)) : 'freshtv420)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv421 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv422)) : 'freshtv424)
            | IDX _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv427) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState231 in
                let (_v : (
# 19 "imp_parser.mly"
       (int)
# 9521 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv425) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 19 "imp_parser.mly"
       (int)
# 9530 "imp_parser.ml"
                )) : (
# 19 "imp_parser.mly"
       (int)
# 9534 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 302 "imp_parser.mly"
        ( SttArg _1 )
# 9539 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)) : 'freshtv428)
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
            | R64 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState231 in
                let (_v : (
# 20 "imp_parser.mly"
       (int64)
# 9553 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv429) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 9562 "imp_parser.ml"
                )) : (
# 20 "imp_parser.mly"
       (int64)
# 9566 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 301 "imp_parser.mly"
        ( Cst(Cst.R64 _1) )
# 9571 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv430)) : 'freshtv432)
            | STG _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv435) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState231 in
                let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9581 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv433) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 9590 "imp_parser.ml"
                )) : (
# 18 "imp_parser.mly"
       (string)
# 9594 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 300 "imp_parser.mly"
        ( Cst(Cst.S8 _1) )
# 9599 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)) : 'freshtv436)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231) : 'freshtv438)
        | L_RCD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState230
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230) : 'freshtv440)
    | SLF _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run257 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState257 in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 9638 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 18 "imp_parser.mly"
       (string)
# 9647 "imp_parser.ml"
        )) : (
# 18 "imp_parser.mly"
       (string)
# 9651 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 122 "imp_parser.mly"
                ( Grm_Abs _2 )
# 9658 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv382)) : 'freshtv384)
    | SLF _v ->
        _menhir_run258 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257

and _menhir_run347 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run374 _menhir_env (Obj.magic _menhir_stack) MenhirState347
    | NAM _v ->
        _menhir_run350 _menhir_env (Obj.magic _menhir_stack) MenhirState347 _v
    | SLF _v ->
        _menhir_run348 _menhir_env (Obj.magic _menhir_stack) MenhirState347 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState347

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState404 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv28)
    | MenhirState400 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv30)
    | MenhirState398 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState385 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState380 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9711 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState377 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9720 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState376 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9729 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState370 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9738 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9742 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState369 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9751 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState366 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9760 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9764 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState365 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9773 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState363 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv49 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9782 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9786 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9795 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState359 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9804 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState353 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9818 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState351 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv60)
    | MenhirState349 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9831 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState347 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState344 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv67 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState339 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv69 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState338 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState333 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState331 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv77 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv79 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState329 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv81 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv83 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState326 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv85 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState325 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv89 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState320 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState319 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState318 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv103 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv105 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv107 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState314 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv109 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv111 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv113 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState310 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState309 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState301 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv125 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9995 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv127 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10004 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv129 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10013 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState295 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv133 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv141 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10047 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * _menhir_state * 'tv_grm_ptn) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState281 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv149 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10071 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10090 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10104 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 10108 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv163 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10122 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10131 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv167 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10140 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10144 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10148 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv169 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10157 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10161 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv171 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10170 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10174 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10183 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10192 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10201 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10210 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv181 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10219 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv183 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10228 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10237 "imp_parser.ml"
        )) * _menhir_state * 'tv_id_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv187 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10246 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv189 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10255 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv191 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10264 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv193 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10273 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv195 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv197 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10287 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir_tail) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv199 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10296 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv201 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10305 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv205 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv219 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10354 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10358 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10367 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10376 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv227 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv229 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10395 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10404 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv233 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv235 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv237 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv239 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv241 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv243 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv247 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv249 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv251 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv255 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10473 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv259 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10482 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10486 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10495 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv263 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10504 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10513 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv267 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv269 * _menhir_state) * _menhir_state) * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv281 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10557 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_regs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv283 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv287 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10576 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv289 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10585 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10624 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv305 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10633 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv307) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10642 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10646 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv309) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10655 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv311) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10664 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv313 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10673 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv315 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10682 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10686 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv317 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10695 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv319 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10704 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10708 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10717 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 10726 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv325 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv327 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv330)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv334)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10763 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 10772 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10786 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10795 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv348)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv349 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv351 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv352)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv353 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv354)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv355 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv356)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv357 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv359 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv360)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv361 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv362)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv363 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv368)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv369 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv370)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv372)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv373 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10868 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv374)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv375 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10877 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv380)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 10894 "imp_parser.ml"
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
# 10906 "imp_parser.ml"
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
    | APP | BYTE | COPRD | COPRD_END | CUT | DOT_END | DTA | DTA_GRM | EOF | EXP | IDX _ | IMP | INI_IR | LCE | LINE _ | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | MLT | N | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRD | PRM _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | S8_P | SCL | SGN | SLF _ | SPL | SRC | SRC_OUT | STG _ | SYNT_COPRD | TYP_STG | VAL _ | WC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10924 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 10929 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10934 "imp_parser.ml"
        ) = 
# 56 "imp_parser.mly"
        ( EndN _1 )
# 10938 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10948 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 10956 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | APP | BYTE | COPRD | COPRD_END | CUT | DOT_END | DTA | DTA_GRM | EOF | EXP | IDX _ | IMP | INI_IR | LCE | LINE _ | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | MLT | N | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRD | PRM _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | S8_P | SCL | SGN | SLF _ | SPL | SRC | SRC_OUT | STG _ | SYNT_COPRD | TYP_STG | VAL _ | WC ->
        _menhir_reduce145 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10974 "imp_parser.ml"
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
# 11004 "imp_parser.ml"
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
# 11032 "imp_parser.ml"
            ) = 
# 49 "imp_parser.mly"
                ( End )
# 11036 "imp_parser.ml"
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
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 11084 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run396 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MDL ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv6))

and file_top : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 11105 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run347 _menhir_env (Obj.magic _menhir_stack) MenhirState400
    | DTA_GRM ->
        _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState400
    | LCE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState400
    | MDL ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState400
    | EOF ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState400
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState400) : 'freshtv4))

and name_eof : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 37 "imp_parser.mly"
      (Lang.name)
# 11132 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState404 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState404 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState404) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 11153 "imp_parser.ml"
