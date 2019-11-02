
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
    | STG of (
# 17 "imp_parser.mly"
       (string)
# 24 "imp_parser.ml"
  )
    | SRC_OUT
    | SRC_IL
    | SRC
    | SPL
    | SLH
    | SLF of (
# 18 "imp_parser.mly"
       (int)
# 34 "imp_parser.ml"
  )
    | SGN
    | SEQ
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
# 50 "imp_parser.ml"
  )
    | RM
    | REG of (
# 17 "imp_parser.mly"
       (string)
# 56 "imp_parser.ml"
  )
    | R64 of (
# 19 "imp_parser.mly"
       (int64)
# 61 "imp_parser.ml"
  )
    | R2 of (
# 20 "imp_parser.mly"
       (bool)
# 66 "imp_parser.ml"
  )
    | PRM of (
# 17 "imp_parser.mly"
       (string)
# 71 "imp_parser.ml"
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
# 83 "imp_parser.ml"
  )
    | ORD_LEX_COPRD
    | ORD_COPRD
    | OP
    | NOT_SPL
    | NOT
    | NL
    | NAT of (
# 18 "imp_parser.mly"
       (int)
# 94 "imp_parser.ml"
  )
    | NAM of (
# 17 "imp_parser.mly"
       (string)
# 99 "imp_parser.ml"
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
# 130 "imp_parser.ml"
  )
    | INJ of (
# 18 "imp_parser.mly"
       (int)
# 135 "imp_parser.ml"
  )
    | INI_IR
    | IN of (
# 18 "imp_parser.mly"
       (int)
# 141 "imp_parser.ml"
  )
    | IMP
    | IDX of (
# 18 "imp_parser.mly"
       (int)
# 147 "imp_parser.ml"
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
    | DTA_GRM
    | DTA
    | DSH
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
# 177 "imp_parser.ml"
  )
    | ARR_REV_IN
    | ARR_REV
    | ARR_END
    | ARR
    | APP
    | AGL_TOP
    | AGL_OP of (
# 18 "imp_parser.mly"
       (int)
# 188 "imp_parser.ml"
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
  | MenhirState382
  | MenhirState380
  | MenhirState375
  | MenhirState362
  | MenhirState357
  | MenhirState354
  | MenhirState353
  | MenhirState347
  | MenhirState346
  | MenhirState343
  | MenhirState342
  | MenhirState340
  | MenhirState339
  | MenhirState336
  | MenhirState332
  | MenhirState330
  | MenhirState328
  | MenhirState326
  | MenhirState324
  | MenhirState321
  | MenhirState317
  | MenhirState316
  | MenhirState315
  | MenhirState312
  | MenhirState311
  | MenhirState310
  | MenhirState305
  | MenhirState304
  | MenhirState302
  | MenhirState298
  | MenhirState296
  | MenhirState293
  | MenhirState290
  | MenhirState286
  | MenhirState285
  | MenhirState282
  | MenhirState279
  | MenhirState276
  | MenhirState268
  | MenhirState267
  | MenhirState266
  | MenhirState264
  | MenhirState263
  | MenhirState259
  | MenhirState258
  | MenhirState256
  | MenhirState249
  | MenhirState248
  | MenhirState246
  | MenhirState245
  | MenhirState243
  | MenhirState239
  | MenhirState235
  | MenhirState233
  | MenhirState231
  | MenhirState229
  | MenhirState227
  | MenhirState224
  | MenhirState222
  | MenhirState220
  | MenhirState218
  | MenhirState214
  | MenhirState212
  | MenhirState210
  | MenhirState208
  | MenhirState206
  | MenhirState205
  | MenhirState201
  | MenhirState199
  | MenhirState197
  | MenhirState195
  | MenhirState193
  | MenhirState187
  | MenhirState185
  | MenhirState184
  | MenhirState183
  | MenhirState182
  | MenhirState181
  | MenhirState179
  | MenhirState177
  | MenhirState176
  | MenhirState173
  | MenhirState171
  | MenhirState170
  | MenhirState164
  | MenhirState161
  | MenhirState159
  | MenhirState157
  | MenhirState153
  | MenhirState151
  | MenhirState149
  | MenhirState147
  | MenhirState145
  | MenhirState144
  | MenhirState141
  | MenhirState140
  | MenhirState139
  | MenhirState136
  | MenhirState135
  | MenhirState132
  | MenhirState131
  | MenhirState130
  | MenhirState129
  | MenhirState127
  | MenhirState126
  | MenhirState124
  | MenhirState123
  | MenhirState122
  | MenhirState121
  | MenhirState119
  | MenhirState115
  | MenhirState113
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState107
  | MenhirState106
  | MenhirState104
  | MenhirState103
  | MenhirState102
  | MenhirState101
  | MenhirState100
  | MenhirState98
  | MenhirState88
  | MenhirState85
  | MenhirState83
  | MenhirState79
  | MenhirState77
  | MenhirState74
  | MenhirState73
  | MenhirState71
  | MenhirState70
  | MenhirState66
  | MenhirState65
  | MenhirState63
  | MenhirState62
  | MenhirState60
  | MenhirState58
  | MenhirState52
  | MenhirState50
  | MenhirState49
  | MenhirState48
  | MenhirState47
  | MenhirState45
  | MenhirState44
  | MenhirState42
  | MenhirState40
  | MenhirState38
  | MenhirState36
  | MenhirState34
  | MenhirState33
  | MenhirState29
  | MenhirState23
  | MenhirState21
  | MenhirState20
  | MenhirState19
  | MenhirState16
  | MenhirState15
  | MenhirState13
  | MenhirState5
  | MenhirState1
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Lang
  open Types
  open Ast
  open Util

# 379 "imp_parser.ml"

let rec _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1435 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 388 "imp_parser.ml"
    ))) * (
# 17 "imp_parser.mly"
       (string)
# 392 "imp_parser.ml"
    )) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run281 _menhir_env (Obj.magic _menhir_stack) MenhirState315
    | ORD_LEX_COPRD ->
        _menhir_run280 _menhir_env (Obj.magic _menhir_stack) MenhirState315
    | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1433 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 406 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 410 "imp_parser.ml"
        )) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 415 "imp_parser.ml"
        ))), (_3 : (
# 17 "imp_parser.mly"
       (string)
# 419 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ord)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 126 "imp_parser.mly"
                        (
    let (_,go) =
    List.fold_left
    ( fun (i,go) (cn,f,r) ->
      if cn="_" then (i+1,go@[(_3^"_"^(string_of_int i),f,r)])
      else (i+1,go@[(cn,f,r)]))
      (0,[]) _4 in
    Lang.Grm.Cnc(_3,go) )
# 432 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1434)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState315) : 'freshtv1436)

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1421 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1419 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 120 "imp_parser.mly"
                    ( _1::_2 )
# 456 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1420)) : 'freshtv1422)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1431 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1429 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 38 "imp_parser.mly"
      (Lang.Ast.grm)
# 473 "imp_parser.ml"
        ) = 
# 116 "imp_parser.mly"
                    ( _2 )
# 477 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1427) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 38 "imp_parser.mly"
      (Lang.Ast.grm)
# 485 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1425) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 38 "imp_parser.mly"
      (Lang.Ast.grm)
# 493 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1423) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 38 "imp_parser.mly"
      (Lang.Ast.grm)
# 501 "imp_parser.ml"
        )) : (
# 38 "imp_parser.mly"
      (Lang.Ast.grm)
# 505 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 112 "imp_parser.mly"
            ( Gram _1 )
# 510 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1424)) : 'freshtv1426)) : 'freshtv1428)) : 'freshtv1430)) : 'freshtv1432)
    | _ ->
        _menhir_fail ()

and _menhir_reduce92 : _menhir_env -> (('ttv_tail * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
    let _v : 'tv_grm_rule = 
# 150 "imp_parser.mly"
                         ( ("_",_1,_2) )
# 522 "imp_parser.ml"
     in
    _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v

and _menhir_run304 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | NAM _v ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
    | REG _v ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
    | WC ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState304
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState304

and _menhir_goto_grm_rule : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_rule -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1413) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1411) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let _v : 'tv_grm_ord = 
# 146 "imp_parser.mly"
             ( [_1] )
# 559 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1412)) : 'freshtv1414)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1417 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1415 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 147 "imp_parser.mly"
                      ( _1@[_2] )
# 575 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1416)) : 'freshtv1418)
    | _ ->
        _menhir_fail ()

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1409 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState296
    | L_OPN ->
        _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState296
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
    | STG _v ->
        _menhir_run283 _menhir_env (Obj.magic _menhir_stack) MenhirState296 _v
    | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | SLF _ | SRC ->
        _menhir_reduce89 _menhir_env (Obj.magic _menhir_stack) MenhirState296
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState296) : 'freshtv1410)

and _menhir_goto_grm_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1407 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState321 _v
    | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1405 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 119 "imp_parser.mly"
            ( [_1] )
# 623 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1406)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState321) : 'freshtv1408)

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1393 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 640 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1391 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 646 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 651 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)), _, (_5 : 'tv_grm_prd)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_rule = 
# 149 "imp_parser.mly"
                                 ( (_2,_1,_4) )
# 657 "imp_parser.ml"
         in
        _menhir_goto_grm_rule _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1392)) : 'freshtv1394)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1397 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            _menhir_run304 _menhir_env (Obj.magic _menhir_stack)
        | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | SLF _ ->
            _menhir_reduce92 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1395 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1396)) : 'freshtv1398)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1401 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            _menhir_run304 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1399 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1400)) : 'freshtv1402)
    | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1403 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        (_menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) : 'freshtv1404)
    | _ ->
        _menhir_fail ()

and _menhir_reduce84 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_prd = 
# 170 "imp_parser.mly"
    ( None )
# 704 "imp_parser.ml"
     in
    _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run294 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1389) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_prd_flg = 
# 174 "imp_parser.mly"
        ( Peg.And )
# 718 "imp_parser.ml"
     in
    _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1390)

and _menhir_run295 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1387) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_prd_flg = 
# 175 "imp_parser.mly"
            ( Peg.Not )
# 732 "imp_parser.ml"
     in
    _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1388)

