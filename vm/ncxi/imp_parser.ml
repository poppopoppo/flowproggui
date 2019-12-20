
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
  | MenhirState379
  | MenhirState375
  | MenhirState373
  | MenhirState360
  | MenhirState355
  | MenhirState352
  | MenhirState351
  | MenhirState345
  | MenhirState344
  | MenhirState341
  | MenhirState340
  | MenhirState338
  | MenhirState337
  | MenhirState334
  | MenhirState330
  | MenhirState328
  | MenhirState326
  | MenhirState324
  | MenhirState322
  | MenhirState319
  | MenhirState315
  | MenhirState314
  | MenhirState313
  | MenhirState312
  | MenhirState308
  | MenhirState306
  | MenhirState305
  | MenhirState304
  | MenhirState303
  | MenhirState301
  | MenhirState300
  | MenhirState299
  | MenhirState298
  | MenhirState297
  | MenhirState296
  | MenhirState295
  | MenhirState294
  | MenhirState293
  | MenhirState292
  | MenhirState291
  | MenhirState290
  | MenhirState289
  | MenhirState287
  | MenhirState286
  | MenhirState285
  | MenhirState284
  | MenhirState280
  | MenhirState277
  | MenhirState276
  | MenhirState274
  | MenhirState273
  | MenhirState272
  | MenhirState270
  | MenhirState268
  | MenhirState267
  | MenhirState266
  | MenhirState265
  | MenhirState264
  | MenhirState260
  | MenhirState259
  | MenhirState257
  | MenhirState256
  | MenhirState253
  | MenhirState248
  | MenhirState246
  | MenhirState243
  | MenhirState235
  | MenhirState232
  | MenhirState230
  | MenhirState222
  | MenhirState221
  | MenhirState220
  | MenhirState218
  | MenhirState217
  | MenhirState206
  | MenhirState205
  | MenhirState203
  | MenhirState201
  | MenhirState200
  | MenhirState199
  | MenhirState197
  | MenhirState192
  | MenhirState191
  | MenhirState190
  | MenhirState187
  | MenhirState185
  | MenhirState175
  | MenhirState173
  | MenhirState171
  | MenhirState166
  | MenhirState162
  | MenhirState160
  | MenhirState158
  | MenhirState156
  | MenhirState154
  | MenhirState151
  | MenhirState149
  | MenhirState145
  | MenhirState141
  | MenhirState139
  | MenhirState135
  | MenhirState133
  | MenhirState131
  | MenhirState129
  | MenhirState127
  | MenhirState123
  | MenhirState116
  | MenhirState114
  | MenhirState112
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState106
  | MenhirState105
  | MenhirState99
  | MenhirState97
  | MenhirState94
  | MenhirState93
  | MenhirState90
  | MenhirState89
  | MenhirState88
  | MenhirState87
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

# 393 "imp_parser.ml"

let rec _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState280 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1411 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1409 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 167 "imp_parser.mly"
                     ( _1::_2 )
# 411 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1410)) : 'freshtv1412)
    | MenhirState315 | MenhirState289 | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1415 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1413 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_rule_seq = 
# 185 "imp_parser.mly"
                ( Some _2 )
# 428 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1414)) : 'freshtv1416)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1419 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 436 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 440 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1417 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 448 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 452 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 459 "imp_parser.ml"
        ))), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 463 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 135 "imp_parser.mly"
                        (
    Lang.Grm.Cnc(_3,_4) )
# 470 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1418)) : 'freshtv1420)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_rule : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1407 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState280
    | COPRD_END ->
        _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState280
    | ORD_LEX_COPRD ->
        _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState280
    | ORD_LEX_COPRD_END ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState280
    | ORD_LINE_COPRD ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState280
    | ORD_LINE_COPRD_END ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState280
    | SYNT_COPRD ->
        _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState280
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState280) : 'freshtv1408)

and _menhir_goto_grm_rule_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1405) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1403) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_end) : 'tv_grm_rule_end) = _v in
    ((let _v : 'tv_grm_ord = 
# 166 "imp_parser.mly"
                 ( [_1] )
# 516 "imp_parser.ml"
     in
    _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1404)) : 'freshtv1406)

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState319 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1391 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1389 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 129 "imp_parser.mly"
                    ( _1::_2 )
# 536 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1390)) : 'freshtv1392)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1401 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1399 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 553 "imp_parser.ml"
        ) = 
# 125 "imp_parser.mly"
                    ( _2 )
# 557 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1397) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 565 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1395) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 573 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1393) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 581 "imp_parser.ml"
        )) : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 585 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 121 "imp_parser.mly"
            ( Gram _1 )
# 590 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1394)) : 'freshtv1396)) : 'freshtv1398)) : 'freshtv1400)) : 'freshtv1402)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_rule_seq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_seq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState285 | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1375 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1373 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule_end = 
# 188 "imp_parser.mly"
                                          (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,_3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2,_3) )
# 615 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1374)) : 'freshtv1376)
    | MenhirState274 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1379 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 623 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1377 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 631 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 638 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule = 
# 169 "imp_parser.mly"
                                              (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,_5,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4,_5) )
# 647 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1378)) : 'freshtv1380)
    | MenhirState314 | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1383 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1381 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule = 
# 174 "imp_parser.mly"
                                      (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,_3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2,_3) )
# 666 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1382)) : 'freshtv1384)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1387 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 674 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1385 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 682 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 689 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule_end = 
# 193 "imp_parser.mly"
                                                  (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,_5,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4,_5) )
# 698 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1386)) : 'freshtv1388)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1371 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState319 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1369 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 128 "imp_parser.mly"
            ( [_1] )
# 721 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1370)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState319) : 'freshtv1372)

and _menhir_run300 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState300
    | NAM _v ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState300 _v
    | REG _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState300 _v
    | WC ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState300
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState300

and _menhir_run304 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | NAM _v ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
    | REG _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
    | WC ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState304

and _menhir_run286 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState286
    | NAM _v ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
    | REG _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
    | WC ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState286
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286

and _menhir_run290 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | NAM _v ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
    | REG _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
    | WC ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState290
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState290

and _menhir_reduce97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_rule_seq = 
# 184 "imp_parser.mly"
    ( None )
# 810 "imp_parser.ml"
     in
    _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v

and _menhir_run265 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState265
    | COPRD_END ->
        _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState265
    | ORD_LEX_COPRD ->
        _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState265
    | ORD_LEX_COPRD_END ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState265
    | ORD_LINE_COPRD ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState265
    | ORD_LINE_COPRD_END ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState265
    | SYNT_COPRD ->
        _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState265
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState265

and _menhir_goto_grm_ord_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState308 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1355 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1353 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule_act)) = _menhir_stack in
        let _v : 'tv_grm_ord_act = 
# 140 "imp_parser.mly"
                             ( _1::_2 )
# 855 "imp_parser.ml"
         in
        _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1354)) : 'freshtv1356)
    | MenhirState306 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1359 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1357 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_8 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _), _, (_6 : 'tv_reg_ptn_src)), _, (_7 : 'tv_ir_lines)) = _menhir_stack in
        let _5 = () in
        let _4 = () in
        let _v : 'tv_grm_rule_act = 
# 143 "imp_parser.mly"
                                                                  (
    Grm.Act_Seq((_6,ref _7),_1,_2,_3,_8)
  )
# 875 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1358)) : 'freshtv1360)
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1363 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1361 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_8 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _), _, (_6 : 'tv_reg_ptn_src)), _, (_7 : 'tv_ir_lines)) = _menhir_stack in
        let _5 = () in
        let _4 = () in
        let _v : 'tv_grm_rule_act_end = 
# 151 "imp_parser.mly"
                                                                      (
    Grm.Act_Seq((_6,ref _7),_1,_2,_3,_8)
  )
# 895 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1362)) : 'freshtv1364)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1367 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 903 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 907 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1365 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 915 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 919 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 926 "imp_parser.ml"
        ))), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 930 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 132 "imp_parser.mly"
                            (
    Lang.Grm.Act(_3,_4)
  )
