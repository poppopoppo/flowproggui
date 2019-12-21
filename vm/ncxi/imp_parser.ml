
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
  | MenhirState378
  | MenhirState374
  | MenhirState372
  | MenhirState359
  | MenhirState354
  | MenhirState351
  | MenhirState350
  | MenhirState344
  | MenhirState343
  | MenhirState340
  | MenhirState339
  | MenhirState337
  | MenhirState336
  | MenhirState333
  | MenhirState329
  | MenhirState327
  | MenhirState325
  | MenhirState323
  | MenhirState321
  | MenhirState318
  | MenhirState314
  | MenhirState313
  | MenhirState312
  | MenhirState311
  | MenhirState307
  | MenhirState305
  | MenhirState304
  | MenhirState303
  | MenhirState302
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
  | MenhirState288
  | MenhirState286
  | MenhirState285
  | MenhirState284
  | MenhirState283
  | MenhirState279
  | MenhirState276
  | MenhirState275
  | MenhirState273
  | MenhirState272
  | MenhirState271
  | MenhirState269
  | MenhirState267
  | MenhirState266
  | MenhirState265
  | MenhirState264
  | MenhirState263
  | MenhirState259
  | MenhirState258
  | MenhirState256
  | MenhirState255
  | MenhirState252
  | MenhirState247
  | MenhirState245
  | MenhirState242
  | MenhirState234
  | MenhirState231
  | MenhirState229
  | MenhirState221
  | MenhirState220
  | MenhirState219
  | MenhirState217
  | MenhirState216
  | MenhirState205
  | MenhirState204
  | MenhirState202
  | MenhirState200
  | MenhirState199
  | MenhirState198
  | MenhirState196
  | MenhirState191
  | MenhirState190
  | MenhirState189
  | MenhirState186
  | MenhirState184
  | MenhirState174
  | MenhirState172
  | MenhirState170
  | MenhirState165
  | MenhirState161
  | MenhirState159
  | MenhirState157
  | MenhirState155
  | MenhirState153
  | MenhirState150
  | MenhirState148
  | MenhirState144
  | MenhirState140
  | MenhirState138
  | MenhirState134
  | MenhirState132
  | MenhirState130
  | MenhirState128
  | MenhirState126
  | MenhirState122
  | MenhirState115
  | MenhirState113
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState107
  | MenhirState105
  | MenhirState104
  | MenhirState98
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

# 392 "imp_parser.ml"

let rec _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1407 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1405 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 167 "imp_parser.mly"
                     ( _1::_2 )
# 410 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1406)) : 'freshtv1408)
    | MenhirState314 | MenhirState288 | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1411 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1409 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_rule_seq = 
# 185 "imp_parser.mly"
                ( Some _2 )
# 427 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1410)) : 'freshtv1412)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1415 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 435 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 439 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1413 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 447 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 451 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord) : 'tv_grm_ord) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 458 "imp_parser.ml"
        ))), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 462 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 135 "imp_parser.mly"
                        (
    Lang.Grm.Cnc(_3,_4) )
# 469 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1414)) : 'freshtv1416)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_rule : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1403 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState279
    | COPRD_END ->
        _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState279
    | ORD_LEX_COPRD ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState279
    | ORD_LEX_COPRD_END ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState279
    | ORD_LINE_COPRD ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState279
    | ORD_LINE_COPRD_END ->
        _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState279
    | SYNT_COPRD ->
        _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState279
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState279) : 'freshtv1404)

and _menhir_goto_grm_rule_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1401) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1399) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_end) : 'tv_grm_rule_end) = _v in
    ((let _v : 'tv_grm_ord = 
# 166 "imp_parser.mly"
                 ( [_1] )
# 515 "imp_parser.ml"
     in
    _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1400)) : 'freshtv1402)

and _menhir_goto_grm_rule_seq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_seq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState284 | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1385 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1383 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule_end = 
# 188 "imp_parser.mly"
                                          (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,_3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2,_3) )
# 538 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1384)) : 'freshtv1386)
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1389 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 546 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1387 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 554 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 561 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule = 
# 169 "imp_parser.mly"
                                              (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,_5,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4,_5) )
# 570 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1388)) : 'freshtv1390)
    | MenhirState313 | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1393 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1391 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule = 
# 174 "imp_parser.mly"
                                      (
    match _4 with
    | Some e -> Grm.Cnc_Seq(Grm.CN_A,_1,_2,_3,e)
    | None -> Grm.Cnc_End(Grm.CN_A,_1,_2,_3) )
# 589 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1392)) : 'freshtv1394)
    | MenhirState263 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1397 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 597 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_seq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1395 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 605 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_grm_rule_seq) : 'tv_grm_rule_seq) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 612 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule_end = 
# 193 "imp_parser.mly"
                                                  (
    match _6 with
    | Some e -> Grm.Cnc_Seq(Grm.CN _2,_1,_4,_5,e)
    | None -> Grm.Cnc_End(Grm.CN _2,_1,_4,_5) )
# 621 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1396)) : 'freshtv1398)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState318 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1371 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1369 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 129 "imp_parser.mly"
                    ( _1::_2 )
# 643 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1370)) : 'freshtv1372)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1381 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1379 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 660 "imp_parser.ml"
        ) = 
# 125 "imp_parser.mly"
                    ( _2 )
# 664 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1377) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 672 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1375) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 680 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1373) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 688 "imp_parser.ml"
        )) : (
# 42 "imp_parser.mly"
      (Lang.Ast.grm)
# 692 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 121 "imp_parser.mly"
            ( Gram _1 )
# 697 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1374)) : 'freshtv1376)) : 'freshtv1378)) : 'freshtv1380)) : 'freshtv1382)
    | _ ->
        _menhir_fail ()

and _menhir_run299 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState299
    | NAM _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState299 _v
    | REG _v ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState299 _v
    | WC ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState299
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState299

and _menhir_run303 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState303
    | NAM _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState303 _v
    | REG _v ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState303 _v
    | WC ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState303
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState303

and _menhir_run285 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState285
    | NAM _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
    | REG _v ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
    | WC ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState285
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState285

and _menhir_run289 : _menhir_env -> ((('ttv_tail * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState289
    | NAM _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState289 _v
    | REG _v ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState289 _v
    | WC ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState289
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState289

and _menhir_reduce97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_rule_seq = 
# 184 "imp_parser.mly"
    ( None )
# 784 "imp_parser.ml"
     in
    _menhir_goto_grm_rule_seq _menhir_env _menhir_stack _menhir_s _v

and _menhir_run264 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState264
    | COPRD_END ->
        _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState264
    | ORD_LEX_COPRD ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState264
    | ORD_LEX_COPRD_END ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState264
    | ORD_LINE_COPRD ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState264
    | ORD_LINE_COPRD_END ->
        _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState264
    | SYNT_COPRD ->
        _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState264
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState264

and _menhir_goto_grm_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1367 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState318 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1365 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 128 "imp_parser.mly"
            ( [_1] )
# 830 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1366)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState318) : 'freshtv1368)

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1341 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 847 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState263
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SLF _ | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState263
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState263) : 'freshtv1342)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1343 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SLF _ | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState267) : 'freshtv1344)
    | MenhirState272 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1345 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 879 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState273
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState273
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState273) : 'freshtv1346)
    | MenhirState275 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1347 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            _menhir_run264 _menhir_env (Obj.magic _menhir_stack) MenhirState276
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState276
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState276) : 'freshtv1348)
    | MenhirState283 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1351 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1349 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState284 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState288
            | COPRD_END ->
                _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState288
            | ORD_LEX_COPRD ->
                _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState288
            | ORD_LEX_COPRD_END ->
                _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState288
            | ORD_LINE_COPRD ->
                _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState288
            | ORD_LINE_COPRD_END ->
                _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState288
            | SRC ->
                _menhir_run289 _menhir_env (Obj.magic _menhir_stack) MenhirState288
            | SYNT_COPRD ->
                _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState288
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState288) : 'freshtv1350)
        | SRC ->
            _menhir_run285 _menhir_env (Obj.magic _menhir_stack) MenhirState284
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState284
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState284) : 'freshtv1352)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1355 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1353 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState294 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                _menhir_run289 _menhir_env (Obj.magic _menhir_stack) MenhirState295
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState295) : 'freshtv1354)
        | SRC ->
            _menhir_run285 _menhir_env (Obj.magic _menhir_stack) MenhirState294
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState294) : 'freshtv1356)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1359 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1357 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState298 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                _menhir_run303 _menhir_env (Obj.magic _menhir_stack) MenhirState302
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState302) : 'freshtv1358)
        | SRC ->
            _menhir_run299 _menhir_env (Obj.magic _menhir_stack) MenhirState298
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState298) : 'freshtv1360)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1363 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SCL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1361 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState313 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | COPRD_END ->
                _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | ORD_LEX_COPRD ->
                _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | ORD_LEX_COPRD_END ->
                _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | ORD_LINE_COPRD ->
                _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | ORD_LINE_COPRD_END ->
                _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | SRC ->
                _menhir_run303 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | SYNT_COPRD ->
                _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState314
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState314) : 'freshtv1362)
        | SRC ->
            _menhir_run299 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SYNT_COPRD ->
            _menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState313) : 'freshtv1364)
    | _ ->
        _menhir_fail ()