and _menhir_goto_grm_ord_act : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord_act -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1385 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 743 "imp_parser.ml"
    ))) * (
# 17 "imp_parser.mly"
       (string)
# 747 "imp_parser.ml"
    )) * _menhir_state * 'tv_grm_ord_act) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run281 _menhir_env (Obj.magic _menhir_stack) MenhirState310
    | ORD_LEX_COPRD ->
        _menhir_run280 _menhir_env (Obj.magic _menhir_stack) MenhirState310
    | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1383 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 761 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 765 "imp_parser.ml"
        )) * _menhir_state * 'tv_grm_ord_act) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 770 "imp_parser.ml"
        ))), (_3 : (
# 17 "imp_parser.mly"
       (string)
# 774 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ord_act)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 123 "imp_parser.mly"
                            (
    Lang.Grm.Act(_3,_4)
  )
# 782 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1384)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState310) : 'freshtv1386)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1377 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 798 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1375 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 806 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 813 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 242 "imp_parser.mly"
                                           ( [_3]@_4 )
# 819 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1376)) : 'freshtv1378)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1381 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1379 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 232 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 836 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1380)) : 'freshtv1382)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1365 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1363 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn)), _, (_3 : 'tv_ir_ptn_eq)), _, (_5 : 'tv_ir_lines)), _, (_6 : 'tv_mtc_ir)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_mtc_ir = 
# 418 "imp_parser.mly"
                                                   ([|((_2,_3),_5)|] |+| _6 )
# 857 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1364)) : 'freshtv1366)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1373 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1369 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1367 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_mtc_ir)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_lines = 
# 254 "imp_parser.mly"
                                 ( Mtc(_2,_3) )
# 878 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1368)) : 'freshtv1370)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1371 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1372)) : 'freshtv1374)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1357 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1355 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn)), _, (_3 : 'tv_ir_ptn_eq)), _, (_5 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_mtc_ir_end = 
# 422 "imp_parser.mly"
                                                       ([|((_2,_3),_5)|] |+| _6 )
# 909 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1356)) : 'freshtv1358)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1361 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1359 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_lines = 
# 255 "imp_parser.mly"
                           ( Mtc(_2,_3) )
# 926 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1360)) : 'freshtv1362)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1349 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1347 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_regs) : 'tv_regs) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 430 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 949 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1348)) : 'freshtv1350)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1353 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 957 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1351 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 965 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_regs) : 'tv_regs) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 972 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 259 "imp_parser.mly"
                                 ( IR_Id(_2,[|_4|] |+| _5)  )
# 978 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1352)) : 'freshtv1354)
    | _ ->
        _menhir_fail ()

and _menhir_run213 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1345) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_op_src = 
# 376 "imp_parser.mly"
          ( None )
# 994 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1346)

and _menhir_run214 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
    | REG _v ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214

and _menhir_run284 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_ord -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 1016 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1341 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1028 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | L_OPN ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
        | STG _v ->
            _menhir_run283 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
        | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | ORD_LEX_COPRD | SLF _ | SPL ->
            _menhir_reduce89 _menhir_env (Obj.magic _menhir_stack) MenhirState285
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState285) : 'freshtv1342)
    | DOT ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
    | COPRD | DTA | DTA_GRM | LCE | L_LST | L_OPN | MDL | MDL_END | MDL_EOP | NAM _ | NL | NOT_SPL | ORD_LEX_COPRD | PRM _ | SLF _ | SPL | SRC | STG _ ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1343 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1060 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1344)

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1325 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1074 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run295 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | SPL ->
            _menhir_run294 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | SLF _ ->
            _menhir_reduce84 _menhir_env (Obj.magic _menhir_stack) MenhirState293
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState293) : 'freshtv1326)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1329 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1327 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_prd = 
# 171 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1098 "imp_parser.ml"
         in
        _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1328)) : 'freshtv1330)
    | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1333 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1331 * _menhir_state * 'tv_grm_ptn) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptn)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_ptns = 
# 158 "imp_parser.mly"
                     ( _1::_2 )
# 1110 "imp_parser.ml"
         in
        _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1332)) : 'freshtv1334)
    | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1335 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run295 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | SPL ->
            _menhir_run294 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | SLF _ | SRC ->
            _menhir_reduce84 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState302) : 'freshtv1336)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1337 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run295 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | SPL ->
            _menhir_run294 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | SRC ->
            _menhir_reduce84 _menhir_env (Obj.magic _menhir_stack) MenhirState312
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState312) : 'freshtv1338)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1339 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            _menhir_run295 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | SPL ->
            _menhir_run294 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | ORD_LEX_COPRD | SLF _ ->
            _menhir_reduce84 _menhir_env (Obj.magic _menhir_stack) MenhirState317
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState317) : 'freshtv1340)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1277 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1275 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn)), _, (_3 : 'tv_ir_ptn_eq)), _, (_5 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_mtc_ir_end = 
# 421 "imp_parser.mly"
                                                ( [|((_2,_3),_5)|] )
# 1179 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1276)) : 'freshtv1278)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1281 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1279 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 253 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 1191 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1280)) : 'freshtv1282)
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1285 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_PTN ->
            _menhir_run245 _menhir_env (Obj.magic _menhir_stack) MenhirState249
        | COPRD_PTN_END ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState249
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv1283 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn)), _, (_3 : 'tv_ir_ptn_eq)), _, (_5 : 'tv_ir_lines)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_mtc_ir = 
# 417 "imp_parser.mly"
                                            ( [|((_2,_3),_5)|] )
# 1213 "imp_parser.ml"
             in
            _menhir_goto_mtc_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1284)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState249) : 'freshtv1286)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1299 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1225 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1297 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1231 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 1236 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), (_3 : 'tv_typ_def)), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 245 "imp_parser.mly"
                                 ( (_1,fst _3,snd _3,(_2,ref _4)) )
# 1241 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1295) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body_ir) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState65 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1289 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 1254 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState256 _v
            | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1287 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 1266 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 1271 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 241 "imp_parser.mly"
                            ( [_3] )
# 1277 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1288)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState256) : 'freshtv1290)
        | MenhirState63 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1293 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1291 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body_ir)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 233 "imp_parser.mly"
                         ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d) )
# 1294 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1292)) : 'freshtv1294)
        | _ ->
            _menhir_fail ()) : 'freshtv1296)) : 'freshtv1298)) : 'freshtv1300)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1303 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1304 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1301 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1310 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 1315 "imp_parser.ml"
        ))), _), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 238 "imp_parser.mly"
                             ( Ast.Etr_Glb(_2,ref _4) )
# 1322 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1302)) : 'freshtv1304)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1323) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1321) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_reg_ptn_src)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_grm_act = 
# 143 "imp_parser.mly"
                             ( (_2,ref _3) )
# 1335 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1319) = _menhir_stack in
        let (_v : 'tv_grm_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1317 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let (_v : 'tv_grm_act) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1315 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) * _menhir_state * 'tv_grm_prd) = Obj.magic _menhir_stack in
        let ((_4 : 'tv_grm_act) : 'tv_grm_act) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)), _, (_3 : 'tv_grm_prd)) = _menhir_stack in
        let _v : 'tv_grm_rule_act = 
# 140 "imp_parser.mly"
                                 ( (_4,_1,_2) )
# 1350 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1313) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule_act) = _v in
        ((match _menhir_s with
        | MenhirState279 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1307) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_grm_rule_act) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1305) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_grm_rule_act) : 'tv_grm_rule_act) = _v in
            ((let _v : 'tv_grm_ord_act = 
# 136 "imp_parser.mly"
                 ( [_1] )
# 1369 "imp_parser.ml"
             in
            _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1306)) : 'freshtv1308)
        | MenhirState310 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1311 * _menhir_state * 'tv_grm_ord_act) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_grm_rule_act) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1309 * _menhir_state * 'tv_grm_ord_act) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_grm_rule_act) : 'tv_grm_rule_act) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord_act)) = _menhir_stack in
            let _v : 'tv_grm_ord_act = 
# 137 "imp_parser.mly"
                             ( _1@[_2] )
# 1385 "imp_parser.ml"
             in
            _menhir_goto_grm_ord_act _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1310)) : 'freshtv1312)
        | _ ->
            _menhir_fail ()) : 'freshtv1314)) : 'freshtv1316)) : 'freshtv1318)) : 'freshtv1320)) : 'freshtv1322)) : 'freshtv1324)
    | _ ->
        _menhir_fail ()

and _menhir_run141 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | VAL _v ->
        _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
    | WC ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141

and _menhir_run245 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState245
    | VAL _v ->
        _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
    | WC ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState245
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState245

and _menhir_reduce175 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 429 "imp_parser.mly"
    ( [||] )
# 1432 "imp_parser.ml"
     in
    _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131

and _menhir_run78 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1273) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_op = 
# 404 "imp_parser.mly"
          ( None )
# 1465 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1274)

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79

and _menhir_run152 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1271) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ir_ptn_op = 
# 298 "imp_parser.mly"
          ( None )
# 1496 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1272)

and _menhir_run153 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
    | WC ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState153
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153

and _menhir_goto_reg_ptn_op_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_op_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1265 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op_src) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1263 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_reg_ptn_lst_lb_src)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_reg_ptn_src = 
# 369 "imp_parser.mly"
                                               (
    match _4 with
    | None -> Rcd_Ptn.R_Lb _3
    | Some r -> Rcd_Ptn.Ro_Lb (_3,r) )
# 1536 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1264)) : 'freshtv1266)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1269 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op_src) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1267 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_reg_ptn_src = 
# 365 "imp_parser.mly"
                                         (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some r -> Rcd_Ptn.Ro (_2,r) )
# 1556 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1268)) : 'freshtv1270)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1259 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1257 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn_src)), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst_src = 
# 379 "imp_parser.mly"
                                ( [|_1|] |+| _2 )
# 1575 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1258)) : 'freshtv1260)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1261 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | R_RCD ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv1262)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_lb_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_lb_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1253 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1604 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1251 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1610 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 1615 "imp_parser.ml"
        ))), _, (_3 : 'tv_reg_ptn_src)), _, (_4 : 'tv_reg_ptn_lst_lb_src)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_reg_ptn_lst_lb_src = 
# 383 "imp_parser.mly"
                                           ( [|(_1,_3)|] |+| _4 )
# 1621 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_lb_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1252)) : 'freshtv1254)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1255 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | R_RCD ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState212
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212) : 'freshtv1256)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1245 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState282
        | L_OPN ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState282
        | NAM _v ->
            _menhir_run284 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
        | STG _v ->
            _menhir_run283 _menhir_env (Obj.magic _menhir_stack) MenhirState282 _v
        | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | ORD_LEX_COPRD | SLF _ | SPL | SRC ->
            _menhir_reduce89 _menhir_env (Obj.magic _menhir_stack) MenhirState282
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState282) : 'freshtv1246)
    | MenhirState310 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1247 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | L_OPN ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
        | STG _v ->
            _menhir_run283 _menhir_env (Obj.magic _menhir_stack) MenhirState311 _v
        | NOT_SPL | SPL | SRC ->
            _menhir_reduce89 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState311) : 'freshtv1248)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1249 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | L_OPN ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | NAM _v ->
            _menhir_run284 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
        | STG _v ->
            _menhir_run283 _menhir_env (Obj.magic _menhir_stack) MenhirState316 _v
        | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | ORD_LEX_COPRD | SLF _ | SPL ->
            _menhir_reduce89 _menhir_env (Obj.magic _menhir_stack) MenhirState316
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState316) : 'freshtv1250)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1239 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1722 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1237 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1730 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 1737 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 90 "imp_parser.mly"
                 (
    let v = newvar_q (-1) in
    let (vs,l) = _3 in
    (v::vs,(_1,v)::l) )