# 938 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1366)) : 'freshtv1368)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1329 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 953 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SLF _ | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState264) : 'freshtv1330)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1331 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SLF _ | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState268) : 'freshtv1332)
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1333 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 985 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState274
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState274
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState274) : 'freshtv1334)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1335 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run265 _menhir_env (Obj.magic _menhir_stack) MenhirState277
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState277
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState277) : 'freshtv1336)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1339 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1337 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState285 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | COPRD_END ->
                _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | ORD_LEX_COPRD ->
                _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | ORD_LEX_COPRD_END ->
                _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | ORD_LINE_COPRD ->
                _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | ORD_LINE_COPRD_END ->
                _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | SRC ->
                _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | SYNT_COPRD ->
                _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState289
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState289) : 'freshtv1338)
        | SRC ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState285) : 'freshtv1340)
    | MenhirState294 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1343 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1341 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState295 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState296
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState296) : 'freshtv1342)
        | SRC ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState295
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState295) : 'freshtv1344)
    | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1347 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1345 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState299 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState303
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState303) : 'freshtv1346)
        | SRC ->
            _menhir_run300 _menhir_env (Obj.magic _menhir_stack) MenhirState299
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState299) : 'freshtv1348)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1351 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1349 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState314 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState315
            | COPRD_END ->
                _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState315
            | ORD_LEX_COPRD ->
                _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState315
            | ORD_LEX_COPRD_END ->
                _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState315
            | ORD_LINE_COPRD ->
                _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState315
            | ORD_LINE_COPRD_END ->
                _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState315
            | SRC ->
                _menhir_run304 _menhir_env (Obj.magic _menhir_stack) MenhirState315
            | SYNT_COPRD ->
                _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState315
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState315) : 'freshtv1350)
        | SRC ->
            _menhir_run300 _menhir_env (Obj.magic _menhir_stack) MenhirState314
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState314
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState314) : 'freshtv1352)
    | _ ->
        _menhir_fail ()

and _menhir_reduce81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_prd = 
# 226 "imp_parser.mly"
    ( None )
# 1156 "imp_parser.ml"
     in
    _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run257 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | L_LST ->
        _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | L_OPN ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | MLT ->
        _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
    | STG _v ->
        _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
    | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
        _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257

and _menhir_goto_grm_rule_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1327 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState308
    | COPRD_END ->
        _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState308
    | ORD_LEX_COPRD ->
        _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState308
    | ORD_LEX_COPRD_END ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState308
    | ORD_LINE_COPRD ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState308
    | ORD_LINE_COPRD_END ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState308
    | SYNT_COPRD ->
        _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState308
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState308) : 'freshtv1328)

and _menhir_goto_grm_rule_act_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_act_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1325) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_act_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1323) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_act_end) : 'tv_grm_rule_act_end) = _v in
    ((let _v : 'tv_grm_ord_act = 
# 139 "imp_parser.mly"
                     ( [_1] )
# 1227 "imp_parser.ml"
     in
    _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1324)) : 'freshtv1326)

and _menhir_goto_mtc_ir_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState305 | MenhirState301 | MenhirState291 | MenhirState287 | MenhirState222 | MenhirState200 | MenhirState197 | MenhirState171 | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1317) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1315) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let _v : 'tv_ir_lines = 
# 320 "imp_parser.mly"
               ( Mtc(_1) )
# 1246 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1316)) : 'freshtv1318)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1321 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1319 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 494 "imp_parser.mly"
                                            ([|((_2,None),_3)|] |+| _4 )
# 1262 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1320)) : 'freshtv1322)
    | _ ->
        _menhir_fail ()

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1309 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1276 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1307 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1284 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1291 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 307 "imp_parser.mly"
                                           ( [_3]@_4 )
# 1297 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1308)) : 'freshtv1310)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1313 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1311 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 290 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 1314 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1312)) : 'freshtv1314)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1301 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1299 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_regs) : 'tv_regs) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 515 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 1337 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1300)) : 'freshtv1302)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1305 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1345 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1303 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1353 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_regs) : 'tv_regs) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1360 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 324 "imp_parser.mly"
                                 ( IR_Id(ref(IR_Id_C(_2,[|_4|] |+| _5)))  )
# 1366 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1304)) : 'freshtv1306)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_eq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_eq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1295 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | ARR ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | COPRD ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | COPRD_END ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | COPRD_PTN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | COPRD_PTN_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | EOP ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState197
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197) : 'freshtv1296)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1297 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | ARR ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | COPRD ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | COPRD_END ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | COPRD_PTN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | COPRD_PTN_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | EOP ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200) : 'freshtv1298)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1289 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1287 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_mtc_ir_tail) : 'tv_mtc_ir_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_mtc_ir_test)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_mtc_ir_tail = 
# 379 "imp_parser.mly"
                                ( _2::_3 )
# 1464 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1288)) : 'freshtv1290)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1293 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1291 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_mtc_ir_tail) : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_mtc_ir_test)) = _menhir_stack in
        let _v : 'tv_ir_ptn_eq = 
# 375 "imp_parser.mly"
                            ( _1::_2 )
# 1480 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1292)) : 'freshtv1294)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1259 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1495 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState256) : 'freshtv1260)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1263 * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1261 * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_prd = 
# 227 "imp_parser.mly"
                 ( Some _2 )
# 1518 "imp_parser.ml"
         in
        _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1262)) : 'freshtv1264)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1267 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1265 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _), _, (_3 : 'tv_grm_ptns)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_ptns = 
# 212 "imp_parser.mly"
                         ( _1::_3 )
# 1531 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1266)) : 'freshtv1268)
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1271 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1269 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_ptns = 
# 211 "imp_parser.mly"
                     ( _1::_2 )
# 1543 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1270)) : 'freshtv1272)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1273 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState267) : 'freshtv1274)
    | MenhirState272 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1275 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1565 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState273
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState273
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState273) : 'freshtv1276)
    | MenhirState270 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1277 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState276
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState276
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState276) : 'freshtv1278)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1279 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState284
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState284
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState284) : 'freshtv1280)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1281 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState294
        | SCL | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState294
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState294) : 'freshtv1282)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1283 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState298
        | SCL | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState298
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState298) : 'freshtv1284)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1285 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run257 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SRC | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState313) : 'freshtv1286)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op_src : _menhir_env -> 'ttv_tail -> 'tv_reg_ptn_op_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1257 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
    let (_v : 'tv_reg_ptn_op_src) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1255 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
    let ((_3 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 433 "imp_parser.mly"
                                         (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn_src 0" (* Rcd_Ptn.Ro ($2,r)*) )
# 1667 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1256)) : 'freshtv1258)

and _menhir_goto_reg_ptn_lst_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1243 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1241 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn_src)), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst_src = 
# 447 "imp_parser.mly"
                                ( [|_1|] |+| _2 )
# 1684 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1242)) : 'freshtv1244)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1253 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1245) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
            | REG _v ->
                _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145) : 'freshtv1246)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1249) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1247) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 444 "imp_parser.mly"
          ( None )
# 1717 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _v) : 'freshtv1248)) : 'freshtv1250)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1251 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1252)) : 'freshtv1254)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1213 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1739 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1211 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1745 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 1750 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), (_3 : 'tv_typ_def)), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 310 "imp_parser.mly"
                                 ( (_1,fst _3,snd _3,(_2,ref _4)) )
# 1755 "imp_parser.ml"
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
# 1768 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState203 _v
            | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1201 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1780 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1785 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 306 "imp_parser.mly"
                            ( [_3] )
# 1791 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1202)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState203) : 'freshtv1204)
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
# 1808 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1206)) : 'freshtv1208)
        | _ ->
            _menhir_fail ()) : 'freshtv1210)) : 'freshtv1212)) : 'freshtv1214)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1217 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1215 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 318 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 1822 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1216)) : 'freshtv1218)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1221 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1219 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn_end)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 493 "imp_parser.mly"
                                     ( [|((_2,None),_3)|] )
# 1834 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1220)) : 'freshtv1222)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1223 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | COPRD_END ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | COPRD_PTN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | COPRD_PTN_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201) : 'freshtv1224)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1227 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1860 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1225 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1866 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 1871 "imp_parser.ml"
        ))), _), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 296 "imp_parser.mly"
                             ( Ast.Etr_Glb(_2,ref _4) )
# 1878 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1226)) : 'freshtv1228)
    | MenhirState287 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1231 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1229 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _, (_5 : 'tv_reg_ptn_src)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_grm_rule_act_end = 
# 154 "imp_parser.mly"
                                                      (
    Grm.Act_End((_5,ref _6),_1,_2,_3)
 )
# 1893 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1230)) : 'freshtv1232)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1233 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | COPRD_END ->
            _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | ORD_LEX_COPRD ->
            _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | ORD_LEX_COPRD_END ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | ORD_LINE_COPRD ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | ORD_LINE_COPRD_END ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | SYNT_COPRD ->
            _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState292) : 'freshtv1234)
    | MenhirState301 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1237 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1235 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _, (_5 : 'tv_reg_ptn_src)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_grm_rule_act = 
# 146 "imp_parser.mly"
                                                  (
    Grm.Act_End((_5,ref _6),_1,_2,_3)
   )
# 1932 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1236)) : 'freshtv1238)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1239 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | COPRD_END ->
            _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | ORD_LEX_COPRD ->
            _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | ORD_LEX_COPRD_END ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | ORD_LINE_COPRD ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | ORD_LINE_COPRD_END ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | SYNT_COPRD ->
            _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState306) : 'freshtv1240)
    | _ ->
        _menhir_fail ()