and _menhir_reduce81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_prd = 
# 226 "imp_parser.mly"
    ( None )
# 1050 "imp_parser.ml"
     in
    _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run256 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState256
    | L_LST ->
        _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState256
    | L_OPN ->
        _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState256
    | MLT ->
        _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState256
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState256 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState256 _v
    | STG _v ->
        _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState256 _v
    | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
        _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState256
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState256

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1335 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1333 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_regs) : 'tv_regs) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 515 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 1098 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1334)) : 'freshtv1336)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1339 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1106 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1337 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1114 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_regs) : 'tv_regs) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1121 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 324 "imp_parser.mly"
                                 ( IR_Id(ref(IR_Id_C(_2,[|_4|] |+| _5)))  )
# 1127 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1338)) : 'freshtv1340)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState307 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1319 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1317 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_rule_act)) = _menhir_stack in
        let _v : 'tv_grm_ord_act = 
# 140 "imp_parser.mly"
                             ( _1::_2 )
# 1149 "imp_parser.ml"
         in
        _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1318)) : 'freshtv1320)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1323 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1321 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
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
# 1169 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1322)) : 'freshtv1324)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1327 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1325 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
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
# 1189 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1326)) : 'freshtv1328)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1331 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1197 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 1201 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_ord_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1329 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1209 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 1213 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_grm_ord_act) : 'tv_grm_ord_act) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1220 "imp_parser.ml"
        ))), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 1224 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 132 "imp_parser.mly"
                            (
    Lang.Grm.Act(_3,_4)
  )
# 1232 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1330)) : 'freshtv1332)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_eq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_eq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1313 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | ARR ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | COPRD ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | COPRD_END ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | COPRD_PTN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | COPRD_PTN_END ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EOP ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196) : 'freshtv1314)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1315 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | ARR ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | COPRD ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | COPRD_END ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | COPRD_PTN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | COPRD_PTN_END ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | EOP ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199) : 'freshtv1316)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1307 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1305 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_mtc_ir_tail) : 'tv_mtc_ir_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_mtc_ir_test)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_mtc_ir_tail = 
# 379 "imp_parser.mly"
                                ( _2::_3 )
# 1330 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1306)) : 'freshtv1308)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1311 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1309 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_mtc_ir_tail) : 'tv_mtc_ir_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_mtc_ir_test)) = _menhir_stack in
        let _v : 'tv_ir_ptn_eq = 
# 375 "imp_parser.mly"
                            ( _1::_2 )
# 1346 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1310)) : 'freshtv1312)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1277 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1361 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState255) : 'freshtv1278)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1281 * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1279 * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_prd = 
# 227 "imp_parser.mly"
                 ( Some _2 )
# 1384 "imp_parser.ml"
         in
        _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1280)) : 'freshtv1282)
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1285 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1283 * _menhir_state * 'tv_grm_ptn) * _menhir_state) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _), _, (_3 : 'tv_grm_ptns)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_ptns = 
# 212 "imp_parser.mly"
                         ( _1::_3 )
# 1397 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1284)) : 'freshtv1286)
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1289 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1287 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_ptns = 
# 211 "imp_parser.mly"
                     ( _1::_2 )
# 1409 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1288)) : 'freshtv1290)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1291 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | COPRD | COPRD_END | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266) : 'freshtv1292)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1293 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1431 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState272
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState272) : 'freshtv1294)
    | MenhirState269 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1295 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState275
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState275
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState275) : 'freshtv1296)
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1297 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState283
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState283
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState283) : 'freshtv1298)
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1299 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | SCL | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState293) : 'freshtv1300)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1301 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | SCL | SRC ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState297
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState297) : 'freshtv1302)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1303 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CUT ->
            _menhir_run256 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | COPRD | COPRD_END | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SRC | SYNT_COPRD ->
            _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState312) : 'freshtv1304)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op_src : _menhir_env -> 'ttv_tail -> 'tv_reg_ptn_op_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1275 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
    let (_v : 'tv_reg_ptn_op_src) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1273 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
    let ((_3 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 433 "imp_parser.mly"
                                         (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn_src 0" (* Rcd_Ptn.Ro ($2,r)*) )
# 1533 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1274)) : 'freshtv1276)

and _menhir_goto_reg_ptn_lst_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1261 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1259 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn_src)), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst_src = 
# 447 "imp_parser.mly"
                                ( [|_1|] |+| _2 )
# 1550 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1260)) : 'freshtv1262)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1271 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1263) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
            | REG _v ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv1264)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1267) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1265) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 444 "imp_parser.mly"
          ( None )
# 1583 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _v) : 'freshtv1266)) : 'freshtv1268)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1269 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1270)) : 'freshtv1272)
    | _ ->
        _menhir_fail ()

and _menhir_reduce173 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 514 "imp_parser.mly"
    ( [||] )
# 1601 "imp_parser.ml"
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

and _menhir_goto_grm_rule_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1257 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState307
    | COPRD_END ->
        _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState307
    | ORD_LEX_COPRD ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState307
    | ORD_LEX_COPRD_END ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState307
    | ORD_LINE_COPRD ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState307
    | ORD_LINE_COPRD_END ->
        _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState307
    | SYNT_COPRD ->
        _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState307
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState307) : 'freshtv1258)

and _menhir_goto_grm_rule_act_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule_act_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1255) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule_act_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1253) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_grm_rule_act_end) : 'tv_grm_rule_act_end) = _v in
    ((let _v : 'tv_grm_ord_act = 
# 139 "imp_parser.mly"
                     ( [_1] )
# 1664 "imp_parser.ml"
     in
    _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1254)) : 'freshtv1256)

and _menhir_goto_mtc_ir_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState304 | MenhirState300 | MenhirState290 | MenhirState286 | MenhirState221 | MenhirState199 | MenhirState196 | MenhirState170 | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1247) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1245) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let _v : 'tv_ir_lines = 
# 320 "imp_parser.mly"
               ( Mtc(_1) )
# 1683 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1246)) : 'freshtv1248)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1251 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1249 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 494 "imp_parser.mly"
                                            ([|((_2,None),_3)|] |+| _4 )
# 1699 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1250)) : 'freshtv1252)
    | _ ->
        _menhir_fail ()

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1239 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1713 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1237 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 1721 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 1728 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 307 "imp_parser.mly"
                                           ( [_3]@_4 )
# 1734 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1238)) : 'freshtv1240)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1243 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1241 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 290 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 1751 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1242)) : 'freshtv1244)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_suc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_suc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState189 | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1231) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1229) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_mtc_ir_tail = 
# 378 "imp_parser.mly"
               ( [] )
# 1772 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1230)) : 'freshtv1232)
    | MenhirState198 | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1235) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_suc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1233) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_mtc_ir_suc) : 'tv_mtc_ir_suc) = _v in
        ((let _v : 'tv_ir_ptn_eq = 
# 374 "imp_parser.mly"
               ( [] )
# 1787 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1234)) : 'freshtv1236)
    | _ ->
        _menhir_fail ()

and _menhir_run244 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord_end -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 1796 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1225 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1808 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState245) : 'freshtv1226)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | EXP | LCE | L_LST | L_OPN | MDL | MDL_END | MDL_EOP | MLT | NAM _ | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRM _ | SCL | SLF _ | SRC | STG _ | SYNT_COPRD ->
        _menhir_reduce138 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1227 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1844 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1228)

and _menhir_run270 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 1852 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1221 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1864 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState271
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState271) : 'freshtv1222)
    | DOT ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack)
    | BYTE | COPRD | COPRD_END | CUT | EXP | L_LST | L_OPN | MLT | NAM _ | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | PRM _ | SCL | SRC | STG _ | SYNT_COPRD ->
        _menhir_reduce138 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1223 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 1900 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1224)

and _menhir_reduce86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 210 "imp_parser.mly"
    ( [] )
# 1910 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_run243 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 1917 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1219) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 1927 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 1931 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 220 "imp_parser.mly"
        ( Grm.Txt _1 )
# 1936 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1220)

and _menhir_run246 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1217) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 222 "imp_parser.mly"
        ( Grm.Name(EndN "_byt") )
# 1950 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1218)

and _menhir_run247 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState247
    | MLT ->
        _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState247
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
    | STG _v ->
        _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState247

and _menhir_run252 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BYTE ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState252
    | MLT ->
        _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState252
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
    | STG _v ->
        _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState252

and _menhir_run248 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1215) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_atom = 
# 223 "imp_parser.mly"
         ( Grm.Name(EndN "_byt") )