# 1746 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1238)) : 'freshtv1240)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1243) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1241) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 79 "imp_parser.mly"
             ( _2 )
# 1762 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv1242)) : 'freshtv1244)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState332 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1231 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1229 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 84 "imp_parser.mly"
                 ( 1+_2 )
# 1785 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1230)) : 'freshtv1232)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1235) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1233) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 80 "imp_parser.mly"
                 ( ([],BatList.init _2 (fun n -> ("$"^(String.make n '\''),newvar_q (-2)))) )
# 1801 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv1234)) : 'freshtv1236)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState354 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1223 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1815 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1221 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 1823 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 1830 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 191 "imp_parser.mly"
                  ( _1::_2 )
# 1835 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1222)) : 'freshtv1224)
    | MenhirState353 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1227 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 1843 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1225 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 1851 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 1858 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 186 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 1865 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1226)) : 'freshtv1228)
    | _ ->
        _menhir_fail ()

and _menhir_reduce89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 157 "imp_parser.mly"
    ( [] )
# 1876 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_run283 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 1883 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1219) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 1893 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 1897 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 166 "imp_parser.mly"
        ( Grm.Txt _1 )
# 1902 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1220)

and _menhir_run286 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
    | STG _v ->
        _menhir_run283 _menhir_env (Obj.magic _menhir_stack) MenhirState286 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState286

and _menhir_run290 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
    | STG _v ->
        _menhir_run283 _menhir_env (Obj.magic _menhir_stack) MenhirState290 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState290

and _menhir_goto_nls : _menhir_env -> 'ttv_tail -> 'tv_nls -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1217 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run324 _menhir_env (Obj.magic _menhir_stack) MenhirState362
    | DTA_GRM ->
        _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState362
    | LCE ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState362
    | MDL ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState362
    | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1215 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState362 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1213 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, (_1 : 'tv_nls)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_nls = 
# 75 "imp_parser.mly"
           ()
# 1969 "imp_parser.ml"
         in
        _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv1214)) : 'freshtv1216)
    | MDL_END | MDL_EOP ->
        _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState362
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState362) : 'freshtv1218)

and _menhir_goto_src_par_p : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_src_par_p -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1205 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | STG _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | S8_P ->
            _menhir_reduce179 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183) : 'freshtv1206)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1211 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1207 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState199
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199) : 'freshtv1208)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1209 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1210)) : 'freshtv1212)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ret : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ret -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1203) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_ir_ret) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1201) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
    ((let _v : 'tv_ir_lines = 
# 252 "imp_parser.mly"
           ( _1 )
# 2048 "imp_parser.ml"
     in
    _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1202)) : 'freshtv1204)

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1195 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1193 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_reg_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_reg_ptn = 
# 397 "imp_parser.mly"
                                       (
    match _4 with
    | None -> Rcd_Ptn.R_Lb _3
    | Some r -> Rcd_Ptn.Ro_Lb (_3,r) )
# 2073 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1194)) : 'freshtv1196)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1199 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1197 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_reg_ptn = 
# 393 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some r -> Rcd_Ptn.Ro (_2,r) )
# 2093 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1198)) : 'freshtv1200)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1121 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2108 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
        | OP | R_RCD ->
            _menhir_reduce159 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74) : 'freshtv1122)
    | MenhirState85 | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1123 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | NAM _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
        | REG _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
        | WC ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | OP | R_RCD ->
            _menhir_reduce157 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv1124)
    | MenhirState258 | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1131 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2146 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1125) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | L_OPN ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | L_PRN ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | L_RCD ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | N ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | ROT _v ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | SGN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | TYP_STG ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | VAL _v ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | Z ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState88
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv1126)
        | APP | ARR | EOP | EOP_EXN | MTC | NAM _ | OUT_IR | PRM _ | ROT _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1127) = Obj.magic _menhir_stack in
            ((let _v : 'tv_typ_def = 
# 433 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 2191 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv1128)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1129 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2201 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1130)) : 'freshtv1132)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1137 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2210 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1133 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2220 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv1134)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1135 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2244 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1136)) : 'freshtv1138)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1139 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2253 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | APP | ARR | EOP | EOP_EXN | MTC | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce175 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130) : 'freshtv1140)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1141 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | APP | ARR | EOP | EOP_EXN | MTC | NAM _ | OUT_IR | PRM _ | ROT _ ->
            _menhir_reduce175 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132) : 'freshtv1142)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1149 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1145 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1143 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 268 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2299 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1144)) : 'freshtv1146)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1147 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1148)) : 'freshtv1150)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1151 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_PTN ->
            _menhir_run245 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | COPRD_PTN_END ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv1152)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1155 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1153 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 248 "imp_parser.mly"
                ( Ret _2 )
# 2333 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1154)) : 'freshtv1156)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1159 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1157 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn_src)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 260 "imp_parser.mly"
                                            ( IR_Exp(_2,_4,_6) )
# 2348 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1158)) : 'freshtv1160)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1163 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1161 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_3 : 'tv_reg_ptn_src)), _, (_5 : 'tv_reg_ptn)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 261 "imp_parser.mly"
                                    ( IR_Exp(_2,_3,_5) )
# 2362 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1162)) : 'freshtv1164)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1169 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1165 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState233
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState233 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState233 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState233
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState233) : 'freshtv1166)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1167 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1168)) : 'freshtv1170)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1173 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1171 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 266 "imp_parser.mly"
                                    (
     IR_Call((_2,_4),_6) )
# 2409 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1172)) : 'freshtv1174)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1187 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1175 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState239
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState239 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState239 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState239
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState239) : 'freshtv1176)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1179 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1177 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_name)), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 256 "imp_parser.mly"
                        ( IL_Glb_Call(_1,_2) )
# 2447 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1178)) : 'freshtv1180)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1183 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1181 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_name)), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 270 "imp_parser.mly"
                         ( IR_Glb_Out(_1,_2) )
# 2461 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1182)) : 'freshtv1184)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1185 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1186)) : 'freshtv1188)
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1191 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1189 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_name)), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 265 "imp_parser.mly"
                             ( IR_Glb_Call(_1,_2,_4) )
# 2481 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1190)) : 'freshtv1192)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1115 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | R_RCD ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv1116)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1119 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1117 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 407 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 2514 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1118)) : 'freshtv1120)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1111 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2529 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1109 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2535 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 2540 "imp_parser.ml"
        ))), _, (_3 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_reg_ptn_lst_lb = 
# 411 "imp_parser.mly"
                                   ( [|(_1,_3)|] |+| _4 )
# 2546 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1110)) : 'freshtv1112)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1113 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | R_RCD ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv1114)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1107 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | ARR ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | EOP ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | EOP_EXN ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | MTC ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
    | OUT_IR ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
    | ROT _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243) : 'freshtv1108)

and _menhir_goto_ir_ptn_eq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_eq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1089 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 2606 "imp_parser.ml"
        ))) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1087 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 2612 "imp_parser.ml"
        ))) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 2617 "imp_parser.ml"
        ))), _, (_4 : 'tv_name)), _, (_6 : 'tv_ir_ptn)), _, (_7 : 'tv_ir_ptn_eq)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_ptn_eq = 
# 306 "imp_parser.mly"
                                         (
        let v = newvar () in
        Types.rm := (_2,v)::!Types.rm;
    (v,Mtc.Eq_Agl_N(_4,_6))::_7
    )
# 2629 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1088)) : 'freshtv1090)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1093 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 2637 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn_cst) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1091 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 2643 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn_cst) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 2648 "imp_parser.ml"
        ))), _, (_4 : 'tv_ir_ptn_cst)), _, (_5 : 'tv_ir_ptn_eq)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_ptn_eq = 
# 311 "imp_parser.mly"
                                    (
        let v = newvar () in
        Types.rm := (_2,v)::!Types.rm;
    (v,Mtc.P_Cst _4)::_5 )
# 2658 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1092)) : 'freshtv1094)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1099 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1095 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState176
            | ARR ->
                _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState176
            | EOP ->
                _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState176
            | EOP_EXN ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState176
            | MTC ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState176
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _v
            | OUT_IR ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState176
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _v
            | ROT _v ->
                _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176) : 'freshtv1096)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1097 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1098)) : 'freshtv1100)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1105 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1101 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState248
            | ARR ->
                _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState248
            | EOP ->
                _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState248
            | EOP_EXN ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState248
            | MTC ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState248
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState248 _v
            | OUT_IR ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState248
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState248 _v
            | ROT _v ->
                _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState248 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState248) : 'freshtv1102)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1103 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1104)) : 'freshtv1106)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1081 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1079 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_ir_ptn_op) : 'tv_ir_ptn_op) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_ir_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_ir_ptn = 
# 290 "imp_parser.mly"
                                     (
    match _4 with
    | None -> Rcd_Ptn.R_Lb _3
    | Some r -> Rcd_Ptn.Ro_Lb (_3,r) )
# 2767 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1080)) : 'freshtv1082)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1085 * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1083 * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_ir_ptn_op) : 'tv_ir_ptn_op) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ptn = 
# 286 "imp_parser.mly"
                               (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some r -> Rcd_Ptn.Ro (_2,r) )
# 2787 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1084)) : 'freshtv1086)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1069 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2802 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run146 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
        | OP | R_RCD ->
            _menhir_reduce122 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv1070)
    | MenhirState159 | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1071 * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | VAL _v ->
            _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
        | WC ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | OP | R_RCD ->
            _menhir_reduce120 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv1072)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1073 * _menhir_state) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | SRC ->
            _menhir_reduce117 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161) : 'freshtv1074)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1075 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 2852 "imp_parser.ml"
        ))) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | SRC ->
            _menhir_reduce117 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171) : 'freshtv1076)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1077 * _menhir_state) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | SRC ->
            _menhir_reduce117 _menhir_env (Obj.magic _menhir_stack) MenhirState246
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState246) : 'freshtv1078)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1063 * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | R_RCD ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157) : 'freshtv1064)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1067 * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1065 * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_ptn)), _, (_2 : 'tv_ir_ptn_lst)) = _menhir_stack in
        let _v : 'tv_ir_ptn_lst = 
# 302 "imp_parser.mly"
                      ( [|_1|] |+| _2 )
# 2909 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1066)) : 'freshtv1068)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1059 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2924 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1057 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 2930 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 2935 "imp_parser.ml"
        ))), _, (_3 : 'tv_ir_ptn)), _, (_4 : 'tv_ir_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_ir_ptn_lst_lb = 
# 344 "imp_parser.mly"
                                 ( [|(_1,_3)|] |+| _4 )
# 2941 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1058)) : 'freshtv1060)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1061 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | R_RCD ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv1062)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState357 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1051 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2969 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1049 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 2977 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 2984 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 179 "imp_parser.mly"
                                        ( [_3]@_4 )
# 2990 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1050)) : 'freshtv1052)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1055 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1053 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 110 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 3007 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1054)) : 'freshtv1056)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_top_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1039 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3022 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 3026 "imp_parser.ml"
        )) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1037 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3032 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 3036 "imp_parser.ml"
        )) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3041 "imp_parser.ml"
        ))), _, (_3 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 3045 "imp_parser.ml"
        ))), _, (_4 : 'tv_typ_top_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_typ_top_lb = 
# 203 "imp_parser.mly"
                            ( Cns_Lb(_1,_3,_4) )
# 3051 "imp_parser.ml"
         in
        _menhir_goto_typ_top_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1038)) : 'freshtv1040)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1047 * _menhir_state)) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1043 * _menhir_state)) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1041 * _menhir_state)) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_typ_top_lb)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 3073 "imp_parser.ml"
            ) = 