and _menhir_reduce173 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 514 "imp_parser.mly"
    ( [||] )
# 1967 "imp_parser.ml"
     in
    _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89

and _menhir_goto_mtc_ir_suc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_suc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState190 | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1195) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1193) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_mtc_ir_tail = 
# 378 "imp_parser.mly"
               ( [] )
# 2005 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1194)) : 'freshtv1196)
    | MenhirState199 | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1199) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1197) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_ir_ptn_eq = 
# 374 "imp_parser.mly"
               ( [] )
# 2020 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1198)) : 'freshtv1200)
    | _ ->
        _menhir_fail ()

and _menhir_run245 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord_end -> _menhir_state -> (
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
        let (_menhir_stack : ('freshtv1189 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2041 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState246 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState246 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState246 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState246) : 'freshtv1190)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | EXP | LCE | L_LST | L_OPN | MDL | MDL_END | MDL_EOP | MLT | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRM _ | SCL | SLF _ | SRC | STG _ | SYNT_COPRD ->
        _menhir_reduce138 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1191 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2077 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1192)

and _menhir_run271 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 2085 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1185 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2097 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState272 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState272 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState272 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState272) : 'freshtv1186)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | CUT | EXP | L_LST | L_OPN | MLT | NAM _ | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRM _ | SCL | SRC | STG _ | SYNT_COPRD ->
        _menhir_reduce138 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1187 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2133 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1188)

and _menhir_reduce86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 210 "imp_parser.mly"
    ( [] )
# 2143 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_run244 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 2150 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1183) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 2160 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 2164 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 220 "imp_parser.mly"
        ( Grm.Txt _1 )
# 2169 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1184)

and _menhir_run247 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1181) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 222 "imp_parser.mly"
        ( Grm.Name(EndN "_byt") )
# 2183 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1182)

and _menhir_run248 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState248
    | MLT ->
        _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState248
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState248 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState248 _v
    | STG _v ->
        _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState248 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState248

and _menhir_run253 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState253
    | MLT ->
        _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState253
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState253 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState253 _v
    | STG _v ->
        _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState253 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState253

and _menhir_run249 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1179) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 223 "imp_parser.mly"
         ( Grm.Name(EndN "_byt") )
# 2239 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1180)

and _menhir_run191 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _v
    | VAL _v ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1177 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | ARR ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | COPRD ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | COPRD_END ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | COPRD_PTN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | COPRD_PTN_END ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | EOP ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | EOP_EXN ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | OUT_IR ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | ROT _v ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171) : 'freshtv1178)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1171 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2303 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1169 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2311 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 2318 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 235 "imp_parser.mly"
                                        ( [_3]@_4 )
# 2324 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1170)) : 'freshtv1172)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1175 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1173 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 119 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2341 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1174)) : 'freshtv1176)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState141 | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1147 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | NAM _v ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
        | REG _v ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
        | WC ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | OP | R_RCD ->
            _menhir_reduce162 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv1148)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1153 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1149 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv1150)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1151 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1152)) : 'freshtv1154)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1159 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1155 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154) : 'freshtv1156)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1157 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1158)) : 'freshtv1160)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1161 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | ARR ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | COPRD ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | COPRD_END ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | COPRD_PTN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | COPRD_PTN_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | EOP ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState287 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState287
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState287 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState287 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState287) : 'freshtv1162)
    | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1163 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | ARR ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | COPRD ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | COPRD_END ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | COPRD_PTN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | COPRD_PTN_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EOP ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState291 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState291 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState291 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState291) : 'freshtv1164)
    | MenhirState300 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1165 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | ARR ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | COPRD ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | COPRD_END ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | COPRD_PTN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | COPRD_PTN_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | EOP ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState301
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState301 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState301) : 'freshtv1166)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1167 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | ARR ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | COPRD ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | COPRD_END ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | COPRD_PTN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | COPRD_PTN_END ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | EOP ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState305 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState305 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState305 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState305) : 'freshtv1168)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState304 | MenhirState300 | MenhirState290 | MenhirState286 | MenhirState135 | MenhirState149 | MenhirState141 | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1137 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1135 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_src = 
# 432 "imp_parser.mly"
            ( Rcd_Ptn.A _1 )
# 2585 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1136)) : 'freshtv1138)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1145) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1141) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1139) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (_2 : 'tv_reg_src)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 443 "imp_parser.mly"
                      ( Some _2 )
# 2606 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _v) : 'freshtv1140)) : 'freshtv1142)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1143) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1144)) : 'freshtv1146)
    | _ ->
        _menhir_fail ()

and _menhir_reduce162 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_src = 
# 446 "imp_parser.mly"
    ( [||] )
# 2624 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_src_par_p : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_src_par_p -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1127 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | LINE _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | STG _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | S8_P ->
            _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv1128)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1133 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1129 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133) : 'freshtv1130)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1131 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1132)) : 'freshtv1134)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ret : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ret -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1125) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ret) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1123) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
    ((let _v : 'tv_ir_lines = 
# 317 "imp_parser.mly"
           ( _1 )
# 2699 "imp_parser.ml"
     in
    _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1124)) : 'freshtv1126)

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState56 | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1051 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
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
            _menhir_reduce160 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv1052)
    | MenhirState205 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1059 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2732 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1053) = Obj.magic _menhir_stack in
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv1054)
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1055) = Obj.magic _menhir_stack in
            ((let _v : 'tv_typ_def = 
# 518 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 2771 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv1056)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1057 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2781 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1058)) : 'freshtv1060)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1065 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2790 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1061 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2800 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87) : 'freshtv1062)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1063 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2824 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1064)) : 'freshtv1066)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1067 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2833 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce173 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv1068)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1069 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce173 _menhir_env (Obj.magic _menhir_stack) MenhirState90
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv1070)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1077 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1073 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1071 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 335 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2879 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1072)) : 'freshtv1074)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1075 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1076)) : 'freshtv1078)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1081 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1079 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 313 "imp_parser.mly"
                ( Ret _2 )
# 2899 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1080)) : 'freshtv1082)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1085 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1083 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn_src)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 325 "imp_parser.mly"
                                            ( IR_Exp(_2,_4,_6) )
# 2914 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1084)) : 'freshtv1086)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1089 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1087 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_3 : 'tv_reg_ptn_src)), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 326 "imp_parser.mly"
                                    ( IR_Exp(_2,_3,_5) )
# 2928 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1088)) : 'freshtv1090)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1095 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1091 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160) : 'freshtv1092)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1093 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1094)) : 'freshtv1096)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1099 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1097 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 333 "imp_parser.mly"
                                    (
     IR_Glb_Call(ref(Lang.Ast.Stt_Axm Lang.Ast.Axm._app),RP.R [|RP.A _2;_4|],_6) )
# 2975 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1098)) : 'freshtv1100)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1113 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2983 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1101 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2993 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv1102)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1105 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3015 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1103 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3022 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3027 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 321 "imp_parser.mly"
                        ( IL_Glb_Call(ref(Ast.Stt_Name _1),_2) )
# 3033 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1104)) : 'freshtv1106)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1109 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3041 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1107 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3048 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3053 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 337 "imp_parser.mly"
                         ( IR_Glb_Out(ref(Ast.Stt_Name _1),_2) )
# 3059 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1108)) : 'freshtv1110)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1111 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3069 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1112)) : 'freshtv1114)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1117 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3078 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1115 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3084 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3089 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 332 "imp_parser.mly"
                             ( IR_Glb_Call(ref(Ast.Stt_Name _1),_2,_4) )
# 3095 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1116)) : 'freshtv1118)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1121 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3103 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3107 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1119 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3113 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3117 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3122 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3126 "imp_parser.ml"
        ))), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_mtc_ir_test = 
# 382 "imp_parser.mly"
                             (
    (ref(R_N _1),ref(Eq_Agl_N(ref(Ast.Stt_Name _3),_5)))
    )
# 3135 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1120)) : 'freshtv1122)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1049 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_reg_ptn_op) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1047 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_reg_ptn = 
# 463 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn 0" (* Rcd_Ptn.Ro ($2,r)  *) )
# 3157 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1048)) : 'freshtv1050)

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1041 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1033) = Obj.magic _menhir_stack in
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv1034)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1037) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1035) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 474 "imp_parser.mly"
          ( None )