# 2006 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1216)

and _menhir_run190 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
    | VAL _v ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1213 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | ARR ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | COPRD ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | COPRD_END ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | COPRD_PTN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | COPRD_PTN_END ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EOP ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EOP_EXN ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | OUT_IR ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | ROT _v ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv1214)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState354 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1207 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2070 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1205 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2078 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 2085 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 235 "imp_parser.mly"
                                        ( [_3]@_4 )
# 2091 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1206)) : 'freshtv1208)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1211 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1209 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 119 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2108 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1210)) : 'freshtv1212)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState140 | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1183 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | NAM _v ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | REG _v ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | WC ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | OP | R_RCD ->
            _menhir_reduce162 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv1184)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1189 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1185 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState150
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState150
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv1186)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1187 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1188)) : 'freshtv1190)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1195 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1191 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv1192)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1193 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1194)) : 'freshtv1196)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1197 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | ARR ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | COPRD ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | COPRD_END ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | COPRD_PTN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | COPRD_PTN_END ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | EOP ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState286
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286) : 'freshtv1198)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1199 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | ARR ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | COPRD ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | COPRD_END ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | COPRD_PTN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | COPRD_PTN_END ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | EOP ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState290
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState290) : 'freshtv1200)
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1201 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | ARR ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | COPRD ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | COPRD_END ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | COPRD_PTN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | COPRD_PTN_END ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | EOP ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState300 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState300
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState300 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState300 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState300) : 'freshtv1202)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1203 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | ARR ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | COPRD ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | COPRD_END ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | COPRD_PTN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | COPRD_PTN_END ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | EOP ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | EOP_EXN ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
        | OUT_IR ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
        | ROT _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState304) : 'freshtv1204)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState303 | MenhirState299 | MenhirState289 | MenhirState285 | MenhirState134 | MenhirState148 | MenhirState140 | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1173 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1171 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_src = 
# 432 "imp_parser.mly"
            ( Rcd_Ptn.A _1 )
# 2352 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1172)) : 'freshtv1174)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1181) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1177) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1175) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (_2 : 'tv_reg_src)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 443 "imp_parser.mly"
                      ( Some _2 )
# 2373 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _v) : 'freshtv1176)) : 'freshtv1178)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1179) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1180)) : 'freshtv1182)
    | _ ->
        _menhir_fail ()

and _menhir_reduce162 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_src = 
# 446 "imp_parser.mly"
    ( [||] )
# 2391 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_src_par_p : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_src_par_p -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1163 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | LINE _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | STG _v ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | S8_P ->
            _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv1164)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1169 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1165 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState132
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132) : 'freshtv1166)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1167 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1168)) : 'freshtv1170)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState56 | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1091 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv1092)
    | MenhirState204 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1099 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2482 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1093) = Obj.magic _menhir_stack in
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv1094)
        | APP | ARR | COPRD | COPRD_END | COPRD_PTN | COPRD_PTN_END | EOP | EOP_EXN | NAM _ | OUT_IR | PRM _ | ROT _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1095) = Obj.magic _menhir_stack in
            ((let _v : 'tv_typ_def = 
# 518 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 2521 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv1096)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1097 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2531 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1098)) : 'freshtv1100)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1105 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2540 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1101 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2550 "imp_parser.ml"
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87) : 'freshtv1102)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1103 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2574 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1104)) : 'freshtv1106)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1107 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 2583 "imp_parser.ml"
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv1108)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1109 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv1110)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1117 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1113 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1111 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 335 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2629 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1112)) : 'freshtv1114)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1115 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1116)) : 'freshtv1118)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1121 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1119 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 313 "imp_parser.mly"
                ( Ret _2 )
# 2649 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1120)) : 'freshtv1122)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1125 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1123 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn_src)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 325 "imp_parser.mly"
                                            ( IR_Exp(_2,_4,_6) )
# 2664 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1124)) : 'freshtv1126)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1129 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1127 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_3 : 'tv_reg_ptn_src)), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 326 "imp_parser.mly"
                                    ( IR_Exp(_2,_3,_5) )
# 2678 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1128)) : 'freshtv1130)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1135 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1131 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState159
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState159
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv1132)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1133 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1134)) : 'freshtv1136)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1139 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1137 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 333 "imp_parser.mly"
                                    (
     IR_Glb_Call(ref(Lang.Ast.Stt_Axm Lang.Ast.Axm._app),RP.R [|RP.A _2;_4|],_6) )
# 2725 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1138)) : 'freshtv1140)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1153 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2733 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1141 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2743 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState165
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState165
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165) : 'freshtv1142)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1145 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2765 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1143 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2772 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2777 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 321 "imp_parser.mly"
                        ( IL_Glb_Call(ref(Ast.Stt_Name _1),_2) )
# 2783 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1144)) : 'freshtv1146)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1149 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2791 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1147 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2798 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2803 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 337 "imp_parser.mly"
                         ( IR_Glb_Out(ref(Ast.Stt_Name _1),_2) )
# 2809 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1148)) : 'freshtv1150)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1151 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2819 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1152)) : 'freshtv1154)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1157 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2828 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1155 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2834 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2839 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 332 "imp_parser.mly"
                             ( IR_Glb_Call(ref(Ast.Stt_Name _1),_2,_4) )
# 2845 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1156)) : 'freshtv1158)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1161 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2853 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2857 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1159 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2863 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2867 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 2872 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 2876 "imp_parser.ml"
        ))), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_mtc_ir_test = 
# 382 "imp_parser.mly"
                             (
    (ref(R_N _1),ref(Eq_Agl_N(ref(Ast.Stt_Name _3),_5)))
    )
# 2885 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1160)) : 'freshtv1162)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1089 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_reg_ptn_op) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1087 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
    let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_reg_ptn = 
# 463 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some _ -> err "reg_ptn 0" (* Rcd_Ptn.Ro ($2,r)  *) )
# 2907 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1088)) : 'freshtv1090)

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1081 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1073) = Obj.magic _menhir_stack in
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv1074)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1077) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1075) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 474 "imp_parser.mly"
          ( None )
# 2947 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv1076)) : 'freshtv1078)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1079 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1080)) : 'freshtv1082)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1085 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1083 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 477 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 2966 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1084)) : 'freshtv1086)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1045 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2981 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1043 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 2987 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 2992 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), (_3 : 'tv_typ_def)), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 310 "imp_parser.mly"
                                 ( (_1,fst _3,snd _3,(_2,ref _4)) )
# 2997 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1041) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body_ir) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState43 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1035 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3010 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _v
            | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1033 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3022 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 3027 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 306 "imp_parser.mly"
                            ( [_3] )
# 3033 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1034)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202) : 'freshtv1036)
        | MenhirState41 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1039 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1037 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body_ir)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 291 "imp_parser.mly"
                         ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d) )
# 3050 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1038)) : 'freshtv1040)
        | _ ->
            _menhir_fail ()) : 'freshtv1042)) : 'freshtv1044)) : 'freshtv1046)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1049 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1047 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 318 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 3064 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1048)) : 'freshtv1050)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1053 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1051 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_coprd_ptn_end)), _, (_2 : 'tv_ir_ptn_eq)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_mtc_ir_end = 
# 493 "imp_parser.mly"
                                     ( [|((_2,None),_3)|] )
# 3076 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1052)) : 'freshtv1054)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1055 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | COPRD_END ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | COPRD_PTN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | COPRD_PTN_END ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState200
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200) : 'freshtv1056)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1059 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3102 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1057 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3108 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 3113 "imp_parser.ml"
        ))), _), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 296 "imp_parser.mly"
                             ( Ast.Etr_Glb(_2,ref _4) )
# 3120 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1058)) : 'freshtv1060)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1063 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1061 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord_end)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _, (_5 : 'tv_reg_ptn_src)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_grm_rule_act_end = 
# 154 "imp_parser.mly"
                                                      (
    Grm.Act_End((_5,ref _6),_1,_2,_3)
 )
# 3135 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1062)) : 'freshtv1064)
    | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1065 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | COPRD_END ->
            _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | ORD_LEX_COPRD ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | ORD_LEX_COPRD_END ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | ORD_LINE_COPRD ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | ORD_LINE_COPRD_END ->
            _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | SYNT_COPRD ->
            _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState291) : 'freshtv1066)
    | MenhirState300 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1069 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1067 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)), _), _, (_5 : 'tv_reg_ptn_src)), _, (_6 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_grm_rule_act = 
# 146 "imp_parser.mly"
                                                  (
    Grm.Act_End((_5,ref _6),_1,_2,_3)
   )
# 3174 "imp_parser.ml"
         in
        _menhir_goto_grm_rule_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1068)) : 'freshtv1070)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1071 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | COPRD_END ->
            _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | ORD_LEX_COPRD ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | ORD_LEX_COPRD_END ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | ORD_LINE_COPRD ->
            _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | ORD_LINE_COPRD_END ->
            _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | SYNT_COPRD ->
            _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState305) : 'freshtv1072)
    | _ ->
        _menhir_fail ()