# 211 "imp_parser.mly"
                              ( Rcd_Lb _3 )
# 3077 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1042)) : 'freshtv1044)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1045 * _menhir_state)) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1046)) : 'freshtv1048)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1019 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3099 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _v
        | OP | R_RCD ->
            _menhir_reduce161 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState210) : 'freshtv1020)
    | MenhirState218 | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1021 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | NAM _v ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState218 _v
        | REG _v ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState218 _v
        | WC ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | OP | R_RCD ->
            _menhir_reduce163 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState218) : 'freshtv1022)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1027 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1023 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState224
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState224 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState224 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState224
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState224) : 'freshtv1024)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1025 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1026)) : 'freshtv1028)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1033 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1029 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState227 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState227 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState227) : 'freshtv1030)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1031 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1032)) : 'freshtv1034)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1035) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | ARR ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | EOP ->
            _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | EOP_EXN ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | MTC ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState305 _v
        | OUT_IR ->
            _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState305
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState305 _v
        | ROT _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState305 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState305) : 'freshtv1036)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState304 | MenhirState201 | MenhirState222 | MenhirState218 | MenhirState205 | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1009 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1007 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_src = 
# 364 "imp_parser.mly"
            ( Rcd_Ptn.A _1 )
# 3238 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1008)) : 'freshtv1010)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1017 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1013 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1011 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_src)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 375 "imp_parser.mly"
                      ( Some _2 )
# 3259 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1012)) : 'freshtv1014)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1015 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1016)) : 'freshtv1018)
    | _ ->
        _menhir_fail ()

and _menhir_reduce163 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_src = 
# 378 "imp_parser.mly"
    ( [||] )
# 3277 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce161 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_lb_src = 
# 382 "imp_parser.mly"
    ( [||] )
# 3286 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_lb_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_run207 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 3293 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1003 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3305 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState208
        | NAM _v ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
        | REG _v ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
        | WC ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState208
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState208) : 'freshtv1004)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1005 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3329 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1006)

and _menhir_goto_mdl_end : _menhir_env -> 'ttv_tail -> 'tv_mdl_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv1001 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 3340 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let (_v : 'tv_mdl_end) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv999 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 3347 "imp_parser.ml"
    )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_mdl_end) : 'tv_mdl_end) = _v in
    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 3353 "imp_parser.ml"
    ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_mdl = 
# 63 "imp_parser.mly"
                               ( (_2,_3) )
# 3359 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv997) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_mdl) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState62 | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv993 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv991 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : 'tv_mdl_etr = 
# 106 "imp_parser.mly"
            (
    let (n,el) = _1 in Mdl (n,el) )
# 3377 "imp_parser.ml"
         in
        _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv992)) : 'freshtv994)
    | MenhirState380 | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv995 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            _menhir_run378 _menhir_env (Obj.magic _menhir_stack) MenhirState380
        | LCE ->
            _menhir_run373 _menhir_env (Obj.magic _menhir_stack) MenhirState380
        | MDL ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState380
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState380) : 'freshtv996)
    | _ ->
        _menhir_fail ()) : 'freshtv998)) : 'freshtv1000)) : 'freshtv1002)

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv989 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 3406 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv983 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv981 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 227 "imp_parser.mly"
                ( _1+1 )
# 3422 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv982)) : 'freshtv984)
    | APP | COPRD | DTA | DTA_GRM | IMP | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ | Z ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv985 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 3430 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 3435 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 3440 "imp_parser.ml"
        ) = 
# 220 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 3444 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv986)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv987 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 3454 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv988)) : 'freshtv990)

and _menhir_run280 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv979) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 154 "imp_parser.mly"
                  ( Grm.Synt )
# 3469 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv980)

and _menhir_run281 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv977) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 153 "imp_parser.mly"
          ( Grm.Lex )
# 3483 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv978)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv975 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3494 "imp_parser.ml"
    )) * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run344 _menhir_env (Obj.magic _menhir_stack) MenhirState336
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv971 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3506 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState336 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState342
        | L_OPN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState342
        | L_PRN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState342
        | L_RCD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState342
        | N ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState342
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState342 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState342 _v
        | ROT _v ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState342 _v
        | SGN ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState342
        | TYP_STG ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState342
        | VAL _v ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState342 _v
        | Z ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState342
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState342) : 'freshtv972)
    | PRD ->
        _menhir_run337 _menhir_env (Obj.magic _menhir_stack) MenhirState336
    | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv973 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3548 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3553 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 182 "imp_parser.mly"
                 ( Def_Abs (_1,snd _2) )
# 3558 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState336) : 'freshtv976)

and _menhir_run329 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 3569 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv965 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3581 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run329 _menhir_env (Obj.magic _menhir_stack) MenhirState330 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState330) : 'freshtv966)
    | COPRD | DTA | DTA_GRM | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv967 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3597 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3602 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 87 "imp_parser.mly"
        (
    let v = newvar_q (-1) in
    ([v],[(_1,v)]) )
# 3609 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv968)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv969 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3619 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv970)

and _menhir_run332 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run332 _menhir_env (Obj.magic _menhir_stack) MenhirState332
    | COPRD | DTA | DTA_GRM | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv963 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 83 "imp_parser.mly"
        ( 1 )
# 3640 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv964)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState332

and _menhir_run354 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 3651 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run354 _menhir_env (Obj.magic _menhir_stack) MenhirState354 _v
    | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv961 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3665 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 3670 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 190 "imp_parser.mly"
        ( [_1] )
# 3675 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv962)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState354

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv959 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run290 _menhir_env (Obj.magic _menhir_stack) MenhirState298
    | L_OPN ->
        _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState298
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState298 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState298 _v
    | STG _v ->
        _menhir_run283 _menhir_env (Obj.magic _menhir_stack) MenhirState298 _v
    | COPRD | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | NOT_SPL | ORD_LEX_COPRD | SLF _ | SPL | SRC ->
        _menhir_reduce89 _menhir_env (Obj.magic _menhir_stack) MenhirState298
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState298) : 'freshtv960)

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv957 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv955) = Obj.magic _menhir_stack in
    ((let _v : 'tv_nls = 
# 74 "imp_parser.mly"
    ()
# 3718 "imp_parser.ml"
     in
    _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv956)) : 'freshtv958)

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState258 | MenhirState66 | MenhirState139 | MenhirState235 | MenhirState239 | MenhirState231 | MenhirState233 | MenhirState227 | MenhirState224 | MenhirState179 | MenhirState136 | MenhirState127 | MenhirState129 | MenhirState131 | MenhirState70 | MenhirState85 | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv911 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv909 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 392 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 3735 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv910)) : 'freshtv912)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv919 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv915 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv913 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 403 "imp_parser.mly"
                  ( Some _2 )
# 3756 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv914)) : 'freshtv916)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv917 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv918)) : 'freshtv920)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv921 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | NAM _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
        | REG _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
        | WC ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv922)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv925 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv923 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 249 "imp_parser.mly"
                ( Exn _2 )
# 3794 "imp_parser.ml"
         in
        _menhir_goto_ir_ret _menhir_env _menhir_stack _menhir_s _v) : 'freshtv924)) : 'freshtv926)
    | MenhirState197 | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv933 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv927 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState197
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197) : 'freshtv928)
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv929 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState193 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState193
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193) : 'freshtv930)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv931 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv932)) : 'freshtv934)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv939 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv935 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState195 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState195 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState195
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv936)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv937 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv938)) : 'freshtv940)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv943 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv941 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_reg)), _, (_3 : 'tv_reg)), _, (_5 : 'tv_reg)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_src_par_p = 
# 273 "imp_parser.mly"
                        ( ([|_1|],[|_3;_5|]) )
# 3882 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv942)) : 'freshtv944)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv947 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_src_par_p)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv945 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_src_par_p)) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_reg)), _, (_3 : 'tv_src_par_p)), _, (_5 : 'tv_reg)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_src_par_p = 
# 274 "imp_parser.mly"
                              (
      let (l0,l1) = _3 in
      ([|_1|] |+| l0,l1 |+| [|_5|]) )
# 3898 "imp_parser.ml"
         in
        _menhir_goto_src_par_p _menhir_env _menhir_stack _menhir_s _v) : 'freshtv946)) : 'freshtv948)
    | MenhirState229 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv953 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv949 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231) : 'freshtv950)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv951 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv952)) : 'freshtv954)
    | _ ->
        _menhir_fail ()

and _menhir_reduce157 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 406 "imp_parser.mly"
    ( [||] )
# 3940 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce159 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_lb = 
# 410 "imp_parser.mly"
    ( [||] )
# 3949 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run72 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 3956 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv905 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3968 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | NAM _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
        | REG _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
        | WC ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv906)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv907 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 3992 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv908)

and _menhir_goto_s8_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_s8_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv887 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4006 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv885 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4012 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 4017 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 281 "imp_parser.mly"
               ( (S8_Var _1)::_2 )
# 4022 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv886)) : 'freshtv888)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv891 * _menhir_state * 'tv_name) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv889 * _menhir_state * 'tv_name) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_name)), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 282 "imp_parser.mly"
                ( (S8_Name _1)::_2 )