# 3197 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv1036)) : 'freshtv1038)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1039 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1040)) : 'freshtv1042)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1045 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1043 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 477 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 3216 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1044)) : 'freshtv1046)
    | _ ->
        _menhir_fail ()

and _menhir_run174 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 3225 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1029 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3237 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | INT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1011) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState175 in
            let (_v : (
# 19 "imp_parser.mly"
       (int)
# 3249 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1009) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 19 "imp_parser.mly"
       (int)
# 3258 "imp_parser.ml"
            )) : (
# 19 "imp_parser.mly"
       (int)
# 3262 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 392 "imp_parser.mly"
        ( P_Z _1 )
# 3267 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1010)) : 'freshtv1012)
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
        | R2 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1015) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState175 in
            let (_v : (
# 21 "imp_parser.mly"
       (bool)
# 3281 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1013) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 21 "imp_parser.mly"
       (bool)
# 3290 "imp_parser.ml"
            )) : (
# 21 "imp_parser.mly"
       (bool)
# 3294 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 394 "imp_parser.mly"
       ( P_R2 _1 )
# 3299 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1014)) : 'freshtv1016)
        | R64 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1019) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState175 in
            let (_v : (
# 20 "imp_parser.mly"
       (int64)
# 3309 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1017) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 3318 "imp_parser.ml"
            )) : (
# 20 "imp_parser.mly"
       (int64)
# 3322 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 393 "imp_parser.mly"
        ( P_R64 _1 )
# 3327 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1018)) : 'freshtv1020)
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1023) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState175 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 3337 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1021) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 3346 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (string)
# 3350 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 391 "imp_parser.mly"
        ( P_Stg _1 )
# 3355 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1022)) : 'freshtv1024)
        | VAL _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1027 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3363 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState175 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 3369 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1025 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3376 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_3 : (
# 18 "imp_parser.mly"
       (string)
# 3382 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (string)
# 3386 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3391 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_mtc_ir_test = 
# 387 "imp_parser.mly"
               (
    (ref(R_N _1),ref(Eq_V(ref(R_N _3)))) )
# 3398 "imp_parser.ml"
             in
            _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1026)) : 'freshtv1028)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175) : 'freshtv1030)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1031 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3412 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1032)

and _menhir_run183 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1007) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 498 "imp_parser.mly"
        ()
# 3427 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1008)

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 3434 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1003 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3446 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185) : 'freshtv1004)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1005 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3466 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1006)

and _menhir_run189 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1001) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 499 "imp_parser.mly"
            ()
# 3481 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1002)

and _menhir_goto_ord_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv995 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | NAM _v ->
            _menhir_run245 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
        | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243) : 'freshtv996)
    | MenhirState315 | MenhirState289 | MenhirState280 | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv997 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | NAM _v ->
            _menhir_run245 _menhir_env (Obj.magic _menhir_stack) MenhirState266 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState266 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState266 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266) : 'freshtv998)
    | MenhirState308 | MenhirState306 | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv999 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState293 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState293 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState293 _v
        | CUT | SCL | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState293) : 'freshtv1000)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState315 | MenhirState289 | MenhirState280 | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv989 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState270
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState270
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState270
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState270
        | NAM _v ->
            _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState270 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState270 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState270 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState270
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState270) : 'freshtv990)
    | MenhirState308 | MenhirState306 | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv991 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState297 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState297 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState297 _v
        | CUT | SCL | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState297) : 'freshtv992)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv993 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | NAM _v ->
            _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState312 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SRC | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState312) : 'freshtv994)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv983 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3663 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv981 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3671 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3678 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 98 "imp_parser.mly"
                 (
    let v = newvar_q (-1) in
    let (vs,l) = _3 in
    (v::vs,(_1,v)::l) )
# 3687 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv982)) : 'freshtv984)
    | MenhirState326 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv987) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv985) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 87 "imp_parser.mly"
             ( _2 )
# 3703 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv986)) : 'freshtv988)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv975 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv973 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 92 "imp_parser.mly"
                 ( 1+_2 )
# 3726 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)) : 'freshtv976)
    | MenhirState326 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv979) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv977) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 88 "imp_parser.mly"
                 ( ([],BatList.init _2 (fun n -> ("$"^(String.make n '\''),newvar_q (-2)))) )
# 3742 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv978)) : 'freshtv980)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState352 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv967 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3756 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv965 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3764 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3771 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 247 "imp_parser.mly"
                  ( _1::_2 )
# 3776 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv966)) : 'freshtv968)
    | MenhirState351 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv971 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3784 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv969 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3792 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 3799 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 242 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3806 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv970)) : 'freshtv972)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv963 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv961 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState259 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | L_LST ->
            _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | L_OPN ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | MLT ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _v
        | STG _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState260
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState260) : 'freshtv962)
    | L_LST ->
        _menhir_run253 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | L_OPN ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | MLT ->
        _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState259 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState259 _v
    | STG _v ->
        _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState259 _v
    | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
        _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState259) : 'freshtv964)

and _menhir_goto_nls : _menhir_env -> 'ttv_tail -> 'tv_nls -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv959 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState360
    | DTA_GRM ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState360
    | LCE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState360
    | MDL ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState360
    | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv957 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState360 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv955 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, (_1 : 'tv_nls)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_nls = 
# 83 "imp_parser.mly"
           ()
# 3898 "imp_parser.ml"
         in
        _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv956)) : 'freshtv958)
    | EOF | MDL_END | MDL_EOP ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState360
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState360) : 'freshtv960)

and _menhir_goto_mtc_ir_test : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_test -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState199 | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv951 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState190
        | SCL ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState190
        | SPL ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState190
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190) : 'freshtv952)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv953 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | SCL ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | SPL ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState192) : 'freshtv954)
    | _ ->
        _menhir_fail ()

and _menhir_goto_s8_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_s8_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv917 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3956 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3960 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv915 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3966 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3970 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 3975 "imp_parser.ml"
        ))), _), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 3979 "imp_parser.ml"
        ))), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_s8_ptn = 
# 351 "imp_parser.mly"
                       ( (S8_For_Txt(_1,_3))::_4 )
# 3985 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv921 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3993 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv919 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3999 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 4004 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 350 "imp_parser.mly"
                ( (S8_Name(ref(Ast.Stt_Name _1)))::_2 )
# 4009 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv920)) : 'freshtv922)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv925 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4017 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv923 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4023 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4028 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 349 "imp_parser.mly"
               ( (S8_Var _1)::_2 )
# 4033 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv924)) : 'freshtv926)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv929 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4041 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv927 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4047 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4052 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 347 "imp_parser.mly"
                ( (S8_Txt _1)::_2 )
# 4057 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)) : 'freshtv930)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv933 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4065 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv931 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4071 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4076 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 348 "imp_parser.mly"
               ( (S8_Txt _1)::_2 )
# 4081 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv932)) : 'freshtv934)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv941 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv937 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv935 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), _), _), _, (_5 : 'tv_reg)), _, (_6 : 'tv_s8_ptn)) = _menhir_stack in
            let _7 = () in
            let _4 = () in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 327 "imp_parser.mly"
                                    (
    IR_S8(ref(IR_S8_C(_6,[||],[|_5|]))) )
# 4106 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv936)) : 'freshtv938)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv939 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv940)) : 'freshtv942)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv949 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv945 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv943 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_src_par_p)), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
            let _5 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 329 "imp_parser.mly"
                                              (
      let (l0,l1) = _3 in
      IR_S8(ref(IR_S8_C(_4,l0,l1))) )
# 4137 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv944)) : 'freshtv946)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv947 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv948)) : 'freshtv950)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState345 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv909 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4158 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4162 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv907 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4170 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4174 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4181 "imp_parser.ml"
        ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4185 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 251 "imp_parser.mly"
                                 ( (_4,_2)::_5 )
# 4192 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv908)) : 'freshtv910)
    | MenhirState334 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv913 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4200 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv911 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4208 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4215 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 239 "imp_parser.mly"
                            (
    Def_CoPrd (_1,snd _2,_3) )
# 4221 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv912)) : 'freshtv914)
    | _ ->
        _menhir_fail ()

and _menhir_run342 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv903 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 4239 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv899 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4250 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState344
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState344
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState344
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState344 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState344 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState344 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState344
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState344
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState344 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState344) : 'freshtv900)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv901 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4284 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv902)) : 'freshtv904)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv905 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv906)

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv893 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4305 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run323 _menhir_env (Obj.magic _menhir_stack) MenhirState355 _v
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv891 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4317 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4322 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 234 "imp_parser.mly"
                         ( [_3] )