and _menhir_run173 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 3207 "imp_parser.ml"
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
# 3219 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | INT _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1011) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState174 in
            let (_v : (
# 19 "imp_parser.mly"
       (int)
# 3231 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1009) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 19 "imp_parser.mly"
       (int)
# 3240 "imp_parser.ml"
            )) : (
# 19 "imp_parser.mly"
       (int)
# 3244 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 392 "imp_parser.mly"
        ( P_Z _1 )
# 3249 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1010)) : 'freshtv1012)
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
        | R2 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1015) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState174 in
            let (_v : (
# 21 "imp_parser.mly"
       (bool)
# 3263 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1013) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 21 "imp_parser.mly"
       (bool)
# 3272 "imp_parser.ml"
            )) : (
# 21 "imp_parser.mly"
       (bool)
# 3276 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 394 "imp_parser.mly"
       ( P_R2 _1 )
# 3281 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1014)) : 'freshtv1016)
        | R64 _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1019) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState174 in
            let (_v : (
# 20 "imp_parser.mly"
       (int64)
# 3291 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1017) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 3300 "imp_parser.ml"
            )) : (
# 20 "imp_parser.mly"
       (int64)
# 3304 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 393 "imp_parser.mly"
        ( P_R64 _1 )
# 3309 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1018)) : 'freshtv1020)
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1023) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState174 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 3319 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1021) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 3328 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (string)
# 3332 "imp_parser.ml"
            )) = _v in
            ((let _v : 'tv_ir_ptn_cst = 
# 391 "imp_parser.mly"
        ( P_Stg _1 )
# 3337 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1022)) : 'freshtv1024)
        | VAL _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1027 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3345 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState174 in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 3351 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1025 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3358 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_3 : (
# 18 "imp_parser.mly"
       (string)
# 3364 "imp_parser.ml"
            )) : (
# 18 "imp_parser.mly"
       (string)
# 3368 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3373 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_mtc_ir_test = 
# 387 "imp_parser.mly"
               (
    (ref(R_N _1),ref(Eq_V(ref(R_N _3)))) )
# 3380 "imp_parser.ml"
             in
            _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1026)) : 'freshtv1028)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174) : 'freshtv1030)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1031 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3394 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1032)

and _menhir_run182 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1007) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 498 "imp_parser.mly"
        ()
# 3409 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1008)

and _menhir_run183 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 3416 "imp_parser.ml"
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
# 3428 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184) : 'freshtv1004)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1005 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3448 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1006)

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1001) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_mtc_ir_suc = 
# 499 "imp_parser.mly"
            ()
# 3463 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_suc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1002)

and _menhir_goto_ord_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv995 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | NAM _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
        | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SCL | SLF _ | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState242) : 'freshtv996)
    | MenhirState314 | MenhirState288 | MenhirState279 | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv997 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | NAM _v ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState265
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState265) : 'freshtv998)
    | MenhirState307 | MenhirState305 | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv999 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState292 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState292 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState292 _v
        | CUT | SCL | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState292) : 'freshtv1000)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState314 | MenhirState288 | MenhirState279 | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv989 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | NAM _v ->
            _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState269 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState269 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState269 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState269) : 'freshtv990)
    | MenhirState307 | MenhirState305 | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv991 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
        | CUT | SCL | SRC ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState296
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState296) : 'freshtv992)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv993 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | NAM _v ->
            _menhir_run270 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
        | COPRD | COPRD_END | CUT | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SRC | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState311) : 'freshtv994)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState327 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv983 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3645 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv981 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3653 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3660 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 98 "imp_parser.mly"
                 (
    let v = newvar_q (-1) in
    let (vs,l) = _3 in
    (v::vs,(_1,v)::l) )
# 3669 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv982)) : 'freshtv984)
    | MenhirState325 ->
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
# 3685 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv986)) : 'freshtv988)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState329 ->
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
# 3708 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)) : 'freshtv976)
    | MenhirState325 ->
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
# 3724 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv978)) : 'freshtv980)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState351 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv967 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3738 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv965 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 3746 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 3753 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 247 "imp_parser.mly"
                  ( _1::_2 )
# 3758 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv966)) : 'freshtv968)
    | MenhirState350 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv971 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3766 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv969 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3774 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 3781 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 242 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3788 "imp_parser.ml"
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
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv961 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState258 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BYTE ->
            _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState259
        | L_LST ->
            _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState259
        | L_OPN ->
            _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState259
        | MLT ->
            _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState259
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState259 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState259 _v
        | STG _v ->
            _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState259 _v
        | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
            _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState259
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState259) : 'freshtv962)
    | L_LST ->
        _menhir_run252 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | L_OPN ->
        _menhir_run247 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | MLT ->
        _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
    | STG _v ->
        _menhir_run243 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
    | COPRD | COPRD_END | CUT | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | ORD_LEX_COPRD_END | ORD_LINE_COPRD | ORD_LINE_COPRD_END | SCL | SLF _ | SRC | SYNT_COPRD ->
        _menhir_reduce86 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState258) : 'freshtv964)

and _menhir_goto_nls : _menhir_env -> 'ttv_tail -> 'tv_nls -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv959 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run321 _menhir_env (Obj.magic _menhir_stack) MenhirState359
    | DTA_GRM ->
        _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState359
    | LCE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState359
    | MDL ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState359
    | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv957 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState359 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv955 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, (_1 : 'tv_nls)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_nls = 
# 83 "imp_parser.mly"
           ()
# 3880 "imp_parser.ml"
         in
        _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv956)) : 'freshtv958)
    | EOF | MDL_END | MDL_EOP ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState359
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState359) : 'freshtv960)

and _menhir_goto_mtc_ir_test : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_test -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState198 | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv951 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState189
        | SCL ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState189
        | SPL ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState189
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState189) : 'freshtv952)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv953 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT_END ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | SCL ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | SPL ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState191
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191) : 'freshtv954)
    | _ ->
        _menhir_fail ()

and _menhir_goto_s8_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_s8_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv917 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3938 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3942 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv915 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3948 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 3952 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 3957 "imp_parser.ml"
        ))), _), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 3961 "imp_parser.ml"
        ))), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_s8_ptn = 
# 351 "imp_parser.mly"
                       ( (S8_For_Txt(_1,_3))::_4 )
# 3967 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv921 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3975 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv919 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3981 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 3986 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 350 "imp_parser.mly"
                ( (S8_Name(ref(Ast.Stt_Name _1)))::_2 )
# 3991 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv920)) : 'freshtv922)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv925 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 3999 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv923 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4005 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4010 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 349 "imp_parser.mly"
               ( (S8_Var _1)::_2 )
# 4015 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv924)) : 'freshtv926)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv929 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4023 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv927 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4029 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4034 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 347 "imp_parser.mly"
                ( (S8_Txt _1)::_2 )
# 4039 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)) : 'freshtv930)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv933 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4047 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv931 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4053 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4058 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 348 "imp_parser.mly"
               ( (S8_Txt _1)::_2 )
# 4063 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv932)) : 'freshtv934)
    | MenhirState108 ->
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
# 4088 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv936)) : 'freshtv938)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv939 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv940)) : 'freshtv942)
    | MenhirState122 ->
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
# 4119 "imp_parser.ml"
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
    | MenhirState344 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv909 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4140 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4144 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv907 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4152 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4156 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4163 "imp_parser.ml"
        ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4167 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 251 "imp_parser.mly"
                                 ( (_4,_2)::_5 )
# 4174 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv908)) : 'freshtv910)
    | MenhirState333 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv913 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4182 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv911 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4190 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4197 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 239 "imp_parser.mly"
                            (
    Def_CoPrd (_1,snd _2,_3) )
# 4203 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv912)) : 'freshtv914)
    | _ ->
        _menhir_fail ()

and _menhir_run341 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
# 4221 "imp_parser.ml"
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
# 4232 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState343
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState343
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState343
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState343 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState343 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState343 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState343
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState343
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState343 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState343) : 'freshtv900)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv901 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4266 "imp_parser.ml"
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
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv893 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4287 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState354 _v
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv891 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 4299 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 4304 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 234 "imp_parser.mly"
                         ( [_3] )
# 4310 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv892)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState354) : 'freshtv894)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv897 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv895 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 120 "imp_parser.mly"
                     ( Flow _2 )
# 4327 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv896)) : 'freshtv898)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv885 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4341 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4345 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv883 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4353 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4357 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4364 "imp_parser.ml"
        ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 4368 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 255 "imp_parser.mly"
                             ( (_4,_2)::_5 )
# 4375 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv884)) : 'freshtv886)
    | MenhirState333 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv889 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4383 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv887 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 4391 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 4398 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 241 "imp_parser.mly"
                         ( Def_Prd (_1,snd _2,_3) )