# 4034 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv890)) : 'freshtv892)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv895 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4042 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv893 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4048 "imp_parser.ml"
        )) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 4053 "imp_parser.ml"
        ))), _, (_2 : 'tv_s8_ptn)) = _menhir_stack in
        let _v : 'tv_s8_ptn = 
# 280 "imp_parser.mly"
               ( (S8_Txt _1)::_2 )
# 4058 "imp_parser.ml"
         in
        _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv903 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | S8_P ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv899 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv897 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_src_par_p)), _, (_4 : 'tv_s8_ptn)) = _menhir_stack in
            let _5 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 262 "imp_parser.mly"
                                              (
      let (l0,l1) = _3 in
      IR_S8(_4,l0,l1) )
# 4082 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv898)) : 'freshtv900)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv901 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) * _menhir_state * 'tv_s8_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv902)) : 'freshtv904)
    | _ ->
        _menhir_fail ()

and _menhir_reduce117 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_ir_ptn_eq = 
# 305 "imp_parser.mly"
    ( [] )
# 4100 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v

and _menhir_run162 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv881 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 4116 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv877 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4127 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | INT _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv863) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState164 in
                let (_v : (
# 18 "imp_parser.mly"
       (int)
# 4139 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv861) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 18 "imp_parser.mly"
       (int)
# 4148 "imp_parser.ml"
                )) : (
# 18 "imp_parser.mly"
       (int)
# 4152 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_ir_ptn_cst = 
# 318 "imp_parser.mly"
        ( Mtc.P_Z _1 )
# 4157 "imp_parser.ml"
                 in
                _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv862)) : 'freshtv864)
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v
            | R2 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv867) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState164 in
                let (_v : (
# 20 "imp_parser.mly"
       (bool)
# 4171 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv865) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 20 "imp_parser.mly"
       (bool)
# 4180 "imp_parser.ml"
                )) : (
# 20 "imp_parser.mly"
       (bool)
# 4184 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_ir_ptn_cst = 
# 320 "imp_parser.mly"
       ( Mtc.P_R2 _1 )
# 4189 "imp_parser.ml"
                 in
                _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv866)) : 'freshtv868)
            | R64 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv871) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState164 in
                let (_v : (
# 19 "imp_parser.mly"
       (int64)
# 4199 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv869) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 19 "imp_parser.mly"
       (int64)
# 4208 "imp_parser.ml"
                )) : (
# 19 "imp_parser.mly"
       (int64)
# 4212 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_ir_ptn_cst = 
# 319 "imp_parser.mly"
        ( Mtc.P_R64 _1 )
# 4217 "imp_parser.ml"
                 in
                _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)) : 'freshtv872)
            | STG _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv875) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState164 in
                let (_v : (
# 17 "imp_parser.mly"
       (string)
# 4227 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv873) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 4236 "imp_parser.ml"
                )) : (
# 17 "imp_parser.mly"
       (string)
# 4240 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_ir_ptn_cst = 
# 317 "imp_parser.mly"
        ( Mtc.P_Stg _1 )
# 4245 "imp_parser.ml"
                 in
                _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv874)) : 'freshtv876)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164) : 'freshtv878)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv879 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4259 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv880)) : 'freshtv882)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv883 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv884)

and _menhir_goto_ir_ptn_atm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_atm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState245 | MenhirState170 | MenhirState141 | MenhirState159 | MenhirState144 | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv851 * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv849 * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_ir_ptn_atm)) = _menhir_stack in
        let _v : 'tv_ir_ptn = 
# 285 "imp_parser.mly"
               ( Rcd_Ptn.A _1 )
# 4284 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv850)) : 'freshtv852)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv859 * _menhir_state) * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv855 * _menhir_state) * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv853 * _menhir_state) * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn_atm)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_ir_ptn_op = 
# 297 "imp_parser.mly"
                         ( Some _2 )
# 4305 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv854)) : 'freshtv856)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv857 * _menhir_state) * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv858)) : 'freshtv860)
    | _ ->
        _menhir_fail ()

and _menhir_reduce120 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_ir_ptn_lst = 
# 301 "imp_parser.mly"
    ( [||] )
# 4323 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_ir_ptn_lst_lb = 
# 343 "imp_parser.mly"
    ( [||] )
# 4332 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run146 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 4339 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv845 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4351 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | VAL _v ->
            _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
        | WC ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv846)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv847 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4373 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv848)

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState347 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv839 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4386 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4390 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv837 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4398 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4402 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 4409 "imp_parser.ml"
        ))), _, (_4 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4413 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 195 "imp_parser.mly"
                                 ( (_4,_2)::_5 )
# 4420 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv838)) : 'freshtv840)
    | MenhirState336 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv843 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4428 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv841 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4436 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 4443 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 183 "imp_parser.mly"
                            (
    Def_CoPrd (_1,snd _2,_3) )
# 4449 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv842)) : 'freshtv844)
    | _ ->
        _menhir_fail ()

and _menhir_run344 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv833 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 4467 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv829 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4478 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState346
            | L_OPN ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState346
            | L_PRN ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState346
            | L_RCD ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState346
            | N ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState346
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState346 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState346 _v
            | ROT _v ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState346 _v
            | SGN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState346
            | TYP_STG ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState346
            | VAL _v ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState346 _v
            | Z ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState346
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState346) : 'freshtv830)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv831 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4518 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv832)) : 'freshtv834)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv835 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv836)

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState326 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv823 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4539 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run325 _menhir_env (Obj.magic _menhir_stack) MenhirState357 _v
        | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv821 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 4551 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 18 "imp_parser.mly"
       (int)
# 4556 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 178 "imp_parser.mly"
                         ( [_3] )
# 4562 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState357) : 'freshtv824)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv827 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv825 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 111 "imp_parser.mly"
                     ( Flow _2 )
# 4579 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)) : 'freshtv828)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv815 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4593 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4597 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv813 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4605 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4609 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 4616 "imp_parser.ml"
        ))), _, (_4 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4620 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 199 "imp_parser.mly"
                             ( (_4,_2)::_5 )
# 4627 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)) : 'freshtv816)
    | MenhirState336 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv819 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4635 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv817 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4643 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 4650 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 185 "imp_parser.mly"
                         ( Def_Prd (_1,snd _2,_3) )
# 4655 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)) : 'freshtv820)
    | _ ->
        _menhir_fail ()

and _menhir_run337 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv809 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 4673 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv805 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4684 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | L_OPN ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | L_PRN ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | L_RCD ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | N ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState339 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState339 _v
            | ROT _v ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState339 _v
            | SGN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | TYP_STG ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | VAL _v ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState339 _v
            | Z ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState339) : 'freshtv806)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv807 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 4724 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv808)) : 'freshtv810)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv811 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv812)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv803 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4743 "imp_parser.ml"
    )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | ARR ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EOP ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EOP_EXN ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | MTC ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | OUT_IR ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | ROT _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv804)

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv801 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | ROT _v ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv799 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState119 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv797 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_typs)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4809 "imp_parser.ml"
        ) = 
# 210 "imp_parser.mly"
                     ( Rcd(rcd_cl _2) )
# 4813 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)) : 'freshtv800)
    | SGN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | TYP_STG ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | VAL _v ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | Z ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119) : 'freshtv802)

and _menhir_reduce201 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typ_top_lb = 
# 202 "imp_parser.mly"
    ( U_Lb )
# 4834 "imp_parser.ml"
     in
    _menhir_goto_typ_top_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run99 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 4841 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv793 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4853 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | L_OPN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | L_PRN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | L_RCD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | N ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | ROT _v ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | SGN ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TYP_STG ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | VAL _v ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | Z ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv794)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv795 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 4893 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv796)

and _menhir_run106 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4901 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | ROT _v ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | SGN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | TYP_STG ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | VAL _v ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | Z ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106

and _menhir_run109 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 4940 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | ROT _v ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | SGN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | TYP_STG ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | VAL _v ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | Z ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv787 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv781 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 471 "imp_parser.mly"
                         ( _2 )
# 4998 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv782)) : 'freshtv784)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv786)) : 'freshtv788)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv791 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv789 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 475 "imp_parser.mly"
                 ( App(Atm (Name (EndN "cns")),Rcd [|_1;_2|]) )
# 5017 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv790)) : 'freshtv792)
    | _ ->
        _menhir_fail ()

and _menhir_run202 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv779) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 363 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 5033 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)

and _menhir_run203 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 5040 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv777) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 5050 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 5054 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 359 "imp_parser.mly"
        (
      let v = newvar () in rm := (_1,v)::!rm; v )
# 5060 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv778)

and _menhir_run204 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 5067 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv775) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 5077 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 5081 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 357 "imp_parser.mly"
        (
     let v = newvar () in rm := (_1,v)::!rm; v )
# 5087 "imp_parser.ml"
     in
    _menhir_goto_reg_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv776)

and _menhir_run205 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv773 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState205 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run207 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
        | OP | R_RCD ->
            _menhir_reduce161 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206) : 'freshtv774)
    | L_RCD ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState205
    | NAM _v ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
    | REG _v ->
        _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
    | WC ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState205
    | OP | R_RCD ->
        _menhir_reduce163 _menhir_env (Obj.magic _menhir_stack) MenhirState205
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv765 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 18 "imp_parser.mly"
       (int)
# 5140 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv763 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 18 "imp_parser.mly"
       (int)
# 5148 "imp_parser.ml"
        )) : (
# 18 "imp_parser.mly"
       (int)
# 5152 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 463 "imp_parser.mly"
                ( Prj(_1,Rcd_Ptn.Idx(_3,Rcd_Ptn.End)) )
# 5159 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv764)) : 'freshtv766)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv769 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 5168 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv767 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 17 "imp_parser.mly"
       (string)
# 5176 "imp_parser.ml"
        )) : (
# 17 "imp_parser.mly"
       (string)
# 5180 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 464 "imp_parser.mly"
                ( Prj(_1,Rcd_Ptn.Lb(_3,Rcd_Ptn.End)) )
# 5187 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv768)) : 'freshtv770)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv771 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv772)

and _menhir_run33 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | L_LST ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_OPN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_PRN ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | R2 _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | R64 _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | ROT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | STG _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv761 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv757 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv755 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 37 "imp_parser.mly"
      (Lang.Ast.line)
# 5253 "imp_parser.ml"
        ) = 
# 43 "imp_parser.mly"
  (
    Line _1  )
# 5258 "imp_parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv756)) : 'freshtv758)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv759 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv760)) : 'freshtv762)

and _menhir_run3 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp_lst_lb -> (
# 17 "imp_parser.mly"
       (string)
# 5272 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv747 * _menhir_state * 'tv_exp_lst_lb) * (
# 17 "imp_parser.mly"
       (string)
# 5284 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | L_LST ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_OPN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_PRN ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_RCD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | R2 _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | R64 _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | ROT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | STG _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | VAL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv748)
    | RM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv751 * _menhir_state * 'tv_exp_lst_lb) * (
# 17 "imp_parser.mly"
       (string)
# 5324 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv749 * _menhir_state * 'tv_exp_lst_lb) * (
# 17 "imp_parser.mly"
       (string)
# 5331 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst_lb)), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 5336 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_exp_lst_lb = 
# 449 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 5342 "imp_parser.ml"
         in
        _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv750)) : 'freshtv752)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv753 * _menhir_state * 'tv_exp_lst_lb) * (
# 17 "imp_parser.mly"
       (string)
# 5352 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv754)

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv733 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv731 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), (_2 : 'tv_nls)), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 97 "imp_parser.mly"
                            ( _1::_3 )
# 5370 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)) : 'freshtv734)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv745 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 5378 "imp_parser.ml"
        )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv737) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv735) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 66 "imp_parser.mly"
            ()