# 4328 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv892)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState355) : 'freshtv894)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv897 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv895 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 120 "imp_parser.mly"
                     ( Flow _2 )
# 4345 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv896)) : 'freshtv898)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState338 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv885 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4359 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4363 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv883 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4371 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4375 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4382 "imp_parser.ml"
        ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4386 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 255 "imp_parser.mly"
                             ( (_4,_2)::_5 )
# 4393 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv884)) : 'freshtv886)
    | MenhirState334 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv889 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4401 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv887 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4409 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4416 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 241 "imp_parser.mly"
                         ( Def_Prd (_1,snd _2,_3) )
# 4421 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv888)) : 'freshtv890)
    | _ ->
        _menhir_fail ()

and _menhir_run335 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv879 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 4439 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv875 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4450 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState337
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState337
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState337
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState337
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState337
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState337 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState337) : 'freshtv876)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv877 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4484 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv878)) : 'freshtv880)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv881 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv882)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv873 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4503 "imp_parser.ml"
    )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | ARR ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_END ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_PTN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_PTN_END ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | EOP ->
        _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | EOP_EXN ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | OUT_IR ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | ROT _v ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv874)

and _menhir_run74 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4540 "imp_parser.ml"
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
# 4573 "imp_parser.ml"
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

and _menhir_run136 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv871) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 431 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 4613 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv872)

and _menhir_run137 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 4620 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv869) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 4630 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 4634 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 428 "imp_parser.mly"
        ( ref(R_N _1) )
# 4639 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)

and _menhir_run138 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 4646 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv867) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 4656 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 4660 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 427 "imp_parser.mly"
        ( ref(R_N _1) )
# 4665 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv868)

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | NAM _v ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | REG _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | WC ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | OP | R_RCD ->
        _menhir_reduce162 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv865 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv861 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv859 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 4708 "imp_parser.ml"
        ) = 
# 47 "imp_parser.mly"
  (
    Line _1  )
# 4713 "imp_parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv860)) : 'freshtv862)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv863 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv864)) : 'freshtv866)

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
        let (_menhir_stack : ('freshtv853 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv849 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv847 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 556 "imp_parser.mly"
                         ( _2 )
# 4773 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv848)) : 'freshtv850)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv851 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv852)) : 'freshtv854)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv857 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv855 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 560 "imp_parser.mly"
                 ( App(Name(ref(Stt_Axm Ast.Axm._cns)),Rcd [|_1;_2|]) )
# 4792 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv856)) : 'freshtv858)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_end : _menhir_env -> 'ttv_tail -> 'tv_mdl_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv845 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4804 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_mdl_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv843 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4811 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_mdl_end) : 'tv_mdl_end) = _v in
    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4817 "imp_parser.ml"
    ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_mdl = 
# 71 "imp_parser.mly"
                               ( (_2,_3) )
# 4823 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv841) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_mdl) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState375 | MenhirState38 | MenhirState40 | MenhirState360 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv837 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv835 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : 'tv_mdl_etr = 
# 114 "imp_parser.mly"
            (
    let (n,el) = _1 in Mdl (n,el) )
# 4841 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv836)) : 'freshtv838)
    | MenhirState373 | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv839 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            _menhir_run371 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | MDL ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState373) : 'freshtv840)
    | _ ->
        _menhir_fail ()) : 'freshtv842)) : 'freshtv844)) : 'freshtv846)

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv801) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv797) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv795) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (_2 : 'tv_reg)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 473 "imp_parser.mly"
                  ( Some _2 )
# 4883 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv796)) : 'freshtv798)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv799) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv800)) : 'freshtv802)
    | MenhirState205 | MenhirState44 | MenhirState187 | MenhirState162 | MenhirState166 | MenhirState158 | MenhirState160 | MenhirState154 | MenhirState151 | MenhirState99 | MenhirState94 | MenhirState85 | MenhirState87 | MenhirState89 | MenhirState48 | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv805 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv803 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 462 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 4902 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv804)) : 'freshtv806)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv807 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv808)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv811 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv809 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 314 "imp_parser.mly"
                ( Exn _2 )
# 4933 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)) : 'freshtv812)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv813 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
        | LINE _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
        | STG _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
        | S8_P ->
            _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109) : 'freshtv814)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv819 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv815 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv816)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv817 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv818)) : 'freshtv820)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv823 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv821 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)), _, (_3 : 'tv_reg)), _, (_5 : 'tv_reg)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_src_par_p = 
# 340 "imp_parser.mly"
                            ( ([|_1|],[|_3;_5|]) )
# 4998 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)) : 'freshtv824)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv827 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv825 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)), _, (_3 : 'tv_src_par_p)), _, (_5 : 'tv_reg)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_src_par_p = 
# 341 "imp_parser.mly"
                                  (
      let (l0,l1) = _3 in
      ([|_1|] |+| l0,l1 |+| [|_5|]) )
# 5014 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)) : 'freshtv828)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv833 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv829 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158) : 'freshtv830)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv831 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv832)) : 'freshtv834)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_dst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_dst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState205 | MenhirState44 | MenhirState187 | MenhirState162 | MenhirState166 | MenhirState158 | MenhirState160 | MenhirState156 | MenhirState154 | MenhirState151 | MenhirState133 | MenhirState129 | MenhirState127 | MenhirState108 | MenhirState99 | MenhirState97 | MenhirState94 | MenhirState93 | MenhirState85 | MenhirState87 | MenhirState89 | MenhirState48 | MenhirState56 | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv785 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv783 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)) = _menhir_stack in
        let _v : 'tv_reg = 
# 455 "imp_parser.mly"
            ( _1 )
# 5064 "imp_parser.ml"
         in
        _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv784)) : 'freshtv786)
    | MenhirState131 | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv793 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv787 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131) : 'freshtv788)
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv789 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127) : 'freshtv790)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv791 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv792)) : 'freshtv794)
    | _ ->
        _menhir_fail ()

and _menhir_reduce160 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 476 "imp_parser.mly"
    ( [||] )
# 5118 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv781 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5129 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv775 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv773 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 285 "imp_parser.mly"
                ( _1+1 )
# 5145 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv774)) : 'freshtv776)
    | APP | COPRD | DTA | DTA_GRM | EOF | IMP | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv777 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5153 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 5158 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5163 "imp_parser.ml"
        ) = 
# 278 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 5167 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv778)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv779 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5177 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv780)) : 'freshtv782)

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv771 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
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
        let (_menhir_stack : ('freshtv769 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState69 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv767 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_typs)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5216 "imp_parser.ml"
        ) = 
# 268 "imp_parser.mly"
                     ( Rcd(rcd_cl _2) )
# 5220 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv768)) : 'freshtv770)
    | SGN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TYP_STG ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | VAL _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv772)

and _menhir_goto_coprd_ptn_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv765 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_END ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState173
    | NAM _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _v
    | SPL ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState173
    | VAL _v ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173) : 'freshtv766)

and _menhir_goto_coprd_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv763 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_END ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState199
    | NAM _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
    | SPL ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState199
    | VAL _v ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199) : 'freshtv764)

and _menhir_run236 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv761) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 201 "imp_parser.mly"
               ( Grm.Synt )
# 5286 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)

and _menhir_run237 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv759) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 207 "imp_parser.mly"
                       ( Grm.Line )
# 5300 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)

and _menhir_run238 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv757) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 202 "imp_parser.mly"
                   ( Grm.Line )
# 5314 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv758)

and _menhir_run239 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv755) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 206 "imp_parser.mly"
                      ( Grm.Synt )
# 5328 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv756)

and _menhir_run240 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv753) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 200 "imp_parser.mly"
                  ( Grm.Synt )
# 5342 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv754)

and _menhir_run241 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv751) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 205 "imp_parser.mly"
              ( Grm.Lex )
# 5356 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv752)

and _menhir_run242 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv749) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 199 "imp_parser.mly"
          ( Grm.Lex )
# 5370 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv750)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv747 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5381 "imp_parser.ml"
    )) * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run342 _menhir_env (Obj.magic _menhir_stack) MenhirState334
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv743 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5393 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState334 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PRN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | L_RCD ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | N ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState340 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState340 _v
        | ROT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState340 _v
        | SGN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | TYP_STG ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | VAL _v ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState340 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState340) : 'freshtv744)
    | PRD ->
        _menhir_run335 _menhir_env (Obj.magic _menhir_stack) MenhirState334
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv745 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5429 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5434 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 238 "imp_parser.mly"
                 ( Def_Abs (_1,snd _2) )
# 5439 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv746)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState334) : 'freshtv748)