# 4403 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv888)) : 'freshtv890)
    | _ ->
        _menhir_fail ()

and _menhir_run334 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
# 4421 "imp_parser.ml"
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
# 4432 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState336
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState336
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState336
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState336 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState336 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState336 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState336
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState336
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState336 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState336) : 'freshtv876)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv877 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4466 "imp_parser.ml"
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
# 4485 "imp_parser.ml"
    )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | ARR ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_END ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_PTN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | COPRD_PTN_END ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | EOP ->
        _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState84
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
# 4522 "imp_parser.ml"
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
# 4555 "imp_parser.ml"
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

and _menhir_run135 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv871) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 431 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 4595 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv872)

and _menhir_run136 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 4602 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv869) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 4612 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 4616 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 428 "imp_parser.mly"
        ( ref(R_N _1) )
# 4621 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)

and _menhir_run137 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 4628 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv867) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 4638 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 4642 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 427 "imp_parser.mly"
        ( ref(R_N _1) )
# 4647 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv868)

and _menhir_run138 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | NAM _v ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
    | REG _v ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
    | WC ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | OP | R_RCD ->
        _menhir_reduce162 _menhir_env (Obj.magic _menhir_stack) MenhirState138
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138

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
# 4690 "imp_parser.ml"
        ) = 
# 47 "imp_parser.mly"
  (
    Line _1  )
# 4695 "imp_parser.ml"
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
# 4755 "imp_parser.ml"
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
# 4774 "imp_parser.ml"
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
# 4786 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_mdl_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv843 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 4793 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_mdl_end) : 'tv_mdl_end) = _v in
    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 4799 "imp_parser.ml"
    ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_mdl = 
# 71 "imp_parser.mly"
                               ( (_2,_3) )
# 4805 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv841) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_mdl) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState374 | MenhirState38 | MenhirState40 | MenhirState359 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv837 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv835 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : 'tv_mdl_etr = 
# 114 "imp_parser.mly"
            (
    let (n,el) = _1 in Mdl (n,el) )
# 4823 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv836)) : 'freshtv838)
    | MenhirState372 | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv839 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            _menhir_run370 _menhir_env (Obj.magic _menhir_stack) MenhirState372
        | MDL ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState372
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState372) : 'freshtv840)
    | _ ->
        _menhir_fail ()) : 'freshtv842)) : 'freshtv844)) : 'freshtv846)

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv805) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv801) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv799) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (_2 : 'tv_reg)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 473 "imp_parser.mly"
                  ( Some _2 )
# 4865 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _v) : 'freshtv800)) : 'freshtv802)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv803) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv804)) : 'freshtv806)
    | MenhirState204 | MenhirState44 | MenhirState186 | MenhirState161 | MenhirState165 | MenhirState157 | MenhirState159 | MenhirState153 | MenhirState150 | MenhirState98 | MenhirState94 | MenhirState85 | MenhirState87 | MenhirState89 | MenhirState48 | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv809 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv807 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 462 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 4884 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)) : 'freshtv810)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv811 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv812)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv813 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | LINE _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | STG _v ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | S8_P ->
            _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv814)
    | MenhirState126 ->
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
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState128
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv816)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv817 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv818)) : 'freshtv820)
    | MenhirState128 ->
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
# 4967 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)) : 'freshtv824)
    | MenhirState132 ->
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
# 4983 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)) : 'freshtv828)
    | MenhirState155 ->
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
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState157
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState157 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState157
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157) : 'freshtv830)
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
    | MenhirState204 | MenhirState44 | MenhirState186 | MenhirState161 | MenhirState165 | MenhirState157 | MenhirState159 | MenhirState155 | MenhirState153 | MenhirState150 | MenhirState132 | MenhirState128 | MenhirState126 | MenhirState107 | MenhirState98 | MenhirState94 | MenhirState93 | MenhirState85 | MenhirState87 | MenhirState89 | MenhirState48 | MenhirState56 | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv789 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv787 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_dst)) = _menhir_stack in
        let _v : 'tv_reg = 
# 455 "imp_parser.mly"
            ( _1 )
# 5033 "imp_parser.ml"
         in
        _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv788)) : 'freshtv790)
    | MenhirState130 | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv797 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv791 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130) : 'freshtv792)
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv793 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv794)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv795 * _menhir_state * 'tv_reg_dst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv796)) : 'freshtv798)
    | _ ->
        _menhir_fail ()

and _menhir_reduce160 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 476 "imp_parser.mly"
    ( [||] )
# 5087 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv785 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5098 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv779 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv777 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 285 "imp_parser.mly"
                ( _1+1 )
# 5114 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv778)) : 'freshtv780)
    | APP | COPRD | DTA | DTA_GRM | EOF | IMP | LCE | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv781 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5122 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 19 "imp_parser.mly"
       (int)
# 5127 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5132 "imp_parser.ml"
        ) = 
# 278 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 5136 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv782)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv783 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5146 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv784)) : 'freshtv786)

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv775 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
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
        let (_menhir_stack : ('freshtv773 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState69 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv771 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_typs)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5185 "imp_parser.ml"
        ) = 
# 268 "imp_parser.mly"
                     ( Rcd(rcd_cl _2) )
# 5189 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv772)) : 'freshtv774)
    | SGN ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TYP_STG ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | VAL _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv776)

and _menhir_goto_ir_ret : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ret -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv769) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ret) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv767) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
    ((let _v : 'tv_ir_lines = 
# 317 "imp_parser.mly"
           ( _1 )
# 5216 "imp_parser.ml"
     in
    _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv768)) : 'freshtv770)

and _menhir_goto_coprd_ptn_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv765 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_END ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState172
    | NAM _v ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _v
    | SPL ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState172
    | VAL _v ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv766)

and _menhir_goto_coprd_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv763 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_END ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState198
    | NAM _v ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _v
    | SPL ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState198
    | VAL _v ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198) : 'freshtv764)

and _menhir_run235 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv761) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 201 "imp_parser.mly"
               ( Grm.Synt )
# 5272 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)

and _menhir_run236 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv759) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 207 "imp_parser.mly"
                       ( Grm.Line )
# 5286 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)

and _menhir_run237 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv757) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 202 "imp_parser.mly"
                   ( Grm.Line )
# 5300 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv758)

and _menhir_run238 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv755) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 206 "imp_parser.mly"
                      ( Grm.Synt )
# 5314 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv756)

and _menhir_run239 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv753) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 200 "imp_parser.mly"
                  ( Grm.Synt )
# 5328 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv754)

and _menhir_run240 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv751) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_end = 
# 205 "imp_parser.mly"
              ( Grm.Lex )
# 5342 "imp_parser.ml"
     in
    _menhir_goto_ord_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv752)

and _menhir_run241 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv749) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 199 "imp_parser.mly"
          ( Grm.Lex )
# 5356 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv750)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv747 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5367 "imp_parser.ml"
    )) * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run341 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv743 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5379 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState333 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PRN ->
            _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | L_RCD ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | N ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState339 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState339 _v
        | ROT _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState339 _v
        | SGN ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | TYP_STG ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState339
        | VAL _v ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState339 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState339) : 'freshtv744)
    | PRD ->
        _menhir_run334 _menhir_env (Obj.magic _menhir_stack) MenhirState333
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv745 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5415 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5420 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 238 "imp_parser.mly"
                 ( Def_Abs (_1,snd _2) )
# 5425 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv746)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState333) : 'freshtv748)

and _menhir_run326 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5436 "imp_parser.ml"
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
# 5448 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run326 _menhir_env (Obj.magic _menhir_stack) MenhirState327 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState327) : 'freshtv738)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv739 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5464 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5469 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 95 "imp_parser.mly"
        (
    let v = newvar_q (-1) in
    ([v],[(_1,v)]) )
# 5476 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv740)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv741 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5486 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv742)

and _menhir_run329 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run329 _menhir_env (Obj.magic _menhir_stack) MenhirState329
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv735 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 91 "imp_parser.mly"
        ( 1 )
# 5507 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState329

and _menhir_run351 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5518 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run351 _menhir_env (Obj.magic _menhir_stack) MenhirState351 _v
    | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv733 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5532 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5537 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 246 "imp_parser.mly"
        ( [_1] )
# 5542 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv734)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState351

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState247 ->
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
# 5577 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv714)) : 'freshtv716)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv717 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv718)) : 'freshtv720)
    | MenhirState252 ->
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
# 5605 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv722)) : 'freshtv724)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv725 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv726)) : 'freshtv728)
    | MenhirState311 | MenhirState242 | MenhirState296 | MenhirState292 | MenhirState245 | MenhirState269 | MenhirState271 | MenhirState265 | MenhirState256 | MenhirState258 | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv731 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv729 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 215 "imp_parser.mly"
             ( Grm.Atm _1 )
# 5624 "imp_parser.ml"
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
# 5640 "imp_parser.ml"
     in
    _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv710)) : 'freshtv712)