# 5393 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv736)) : 'freshtv738)
        | MDL_EOP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv741) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv739) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_mdl_end = 
# 67 "imp_parser.mly"
            ()
# 5406 "imp_parser.ml"
             in
            _menhir_goto_mdl_end _menhir_env _menhir_stack _v) : 'freshtv740)) : 'freshtv742)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv743 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 5416 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv744)) : 'freshtv746)
    | _ ->
        _menhir_fail ()

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 5426 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv727 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 5438 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv725) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState65 in
            let (_v : (
# 17 "imp_parser.mly"
       (string)
# 5450 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | NAM _v ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | REG _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | WC ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv726)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv728)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv729 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 5479 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv730)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv723) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 5494 "imp_parser.ml"
    ) = 
# 218 "imp_parser.mly"
      ( zn (Lang.Types.Axm.z_u) )
# 5498 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv724)

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 5505 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv721) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 5515 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 5519 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 5524 "imp_parser.ml"
    ) = 
# 216 "imp_parser.mly"
        ( Var(ref(N_Ln (EndN _1,Axm Lang.Types.Axm.v))) )
# 5528 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv722)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv719) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 5542 "imp_parser.ml"
    ) = 
# 223 "imp_parser.mly"
            ( Axm Lang.Types.Axm.stg )
# 5546 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv720)

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv717) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 5560 "imp_parser.ml"
    ) = 
# 222 "imp_parser.mly"
        ( Axm Lang.Types.Axm.sgn_p )
# 5564 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv718)

and _menhir_run93 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 5571 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv715) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 226 "imp_parser.mly"
    ( 0 )
# 5581 "imp_parser.ml"
     in
    _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv716)

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv713) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 5595 "imp_parser.ml"
    ) = 
# 219 "imp_parser.mly"
      ( Axm Lang.Types.Axm.nat )
# 5599 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv714)

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv707 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
        | R_RCD ->
            _menhir_reduce201 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv708)
    | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | PRM _ | ROT _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv709) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typs = 
# 205 "imp_parser.mly"
    ( [] )
# 5629 "imp_parser.ml"
         in
        _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv710)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv711 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv712)

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | ROT _v ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | SGN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | TYP_STG ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | VAL _v ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | Z ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101

and _menhir_run102 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | ROT _v ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | SGN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | TYP_STG ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | VAL _v ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | Z ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102

and _menhir_run103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | ROT _v ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | SGN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | TYP_STG ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | VAL _v ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | Z ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 5748 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127

and _menhir_run135 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState135
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139

and _menhir_run177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177

and _menhir_run179 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState179
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState179
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179

and _menhir_run181 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | L_LST ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState181
    | L_OPN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState181
    | L_PRN ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState181
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState181
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | R2 _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | R64 _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | ROT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | S8_E ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv705 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState181 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState182 _v
        | REG _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState182 _v
        | WC ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState182
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState182) : 'freshtv706)
    | STG _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState181

and _menhir_run229 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState229 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState229
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState229

and _menhir_run277 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 5915 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv701 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 5927 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv697 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 5937 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 17 "imp_parser.mly"
       (string)
# 5942 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run281 _menhir_env (Obj.magic _menhir_stack) MenhirState279
            | ORD_LEX_COPRD ->
                _menhir_run280 _menhir_env (Obj.magic _menhir_stack) MenhirState279
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState279) : 'freshtv698)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv699 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 5963 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv700)) : 'freshtv702)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv703 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 5974 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv704)

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv695) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv693) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 105 "imp_parser.mly"
            ( _1 )
# 5992 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv694)) : 'freshtv696)

and _menhir_run325 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 5999 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv689 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 6011 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run351 _menhir_env (Obj.magic _menhir_stack) MenhirState326
        | NAM _v ->
            _menhir_run327 _menhir_env (Obj.magic _menhir_stack) MenhirState326 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState326) : 'freshtv690)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv691 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 6031 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv692)

and _menhir_run327 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 6039 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv683) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run332 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | VAL _v ->
            _menhir_run329 _menhir_env (Obj.magic _menhir_stack) MenhirState328 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState328) : 'freshtv684)
    | COPRD | DTA | DTA_GRM | EQ | LCE | MDL | MDL_END | MDL_EOP | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv685) = Obj.magic _menhir_stack in
        ((let _v : 'tv_def_arg = 
# 78 "imp_parser.mly"
    ( ([],[]) )
# 6066 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv686)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv687 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 6076 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv688)

and _menhir_run351 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv679 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 6093 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv675 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 6104 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run354 _menhir_env (Obj.magic _menhir_stack) MenhirState353 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState353) : 'freshtv676)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv677 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 6122 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv678)) : 'freshtv680)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv681 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv682)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv661 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv657 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv655 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 163 "imp_parser.mly"
                         ( Grm.Opn _2 )
# 6161 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv656)) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv659 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv660)) : 'freshtv662)
    | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv669 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv665 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv663 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 162 "imp_parser.mly"
                         ( Grm.Lst _2 )
# 6189 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv664)) : 'freshtv666)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv667 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv668)) : 'freshtv670)
    | MenhirState316 | MenhirState311 | MenhirState282 | MenhirState285 | MenhirState296 | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv673 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv671 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 161 "imp_parser.mly"
             ( Grm.Atm _1 )
# 6208 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv672)) : 'freshtv674)
    | _ ->
        _menhir_fail ()

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv653) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv651) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 104 "imp_parser.mly"
            ( _1 )
# 6227 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv652)) : 'freshtv654)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv649) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg = 
# 386 "imp_parser.mly"
       ( let v = newvar () in rm := ("_",v)::!rm; v)
# 6241 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv650)

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 6248 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv647) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 6258 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 6262 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg = 
# 389 "imp_parser.mly"
        ( let v = newvar () in rm := (_1,v)::!rm; v )
# 6267 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv648)

and _menhir_run69 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 6274 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv645) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 6284 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 6288 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg = 
# 387 "imp_parser.mly"
        (
     let v = newvar () in rm := (_1,v)::!rm; v )
# 6294 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv646)

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv643 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState70 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | OP | R_RCD ->
            _menhir_reduce159 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv644)
    | L_RCD ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | NAM _v ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | REG _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | WC ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OP | R_RCD ->
        _menhir_reduce157 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_reduce179 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_s8_ptn = 
# 279 "imp_parser.mly"
    ( [] )
# 6340 "imp_parser.ml"
     in
    _menhir_goto_s8_ptn _menhir_env _menhir_stack _menhir_s _v

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 6347 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
    | STG _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
    | S8_P ->
        _menhir_reduce179 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 6372 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | STG _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | S8_P ->
        _menhir_reduce179 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185

and _menhir_goto_ir_ptn_cst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_cst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv641 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 6401 "imp_parser.ml"
    ))) * _menhir_state * 'tv_ir_ptn_cst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState173
    | SRC ->
        _menhir_reduce117 _menhir_env (Obj.magic _menhir_stack) MenhirState173
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173) : 'freshtv642)

and _menhir_run142 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv639) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ir_ptn_atm = 
# 324 "imp_parser.mly"
       (
    let v = newvar () in Types.rm := ("_",v)::!Types.rm; v)
# 6426 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_atm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv640)

and _menhir_run143 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 6433 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv637) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 6443 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 6447 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_ir_ptn_atm = 
# 326 "imp_parser.mly"
        (
        let v = newvar () in
        Types.rm := (_1,v)::!Types.rm;
        v  )
# 6455 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_atm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)

and _menhir_run144 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv635 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState144 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run146 _menhir_env (Obj.magic _menhir_stack) MenhirState145 _v
        | OP | R_RCD ->
            _menhir_reduce122 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145) : 'freshtv636)
    | L_RCD ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState144
    | VAL _v ->
        _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
    | WC ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState144
    | OP | R_RCD ->
        _menhir_reduce120 _menhir_env (Obj.magic _menhir_stack) MenhirState144
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6497 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv573 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6507 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv571 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6521 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState104 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv569 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6529 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6535 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6542 "imp_parser.ml"
            ) = 
# 215 "imp_parser.mly"
                    ( lst _2 )
# 6546 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv574)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv577 * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6558 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6562 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | APP | COPRD | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv575 * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6574 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6578 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6583 "imp_parser.ml"
            ))), _), _, (_3 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6587 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6593 "imp_parser.ml"
            ) = 
# 221 "imp_parser.mly"
                 ( Imp(_1,_3) )
# 6597 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107) : 'freshtv578)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv581 * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6609 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6613 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | APP | COPRD | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | PRD | PRM _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | SRC | SRC_OUT | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv579 * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6625 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6629 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6634 "imp_parser.ml"
            ))), _), _, (_3 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6638 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6644 "imp_parser.ml"
            ) = 
# 212 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 6648 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv580)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv582)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6660 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv585 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6674 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState111 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv583 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6682 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6688 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6695 "imp_parser.ml"
            ) = 
# 214 "imp_parser.mly"
                    ( opn _2 )
# 6699 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)) : 'freshtv586)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv588)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv593 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6711 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv591 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6725 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState113 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6733 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6739 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6746 "imp_parser.ml"
            ) = 
# 209 "imp_parser.mly"
                    ( _2 )