and _menhir_run327 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5450 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv737 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5462 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run327 _menhir_env (Obj.magic _menhir_stack) MenhirState328 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState328) : 'freshtv738)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv739 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5478 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5483 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 95 "imp_parser.mly"
        (
    let v = newvar_q (-1) in
    ([v],[(_1,v)]) )
# 5490 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv740)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv741 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5500 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv742)

and _menhir_run330 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run330 _menhir_env (Obj.magic _menhir_stack) MenhirState330
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv735 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 91 "imp_parser.mly"
        ( 1 )
# 5521 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState330

and _menhir_run352 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5532 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run352 _menhir_env (Obj.magic _menhir_stack) MenhirState352 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv733 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5546 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5551 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 246 "imp_parser.mly"
        ( [_1] )
# 5556 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv734)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState352

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv719 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv715 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv713 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 217 "imp_parser.mly"
                         ( Grm.Opn _2 )
# 5591 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv714)) : 'freshtv716)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv717 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv718)) : 'freshtv720)
    | MenhirState253 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv727 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv723 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv721 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 216 "imp_parser.mly"
                         ( Grm.Lst _2 )
# 5619 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv722)) : 'freshtv724)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv725 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv726)) : 'freshtv728)
    | MenhirState312 | MenhirState243 | MenhirState297 | MenhirState293 | MenhirState246 | MenhirState270 | MenhirState272 | MenhirState266 | MenhirState257 | MenhirState259 | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv731 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv729 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 215 "imp_parser.mly"
             ( Grm.Atm _1 )
# 5638 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv730)) : 'freshtv732)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv711 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv709) = Obj.magic _menhir_stack in
    ((let _v : 'tv_nls = 
# 82 "imp_parser.mly"
    ()
# 5654 "imp_parser.ml"
     in
    _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv710)) : 'freshtv712)

and _menhir_goto_ir_ptn_cst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_cst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv707 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5664 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv705 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5672 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_ir_ptn_cst) : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5679 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_mtc_ir_test = 
# 385 "imp_parser.mly"
                      (
    (ref(R_N _1),ref(P_Cst _3)) )
# 5686 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv706)) : 'freshtv708)

and _menhir_reduce177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_s8_ptn = 
# 346 "imp_parser.mly"
    ( [] )
# 5695 "imp_parser.ml"
     in
    _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v

and _menhir_run110 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5702 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | LINE _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | STG _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | S8_P ->
        _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5729 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | LINE _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | STG _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | S8_P ->
        _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 5756 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | LINE _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | MLT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv703 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5772 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState112 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv699 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5784 "imp_parser.ml"
            )) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 5789 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDX _v ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
            | LINE _v ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
            | STG _v ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
            | S8_P ->
                _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv700)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv701 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5818 "imp_parser.ml"
            )) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv702)) : 'freshtv704)
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | STG _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | S8_P ->
        _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5838 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv651 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5848 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv649 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5862 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState72 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv647 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5870 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5876 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5883 "imp_parser.ml"
            ) = 
# 267 "imp_parser.mly"
                    ( _2 )
# 5887 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv648)) : 'freshtv650)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72) : 'freshtv652)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv655 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5899 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5903 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | APP | COPRD | DTA | DTA_GRM | EOF | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv653 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5915 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5919 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5924 "imp_parser.ml"
            ))), _), _, (_3 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5928 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5934 "imp_parser.ml"
            ) = 
# 279 "imp_parser.mly"
                 ( Imp(_1,_3) )
# 5938 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv656)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv659 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5950 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5954 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | APP | COPRD | DTA | DTA_GRM | EOF | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv657 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5966 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5970 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5975 "imp_parser.ml"
            ))), _), _, (_3 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5979 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5985 "imp_parser.ml"
            ) = 
# 270 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 5989 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv660)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv663 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6001 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv661 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6015 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : 'tv_typs)), _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6020 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 264 "imp_parser.mly"
             ( _1@[_2] )
# 6025 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv662)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv664)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv667) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6037 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv665) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6051 "imp_parser.ml"
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv666)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv668)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv673) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6089 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6093 "imp_parser.ml"
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
            let (_menhir_stack : ((('freshtv671) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6107 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6111 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState82 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv669) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6119 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6123 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6129 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6133 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 519 "imp_parser.mly"
                        ( (_2,_4) )
# 6141 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv670)) : 'freshtv672)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv674)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv681 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6153 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6157 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv675 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6171 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6175 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState218 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv676)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv679 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6209 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6213 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState218 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv677 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6221 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6225 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6231 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6235 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 294 "imp_parser.mly"
                            ( Ast.Etr_Out_Abs(_2,_4) )
# 6243 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv678)) : 'freshtv680)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState218) : 'freshtv682)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv685 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6255 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6259 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6263 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState221
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState221
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv683 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6277 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6281 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6285 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6290 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6294 "imp_parser.ml"
            ))), _), _, (_6 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6298 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 292 "imp_parser.mly"
                            (
    Ast.Etr_Abs(_2,_4,_6) )
# 6307 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState221) : 'freshtv686)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv689 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6319 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6323 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | PRD ->
            _menhir_run335 _menhir_env (Obj.magic _menhir_stack) MenhirState338
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv687 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6339 "imp_parser.ml"
            ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6343 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6348 "imp_parser.ml"
            ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6352 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_prd = 
# 254 "imp_parser.mly"
                     ( [(_4,_2)] )
# 6359 "imp_parser.ml"
             in
            _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState338) : 'freshtv690)
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv693 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6371 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6375 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState341
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState341
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv691 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6389 "imp_parser.ml"
            )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6393 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 6398 "imp_parser.ml"
            ))), (_2 : 'tv_def_arg)), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6402 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 243 "imp_parser.mly"
                        ( Def_EqT (_1,snd _2,_4) )
# 6408 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv692)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState341) : 'freshtv694)
    | MenhirState344 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv697 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6420 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6424 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState345
        | COPRD ->
            _menhir_run342 _menhir_env (Obj.magic _menhir_stack) MenhirState345
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState345
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv695 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6440 "imp_parser.ml"
            ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6444 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6449 "imp_parser.ml"
            ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6453 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 250 "imp_parser.mly"
                      ( [(_4,_2)] )
# 6460 "imp_parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState345) : 'freshtv698)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv641 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv639 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState11 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv637 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 550 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 6508 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)) : 'freshtv640)
        | STG _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv642)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv645 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : 'freshtv643 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 522 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 6546 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv644)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv646)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState20 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv607 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv608)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv611 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv609 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 547 "imp_parser.mly"
                ( App(_1,_3) )
# 6600 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv610)) : 'freshtv612)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv615 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState24 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv613 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 555 "imp_parser.mly"
                    ( App(Name(ref(Stt_Axm Ast.Axm._some)),_2) )
# 6625 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv614)) : 'freshtv616)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv618)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv623 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv621 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState26 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv619 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 544 "imp_parser.mly"
                    ( _2 )
# 6654 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)) : 'freshtv622)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv624)
    | MenhirState34 | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv627 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | EOF | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | PRM _ | R64 _ | R_RCD | STG _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv625 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 529 "imp_parser.mly"
                 ( _1@[_2] )
# 6676 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv626)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv628)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv631 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv629 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 525 "imp_parser.mly"
            ( _2 )
# 6699 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv632)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv635 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv633 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState135 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState149
            | NAM _v ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
            | REG _v ->
                _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
            | WC ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState149
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv634)
        | L_RCD ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | NAM _v ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
        | REG _v ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
        | WC ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv636)
    | _ ->
        _menhir_fail ()

and _menhir_reduce121 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 559 "imp_parser.mly"
    ( App(Name(ref(Stt_Axm Ast.Axm._nil)),Rcd [||]) )
# 6754 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6761 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv601) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6772 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv599) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6780 "imp_parser.ml"
        )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6784 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv600)) : 'freshtv602)
    | MenhirState373 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv605 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6794 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv603 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6802 "imp_parser.ml"
        )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6806 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6812 "imp_parser.ml"
        ) = 
# 63 "imp_parser.mly"
                 (
    let ms = _2 in
    _1::ms )
# 6818 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)) : 'freshtv606)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState360 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv571 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv569 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), (_2 : 'tv_nls)), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 105 "imp_parser.mly"
                            ( _1::_3 )
# 6837 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
    | MenhirState38 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv583 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6845 "imp_parser.ml"
        )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv575) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv573) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 74 "imp_parser.mly"
            ()
# 6860 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv574)) : 'freshtv576)
        | MDL_EOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv579) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv577) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 75 "imp_parser.mly"
            ()
# 6873 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv578)) : 'freshtv580)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv581 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6883 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv582)) : 'freshtv584)
    | MenhirState375 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv597 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv593 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv591 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6903 "imp_parser.ml"
            ) = 