and _menhir_goto_ir_ptn_cst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_cst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv707 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5650 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv705 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 5658 "imp_parser.ml"
    ))) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_ir_ptn_cst) : 'tv_ir_ptn_cst) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 5665 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_mtc_ir_test = 
# 385 "imp_parser.mly"
                      (
    (ref(R_N _1),ref(P_Cst _3)) )
# 5672 "imp_parser.ml"
     in
    _menhir_goto_mtc_ir_test _menhir_env _menhir_stack _menhir_s _v) : 'freshtv706)) : 'freshtv708)

and _menhir_reduce177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_s8_ptn = 
# 346 "imp_parser.mly"
    ( [] )
# 5681 "imp_parser.ml"
     in
    _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v

and _menhir_run109 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5688 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | LINE _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | STG _v ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | S8_P ->
        _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109

and _menhir_run110 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 5715 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | LINE _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | STG _v ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | S8_P ->
        _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 5742 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | LINE _v ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | MLT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv703 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5758 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState111 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STG _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv699 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5770 "imp_parser.ml"
            )) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 5775 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDX _v ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
            | LINE _v ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
            | STG _v ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
            | S8_P ->
                _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState113
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv700)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv701 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 5804 "imp_parser.ml"
            )) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv702)) : 'freshtv704)
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | STG _v ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
    | S8_P ->
        _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5824 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv651 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5834 "imp_parser.ml"
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
# 5848 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState72 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv647 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5856 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5862 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5869 "imp_parser.ml"
            ) = 
# 267 "imp_parser.mly"
                    ( _2 )
# 5873 "imp_parser.ml"
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
# 5885 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5889 "imp_parser.ml"
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
# 5901 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5905 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5910 "imp_parser.ml"
            ))), _), _, (_3 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5914 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5920 "imp_parser.ml"
            ) = 
# 279 "imp_parser.mly"
                 ( Imp(_1,_3) )
# 5924 "imp_parser.ml"
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
# 5936 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5940 "imp_parser.ml"
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
# 5952 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5956 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5961 "imp_parser.ml"
            ))), _), _, (_3 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5965 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 5971 "imp_parser.ml"
            ) = 
# 270 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 5975 "imp_parser.ml"
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
# 5987 "imp_parser.ml"
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
# 6001 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : 'tv_typs)), _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6006 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 264 "imp_parser.mly"
             ( _1@[_2] )
# 6011 "imp_parser.ml"
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
# 6023 "imp_parser.ml"
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
# 6037 "imp_parser.ml"
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
# 6075 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6079 "imp_parser.ml"
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
# 6093 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6097 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState82 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv669) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6105 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6109 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _, (_2 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6115 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6119 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 519 "imp_parser.mly"
                        ( (_2,_4) )
# 6127 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv670)) : 'freshtv672)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv674)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv681 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6139 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6143 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv675 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6157 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6161 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState217 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState219
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState219
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState219
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState219 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState219 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState219 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState219
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState219
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState219 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219) : 'freshtv676)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv679 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6195 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6199 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState217 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv677 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6207 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6211 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6217 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6221 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 294 "imp_parser.mly"
                            ( Ast.Etr_Out_Abs(_2,_4) )
# 6229 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv678)) : 'freshtv680)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217) : 'freshtv682)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv685 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6241 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6245 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6249 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv683 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6263 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6267 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6271 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6276 "imp_parser.ml"
            ))), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6280 "imp_parser.ml"
            ))), _), _, (_6 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6284 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 292 "imp_parser.mly"
                            (
    Ast.Etr_Abs(_2,_4,_6) )
# 6293 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv686)
    | MenhirState336 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv689 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6305 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6309 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | PRD ->
            _menhir_run334 _menhir_env (Obj.magic _menhir_stack) MenhirState337
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv687 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6325 "imp_parser.ml"
            ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6329 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6334 "imp_parser.ml"
            ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6338 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_prd = 
# 254 "imp_parser.mly"
                     ( [(_4,_2)] )
# 6345 "imp_parser.ml"
             in
            _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState337) : 'freshtv690)
    | MenhirState339 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv693 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6357 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6361 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv691 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 6375 "imp_parser.ml"
            )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6379 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 6384 "imp_parser.ml"
            ))), (_2 : 'tv_def_arg)), _), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6388 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 243 "imp_parser.mly"
                        ( Def_EqT (_1,snd _2,_4) )
# 6394 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv692)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState340) : 'freshtv694)
    | MenhirState343 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv697 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6406 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6410 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState344
        | COPRD ->
            _menhir_run341 _menhir_env (Obj.magic _menhir_stack) MenhirState344
        | IMP ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState344
        | DTA | DTA_GRM | EOF | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv695 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6426 "imp_parser.ml"
            ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6430 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 6435 "imp_parser.ml"
            ))), _, (_4 : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 6439 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 250 "imp_parser.mly"
                      ( [(_4,_2)] )
# 6446 "imp_parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState344) : 'freshtv698)
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
# 6494 "imp_parser.ml"
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
# 6532 "imp_parser.ml"
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
# 6586 "imp_parser.ml"
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
# 6611 "imp_parser.ml"
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
# 6640 "imp_parser.ml"
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
# 6662 "imp_parser.ml"
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
# 6685 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv632)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv635 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv633 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState134 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState148
            | NAM _v ->
                _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState148 _v
            | REG _v ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState148 _v
            | WC ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState148
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148) : 'freshtv634)
        | L_RCD ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | NAM _v ->
            _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | REG _v ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | WC ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134) : 'freshtv636)
    | _ ->
        _menhir_fail ()

and _menhir_reduce121 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 559 "imp_parser.mly"
    ( App(Name(ref(Stt_Axm Ast.Axm._nil)),Rcd [||]) )
# 6740 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6747 "imp_parser.ml"
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
# 6758 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv599) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6766 "imp_parser.ml"
        )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6770 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv600)) : 'freshtv602)
    | MenhirState372 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv605 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6780 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv603 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6788 "imp_parser.ml"
        )) : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6792 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6798 "imp_parser.ml"
        ) = 
# 63 "imp_parser.mly"
                 (
    let ms = _2 in
    _1::ms )
# 6804 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)) : 'freshtv606)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState359 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv571 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv569 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), (_2 : 'tv_nls)), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 105 "imp_parser.mly"
                            ( _1::_3 )
# 6823 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
    | MenhirState38 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv583 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6831 "imp_parser.ml"
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
# 6846 "imp_parser.ml"
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
# 6859 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv578)) : 'freshtv580)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv581 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 6869 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv582)) : 'freshtv584)
    | MenhirState374 ->
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
# 6889 "imp_parser.ml"
            ) = 
# 68 "imp_parser.mly"
                   ( _1 )
# 6893 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv589) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6901 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv587) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6909 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv585) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6917 "imp_parser.ml"
            )) : (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 6921 "imp_parser.ml"
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
# 6937 "imp_parser.ml"
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
# 6949 "imp_parser.ml"
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
# 6961 "imp_parser.ml"
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
# 6990 "imp_parser.ml"
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
# 7005 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv562)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7012 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv559) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7022 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7026 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 459 "imp_parser.mly"
        ( ref(R_N _1) )
# 7031 "imp_parser.ml"
     in
    _menhir_goto_reg_dst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7038 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv557) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7048 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7052 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_dst = 
# 458 "imp_parser.mly"
        ( ref(R_N _1) )
# 7057 "imp_parser.ml"
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
# 7088 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_eq_def) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv553 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7096 "imp_parser.ml"
    )) * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_4 : 'tv_eq_def) : 'tv_eq_def) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 7103 "imp_parser.ml"
    ))), _) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_glb_etr = 
# 295 "imp_parser.mly"
                      ( Ast.Etr_Eq(_2,_4) )
# 7110 "imp_parser.ml"
     in
    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv554)) : 'freshtv556)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7117 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv551) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 7127 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 7131 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7136 "imp_parser.ml"
    ) = 
# 274 "imp_parser.mly"
        ( Var(ref(N_Ln (EndN _1,Axm Lang.Types.Axm.v))) )
# 7140 "imp_parser.ml"
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
# 7154 "imp_parser.ml"
    ) = 
# 281 "imp_parser.mly"
            ( Axm Lang.Types.Axm.stg )
# 7158 "imp_parser.ml"
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
# 7172 "imp_parser.ml"
    ) = 
# 280 "imp_parser.mly"
        ( Axm Lang.Types.Axm.sgn_p )
# 7176 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7183 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv545) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 284 "imp_parser.mly"
    ( 0 )
# 7193 "imp_parser.ml"
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
# 7207 "imp_parser.ml"
    ) = 
# 277 "imp_parser.mly"
      ( Axm Lang.Types.Axm.nat )