# 6750 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv590)) : 'freshtv592)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv594)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv595 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 6762 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6766 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | NAM _v ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | R_RCD ->
            _menhir_reduce201 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv596)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv599 * 'tv_typs) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6788 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState121
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState121
        | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | PRM _ | ROT _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv597 * 'tv_typs) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6802 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : 'tv_typs)), _, (_2 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6807 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 206 "imp_parser.mly"
             ( _1@[_2] )
# 6812 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _v) : 'freshtv598)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv600)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv603) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6824 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv601) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6838 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState122 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | L_OPN ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | L_PRN ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | L_RCD ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | N ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
            | ROT _v ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
            | SGN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | TYP_STG ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | VAL _v ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
            | Z ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv602)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv604)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv609) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6882 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6886 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv607) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6900 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6904 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState124 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv605) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6912 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6916 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _, (_2 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6922 "imp_parser.ml"
            ))), _), _, (_4 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6926 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 434 "imp_parser.mly"
                        ( (_2,_4) )
# 6934 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv606)) : 'freshtv608)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv610)
    | MenhirState263 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv617 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 6946 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6950 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv611 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 6964 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 6968 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState264 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState266
            | L_OPN ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState266
            | L_PRN ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState266
            | L_RCD ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState266
            | N ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState266
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState266 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState266 _v
            | ROT _v ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState266 _v
            | SGN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState266
            | TYP_STG ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState266
            | VAL _v ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState266 _v
            | Z ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState266
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266) : 'freshtv612)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv615 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7008 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7012 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState264 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv613 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7020 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7024 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 7030 "imp_parser.ml"
            ))), _), _, (_4 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7034 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 236 "imp_parser.mly"
                            ( Ast.Etr_Out_Abs(_2,_4) )
# 7042 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv614)) : 'freshtv616)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState264) : 'freshtv618)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv621 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7054 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7058 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7062 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState267
        | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv619 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7076 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7080 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7084 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 7089 "imp_parser.ml"
            ))), _), _, (_4 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7093 "imp_parser.ml"
            ))), _), _, (_6 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7097 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 234 "imp_parser.mly"
                            (
    Ast.Etr_Abs(_2,_4,_6) )
# 7106 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState267) : 'freshtv622)
    | MenhirState339 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv625 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7118 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7122 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | PRD ->
            _menhir_run337 _menhir_env (Obj.magic _menhir_stack) MenhirState340
        | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv623 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7138 "imp_parser.ml"
            ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7142 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 7147 "imp_parser.ml"
            ))), _, (_4 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7151 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_prd = 
# 198 "imp_parser.mly"
                     ( [(_4,_2)] )
# 7158 "imp_parser.ml"
             in
            _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv624)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState340) : 'freshtv626)
    | MenhirState342 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv629 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7170 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7174 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState343
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState343
        | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv627 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7188 "imp_parser.ml"
            )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7192 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 7197 "imp_parser.ml"
            ))), (_2 : 'tv_def_arg)), _), _, (_4 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7201 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 187 "imp_parser.mly"
                        ( Def_EqT (_1,snd _2,_4) )
# 7207 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv628)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState343) : 'freshtv630)
    | MenhirState346 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv633 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7219 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7223 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState347
        | COPRD ->
            _menhir_run344 _menhir_env (Obj.magic _menhir_stack) MenhirState347
        | IMP ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState347
        | DTA | DTA_GRM | LCE | MDL | MDL_END | MDL_EOP | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv631 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7239 "imp_parser.ml"
            ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7243 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 7248 "imp_parser.ml"
            ))), _, (_4 : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 7252 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 194 "imp_parser.mly"
                      ( [(_4,_2)] )
# 7259 "imp_parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv632)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState347) : 'freshtv634)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv563 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | L_LST ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | L_OPN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | L_PRN ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | L_RCD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv557 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState42 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDX _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | L_LST ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | L_OPN ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | L_PRN ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | L_RCD ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | R2 _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | R64 _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | ROT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | STG _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv558)
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | R2 _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | R64 _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | ROT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv561 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState42 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv559 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 465 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 7353 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)) : 'freshtv562)
        | STG _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | VAL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv564)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | L_LST ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | L_OPN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | L_PRN ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | L_RCD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | R2 _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | R64 _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | ROT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | STG _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | VAL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv565 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 437 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 7403 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv568)
    | _ ->
        _menhir_fail ()

and _menhir_reduce128 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 474 "imp_parser.mly"
    ( App(Atm (Name (EndN "nil")),Rcd [||]) )
# 7418 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState29 | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv511 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | IDX _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | L_LST ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | L_OPN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | L_PRN ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | L_RCD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | R2 _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | R64 _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | ROT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | STG _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | VAL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | R_LST ->
            _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv512)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv515 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | APP | EOF | IDX _ | INI_IR | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | PRM _ | R2 _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | STG _ | VAL _ | WC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv513 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 462 "imp_parser.mly"
                ( App(_1,_3) )
# 7484 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv514)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv516)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv521 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv519 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState36 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv517 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 470 "imp_parser.mly"
                    ( App(Atm (Name (EndN "some")),_2) )
# 7515 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)) : 'freshtv520)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv522)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv527 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv525 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState38 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv523 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 459 "imp_parser.mly"
                    ( _2 )
# 7546 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv524)) : 'freshtv526)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv528)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv533 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv531 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState40 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv529 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp_lst_lb)), _, (_5 : 'tv_exp)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 468 "imp_parser.mly"
                                     ( Rcd_Lb (Some _5,Array.of_list _3) )
# 7579 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv530)) : 'freshtv532)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv534)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv539 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv537 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState45 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv535 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)), _), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 466 "imp_parser.mly"
                               ( Rcd (Array.of_list _2) )
# 7611 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv536)) : 'freshtv538)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv540)
    | MenhirState58 | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EOF | IDX _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | PRM _ | R2 _ | R64 _ | ROT _ | R_RCD | STG _ | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv541 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 444 "imp_parser.mly"
                 ( _1@[_2] )
# 7635 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv542)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv544)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv547 * _menhir_state * 'tv_exp_lst_lb) * (
# 17 "imp_parser.mly"
       (string)
# 7647 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | EOF | NAM _ | OP | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv545 * _menhir_state * 'tv_exp_lst_lb) * (
# 17 "imp_parser.mly"
       (string)
# 7661 "imp_parser.ml"
            ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst_lb)), (_2 : (
# 17 "imp_parser.mly"
       (string)
# 7666 "imp_parser.ml"
            ))), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_exp_lst_lb = 
# 448 "imp_parser.mly"
                           ( _1@[(_2,Some _4)] )
# 7672 "imp_parser.ml"
             in
            _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv546)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv548)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv551 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv549 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 440 "imp_parser.mly"
            ( _2 )
# 7697 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv550)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50) : 'freshtv552)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv555 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv553 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState201 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | NAM _v ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
            | REG _v ->
                _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
            | WC ->
                _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState222
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222) : 'freshtv554)
        | L_RCD ->
            _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | NAM _v ->
            _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v
        | PRJ ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | REG _v ->
            _menhir_run203 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v
        | WC ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201) : 'freshtv556)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv493 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv489 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 438 "imp_parser.mly"
                  ( Rcd_Lb(None,Array.of_list _2) )
# 7769 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv490)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv491 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv492)) : 'freshtv494)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv503 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv495 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | IDX _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | L_LST ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | L_OPN ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | L_PRN ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | L_RCD ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | R2 _v ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | R64 _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | ROT _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | STG _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv496)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv499 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv497 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 467 "imp_parser.mly"
                              ( Rcd_Lb (None,Array.of_list _3) )
# 7836 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv498)) : 'freshtv500)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv501 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv502)) : 'freshtv504)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv509 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv505 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 439 "imp_parser.mly"
                      ( Rcd_Lb(Some Rot,Array.of_list _3) )
# 7863 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv507 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv508)) : 'freshtv510)
    | _ ->
        _menhir_fail ()

and _menhir_reduce60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 96 "imp_parser.mly"
      ( [] )
# 7881 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv471 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState63 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv467 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 17 "imp_parser.mly"
       (string)
# 7905 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DOT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv463 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7916 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | WC ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv459 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7926 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv457 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7933 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), (_3 : (
# 17 "imp_parser.mly"
       (string)
# 7938 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _4 = () in
                    let _2 = () in
                    let _1 = () in
                    let _v : 'tv_glb_etr = 
# 230 "imp_parser.mly"
                       ( Mdl_Ln(false,_3) )
# 7947 "imp_parser.ml"
                     in
                    _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv458)) : 'freshtv460)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv461 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7957 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv462)) : 'freshtv464)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv465 * _menhir_state) * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 7968 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv466)) : 'freshtv468)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)) : 'freshtv472)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv487 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState63 in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 7986 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR_REV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv473 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 7997 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState258 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState268
            | ARR ->
                _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState268
            | EOP ->
                _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState268
            | EOP_EXN ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState268
            | MTC ->
                _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState268
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState268 _v
            | OUT_IR ->
                _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState268
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState268 _v
            | ROT _v ->
                _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState268 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState268) : 'freshtv474)
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv475 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8031 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState258 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState263
            | L_OPN ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState263
            | L_PRN ->
                _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState263
            | L_RCD ->
                _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState263
            | N ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState263
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState263 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState263 _v
            | ROT _v ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState263 _v
            | SGN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState263
            | TYP_STG ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState263
            | VAL _v ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState263 _v
            | Z ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState263
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState263) : 'freshtv476)
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv483 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8071 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState258 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | WC ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv479 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8083 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv477 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8090 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 8095 "imp_parser.ml"
                ))), _) = _menhir_stack in
                let _4 = () in
                let _3 = () in
                let _1 = () in
                let _v : 'tv_glb_etr = 
# 231 "imp_parser.mly"
                   ( Mdl_Ln(true,_2) )
# 8103 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)) : 'freshtv480)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv481 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8113 "imp_parser.ml"
                )) * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv482)) : 'freshtv484)
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv485 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8122 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState258 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState259 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState259 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState259) : 'freshtv486)
        | L_RCD ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | NAM _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
        | REG _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
        | WC ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState258) : 'freshtv488)
    | SLF _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run276 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv455 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState276 in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 8169 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv453 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 17 "imp_parser.mly"
       (string)
# 8178 "imp_parser.ml"
        )) : (
# 17 "imp_parser.mly"
       (string)
# 8182 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 113 "imp_parser.mly"
                ( Grm_Abs _2 )
# 8189 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)) : 'freshtv456)
    | SLF _v ->
        _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState276 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState276

and _menhir_run324 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run351 _menhir_env (Obj.magic _menhir_stack) MenhirState324
    | NAM _v ->
        _menhir_run327 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
    | SLF _v ->
        _menhir_run325 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState324

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8219 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv447) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8230 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv445) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8238 "imp_parser.ml"
        )) : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8242 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv446)) : 'freshtv448)
    | MenhirState380 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8252 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv449 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8260 "imp_parser.ml"
        )) : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8264 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8270 "imp_parser.ml"
        ) = 
# 58 "imp_parser.mly"
                 (
    let (o,ms) = _2 in
    (o,_1::ms) )
# 8276 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv450)) : 'freshtv452)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv393 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8291 "imp_parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv391 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8297 "imp_parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 8302 "imp_parser.ml"
        ))), _, (_3 : 'tv_name)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_name = 
# 53 "imp_parser.mly"
                 ( DotN(_1,_3) )
# 8308 "imp_parser.ml"
         in
        _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)) : 'freshtv394)
    | MenhirState181 | MenhirState58 | MenhirState49 | MenhirState5 | MenhirState42 | MenhirState44 | MenhirState19 | MenhirState20 | MenhirState21 | MenhirState29 | MenhirState33 | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv397 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv395 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
        let _v : 'tv_exp = 
# 457 "imp_parser.mly"
          ( Atm (Name _1) )
# 8320 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)) : 'freshtv398)
    | MenhirState346 | MenhirState342 | MenhirState339 | MenhirState263 | MenhirState266 | MenhirState88 | MenhirState123 | MenhirState119 | MenhirState100 | MenhirState101 | MenhirState102 | MenhirState103 | MenhirState109 | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv401 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
        let _v : (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 8332 "imp_parser.ml"
        ) = 
# 217 "imp_parser.mly"
         ( Var(ref(N _1)) )
# 8336 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv400)) : 'freshtv402)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv409 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8344 "imp_parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv403 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8354 "imp_parser.ml"
            ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState170
            | VAL _v ->
                _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
            | WC ->
                _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState170
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv404)
        | CMM | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv405 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
            let _v : 'tv_ir_ptn_cst = 