# 68 "imp_parser.mly"
                   ( _1 )
# 6907 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv589) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6915 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv587) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6923 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv585) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6931 "imp_parser.ml"
            )) : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6935 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv586)) : 'freshtv588)) : 'freshtv590)) : 'freshtv592)) : 'freshtv594)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv595 * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv596)) : 'freshtv598)
    | _ ->
        _menhir_fail ()

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 6951 "imp_parser.ml"
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
# 6963 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv563) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState43 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 6975 "imp_parser.ml"
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv564)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv566)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7004 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv568)

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv561) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg = 
# 454 "imp_parser.mly"
       ( ref(R_Ax(R_WC (sgn ()))) )
# 7019 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv562)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7026 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv559) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7036 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7040 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 459 "imp_parser.mly"
        ( ref(R_N _1) )
# 7045 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7052 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv557) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7062 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7066 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 458 "imp_parser.mly"
        ( ref(R_N _1) )
# 7071 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv558)

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
        _menhir_reduce160 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_goto_eq_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eq_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv555 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7102 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_eq_def) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv553 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7110 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_4 : 'tv_eq_def) : 'tv_eq_def) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 7117 "imp_parser.ml"
    ))), _) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_glb_etr = 
# 295 "imp_parser.mly"
                      ( Ast.Etr_Eq(_2,_4) )
# 7124 "imp_parser.ml"
     in
    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv554)) : 'freshtv556)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7131 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv551) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7141 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7145 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7150 "imp_parser.ml"
    ) = 
# 274 "imp_parser.mly"
        ( Var(ref(N_Ln (EndN _1,Axm Lang.Types.Axm.v))) )
# 7154 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv549) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7168 "imp_parser.ml"
    ) = 
# 281 "imp_parser.mly"
            ( Axm Lang.Types.Axm.stg )
# 7172 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv550)

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv547) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7186 "imp_parser.ml"
    ) = 
# 280 "imp_parser.mly"
        ( Axm Lang.Types.Axm.sgn_p )
# 7190 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7197 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv545) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 284 "imp_parser.mly"
    ( 0 )
# 7207 "imp_parser.ml"
     in
    _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv546)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv543) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7221 "imp_parser.ml"
    ) = 
# 277 "imp_parser.mly"
      ( Axm Lang.Types.Axm.nat )
# 7225 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv544)

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv541) = Obj.magic _menhir_stack in
    ((let _v : 'tv_typs = 
# 263 "imp_parser.mly"
    ( [] )
# 7238 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv542)

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
# 7274 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run93 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState93
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97

and _menhir_run99 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState99
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState99
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv539) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 506 "imp_parser.mly"
                  ()
# 7357 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv540)

and _menhir_run102 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv537) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 502 "imp_parser.mly"
              ()
# 7371 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv538)

and _menhir_run103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv535) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 507 "imp_parser.mly"
              ()
# 7385 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv536)

and _menhir_run104 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 503 "imp_parser.mly"
          ()
# 7399 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)

and _menhir_run105 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | R64 _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | S8_E ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState105 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
        | WC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv529 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState106 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv525 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
                | REG _v ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
                | WC ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState108
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv526)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv527 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv528)) : 'freshtv530)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv532)
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_run156 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState156 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState156
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv523) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv521) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 112 "imp_parser.mly"
            ( _1 )
# 7507 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv522)) : 'freshtv524)

and _menhir_run233 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7514 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv517 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7526 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv513 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7536 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 7541 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | COPRD_END ->
                _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | ORD_LEX_COPRD ->
                _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | ORD_LEX_COPRD_END ->
                _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | ORD_LINE_COPRD ->
                _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | ORD_LINE_COPRD_END ->
                _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | SYNT_COPRD ->
                _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState235) : 'freshtv514)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv515 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7572 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv516)) : 'freshtv518)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv519 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7583 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv520)

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv511) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv509) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 113 "imp_parser.mly"
            ( _1 )
# 7601 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv510)) : 'freshtv512)

and _menhir_run323 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7608 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv505 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7620 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run349 _menhir_env (Obj.magic _menhir_stack) MenhirState324
        | NAM _v ->
            _menhir_run325 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState324) : 'freshtv506)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv507 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7640 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv508)

and _menhir_run325 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7648 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv499) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run330 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | VAL _v ->
            _menhir_run327 _menhir_env (Obj.magic _menhir_stack) MenhirState326 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState326) : 'freshtv500)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv501) = Obj.magic _menhir_stack in
        ((let _v : 'tv_def_arg = 
# 86 "imp_parser.mly"
    ( ([],[]) )
# 7675 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv502)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv503 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7685 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv504)

and _menhir_run349 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv495 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 7702 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv491 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7713 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run352 _menhir_env (Obj.magic _menhir_stack) MenhirState351 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState351) : 'freshtv492)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv493 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7731 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv494)) : 'freshtv496)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv497 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv498)

and _menhir_goto_name : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7746 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv437 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7756 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7760 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv435 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7766 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7770 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 7775 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7779 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7785 "imp_parser.ml"
        ) = 
# 57 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 7789 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv436)) : 'freshtv438)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv441 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7797 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7801 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv439 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7807 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7811 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 7816 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7820 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7826 "imp_parser.ml"
        ) = 
# 58 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 7830 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv440)) : 'freshtv442)
    | MenhirState105 | MenhirState34 | MenhirState1 | MenhirState11 | MenhirState13 | MenhirState14 | MenhirState20 | MenhirState21 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv445 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7838 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv443 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7844 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7849 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 542 "imp_parser.mly"
          ( Name(ref(Ast.Stt_Name _1)) )
# 7854 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv444)) : 'freshtv446)
    | MenhirState344 | MenhirState340 | MenhirState337 | MenhirState217 | MenhirState220 | MenhirState60 | MenhirState81 | MenhirState69 | MenhirState71 | MenhirState77 | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv449 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7862 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv447 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7868 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7873 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7878 "imp_parser.ml"
        ) = 
# 275 "imp_parser.mly"
         ( Var(ref(N _1)) )
# 7882 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv448)) : 'freshtv450)
    | MenhirState123 | MenhirState109 | MenhirState110 | MenhirState111 | MenhirState112 | MenhirState116 | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7890 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | LINE _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | STG _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | S8_P ->
            _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv452)
    | MenhirState305 | MenhirState301 | MenhirState291 | MenhirState287 | MenhirState222 | MenhirState200 | MenhirState197 | MenhirState171 | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv453 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7916 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv454)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv457 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7938 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv455 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7944 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7949 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_ir_ptn_cst = 
# 395 "imp_parser.mly"
         ( P_N(ref(Ast.Stt_Name _1)) )
# 7954 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv456)) : 'freshtv458)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv463 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7962 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7966 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv459 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7976 "imp_parser.ml"
            ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7980 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState187
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState187
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187) : 'freshtv460)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv461 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8004 "imp_parser.ml"
            ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8008 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv462)) : 'freshtv464)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv467 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8017 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv465 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8023 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8028 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_eq_def = 
# 299 "imp_parser.mly"
         ( EqLn _1 )
# 8033 "imp_parser.ml"
         in
        _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv466)) : 'freshtv468)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv471 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8041 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8045 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv469 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8051 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8055 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 8060 "imp_parser.ml"
        ))), _), _, (_4 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8064 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_mdl_etr = 
# 116 "imp_parser.mly"
                    ( Mdl_Eq(_2,_4) )
# 8071 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv470)) : 'freshtv472)
    | MenhirState312 | MenhirState297 | MenhirState293 | MenhirState243 | MenhirState270 | MenhirState272 | MenhirState266 | MenhirState259 | MenhirState260 | MenhirState257 | MenhirState246 | MenhirState253 | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv475 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8079 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv473 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8085 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8090 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_grm_atom = 
# 221 "imp_parser.mly"
         ( Grm.Name _1 )
# 8095 "imp_parser.ml"
         in
        _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv474)) : 'freshtv476)
    | MenhirState379 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv489 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8103 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv485 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8113 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv483 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8119 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8124 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8130 "imp_parser.ml"
            ) = 
# 52 "imp_parser.mly"
             ( _1 )
# 8134 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv481) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8142 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv479) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8150 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8158 "imp_parser.ml"
            )) : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8162 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv478)) : 'freshtv480)) : 'freshtv482)) : 'freshtv484)) : 'freshtv486)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv487 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8172 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv488)) : 'freshtv490)
    | _ ->
        _menhir_fail ()

and _menhir_reduce138 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8182 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 8188 "imp_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8193 "imp_parser.ml"
    ) = 
# 55 "imp_parser.mly"
        ( (EndN _1) )