# 7211 "imp_parser.ml"
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
# 7224 "imp_parser.ml"
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
# 7260 "imp_parser.ml"
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
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv539) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ir_ret = 
# 314 "imp_parser.mly"
            ( Exn (ref(R_Ax(R_A(Util.sgn ())))) )
# 7307 "imp_parser.ml"
     in
    _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv540)

and _menhir_run98 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv537) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 506 "imp_parser.mly"
                  ()
# 7340 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv538)

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv535) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 502 "imp_parser.mly"
              ()
# 7354 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv536)

and _menhir_run102 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn_end = 
# 507 "imp_parser.mly"
              ()
# 7368 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)

and _menhir_run103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv531) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_coprd_ptn = 
# 503 "imp_parser.mly"
          ()
# 7382 "imp_parser.ml"
     in
    _menhir_goto_coprd_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv532)

and _menhir_run104 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | R64 _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | S8_E ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv529 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState104 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
        | WC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv527 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState105 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SRC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv523 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
                | REG _v ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
                | WC ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState107
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107) : 'freshtv524)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv525 * _menhir_state) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv526)) : 'freshtv528)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105) : 'freshtv530)
    | STG _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104

and _menhir_run155 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
    | REG _v ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
    | WC ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState155
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv521) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv519) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 112 "imp_parser.mly"
            ( _1 )
# 7490 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)) : 'freshtv522)

and _menhir_run232 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7497 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7509 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv511 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7519 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 7524 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | COPRD_END ->
                _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | ORD_LEX_COPRD ->
                _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | ORD_LEX_COPRD_END ->
                _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | ORD_LINE_COPRD ->
                _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | ORD_LINE_COPRD_END ->
                _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | SYNT_COPRD ->
                _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState234) : 'freshtv512)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv513 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7555 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv514)) : 'freshtv516)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv517 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7566 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv518)

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv509) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv507) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 113 "imp_parser.mly"
            ( _1 )
# 7584 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv508)) : 'freshtv510)

and _menhir_run322 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int)
# 7591 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv503 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7603 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run348 _menhir_env (Obj.magic _menhir_stack) MenhirState323
        | NAM _v ->
            _menhir_run324 _menhir_env (Obj.magic _menhir_stack) MenhirState323 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState323) : 'freshtv504)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv505 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 7623 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv506)

and _menhir_run324 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 7631 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv497) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run329 _menhir_env (Obj.magic _menhir_stack) MenhirState325
        | VAL _v ->
            _menhir_run326 _menhir_env (Obj.magic _menhir_stack) MenhirState325 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState325) : 'freshtv498)
    | COPRD | DTA | DTA_GRM | EOF | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv499) = Obj.magic _menhir_stack in
        ((let _v : 'tv_def_arg = 
# 86 "imp_parser.mly"
    ( ([],[]) )
# 7658 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv500)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv501 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7668 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv502)

and _menhir_run348 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv493 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 7685 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv489 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7696 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run351 _menhir_env (Obj.magic _menhir_stack) MenhirState350 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState350) : 'freshtv490)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv491 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 7714 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv492)) : 'freshtv494)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv495 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv496)

and _menhir_goto_name : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7729 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv435 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7739 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7743 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv433 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7749 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7753 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 7758 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7762 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7768 "imp_parser.ml"
        ) = 
# 57 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 7772 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)) : 'freshtv436)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv439 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7780 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7784 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv437 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7790 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7794 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 7799 "imp_parser.ml"
        ))), _, (_3 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7803 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7809 "imp_parser.ml"
        ) = 
# 58 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 7813 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)) : 'freshtv440)
    | MenhirState104 | MenhirState34 | MenhirState1 | MenhirState11 | MenhirState13 | MenhirState14 | MenhirState20 | MenhirState21 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv443 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7821 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv441 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7827 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7832 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 542 "imp_parser.mly"
          ( Name(ref(Ast.Stt_Name _1)) )
# 7837 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)) : 'freshtv444)
    | MenhirState343 | MenhirState339 | MenhirState336 | MenhirState216 | MenhirState219 | MenhirState60 | MenhirState81 | MenhirState69 | MenhirState71 | MenhirState77 | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv447 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7845 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv445 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7851 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7856 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 7861 "imp_parser.ml"
        ) = 
# 275 "imp_parser.mly"
         ( Var(ref(N _1)) )
# 7865 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)) : 'freshtv448)
    | MenhirState122 | MenhirState108 | MenhirState109 | MenhirState110 | MenhirState111 | MenhirState115 | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv449 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7873 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | LINE _v ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | NAM _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | PRM _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | STG _v ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | S8_P ->
            _menhir_reduce177 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv450)
    | MenhirState304 | MenhirState300 | MenhirState290 | MenhirState286 | MenhirState221 | MenhirState199 | MenhirState196 | MenhirState170 | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7899 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161) : 'freshtv452)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv455 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7921 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv453 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7927 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7932 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_ir_ptn_cst = 
# 395 "imp_parser.mly"
         ( P_N(ref(Ast.Stt_Name _1)) )
# 7937 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)) : 'freshtv456)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv461 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7945 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7949 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv457 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7959 "imp_parser.ml"
            ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7963 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState186
            | NAM _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
            | REG _v ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
            | WC ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState186
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186) : 'freshtv458)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv459 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 7987 "imp_parser.ml"
            ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 7991 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv460)) : 'freshtv462)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv465 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8000 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv463 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8006 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8011 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_eq_def = 
# 299 "imp_parser.mly"
         ( EqLn _1 )
# 8016 "imp_parser.ml"
         in
        _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv464)) : 'freshtv466)
    | MenhirState229 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv469 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8024 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8028 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv467 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8034 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8038 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (_2 : (
# 18 "imp_parser.mly"
       (string)
# 8043 "imp_parser.ml"
        ))), _), _, (_4 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8047 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_mdl_etr = 
# 116 "imp_parser.mly"
                    ( Mdl_Eq(_2,_4) )
# 8054 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv468)) : 'freshtv470)
    | MenhirState311 | MenhirState296 | MenhirState292 | MenhirState242 | MenhirState269 | MenhirState271 | MenhirState265 | MenhirState258 | MenhirState259 | MenhirState256 | MenhirState245 | MenhirState252 | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv473 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8062 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv471 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8068 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8073 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_grm_atom = 
# 221 "imp_parser.mly"
         ( Grm.Name _1 )
# 8078 "imp_parser.ml"
         in
        _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv472)) : 'freshtv474)
    | MenhirState378 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv487 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8086 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv483 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8096 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv481 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8102 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8107 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8113 "imp_parser.ml"
            ) = 
# 52 "imp_parser.mly"
             ( _1 )
# 8117 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv479) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8125 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8133 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv475) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8141 "imp_parser.ml"
            )) : (
# 37 "imp_parser.mly"
      (Lang.name)
# 8145 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv476)) : 'freshtv478)) : 'freshtv480)) : 'freshtv482)) : 'freshtv484)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv485 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8155 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv486)) : 'freshtv488)
    | _ ->
        _menhir_fail ()

and _menhir_reduce138 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8165 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 8171 "imp_parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 8176 "imp_parser.ml"
    ) = 
# 55 "imp_parser.mly"
        ( (EndN _1) )
# 8180 "imp_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8187 "imp_parser.ml"
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
# 8207 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 8214 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 8224 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (string)
# 8228 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 543 "imp_parser.mly"
        ( ExpCst(Cst.S8 _1) )
# 8233 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "imp_parser.mly"
       (int64)
# 8240 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv429) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 8250 "imp_parser.ml"
    )) : (
# 20 "imp_parser.mly"
       (int64)
# 8254 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 545 "imp_parser.mly"
        ( ExpCst(Cst.R64 _1) )
# 8259 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv430)

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
        let (_menhir_stack : 'freshtv427 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState14 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv425 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 554 "imp_parser.mly"
                ( App(Name(ref(Stt_Axm Ast.Axm._none)),Rcd [||]) )
# 8330 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)) : 'freshtv428)
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
# 8372 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv423) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 8381 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv421) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 8389 "imp_parser.ml"
    )) : (
# 41 "imp_parser.mly"
      (Lang.Ast.line)
# 8393 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv422)) : 'freshtv424)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv417 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8409 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run321 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | DTA_GRM ->
            _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | LCE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MDL_END | MDL_EOP ->
            _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv418)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv419 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv420)

and _menhir_run370 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv415) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 39 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8446 "imp_parser.ml"
    ) = 
# 61 "imp_parser.mly"
        ( [] )
# 8450 "imp_parser.ml"
     in
    _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv416)

and _menhir_reduce56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 104 "imp_parser.mly"
      ( [] )