# 321 "imp_parser.mly"
         ( Mtc.P_N _1 )
# 8376 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv406)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv407 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 8386 "imp_parser.ml"
            ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv408)) : 'freshtv410)
    | MenhirState183 | MenhirState184 | MenhirState187 | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv411 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _v
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _v
        | STG _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _v
        | S8_P ->
            _menhir_reduce179 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187) : 'freshtv412)
    | MenhirState305 | MenhirState268 | MenhirState126 | MenhirState248 | MenhirState243 | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv413 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState235
        | NAM _v ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState235 _v
        | REG _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState235 _v
        | WC ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState235
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState235) : 'freshtv414)
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv417 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8433 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv415 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8439 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 17 "imp_parser.mly"
       (string)
# 8444 "imp_parser.ml"
        ))), _), _, (_4 : 'tv_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 237 "imp_parser.mly"
                    ( Ast.Etr_Eq(_2,_4) )
# 8451 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv416)) : 'freshtv418)
    | MenhirState316 | MenhirState311 | MenhirState282 | MenhirState298 | MenhirState296 | MenhirState285 | MenhirState290 | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv421 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv419 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
        let _v : 'tv_grm_atom = 
# 167 "imp_parser.mly"
         ( Grm.Name _1 )
# 8463 "imp_parser.ml"
         in
        _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)) : 'freshtv422)
    | MenhirState375 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv429 * _menhir_state))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv425 * _menhir_state))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv423 * _menhir_state))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_4 : 'tv_name)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 8485 "imp_parser.ml"
            ) = 
# 57 "imp_parser.mly"
                       ( (Some _4,[]) )
# 8489 "imp_parser.ml"
             in
            _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv424)) : 'freshtv426)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv427 * _menhir_state))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv428)) : 'freshtv430)
    | MenhirState382 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv443 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv439 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv437 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 35 "imp_parser.mly"
      (Lang.name)
# 8515 "imp_parser.ml"
            ) = 
# 48 "imp_parser.mly"
             ( _1 )
# 8519 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv435) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 35 "imp_parser.mly"
      (Lang.name)
# 8527 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv433) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 35 "imp_parser.mly"
      (Lang.name)
# 8535 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 35 "imp_parser.mly"
      (Lang.name)
# 8543 "imp_parser.ml"
            )) : (
# 35 "imp_parser.mly"
      (Lang.name)
# 8547 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv432)) : 'freshtv434)) : 'freshtv436)) : 'freshtv438)) : 'freshtv440)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv441 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv442)) : 'freshtv444)
    | _ ->
        _menhir_fail ()

and _menhir_reduce139 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8563 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (string)
# 8569 "imp_parser.ml"
    ))) = _menhir_stack in
    let _v : 'tv_name = 
# 51 "imp_parser.mly"
        ( (EndN _1) )
# 8574 "imp_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 8581 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_reduce48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 443 "imp_parser.mly"
    ( [] )
# 8601 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 8608 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv389) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 8618 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 8622 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 454 "imp_parser.mly"
        ( Prj(Rot,Rcd_Ptn.Lb(_1,Rcd_Ptn.End)) )
# 8627 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 8634 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv387) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 8644 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 8648 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 458 "imp_parser.mly"
        ( Atm (Stg _1) )
# 8653 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 8660 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv385) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (int)
# 8670 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (int)
# 8674 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 452 "imp_parser.mly"
        ( Rot )
# 8679 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (int64)
# 8686 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv383) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 19 "imp_parser.mly"
       (int64)
# 8696 "imp_parser.ml"
    )) : (
# 19 "imp_parser.mly"
       (int64)
# 8700 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 460 "imp_parser.mly"
        ( Atm(R64 _1) )
# 8705 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "imp_parser.mly"
       (bool)
# 8712 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv381) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "imp_parser.mly"
       (bool)
# 8722 "imp_parser.ml"
    )) : (
# 20 "imp_parser.mly"
       (bool)
# 8726 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 461 "imp_parser.mly"
       ( Atm(R2 _1) )
# 8731 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv382)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState15 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState16) : 'freshtv380)
    | IDX _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | PRM _ | R2 _ | R64 _ | ROT _ | R_RCD | STG _ | VAL _ ->
        _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | L_LST ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | L_OPN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | L_PRN ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | R2 _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | R64 _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | ROT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | STG _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | L_LST ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_OPN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_PRN ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | R2 _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | R64 _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | ROT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | R_OPN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState21 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 469 "imp_parser.mly"
                ( App(Atm(Name (EndN "none")),Rcd [||]) )
# 8834 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)) : 'freshtv378)
    | STG _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDX _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | L_LST ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_OPN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_PRN ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | R2 _v ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | R64 _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | ROT _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | STG _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | R_LST ->
        _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 8888 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv373) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (int)
# 8898 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (int)
# 8902 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 451 "imp_parser.mly"
        ( Atm(Z _1) )
# 8907 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int)
# 8914 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (int)
# 8924 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (int)
# 8928 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 453 "imp_parser.mly"
        ( Prj(Rot,Rcd_Ptn.Idx(_1,Rcd_Ptn.End)) )
# 8933 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)

and _menhir_reduce50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst_lb = 
# 447 "imp_parser.mly"
    ( [] )
# 8942 "imp_parser.ml"
     in
    _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 37 "imp_parser.mly"
      (Lang.Ast.line)
# 8949 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv369) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 37 "imp_parser.mly"
      (Lang.Ast.line)
# 8958 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv367) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 37 "imp_parser.mly"
      (Lang.Ast.line)
# 8966 "imp_parser.ml"
    )) : (
# 37 "imp_parser.mly"
      (Lang.Ast.line)
# 8970 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv368)) : 'freshtv370)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv363 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (string)
# 8986 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run324 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | DTA_GRM ->
            _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | LCE ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | MDL ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | MDL_END | MDL_EOP ->
            _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv364)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv366)

and _menhir_run373 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | WC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv359 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv355 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState375 _v
            | PRM _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState375 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState375) : 'freshtv356)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv357 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)) : 'freshtv360)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv361 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv362)

and _menhir_run378 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv353) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 9064 "imp_parser.ml"
    ) = 
# 56 "imp_parser.mly"
        ( (None,[]) )
# 9068 "imp_parser.ml"
     in
    _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState382 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv30)
    | MenhirState380 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState375 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState357 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9099 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState354 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9108 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState353 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9117 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState347 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9126 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9130 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState346 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9139 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState343 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv47 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9148 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9152 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState342 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv49 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9161 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv51 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9170 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9174 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState339 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv53 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9183 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState336 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9192 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState332 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9206 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv62)
    | MenhirState326 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9219 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState317 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv73 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9248 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 9252 "imp_parser.ml"
        )) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState312 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState310 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9271 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 9275 "imp_parser.ml"
        )) * _menhir_state * 'tv_grm_ord_act) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState305 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv84)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState298 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state * 'tv_grm_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState296 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv91 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9308 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState290 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState286 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * 'tv_ord) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9327 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState282 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9341 "imp_parser.ml"
        ))) * (
# 17 "imp_parser.mly"
       (string)
# 9345 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState276 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv105 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9359 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv107 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9368 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9372 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9376 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv109 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9385 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9389 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv111 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9398 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9402 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState263 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv113 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9411 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9420 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state) * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9429 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv119 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9438 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv121 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv123 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv131 * _menhir_state * 'tv_name) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv135 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv137 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState229 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv141 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv143 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv145 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv153 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9532 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9541 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv165 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_src_par_p)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv169 * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv175 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9590 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv177 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9599 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_src_par_p) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv181 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv189 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv191 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9638 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn_cst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv193 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9647 "imp_parser.ml"
        ))) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv195 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9656 "imp_parser.ml"
        ))) * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 9665 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState157 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203 * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv207 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv209 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9699 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9708 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv231 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9762 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv233 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9771 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 9780 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv237 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9789 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv239) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9798 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9802 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv241) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9811 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv243) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9820 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * 'tv_typs) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9829 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * _menhir_state) * 'tv_typs) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv249 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9843 "imp_parser.ml"
        ))) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9847 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv251 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9856 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9865 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv255 * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9874 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9878 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv257 * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9887 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv259 * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9896 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9900 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv261 * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9909 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state) * _menhir_state * (
# 39 "imp_parser.mly"
      (Lang.Types.t)
# 9918 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9942 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv273 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv276)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv279 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv283 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv285 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9980 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv287 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 9989 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv289 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv291 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 10008 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state * (
# 18 "imp_parser.mly"
       (int)
# 10017 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv299 * _menhir_state) * (
# 17 "imp_parser.mly"
       (string)
# 10031 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv302)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv305 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv307 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv311 * _menhir_state * 'tv_exp_lst_lb) * (
# 17 "imp_parser.mly"
       (string)
# 10064 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv313 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv315 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv317 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv319 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv321 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv327 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv329 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv339 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv341 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv343 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 10153 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv346)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv347 * _menhir_state * 'tv_exp_lst_lb) * (
# 17 "imp_parser.mly"
       (string)
# 10162 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv349 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv352)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 10179 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (string)
# 10189 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (string)
# 10193 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_name = 
# 52 "imp_parser.mly"
        ( EndN _1 )
# 10198 "imp_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (string)
# 10205 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
    | APP | CMM | COPRD | DTA | DTA_GRM | EOF | IDX _ | IMP | INI_IR | INT _ | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL | MDL_END | MDL_EOP | N | NAM _ | NL | NOT_SPL | OP | ORD_LEX_COPRD | PRD | PRJ | PRM _ | R2 _ | R64 _ | REG _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | S8_P | SGN | SLF _ | SPL | SRC | SRC_OUT | STG _ | TYP_STG | VAL _ | WC | Z ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * (
# 17 "imp_parser.mly"
       (string)
# 10223 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)

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
# 37 "imp_parser.mly"
      (Lang.Ast.line)
# 10253 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv5 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Ast.line)
# 10281 "imp_parser.ml"
            ) = 
# 45 "imp_parser.mly"
                ( End )
# 10285 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)) : 'freshtv8)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)) : 'freshtv12)
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv13 * _menhir_state) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv14)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDX _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | L_LST ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | L_OPN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | L_PRN ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | L_RCD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | NAM _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | PRM _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | R2 _v ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | R64 _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | ROT _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | STG _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | VAL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv20)
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce50 _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv22)
    | EOF | IDX _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | PRM _ | R2 _ | R64 _ | ROT _ | STG _ | VAL _ ->
        _menhir_reduce48 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv24))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 36 "imp_parser.mly"
      (Lang.name option * Lang.Ast.mdl list)
# 10370 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run378 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | LCE ->
        _menhir_run373 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | MDL ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv4))

and name_eof : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 35 "imp_parser.mly"
      (Lang.name)
# 10393 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState382 _v
    | PRM _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState382 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState382) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 10414 "imp_parser.ml"