# 8197 "imp_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8204 "imp_parser.ml"
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
# 528 "imp_parser.mly"
    ( [] )
# 8224 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 8231 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv433) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 8241 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 8245 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 543 "imp_parser.mly"
        ( ExpCst(Cst.S8 _1) )
# 8250 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "imp_parser.mly"
       (int64)
# 8257 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 8267 "imp_parser.ml"
    )) : (
# 20 "imp_parser.mly"
       (int64)
# 8271 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 545 "imp_parser.mly"
        ( ExpCst(Cst.R64 _1) )
# 8276 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)

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
        let (_menhir_stack : 'freshtv429 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState14 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv427 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 554 "imp_parser.mly"
                ( App(Name(ref(Stt_Axm Ast.Axm._none)),Rcd [||]) )
# 8347 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv428)) : 'freshtv430)
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
        _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 8389 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv425) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 8398 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv423) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 8406 "imp_parser.ml"
    )) : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 8410 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv424)) : 'freshtv426)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv419 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8426 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | DTA_GRM ->
            _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LCE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL_END | MDL_EOP ->
            _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv420)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv421 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv422)

and _menhir_run371 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv417) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8463 "imp_parser.ml"
    ) = 
# 61 "imp_parser.mly"
        ( [] )
# 8467 "imp_parser.ml"
     in
    _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)

and _menhir_reduce56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 104 "imp_parser.mly"
      ( [] )
# 8476 "imp_parser.ml"
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
        let (_menhir_stack : 'freshtv413 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8492 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | DTA_GRM ->
            _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv411 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8507 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState40 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230) : 'freshtv412)
        | LCE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MDL ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MDL_END | MDL_EOP ->
            _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv414)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv415 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv416)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState41 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv365 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8560 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv361 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8571 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | WC ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv357 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8581 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv355 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8588 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 8593 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : 'tv_glb_etr = 
# 288 "imp_parser.mly"
                       ( Mdl_Ln(false,_3) )
# 8602 "imp_parser.ml"
                     in
                    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)) : 'freshtv358)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv359 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8612 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv360)) : 'freshtv362)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv363 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8623 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)) : 'freshtv366)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv367 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv368)) : 'freshtv370)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv409 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState41 in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8641 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR_REV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv371 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8652 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState205 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | ARR ->
                _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | COPRD ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | COPRD_END ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | COPRD_PTN ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | COPRD_PTN_END ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | EOP ->
                _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | EOP_EXN ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
            | OUT_IR ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
            | ROT _v ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222) : 'freshtv372)
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv373 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8692 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState205 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217) : 'freshtv374)
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv381 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8726 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState205 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | WC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv377 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8738 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv375 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8745 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 8750 "imp_parser.ml"
                ))), _) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_glb_etr = 
# 289 "imp_parser.mly"
                   ( Mdl_Ln(true,_2) )
# 8758 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)) : 'freshtv378)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv379 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8768 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv380)) : 'freshtv382)
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv407 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8777 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState205 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ENV ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv393) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState206 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDX _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv385 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 19 "imp_parser.mly"
       (int)
# 8798 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv383 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 19 "imp_parser.mly"
       (int)
# 8806 "imp_parser.ml"
                    )) : (
# 19 "imp_parser.mly"
       (int)
# 8810 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 304 "imp_parser.mly"
            ( ExStgArg _2 )
# 8817 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)) : 'freshtv386)
                | STG _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv389 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8826 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv387 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 18 "imp_parser.mly"
       (string)
# 8834 "imp_parser.ml"
                    )) : (
# 18 "imp_parser.mly"
       (string)
# 8838 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 303 "imp_parser.mly"
            ( ExStg _2 )
# 8845 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)) : 'freshtv390)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv391 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv392)) : 'freshtv394)
            | IDX _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState206 in
                let (_v : (
# 19 "imp_parser.mly"
       (int)
# 8862 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 19 "imp_parser.mly"
       (int)
# 8871 "imp_parser.ml"
                )) : (
# 19 "imp_parser.mly"
       (int)
# 8875 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 302 "imp_parser.mly"
        ( SttArg _1 )
# 8880 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)) : 'freshtv398)
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
            | R64 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState206 in
                let (_v : (
# 20 "imp_parser.mly"
       (int64)
# 8894 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 8903 "imp_parser.ml"
                )) : (
# 20 "imp_parser.mly"
       (int64)
# 8907 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 301 "imp_parser.mly"
        ( Cst(Cst.R64 _1) )
# 8912 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv400)) : 'freshtv402)
            | STG _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv405) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState206 in
                let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8922 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv403) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 8931 "imp_parser.ml"
                )) : (
# 18 "imp_parser.mly"
       (string)
# 8935 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 300 "imp_parser.mly"
        ( Cst(Cst.S8 _1) )
# 8940 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv404)) : 'freshtv406)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206) : 'freshtv408)
        | L_RCD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv410)
    | SLF _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run232 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv353 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState232 in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8979 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv351 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 18 "imp_parser.mly"
       (string)
# 8988 "imp_parser.ml"
        )) : (
# 18 "imp_parser.mly"
       (string)
# 8992 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 122 "imp_parser.mly"
                ( Grm_Abs _2 )
# 8999 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)) : 'freshtv354)
    | SLF _v ->
        _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState232 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232

and _menhir_run322 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run349 _menhir_env (Obj.magic _menhir_stack) MenhirState322
    | NAM _v ->
        _menhir_run325 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
    | SLF _v ->
        _menhir_run323 _menhir_env (Obj.magic _menhir_stack) MenhirState322 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState322

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState379 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv28)
    | MenhirState375 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv30)
    | MenhirState373 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState360 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9052 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState352 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9061 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState351 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9070 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState345 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9079 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9083 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState344 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9092 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState341 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9101 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9105 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9114 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState338 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv49 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9123 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9127 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9136 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState334 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9145 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9159 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState326 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv60)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9172 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState322 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState319 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv67 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState314 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv69 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState308 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState306 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv77 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv79 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv81 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv83 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState301 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv85 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState300 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv89 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState295 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState294 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv103 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv105 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv107 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv109 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState287 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv111 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv113 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState280 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState274 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv125 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9336 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv127 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9345 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState272 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv129 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9354 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState270 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv133 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv141 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9388 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * _menhir_state * 'tv_grm_ptn) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv149 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9412 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState253 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9431 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9445 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 9449 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv163 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9463 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9472 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv167 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9481 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9485 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9489 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv169 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9498 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9502 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv171 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9511 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9515 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9524 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9533 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9542 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9551 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv195 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9595 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9599 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv197 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9608 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9617 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv205 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9636 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9645 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv209 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv211 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv215 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv217 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv219 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv222)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv229 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv233 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv235 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv237 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9728 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv241 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9737 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9741 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9750 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9759 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9768 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv249 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv251 * _menhir_state) * _menhir_state) * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv259 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv261 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv263 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv269 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9827 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv271 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9836 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9845 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv275 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9854 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv277) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9863 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9867 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv279) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9876 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv281) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9885 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv283 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9894 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv285 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9903 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9907 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv287 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9916 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv289 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9925 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9929 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9938 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv293 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9947 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv297 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv300)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv304)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9984 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv309 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9993 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv313 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10007 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv315 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 10016 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv318)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv319 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv327 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv329 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10089 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10098 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv347 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv350)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 10115 "imp_parser.ml"
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
# 10127 "imp_parser.ml"
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
# 10145 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 10150 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10155 "imp_parser.ml"
        ) = 
# 56 "imp_parser.mly"
        ( EndN _1 )
# 10159 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10169 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 10177 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | APP | BYTE | COPRD | COPRD_END | CUT | DOT_END | DTA | DTA_GRM | EOF | EXP | IDX _ | IMP | INI_IR | LCE | LINE _ | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | MLT | N | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRD | PRM _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | S8_P | SCL | SGN | SLF _ | SPL | SRC | SRC_OUT | STG _ | SYNT_COPRD | TYP_STG | VAL _ | WC ->
        _menhir_reduce138 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10195 "imp_parser.ml"
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
# 10225 "imp_parser.ml"
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
# 10253 "imp_parser.ml"
            ) = 
# 49 "imp_parser.mly"
                ( End )
# 10257 "imp_parser.ml"
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
# 10305 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run371 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MDL ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv6))

and file_top : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 10326 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState375
    | DTA_GRM ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState375
    | LCE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState375
    | MDL ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState375
    | EOF ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState375
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState375) : 'freshtv4))

and name_eof : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 37 "imp_parser.mly"
      (Lang.name)
# 10353 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState379 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState379 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState379) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 10374 "imp_parser.ml"