# 8459 "imp_parser.ml"
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
        let (_menhir_stack : 'freshtv411 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8475 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run321 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | DTA_GRM ->
            _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv409 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8490 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState40 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState229) : 'freshtv410)
        | LCE ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MDL ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MDL_END | MDL_EOP ->
            _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv412)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv413 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv414)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState41 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv363 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8543 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv359 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8554 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | WC ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv355 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8564 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv353 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8571 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), (_3 : (
# 18 "imp_parser.mly"
       (string)
# 8576 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : 'tv_glb_etr = 
# 288 "imp_parser.mly"
                       ( Mdl_Ln(false,_3) )
# 8585 "imp_parser.ml"
                     in
                    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)) : 'freshtv356)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv357 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8595 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)) : 'freshtv360)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv361 * _menhir_state) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 8606 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv362)) : 'freshtv364)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv365 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)) : 'freshtv368)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState41 in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8624 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR_REV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv369 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8635 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState204 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | ARR ->
                _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | COPRD ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | COPRD_END ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | COPRD_PTN ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | COPRD_PTN_END ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | EOP ->
                _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | EOP_EXN ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState221 _v
            | OUT_IR ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState221 _v
            | ROT _v ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState221 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState221) : 'freshtv370)
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv371 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8675 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState204 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_PRN ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | ROT _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | SGN ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TYP_STG ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | VAL _v ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216) : 'freshtv372)
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv379 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8709 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState204 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | WC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv375 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8721 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv373 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8728 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 18 "imp_parser.mly"
       (string)
# 8733 "imp_parser.ml"
                ))), _) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_glb_etr = 
# 289 "imp_parser.mly"
                   ( Mdl_Ln(true,_2) )
# 8741 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)) : 'freshtv376)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv377 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8751 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)) : 'freshtv380)
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv405 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 8760 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState204 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ENV ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv391) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState205 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | IDX _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv383 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 19 "imp_parser.mly"
       (int)
# 8781 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv381 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 19 "imp_parser.mly"
       (int)
# 8789 "imp_parser.ml"
                    )) : (
# 19 "imp_parser.mly"
       (int)
# 8793 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 304 "imp_parser.mly"
            ( ExStgArg _2 )
# 8800 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv382)) : 'freshtv384)
                | STG _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv387 * _menhir_state) = Obj.magic _menhir_stack in
                    let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8809 "imp_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv385 * _menhir_state) = Obj.magic _menhir_stack in
                    let ((_2 : (
# 18 "imp_parser.mly"
       (string)
# 8817 "imp_parser.ml"
                    )) : (
# 18 "imp_parser.mly"
       (string)
# 8821 "imp_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    let _1 = () in
                    let _v : 'tv_eq_def = 
# 303 "imp_parser.mly"
            ( ExStg _2 )
# 8828 "imp_parser.ml"
                     in
                    _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)) : 'freshtv388)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv389 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)) : 'freshtv392)
            | IDX _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState205 in
                let (_v : (
# 19 "imp_parser.mly"
       (int)
# 8845 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv393) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 19 "imp_parser.mly"
       (int)
# 8854 "imp_parser.ml"
                )) : (
# 19 "imp_parser.mly"
       (int)
# 8858 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 302 "imp_parser.mly"
        ( SttArg _1 )
# 8863 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)) : 'freshtv396)
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
            | PRM _v ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
            | R64 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState205 in
                let (_v : (
# 20 "imp_parser.mly"
       (int64)
# 8877 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 20 "imp_parser.mly"
       (int64)
# 8886 "imp_parser.ml"
                )) : (
# 20 "imp_parser.mly"
       (int64)
# 8890 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 301 "imp_parser.mly"
        ( Cst(Cst.R64 _1) )
# 8895 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)) : 'freshtv400)
            | STG _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv403) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState205 in
                let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8905 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 18 "imp_parser.mly"
       (string)
# 8914 "imp_parser.ml"
                )) : (
# 18 "imp_parser.mly"
       (string)
# 8918 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_eq_def = 
# 300 "imp_parser.mly"
        ( Cst(Cst.S8 _1) )
# 8923 "imp_parser.ml"
                 in
                _menhir_goto_eq_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv402)) : 'freshtv404)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv406)
        | L_RCD ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | NAM _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState204 _v
        | REG _v ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState204 _v
        | WC ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204) : 'freshtv408)
    | SLF _v ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run231 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv351 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState231 in
        let (_v : (
# 18 "imp_parser.mly"
       (string)
# 8962 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv349 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 18 "imp_parser.mly"
       (string)
# 8971 "imp_parser.ml"
        )) : (
# 18 "imp_parser.mly"
       (string)
# 8975 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 122 "imp_parser.mly"
                ( Grm_Abs _2 )
# 8982 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)) : 'freshtv352)
    | SLF _v ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231

and _menhir_run321 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run348 _menhir_env (Obj.magic _menhir_stack) MenhirState321
    | NAM _v ->
        _menhir_run324 _menhir_env (Obj.magic _menhir_stack) MenhirState321 _v
    | SLF _v ->
        _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState321 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState321

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState378 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv28)
    | MenhirState374 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv30)
    | MenhirState372 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState359 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState354 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9035 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState351 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9044 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState350 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9053 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState344 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9062 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9066 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState343 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9075 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9084 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9088 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState339 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9097 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState337 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv49 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9106 "imp_parser.ml"
        ))) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9110 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState336 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9119 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState333 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9128 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState329 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState327 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9142 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState325 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv60)
    | MenhirState323 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9155 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState318 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState314 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv67 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv69 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState307 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_grm_rule_act) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv77 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv79 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv81 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv83 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState300 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv85 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv89 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState295 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState294 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv103 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv105 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState289 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv107 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv109 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv111 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv113 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState283 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_grm_rule) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState275 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState273 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv125 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9319 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState272 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv127 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9328 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv129 * _menhir_state * 'tv_ord) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9337 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState269 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv133 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state * 'tv_ord_end) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState263 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv141 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9371 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * _menhir_state * 'tv_grm_ptn) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv149 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9395 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state * 'tv_ord_end) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9414 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_ord_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9428 "imp_parser.ml"
        ))) * (
# 18 "imp_parser.mly"
       (string)
# 9432 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState229 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv163 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9446 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9455 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv167 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9464 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9468 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9472 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv169 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9481 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9485 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv171 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9494 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9498 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9507 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9516 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9525 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9534 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state * 'tv_coprd_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state * 'tv_coprd_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state * 'tv_coprd_ptn_end) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * _menhir_state) * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state * 'tv_mtc_ir_test) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv195 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9578 "imp_parser.ml"
        ))) * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9582 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv197 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9591 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9600 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state * 'tv_coprd_ptn_end) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv205 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9619 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9628 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv209 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv211 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv215 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv217 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv219 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv222)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv229 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_src_par_p)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv233 * _menhir_state * 'tv_reg_dst)) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv235 * _menhir_state * 'tv_reg_dst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv237 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239 * _menhir_state * (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 9711 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv241 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9720 "imp_parser.ml"
        )) * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9724 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9733 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9742 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9751 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv249 * _menhir_state) * _menhir_state) * _menhir_state)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv251 * _menhir_state) * _menhir_state) * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv267 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9805 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv269 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9814 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9823 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv273 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9832 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv275) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9841 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9845 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv277) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9854 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv279) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9863 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv281 * 'tv_typs) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9872 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv283 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9881 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9885 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv285 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9894 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv287 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9903 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9907 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv289 * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9916 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291 * _menhir_state) * _menhir_state * (
# 43 "imp_parser.mly"
      (Lang.Types.t)
# 9925 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv298)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv302)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 9962 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv307 * _menhir_state * (
# 19 "imp_parser.mly"
       (int)
# 9971 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv311 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9985 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv313 * _menhir_state) * (
# 18 "imp_parser.mly"
       (string)
# 9994 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv316)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv319 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv327 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv337 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv339 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv341 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10067 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10076 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv345 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv348)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 10093 "imp_parser.ml"
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
# 10105 "imp_parser.ml"
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
# 10123 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (string)
# 10128 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.abs_name)
# 10133 "imp_parser.ml"
        ) = 
# 56 "imp_parser.mly"
        ( EndN _1 )
# 10137 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * (
# 18 "imp_parser.mly"
       (string)
# 10147 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (string)
# 10155 "imp_parser.ml"
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
# 10173 "imp_parser.ml"
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
# 10203 "imp_parser.ml"
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
# 10231 "imp_parser.ml"
            ) = 
# 49 "imp_parser.mly"
                ( End )
# 10235 "imp_parser.ml"
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
# 10283 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run370 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MDL ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv6))

and file_top : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 40 "imp_parser.mly"
      (Lang.Ast.glb_etr list)
# 10304 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run321 _menhir_env (Obj.magic _menhir_stack) MenhirState374
    | DTA_GRM ->
        _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState374
    | LCE ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState374
    | MDL ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState374
    | EOF ->
        _menhir_reduce56 _menhir_env (Obj.magic _menhir_stack) MenhirState374
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState374) : 'freshtv4))

and name_eof : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 37 "imp_parser.mly"
      (Lang.name)
# 10331 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState378 _v
    | PRM _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState378 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState378) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 10352 "imp_parser.ml"
