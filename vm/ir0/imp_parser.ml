
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | WC
    | VCT_INI
    | VCT
    | VAL of (
# 16 "imp_parser.mly"
       (string)
# 15 "imp_parser.ml"
  )
    | TYP_VCT
    | TYP_STG
    | TYP_SGN
    | TYP_OPN_VCT
    | STG of (
# 16 "imp_parser.mly"
       (string)
# 24 "imp_parser.ml"
  )
    | SRC_OUT
    | SRC_IL
    | SRC
    | SPL
    | SLH
    | SLF of (
# 17 "imp_parser.mly"
       (int)
# 34 "imp_parser.ml"
  )
    | SGN
    | SEQ
    | R_RCD
    | R_PRN
    | R_OPN
    | R_LST
    | R_BLK
    | ROT of (
# 17 "imp_parser.mly"
       (int)
# 46 "imp_parser.ml"
  )
    | RM
    | R64 of (
# 18 "imp_parser.mly"
       (int64)
# 52 "imp_parser.ml"
  )
    | R2 of (
# 19 "imp_parser.mly"
       (bool)
# 57 "imp_parser.ml"
  )
    | PRJ_IR
    | PRJ
    | PRD_END
    | PRD
    | PLS_NAT
    | PLS
    | OUT_IR
    | OUT of (
# 17 "imp_parser.mly"
       (int)
# 69 "imp_parser.ml"
  )
    | ORD_LEX_COPRD
    | ORD_COPRD
    | OP
    | NOT_SPL
    | NOT
    | NL
    | NAT of (
# 17 "imp_parser.mly"
       (int)
# 80 "imp_parser.ml"
  )
    | NAM of (
# 16 "imp_parser.mly"
       (string)
# 85 "imp_parser.ml"
  )
    | N
    | MTC_IR
    | MTC
    | MNS_NAT
    | MNS
    | MLT_NAT
    | MLT
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
    | LCE
    | LB
    | ISO
    | IO
    | INT of (
# 17 "imp_parser.mly"
       (int)
# 113 "imp_parser.ml"
  )
    | INJ of (
# 17 "imp_parser.mly"
       (int)
# 118 "imp_parser.ml"
  )
    | INI_IR
    | IN of (
# 17 "imp_parser.mly"
       (int)
# 124 "imp_parser.ml"
  )
    | IDX of (
# 17 "imp_parser.mly"
       (int)
# 129 "imp_parser.ml"
  )
    | GRM
    | FOR_ALL
    | FNT
    | EXP
    | EXN
    | EQ
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
# 17 "imp_parser.mly"
       (int)
# 157 "imp_parser.ml"
  )
    | ARR_REV_IN
    | ARR_REV
    | ARR_END
    | ARR
    | APP
    | AGL_TOP
    | AGL_OP of (
# 17 "imp_parser.mly"
       (int)
# 168 "imp_parser.ml"
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
  | MenhirState350
  | MenhirState340
  | MenhirState335
  | MenhirState332
  | MenhirState331
  | MenhirState325
  | MenhirState324
  | MenhirState321
  | MenhirState320
  | MenhirState318
  | MenhirState315
  | MenhirState314
  | MenhirState310
  | MenhirState308
  | MenhirState306
  | MenhirState304
  | MenhirState302
  | MenhirState299
  | MenhirState297
  | MenhirState292
  | MenhirState291
  | MenhirState288
  | MenhirState285
  | MenhirState279
  | MenhirState278
  | MenhirState275
  | MenhirState271
  | MenhirState268
  | MenhirState267
  | MenhirState266
  | MenhirState265
  | MenhirState264
  | MenhirState262
  | MenhirState255
  | MenhirState254
  | MenhirState252
  | MenhirState251
  | MenhirState246
  | MenhirState244
  | MenhirState242
  | MenhirState241
  | MenhirState240
  | MenhirState239
  | MenhirState237
  | MenhirState235
  | MenhirState233
  | MenhirState231
  | MenhirState228
  | MenhirState226
  | MenhirState222
  | MenhirState220
  | MenhirState218
  | MenhirState216
  | MenhirState214
  | MenhirState213
  | MenhirState210
  | MenhirState209
  | MenhirState208
  | MenhirState206
  | MenhirState205
  | MenhirState202
  | MenhirState199
  | MenhirState198
  | MenhirState190
  | MenhirState188
  | MenhirState186
  | MenhirState182
  | MenhirState180
  | MenhirState178
  | MenhirState176
  | MenhirState174
  | MenhirState173
  | MenhirState170
  | MenhirState169
  | MenhirState168
  | MenhirState166
  | MenhirState162
  | MenhirState159
  | MenhirState158
  | MenhirState155
  | MenhirState154
  | MenhirState153
  | MenhirState152
  | MenhirState150
  | MenhirState149
  | MenhirState147
  | MenhirState146
  | MenhirState145
  | MenhirState142
  | MenhirState141
  | MenhirState140
  | MenhirState139
  | MenhirState135
  | MenhirState133
  | MenhirState131
  | MenhirState130
  | MenhirState129
  | MenhirState128
  | MenhirState127
  | MenhirState126
  | MenhirState125
  | MenhirState123
  | MenhirState122
  | MenhirState121
  | MenhirState120
  | MenhirState119
  | MenhirState117
  | MenhirState116
  | MenhirState106
  | MenhirState103
  | MenhirState101
  | MenhirState97
  | MenhirState95
  | MenhirState92
  | MenhirState91
  | MenhirState89
  | MenhirState88
  | MenhirState85
  | MenhirState84
  | MenhirState82
  | MenhirState81
  | MenhirState79
  | MenhirState77
  | MenhirState71
  | MenhirState69
  | MenhirState68
  | MenhirState67
  | MenhirState66
  | MenhirState64
  | MenhirState63
  | MenhirState61
  | MenhirState59
  | MenhirState57
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState48
  | MenhirState47
  | MenhirState46
  | MenhirState45
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState41
  | MenhirState40
  | MenhirState39
  | MenhirState35
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState26
  | MenhirState24
  | MenhirState23
  | MenhirState22
  | MenhirState21
  | MenhirState18
  | MenhirState17
  | MenhirState5
  | MenhirState1
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Lang
  open Types
  open Ast
  open Util

# 357 "imp_parser.ml"

let rec _menhir_goto_ir_ptn_eq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_eq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1293 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 368 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 372 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv1291 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 378 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 382 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 387 "imp_parser.ml"
        ))), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 391 "imp_parser.ml"
        ))), _, (_6 : 'tv_ir_ptn)), _, (_7 : 'tv_ir_ptn_eq)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_ptn_eq = 
# 249 "imp_parser.mly"
                                        (
        let v = newvar () in
        Types.rm := (_2,v)::!Types.rm;
    (v,Mtc.Eq_Agl_N(_4,_6))::_7
    )
# 403 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1292)) : 'freshtv1294)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1297 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 411 "imp_parser.ml"
        ))) * 'tv_ir_ptn_cst) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1295 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 417 "imp_parser.ml"
        ))) * 'tv_ir_ptn_cst) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 422 "imp_parser.ml"
        ))), (_4 : 'tv_ir_ptn_cst)), _, (_5 : 'tv_ir_ptn_eq)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_ptn_eq = 
# 254 "imp_parser.mly"
                                    (
        let v = newvar () in
        Types.rm := (_2,v)::!Types.rm;
    (v,Mtc.P_Cst _4)::_5 )
# 432 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1296)) : 'freshtv1298)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1303 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MTC_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1299 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | APP ->
                _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | ARR ->
                _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | EOP ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | MTC ->
                _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | NAM _v ->
                _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
            | OUT_IR ->
                _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | ROT _v ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv1300)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1301 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1302)) : 'freshtv1304)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1309 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MTC_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1305 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState254
            | APP ->
                _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState254
            | ARR ->
                _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState254
            | EOP ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState254
            | MTC ->
                _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState254
            | NAM _v ->
                _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState254 _v
            | OUT_IR ->
                _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState254
            | ROT _v ->
                _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState254 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState254) : 'freshtv1306)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1307 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1308)) : 'freshtv1310)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_cst : _menhir_env -> 'ttv_tail -> 'tv_ir_ptn_cst -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1289 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 523 "imp_parser.ml"
    ))) * 'tv_ir_ptn_cst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState202
    | MTC_IR ->
        _menhir_reduce119 _menhir_env (Obj.magic _menhir_stack) MenhirState202
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202) : 'freshtv1290)

and _menhir_reduce119 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_ir_ptn_eq = 
# 248 "imp_parser.mly"
    ( [] )
# 542 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_eq _menhir_env _menhir_stack _menhir_s _v

and _menhir_run191 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1285 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 558 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1281 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 569 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | INT _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1257) = Obj.magic _menhir_stack in
                let (_v : (
# 17 "imp_parser.mly"
       (int)
# 580 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1255) = Obj.magic _menhir_stack in
                let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 588 "imp_parser.ml"
                )) : (
# 17 "imp_parser.mly"
       (int)
# 592 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_ir_ptn_cst = 
# 261 "imp_parser.mly"
        ( Mtc.P_Z _1 )
# 597 "imp_parser.ml"
                 in
                _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _v) : 'freshtv1256)) : 'freshtv1258)
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1265 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 605 "imp_parser.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "imp_parser.mly"
       (string)
# 610 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | APP ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv1259 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 621 "imp_parser.ml"
                    ))) * (
# 16 "imp_parser.mly"
       (string)
# 625 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | L_RCD ->
                        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState198
                    | VAL _v ->
                        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _v
                    | WC ->
                        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState198
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198) : 'freshtv1260)
                | CMM | MTC_IR ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv1261 * (
# 16 "imp_parser.mly"
       (string)
# 645 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 650 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _v : 'tv_ir_ptn_cst = 
# 264 "imp_parser.mly"
        ( Mtc.P_N _1 )
# 655 "imp_parser.ml"
                     in
                    _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _v) : 'freshtv1262)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv1263 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 665 "imp_parser.ml"
                    ))) * (
# 16 "imp_parser.mly"
       (string)
# 669 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1264)) : 'freshtv1266)
            | R2 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1269) = Obj.magic _menhir_stack in
                let (_v : (
# 19 "imp_parser.mly"
       (bool)
# 679 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1267) = Obj.magic _menhir_stack in
                let ((_1 : (
# 19 "imp_parser.mly"
       (bool)
# 687 "imp_parser.ml"
                )) : (
# 19 "imp_parser.mly"
       (bool)
# 691 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_ir_ptn_cst = 
# 263 "imp_parser.mly"
       ( Mtc.P_R2 _1 )
# 696 "imp_parser.ml"
                 in
                _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _v) : 'freshtv1268)) : 'freshtv1270)
            | R64 _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1273) = Obj.magic _menhir_stack in
                let (_v : (
# 18 "imp_parser.mly"
       (int64)
# 705 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1271) = Obj.magic _menhir_stack in
                let ((_1 : (
# 18 "imp_parser.mly"
       (int64)
# 713 "imp_parser.ml"
                )) : (
# 18 "imp_parser.mly"
       (int64)
# 717 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_ir_ptn_cst = 
# 262 "imp_parser.mly"
        ( Mtc.P_R64 _1 )
# 722 "imp_parser.ml"
                 in
                _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _v) : 'freshtv1272)) : 'freshtv1274)
            | STG _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1277) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "imp_parser.mly"
       (string)
# 731 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1275) = Obj.magic _menhir_stack in
                let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 739 "imp_parser.ml"
                )) : (
# 16 "imp_parser.mly"
       (string)
# 743 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_ir_ptn_cst = 
# 260 "imp_parser.mly"
        ( Mtc.P_Stg _1 )
# 748 "imp_parser.ml"
                 in
                _menhir_goto_ir_ptn_cst _menhir_env _menhir_stack _v) : 'freshtv1276)) : 'freshtv1278)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1279 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 758 "imp_parser.ml"
                ))) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1280)) : 'freshtv1282)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1283 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 769 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1284)) : 'freshtv1286)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1287 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1288)

and _menhir_run181 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1253) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ir_ptn_op = 
# 241 "imp_parser.mly"
          ( None )
# 791 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1254)

and _menhir_run182 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState182 _v
    | WC ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState182
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState182

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1241 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1239 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 99 "imp_parser.mly"
                    ( _1::_2 )
# 826 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1240)) : 'freshtv1242)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1251 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1249 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 843 "imp_parser.ml"
        ) = 
# 95 "imp_parser.mly"
                    ( _2 )
# 847 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1247) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 855 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1245) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 863 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1243) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 871 "imp_parser.ml"
        )) : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 875 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 92 "imp_parser.mly"
            ( Gram _1 )
# 880 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1244)) : 'freshtv1246)) : 'freshtv1248)) : 'freshtv1250)) : 'freshtv1252)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1233 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1231 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_ir_ptn_op) : 'tv_ir_ptn_op) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_ir_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_ir_ptn = 
# 233 "imp_parser.mly"
                                     (
    match _4 with
    | None -> Rcd_Ptn.R_Lb _3
    | Some r -> Rcd_Ptn.Ro_Lb (_3,r) )
# 907 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1232)) : 'freshtv1234)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1237 * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1235 * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_ir_ptn_op) : 'tv_ir_ptn_op) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ptn = 
# 229 "imp_parser.mly"
                               (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some r -> Rcd_Ptn.Ro (_2,r) )
# 927 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1236)) : 'freshtv1238)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1221 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 942 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
        | OP | R_RCD ->
            _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState178
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178) : 'freshtv1222)
    | MenhirState188 | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1223 * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState188
        | VAL _v ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _v
        | WC ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState188
        | OP | R_RCD ->
            _menhir_reduce122 _menhir_env (Obj.magic _menhir_stack) MenhirState188
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188) : 'freshtv1224)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1225 * _menhir_state) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState190
        | MTC_IR ->
            _menhir_reduce119 _menhir_env (Obj.magic _menhir_stack) MenhirState190
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190) : 'freshtv1226)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1227 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 992 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 996 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | MTC_IR ->
            _menhir_reduce119 _menhir_env (Obj.magic _menhir_stack) MenhirState199
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199) : 'freshtv1228)
    | MenhirState251 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1229 * _menhir_state) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | MTC_IR ->
            _menhir_reduce119 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState252) : 'freshtv1230)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1215 * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | R_RCD ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186) : 'freshtv1216)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1219 * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1217 * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_ptn)), _, (_2 : 'tv_ir_ptn_lst)) = _menhir_stack in
        let _v : 'tv_ir_ptn_lst = 
# 245 "imp_parser.mly"
                      ( [|_1|] |+| _2 )
# 1053 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1218)) : 'freshtv1220)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1211 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1068 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1209 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1074 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 1079 "imp_parser.ml"
        ))), _, (_3 : 'tv_ir_ptn)), _, (_4 : 'tv_ir_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_ir_ptn_lst_lb = 
# 287 "imp_parser.mly"
                                 ( [|(_1,_3)|] |+| _4 )
# 1085 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1210)) : 'freshtv1212)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1213 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | R_RCD ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv1214)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv1207 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1112 "imp_parser.ml"
    ))) * (
# 16 "imp_parser.mly"
       (string)
# 1116 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState297
    | ORD_LEX_COPRD ->
        _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState297
    | DTA | DTA_GRM | LCE | MDL_END | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1205 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1130 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 1134 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 1139 "imp_parser.ml"
        ))), (_3 : (
# 16 "imp_parser.mly"
       (string)
# 1143 "imp_parser.ml"
        ))), _, (_5 : 'tv_grm_ord)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 102 "imp_parser.mly"
                              ( (_3,[],_5) )
# 1150 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1203) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1201 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState299 _v
        | DTA | DTA_GRM | LCE | MDL_END | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1199 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
            let _v : 'tv_grm_clq = 
# 98 "imp_parser.mly"
            ( [_1] )
# 1171 "imp_parser.ml"
             in
            _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1200)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState299) : 'freshtv1202)) : 'freshtv1204)) : 'freshtv1206)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState297) : 'freshtv1208)

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1197 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1195 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 116 "imp_parser.mly"
                      ( _1@[_2] )
# 1197 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1196)) : 'freshtv1198)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1181 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1177 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1175 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 122 "imp_parser.mly"
                         ( Peg.Option _2 )
# 1223 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1176)) : 'freshtv1178)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1179 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1180)) : 'freshtv1182)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1189 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1185 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1183 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 121 "imp_parser.mly"
                         ( Peg.List _2 )
# 1251 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1184)) : 'freshtv1186)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1187 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1188)) : 'freshtv1190)
    | MenhirState279 | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1193 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1191 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 120 "imp_parser.mly"
             ( Peg.Atm _1 )
# 1270 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1192)) : 'freshtv1194)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_ptn_atm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_ptn_atm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState251 | MenhirState198 | MenhirState170 | MenhirState188 | MenhirState173 | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1165 * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1163 * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_ir_ptn_atm)) = _menhir_stack in
        let _v : 'tv_ir_ptn = 
# 228 "imp_parser.mly"
               ( Rcd_Ptn.A _1 )
# 1289 "imp_parser.ml"
         in
        _menhir_goto_ir_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1164)) : 'freshtv1166)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1173 * _menhir_state) * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1169 * _menhir_state) * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1167 * _menhir_state) * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn_atm)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_ir_ptn_op = 
# 240 "imp_parser.mly"
                         ( Some _2 )
# 1310 "imp_parser.ml"
             in
            _menhir_goto_ir_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1168)) : 'freshtv1170)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1171 * _menhir_state) * _menhir_state * 'tv_ir_ptn_atm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1172)) : 'freshtv1174)
    | _ ->
        _menhir_fail ()

and _menhir_reduce122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_ir_ptn_lst = 
# 244 "imp_parser.mly"
    ( [||] )
# 1328 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_ir_ptn_lst_lb = 
# 286 "imp_parser.mly"
    ( [||] )
# 1337 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run175 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 1344 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1159 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1356 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | VAL _v ->
            _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _v
        | WC ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState176
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176) : 'freshtv1160)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1161 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1378 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1162)

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1157 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_prd) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1155 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_rule = 
# 108 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 1397 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1153) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule) = _v in
    ((match _menhir_s with
    | MenhirState275 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1147) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1145) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let _v : 'tv_grm_ord = 
# 105 "imp_parser.mly"
             ( [(_1,None)] )
# 1416 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1146)) : 'freshtv1148)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1151 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1149 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 106 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 1432 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1150)) : 'freshtv1152)
    | _ ->
        _menhir_fail ()) : 'freshtv1154)) : 'freshtv1156)) : 'freshtv1158)

and _menhir_run280 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1143) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_ptn = 
# 119 "imp_parser.mly"
        ( Peg.Atm Peg.Any )
# 1448 "imp_parser.ml"
     in
    _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1144)

and _menhir_run281 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 1455 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1141) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 1465 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 1469 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 125 "imp_parser.mly"
        ( (Peg.Text _1) )
# 1474 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1142)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1139 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce94 _menhir_env (Obj.magic _menhir_stack) MenhirState291 : 'freshtv1140)

and _menhir_run284 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 1488 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1137) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 1498 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 1502 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 126 "imp_parser.mly"
        ( Peg.Name _1 )
# 1507 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1138)

and _menhir_run285 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run284 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
    | STG _v ->
        _menhir_run281 _menhir_env (Obj.magic _menhir_stack) MenhirState285 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState285

and _menhir_run288 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run284 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _v
    | STG _v ->
        _menhir_run281 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState288

and _menhir_run171 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1135) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ir_ptn_atm = 
# 267 "imp_parser.mly"
       (
    let v = newvar () in Types.rm := ("_",v)::!Types.rm; v)
# 1552 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_atm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1136)

and _menhir_run172 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 1559 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1133) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 1569 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 1573 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_ir_ptn_atm = 
# 269 "imp_parser.mly"
        (
        let v = newvar () in
        Types.rm := (_1,v)::!Types.rm;
        v  )
# 1581 "imp_parser.ml"
     in
    _menhir_goto_ir_ptn_atm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1134)

and _menhir_run173 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1131 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState173 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
        | OP | R_RCD ->
            _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState174
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174) : 'freshtv1132)
    | L_RCD ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState173
    | VAL _v ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _v
    | WC ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState173
    | OP | R_RCD ->
        _menhir_reduce122 _menhir_env (Obj.magic _menhir_stack) MenhirState173
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1125 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1628 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1123 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1636 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 1643 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 200 "imp_parser.mly"
                                           ( [_3]@_4 )
# 1649 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1124)) : 'freshtv1126)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1129 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1127 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 193 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 1666 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1128)) : 'freshtv1130)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1113 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1111 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn)), _, (_3 : 'tv_ir_ptn_eq)), _, (_5 : 'tv_ir_lines)), _, (_6 : 'tv_mtc_ir)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_mtc_ir = 
# 358 "imp_parser.mly"
                                                      ([|((_2,_3),_5)|] |+| _6 )
# 1687 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1112)) : 'freshtv1114)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1121 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1117 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1115 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_mtc_ir)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_lines = 
# 213 "imp_parser.mly"
                                 ( Mtc(_2,_3) )
# 1708 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1116)) : 'freshtv1118)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1119 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_mtc_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1120)) : 'freshtv1122)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mtc_ir_end : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mtc_ir_end -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1105 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1103 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn)), _, (_3 : 'tv_ir_ptn_eq)), _, (_5 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_mtc_ir_end = 
# 362 "imp_parser.mly"
                                                          ([|((_2,_3),_5)|] |+| _6 )
# 1739 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1104)) : 'freshtv1106)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1109 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_mtc_ir_end) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1107 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_mtc_ir_end) : 'tv_mtc_ir_end) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_lines = 
# 214 "imp_parser.mly"
                           ( Mtc(_2,_3) )
# 1756 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1108)) : 'freshtv1110)
    | _ ->
        _menhir_fail ()

and _menhir_goto_coprd_ir : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ir -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState244 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1093 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1091 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_ir_lines)), _, (_4 : 'tv_coprd_ir)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_coprd_ir = 
# 366 "imp_parser.mly"
                                    ( [|(_2,_3)|] |+| _4 )
# 1776 "imp_parser.ml"
         in
        _menhir_goto_coprd_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1092)) : 'freshtv1094)
    | MenhirState240 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1101 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1097 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1095 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_coprd_ir)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_lines = 
# 211 "imp_parser.mly"
                               (
     Agl(_2,_3) )
# 1798 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1096)) : 'freshtv1098)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1099 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1100)) : 'freshtv1102)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1085 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1083 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_regs) : 'tv_regs) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 370 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 1828 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1084)) : 'freshtv1086)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1089 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1836 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1087 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1844 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_regs) : 'tv_regs) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 1851 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 218 "imp_parser.mly"
                                 ( IR_Id(_2,[|_4|] |+| _5)  )
# 1857 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1088)) : 'freshtv1090)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nls : _menhir_env -> 'ttv_tail -> 'tv_nls -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1081 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run302 _menhir_env (Obj.magic _menhir_stack) MenhirState340
    | DTA_GRM ->
        _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState340
    | LCE ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState340
    | NL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1079 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState340 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1077 * 'tv_nls) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, (_1 : 'tv_nls)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_nls = 
# 61 "imp_parser.mly"
           ()
# 1890 "imp_parser.ml"
         in
        _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv1078)) : 'freshtv1080)
    | MDL_END ->
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState340
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState340) : 'freshtv1082)

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1071 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run288 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | L_OPN ->
            _menhir_run285 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | NAM _v ->
            _menhir_run284 _menhir_env (Obj.magic _menhir_stack) MenhirState279 _v
        | NOT_SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1063) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState279 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1061) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 134 "imp_parser.mly"
            ( Peg.Not )
# 1928 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1062)) : 'freshtv1064)
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1067) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState279 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1065) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 133 "imp_parser.mly"
        ( Peg.And )
# 1943 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1066)) : 'freshtv1068)
        | STG _v ->
            _menhir_run281 _menhir_env (Obj.magic _menhir_stack) MenhirState279 _v
        | WC ->
            _menhir_run280 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | NL | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1069) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState279 in
            ((let _v : 'tv_grm_prd = 
# 129 "imp_parser.mly"
    ( None )
# 1957 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1070)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState279) : 'freshtv1072)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1075 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run288 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | L_OPN ->
            _menhir_run285 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | NAM _v ->
            _menhir_run284 _menhir_env (Obj.magic _menhir_stack) MenhirState292 _v
        | STG _v ->
            _menhir_run281 _menhir_env (Obj.magic _menhir_stack) MenhirState292 _v
        | WC ->
            _menhir_run280 _menhir_env (Obj.magic _menhir_stack) MenhirState292
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | NL | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1073 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 130 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1987 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1074)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState292) : 'freshtv1076)
    | _ ->
        _menhir_fail ()

and _menhir_run221 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1059) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_op_src = 
# 317 "imp_parser.mly"
          ( None )
# 2007 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1060)

and _menhir_run222 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState222 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222

and _menhir_run170 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | VAL _v ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | WC ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170

and _menhir_run251 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState251
    | VAL _v ->
        _menhir_run172 _menhir_env (Obj.magic _menhir_stack) MenhirState251 _v
    | WC ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState251
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState251

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1031 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState244
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1029 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_coprd_ir = 
# 365 "imp_parser.mly"
                           ( [|(_2,_3)|] )
# 2078 "imp_parser.ml"
             in
            _menhir_goto_coprd_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1030)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState244) : 'freshtv1032)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1035 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1033 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 210 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 2094 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1034)) : 'freshtv1036)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1039 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1037 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn)), _, (_3 : 'tv_ir_ptn_eq)), _, (_5 : 'tv_ir_lines)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_mtc_ir_end = 
# 361 "imp_parser.mly"
                                                   ( [|((_2,_3),_5)|] )
# 2108 "imp_parser.ml"
         in
        _menhir_goto_mtc_ir_end _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1038)) : 'freshtv1040)
    | MenhirState254 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1043 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_PTN ->
            _menhir_run251 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | COPRD_PTN_END ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv1041 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_ir_ptn)), _, (_3 : 'tv_ir_ptn_eq)), _, (_5 : 'tv_ir_lines)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_mtc_ir = 
# 357 "imp_parser.mly"
                                               ( [|((_2,_3),_5)|] )
# 2130 "imp_parser.ml"
             in
            _menhir_goto_mtc_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1042)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState255) : 'freshtv1044)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1057 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2142 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1055 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2148 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2153 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), (_3 : 'tv_typ_def)), _, (_4 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 203 "imp_parser.mly"
                                 ( (_1,fst _3,snd _3,(_2,ref _4)) )
# 2158 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1053) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body_ir) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState84 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1047 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2171 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _v
            | DTA | DTA_GRM | LCE | MDL_END | NL ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1045 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2183 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 2188 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 199 "imp_parser.mly"
                            ( [_3] )
# 2194 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1046)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState262) : 'freshtv1048)
        | MenhirState82 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1051 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1049 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body_ir)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 194 "imp_parser.mly"
                         ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d) )
# 2211 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1050)) : 'freshtv1052)
        | _ ->
            _menhir_fail ()) : 'freshtv1054)) : 'freshtv1056)) : 'freshtv1058)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1027 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState246
    | APP ->
        _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState246
    | ARR ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState246
    | EOP ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState246
    | MTC ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState246
    | NAM _v ->
        _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState246 _v
    | OUT_IR ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState246
    | ROT _v ->
        _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState246 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState246) : 'freshtv1028)

and _menhir_reduce167 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 369 "imp_parser.mly"
    ( [||] )
# 2253 "imp_parser.ml"
     in
    _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1025) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_op = 
# 344 "imp_parser.mly"
          ( None )
# 2284 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1026)

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1023 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1021) = Obj.magic _menhir_stack in
    ((let _v : 'tv_nls = 
# 60 "imp_parser.mly"
    ()
# 2313 "imp_parser.ml"
     in
    _menhir_goto_nls _menhir_env _menhir_stack _v) : 'freshtv1022)) : 'freshtv1024)

and _menhir_run150 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 2320 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState150
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState150
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150

and _menhir_run158 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState158
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158

and _menhir_run162 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 2356 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState162
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState162
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162

and _menhir_run168 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168

and _menhir_run206 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState206
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState206
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206

and _menhir_run208 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState208
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState208
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState208
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState208
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState208
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState208
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState208
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState208
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState208

and _menhir_run233 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState233 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState233
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState233

and _menhir_run239 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState239 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState239
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState239

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState318 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1015 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 2495 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1013 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 2503 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 2510 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 158 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 2517 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1014)) : 'freshtv1016)
    | MenhirState314 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1019 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2525 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1017 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2533 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2540 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 144 "imp_parser.mly"
                         ( Def_Prd (_1,snd _2,_3) )
# 2545 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1018)) : 'freshtv1020)
    | _ ->
        _menhir_fail ()

and _menhir_reduce94 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 115 "imp_parser.mly"
    ( [] )
# 2556 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1011) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1009) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 87 "imp_parser.mly"
            ( _1 )
# 2573 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1010)) : 'freshtv1012)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState335 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1003 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2585 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1001 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2593 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 2600 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 138 "imp_parser.mly"
                                        ( [_3]@_4 )
# 2606 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1002)) : 'freshtv1004)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1007 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1005 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 90 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2623 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1006)) : 'freshtv1008)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState226 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv997 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv995 * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn_src)), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst_src = 
# 320 "imp_parser.mly"
                                ( [|_1|] |+| _2 )
# 2642 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv996)) : 'freshtv998)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv999 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState228
        | R_RCD ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState228
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228) : 'freshtv1000)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_lb_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_lb_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv991 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2671 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv989 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2677 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn_src) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2682 "imp_parser.ml"
        ))), _, (_3 : 'tv_reg_ptn_src)), _, (_4 : 'tv_reg_ptn_lst_lb_src)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_reg_ptn_lst_lb_src = 
# 324 "imp_parser.mly"
                                           ( [|(_1,_3)|] |+| _4 )
# 2688 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_lb_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv990)) : 'freshtv992)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv993 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | R_RCD ->
            _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv994)
    | _ ->
        _menhir_fail ()

and _menhir_run241 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState241
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState241 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState241
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState241

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv983 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv981 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_reg_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_reg_ptn = 
# 337 "imp_parser.mly"
                                       (
    match _4 with
    | None -> Rcd_Ptn.R_Lb _3
    | Some r -> Rcd_Ptn.Ro_Lb (_3,r) )
# 2746 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv982)) : 'freshtv984)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv987 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv985 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_reg_ptn = 
# 333 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some r -> Rcd_Ptn.Ro (_2,r) )
# 2766 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv986)) : 'freshtv988)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv905 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2781 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
        | OP | R_RCD ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92) : 'freshtv906)
    | MenhirState103 | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv907 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | NAM _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
        | WC ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | OP | R_RCD ->
            _menhir_reduce150 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv908)
    | MenhirState264 | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv915 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2817 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv909) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | L_OPN ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | L_PRN ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | L_RCD ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | N ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | NAM _v ->
                _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
            | ROT _v ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
            | SGN ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | TYP_STG ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | VAL _v ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
            | Z ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv910)
        | AGL | APP | ARR | EOP | MTC | NAM _ | OUT_IR | ROT _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv911) = Obj.magic _menhir_stack in
            ((let _v : 'tv_typ_def = 
# 373 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 2860 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv912)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv913 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2870 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv914)) : 'freshtv916)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv921 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2879 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv917 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2889 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState152
            | NAM _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState152 _v
            | WC ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState152
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152) : 'freshtv918)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv919 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2911 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv920)) : 'freshtv922)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv923 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2920 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState153
        | AGL | APP | ARR | EOP | MTC | NAM _ | OUT_IR | ROT _ ->
            _menhir_reduce167 _menhir_env (Obj.magic _menhir_stack) MenhirState153
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv924)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv925 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | AGL | APP | ARR | EOP | MTC | NAM _ | OUT_IR | ROT _ ->
            _menhir_reduce167 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv926)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv933 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv929 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv927 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 223 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2966 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)) : 'freshtv930)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv931 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv932)) : 'freshtv934)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv947 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2981 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv935 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2991 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | NAM _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
            | WC ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv936)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv939 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3011 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv937 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3018 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3023 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 215 "imp_parser.mly"
                       ( IL_Glb_Call((Tkn.Etr_N _1),_2) )
# 3029 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv938)) : 'freshtv940)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv943 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3037 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv941 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3044 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3049 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 225 "imp_parser.mly"
                        ( IR_Glb_Out(_1,_2) )
# 3055 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv942)) : 'freshtv944)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv945 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3065 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv946)) : 'freshtv948)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv951 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3074 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv949 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3080 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3085 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 220 "imp_parser.mly"
                            ( IR_Glb_Call(Tkn.Etr_N _1,_2,_4) )
# 3091 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv950)) : 'freshtv952)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv953 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_PTN ->
            _menhir_run251 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | COPRD_PTN_END ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169) : 'freshtv954)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv963 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv961 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 206 "imp_parser.mly"
                ( Ret _2 )
# 3118 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv959) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ret) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv957) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ret) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv955) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
        ((let _v : 'tv_ir_lines = 
# 209 "imp_parser.mly"
           ( _1 )
# 3135 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv956)) : 'freshtv958)) : 'freshtv960)) : 'freshtv962)) : 'freshtv964)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv967 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv965 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn_src)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 219 "imp_parser.mly"
                                            ( IR_Exp(_2,_4,_6) )
# 3150 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv966)) : 'freshtv968)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv973 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv969 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | NAM _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState237 _v
            | WC ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState237) : 'freshtv970)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv971 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv972)) : 'freshtv974)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv977 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv975 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 221 "imp_parser.mly"
                                    (
     IR_Call((_2,_4),_6) )
# 3195 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv976)) : 'freshtv978)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv979 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | APP ->
            _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | ARR ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | EOP ->
            _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | MTC ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | NAM _v ->
            _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
        | OUT_IR ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState242
        | ROT _v ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState242) : 'freshtv980)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv899 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | R_RCD ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101) : 'freshtv900)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv903 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv901 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 347 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 3254 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv902)) : 'freshtv904)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv895 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3269 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv893 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3275 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3280 "imp_parser.ml"
        ))), _, (_3 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_reg_ptn_lst_lb = 
# 351 "imp_parser.mly"
                                   ( [|(_1,_3)|] |+| _4 )
# 3286 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv897 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | R_RCD ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95) : 'freshtv898)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState325 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv887 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 3314 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3318 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv885 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 3326 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3330 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 3337 "imp_parser.ml"
        ))), _, (_4 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3341 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 154 "imp_parser.mly"
                                 ( (_4,_2)::_5 )
# 3348 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv886)) : 'freshtv888)
    | MenhirState314 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv891 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3356 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv889 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3364 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3371 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 142 "imp_parser.mly"
                            (
    Def_CoPrd (_1,snd _2,_3) )
# 3377 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv890)) : 'freshtv892)
    | _ ->
        _menhir_fail ()

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv883) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv881) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 86 "imp_parser.mly"
            ( _1 )
# 3396 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv882)) : 'freshtv884)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv879 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3407 "imp_parser.ml"
    )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | APP ->
        _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | ARR ->
        _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | EOP ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | MTC ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | NAM _v ->
        _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
    | OUT_IR ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | ROT _v ->
        _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv880)

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv865 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv861 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv859 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3455 "imp_parser.ml"
            ) = 
# 173 "imp_parser.mly"
                        ( _2 )
# 3459 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv860)) : 'freshtv862)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv863 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv864)) : 'freshtv866)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv877 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv873 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv869 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "imp_parser.mly"
       (string)
# 3487 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run315 _menhir_env (Obj.magic _menhir_stack) MenhirState318
                | DTA | DTA_GRM | LCE | MDL_END | NL | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv867 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 3500 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 3505 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 157 "imp_parser.mly"
                         ( [(_2,_4)] )
# 3512 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv868)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState318) : 'freshtv870)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv871 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv872)) : 'freshtv874)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv875 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv876)) : 'freshtv878)
    | _ ->
        _menhir_fail ()

and _menhir_run125 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3539 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | L_OPN ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | L_PRN ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | N ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
    | ROT _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
    | SGN ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | TYP_STG ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | VAL _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
    | Z ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125

and _menhir_run127 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3576 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | L_OPN ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | L_PRN ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | N ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | ROT _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | SGN ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TYP_STG ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | VAL _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | Z ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127

and _menhir_run129 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3613 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | L_OPN ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | L_PRN ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | N ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | ROT _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | SGN ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | TYP_STG ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | VAL _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | Z ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv857 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | L_OPN ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | L_PRN ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | N ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
    | ROT _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
    | SGN ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | TYP_STG ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | VAL _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
    | Z ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | CLN | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv855 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 161 "imp_parser.mly"
         ( Rcd(rcd_cl _1) )
# 3684 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv856)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv858)

and _menhir_goto_typ_top_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv845 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3701 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3705 "imp_parser.ml"
        )) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv843 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3711 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3715 "imp_parser.ml"
        )) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3720 "imp_parser.ml"
        ))), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3724 "imp_parser.ml"
        ))), _, (_4 : 'tv_typ_top_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_typ_top_lb = 
# 166 "imp_parser.mly"
                            ( Cns_Lb(_1,_3,_4) )
# 3730 "imp_parser.ml"
         in
        _menhir_goto_typ_top_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv844)) : 'freshtv846)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv853 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv849 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv847 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_typ_top_lb)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3752 "imp_parser.ml"
            ) = 
# 174 "imp_parser.mly"
                              ( Rcd_Lb _3 )
# 3756 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv848)) : 'freshtv850)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv851 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv852)) : 'freshtv854)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv841 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce94 _menhir_env (Obj.magic _menhir_stack) MenhirState278 : 'freshtv842)

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv835 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 3785 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run303 _menhir_env (Obj.magic _menhir_stack) MenhirState335 _v
        | DTA | DTA_GRM | LCE | MDL_END | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv833 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 3797 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 3802 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 137 "imp_parser.mly"
                         ( [_3] )
# 3808 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv834)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState335) : 'freshtv836)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv839 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv837 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 91 "imp_parser.mly"
                     ( Flow _2 )
# 3825 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv838)) : 'freshtv840)
    | _ ->
        _menhir_fail ()

and _menhir_run315 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState315
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce192 _menhir_env (Obj.magic _menhir_stack) MenhirState315
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState315

and _menhir_run322 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv829 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 3858 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv825 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 3869 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState324
            | L_OPN ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState324
            | L_PRN ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState324
            | L_RCD ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState324
            | N ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState324
            | NAM _v ->
                _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
            | ROT _v ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
            | SGN ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState324
            | TYP_STG ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState324
            | VAL _v ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState324 _v
            | Z ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState324
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState324) : 'freshtv826)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv827 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 3907 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv828)) : 'freshtv830)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv831 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv832)

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState308 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv819 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3927 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv817 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3935 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3942 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 76 "imp_parser.mly"
                 (
    let v = newvar_q (-1) in
    let (vs,l) = _3 in
    (v::vs,(_1,v)::l) )
# 3951 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)) : 'freshtv820)
    | MenhirState306 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv823) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv821) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 65 "imp_parser.mly"
             ( _2 )
# 3967 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv822)) : 'freshtv824)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState310 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv811 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv809 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 70 "imp_parser.mly"
                 ( 1+_2 )
# 3990 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)) : 'freshtv812)
    | MenhirState306 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv815) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv813) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 66 "imp_parser.mly"
                 ( ([],BatList.init _2 (fun n -> ("$"^(String.make n '\''),newvar_q (-2)))) )
# 4006 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv814)) : 'freshtv816)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState332 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv803 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4020 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv801 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4028 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 4035 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 150 "imp_parser.mly"
                  ( _1::_2 )
# 4040 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv802)) : 'freshtv804)
    | MenhirState331 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv807 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4048 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv805 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4056 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 4063 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 145 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 4070 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv806)) : 'freshtv808)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_op_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_op_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv795 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op_src) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv793 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_reg_ptn_lst_lb_src)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_reg_ptn_src = 
# 310 "imp_parser.mly"
                                               (
    match _4 with
    | None -> Rcd_Ptn.R_Lb _3
    | Some r -> Rcd_Ptn.Ro_Lb (_3,r) )
# 4097 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv794)) : 'freshtv796)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv799 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op_src) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv797 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op_src) : 'tv_reg_ptn_op_src) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst_src)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_reg_ptn_src = 
# 306 "imp_parser.mly"
                                         (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some r -> Rcd_Ptn.Ro (_2,r) )
# 4117 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)) : 'freshtv800)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_src : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_src -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv783 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4132 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState218 _v
        | OP | R_RCD ->
            _menhir_reduce154 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState218) : 'freshtv784)
    | MenhirState226 | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv785 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState226
        | NAM _v ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState226 _v
        | WC ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState226
        | OP | R_RCD ->
            _menhir_reduce156 _menhir_env (Obj.magic _menhir_stack) MenhirState226
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState226) : 'freshtv786)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv791 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv787 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | NAM _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
            | WC ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231) : 'freshtv788)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv789 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv790)) : 'freshtv792)
    | _ ->
        _menhir_fail ()

and _menhir_reduce156 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_src = 
# 319 "imp_parser.mly"
    ( [||] )
# 4200 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_lb_src = 
# 323 "imp_parser.mly"
    ( [||] )
# 4209 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_lb_src _menhir_env _menhir_stack _menhir_s _v

and _menhir_run215 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4216 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv779 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4228 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState216
        | NAM _v ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
        | WC ->
            _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState216
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216) : 'freshtv780)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv781 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4250 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv782)

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState264 | MenhirState85 | MenhirState168 | MenhirState241 | MenhirState235 | MenhirState237 | MenhirState231 | MenhirState206 | MenhirState162 | MenhirState166 | MenhirState159 | MenhirState150 | MenhirState152 | MenhirState154 | MenhirState88 | MenhirState103 | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv759 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv757 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 332 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 4268 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv758)) : 'freshtv760)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv767 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv763 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv761 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 343 "imp_parser.mly"
                  ( Some _2 )
# 4289 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)) : 'freshtv764)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv765 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv766)) : 'freshtv768)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv769 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | NAM _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
        | WC ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv770)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv775 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv771 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | NAM _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState235 _v
            | WC ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState235
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState235) : 'freshtv772)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv773 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv774)) : 'freshtv776)
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv777 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run241 _menhir_env (Obj.magic _menhir_stack) MenhirState240
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState240) : 'freshtv778)
    | _ ->
        _menhir_fail ()

and _menhir_reduce150 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 346 "imp_parser.mly"
    ( [||] )
# 4364 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce152 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_lb = 
# 350 "imp_parser.mly"
    ( [||] )
# 4373 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4380 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv753 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4392 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | NAM _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
        | WC ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv754)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv755 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4414 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv756)

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv751 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 4426 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv745 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv743 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 190 "imp_parser.mly"
                ( _1+1 )
# 4442 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv744)) : 'freshtv746)
    | APP | CLN | COPRD | DOT | DTA | DTA_GRM | IO | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | NL | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv747 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 4450 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 4455 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4460 "imp_parser.ml"
        ) = 
# 183 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 4464 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv748)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv749 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 4474 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv750)) : 'freshtv752)

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4482 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv681 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4492 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv679 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4508 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState123 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv677 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4516 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4522 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4529 "imp_parser.ml"
            ) = 
# 178 "imp_parser.mly"
                    ( lst _2 )
# 4533 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv678)) : 'freshtv680)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv682)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv685 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4545 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4549 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | APP | CLN | COPRD | DOT | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | NL | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv683 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4561 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4565 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4570 "imp_parser.ml"
            ))), _), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4574 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4580 "imp_parser.ml"
            ) = 
# 176 "imp_parser.mly"
                ( App(App(Prm Vct,_1),_3) )
# 4584 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv686)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv689 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4596 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4600 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | APP | CLN | COPRD | DOT | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | NL | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv687 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4612 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4616 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4621 "imp_parser.ml"
            ))), _), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4625 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4631 "imp_parser.ml"
            ) = 
# 184 "imp_parser.mly"
                ( Imp(_1,_3) )
# 4635 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv690)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv693 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4647 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4651 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | APP | CLN | COPRD | DOT | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | NL | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv691 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4665 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4669 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4674 "imp_parser.ml"
            ))), _), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4678 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4684 "imp_parser.ml"
            ) = 
# 175 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 4688 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv692)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130) : 'freshtv694)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv699 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4700 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv697 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4716 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState131 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv695 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4724 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4730 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4737 "imp_parser.ml"
            ) = 
# 177 "imp_parser.mly"
                    ( opn _2 )
# 4741 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)) : 'freshtv698)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131) : 'freshtv700)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv705 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4753 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv703 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4769 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState133 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv701 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4777 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4783 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4790 "imp_parser.ml"
            ) = 
# 172 "imp_parser.mly"
                    ( _2 )
# 4794 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv702)) : 'freshtv704)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133) : 'freshtv706)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv707 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4806 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4810 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | NAM _v ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | R_RCD ->
            _menhir_reduce190 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv708)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv711 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4834 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | CLN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv709 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4850 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4855 "imp_parser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 162 "imp_parser.mly"
            ( _2 )
# 4861 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv710)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv712)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv715 * _menhir_state * 'tv_typs) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4873 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState142
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState142
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState142
        | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv713 * _menhir_state * 'tv_typs) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4889 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4894 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 169 "imp_parser.mly"
             ( _1@[_2] )
# 4899 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv714)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142) : 'freshtv716)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv719) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4911 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv717) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4927 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState145 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | L_OPN ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | L_PRN ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | L_RCD ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | N ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | NAM _v ->
                _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | ROT _v ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | SGN ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | TYP_STG ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | VAL _v ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | Z ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv718)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145) : 'freshtv720)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv725) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4969 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4973 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv723) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4985 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4989 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState147 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv721) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 4997 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5001 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5007 "imp_parser.ml"
            ))), _), _, (_4 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5011 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 374 "imp_parser.mly"
                        ( (_2,_4) )
# 5019 "imp_parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv722)) : 'freshtv724)
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv726)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv729 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5035 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5039 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv727 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5055 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5059 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState266 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | L_OPN ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | L_PRN ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | L_RCD ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | N ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | NAM _v ->
                _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
            | ROT _v ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
            | SGN ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | TYP_STG ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | VAL _v ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
            | Z ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState267
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState267) : 'freshtv728)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266) : 'freshtv730)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv733 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5101 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5105 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5109 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState268
        | DTA | DTA_GRM | LCE | MDL_END | NL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv731 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5125 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5129 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5133 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((((_menhir_stack, _menhir_s), _, (_2 : (
# 16 "imp_parser.mly"
       (string)
# 5138 "imp_parser.ml"
            ))), _), _, (_4 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5142 "imp_parser.ml"
            ))), _), _, (_6 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5146 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 195 "imp_parser.mly"
                            (
    Ast.Etr_Abs(_2,_4,_6) )
# 5155 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState268) : 'freshtv734)
    | MenhirState320 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv737 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5167 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5171 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState321
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState321
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState321
        | DTA | DTA_GRM | LCE | MDL_END | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv735 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5187 "imp_parser.ml"
            )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5191 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 5196 "imp_parser.ml"
            ))), (_2 : 'tv_def_arg)), _), _, (_4 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5200 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 146 "imp_parser.mly"
                        ( Def_EqT (_1,snd _2,_4) )
# 5206 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState321) : 'freshtv738)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv741 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 5218 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5222 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState325
        | COPRD ->
            _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState325
        | IO ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState325
        | PRJ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState325
        | DTA | DTA_GRM | LCE | MDL_END | NL | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv739 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 5240 "imp_parser.ml"
            ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5244 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 5249 "imp_parser.ml"
            ))), _, (_4 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 5253 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 153 "imp_parser.mly"
                      ( [(_4,_2)] )
# 5260 "imp_parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv740)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState325) : 'freshtv742)
    | _ ->
        _menhir_fail ()

and _menhir_reduce192 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 168 "imp_parser.mly"
    ( [] )
# 5275 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce190 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typ_top_lb = 
# 165 "imp_parser.mly"
    ( U_Lb )
# 5284 "imp_parser.ml"
     in
    _menhir_goto_typ_top_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run118 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 5291 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv673 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5303 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | L_OPN ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | L_PRN ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | L_RCD ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | N ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | NAM _v ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
        | ROT _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
        | SGN ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | TYP_STG ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | VAL _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
        | Z ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119) : 'freshtv674)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv675 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5341 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv676)

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | L_OPN ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | L_PRN ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | N ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | ROT _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | SGN ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | TYP_STG ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | VAL _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
    | Z ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139

and _menhir_run276 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv671) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 112 "imp_parser.mly"
                  ( Peg.Lex )
# 5389 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv672)

and _menhir_run277 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv669) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 111 "imp_parser.mly"
          ( Peg.Synt )
# 5403 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv667 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5414 "imp_parser.ml"
    )) * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run322 _menhir_env (Obj.magic _menhir_stack) MenhirState314
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv663 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5426 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState314 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | L_OPN ->
            _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | L_PRN ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | L_RCD ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | N ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | NAM _v ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState320 _v
        | ROT _v ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState320 _v
        | SGN ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | TYP_STG ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | VAL _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState320 _v
        | Z ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState320) : 'freshtv664)
    | PRD ->
        _menhir_run315 _menhir_env (Obj.magic _menhir_stack) MenhirState314
    | DTA | DTA_GRM | LCE | MDL_END | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv665 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5466 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 5471 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 141 "imp_parser.mly"
                 ( Def_Abs (_1,snd _2) )
# 5476 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv666)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState314) : 'freshtv668)

and _menhir_run307 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 5487 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv657 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5499 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run307 _menhir_env (Obj.magic _menhir_stack) MenhirState308 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState308) : 'freshtv658)
    | COPRD | DTA | DTA_GRM | EQ | LCE | MDL_END | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv659 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5515 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 5520 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 73 "imp_parser.mly"
        (
    let v = newvar_q (-1) in
    ([v],[(_1,v)]) )
# 5527 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv660)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv661 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5537 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv662)

and _menhir_run310 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run310 _menhir_env (Obj.magic _menhir_stack) MenhirState310
    | COPRD | DTA | DTA_GRM | EQ | LCE | MDL_END | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv655 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 69 "imp_parser.mly"
        ( 1 )
# 5558 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv656)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState310

and _menhir_run332 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 5569 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run332 _menhir_env (Obj.magic _menhir_stack) MenhirState332 _v
    | DTA | DTA_GRM | LCE | MDL_END | NL | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv653 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5583 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 5588 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 149 "imp_parser.mly"
        ( [_1] )
# 5593 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState332

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv647 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv643 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv641 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 423 "imp_parser.mly"
                         ( _2 )
# 5623 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv642)) : 'freshtv644)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv645 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv646)) : 'freshtv648)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv651 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 427 "imp_parser.mly"
                 ( App(Atm (Name "cns"),Rcd [|_1;_2|]) )
# 5642 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv650)) : 'freshtv652)
    | _ ->
        _menhir_fail ()

and _menhir_run211 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv639) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_src = 
# 304 "imp_parser.mly"
       ( Rcd_Ptn.R [||] )
# 5658 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv640)

and _menhir_run212 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 5665 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv637) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 5675 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 5679 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg_src = 
# 300 "imp_parser.mly"
        (
     let v = newvar () in rm := (_1,v)::!rm; v )
# 5685 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv635) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_reg_src) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState210 | MenhirState226 | MenhirState213 | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv625 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv623 * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg_src)) = _menhir_stack in
        let _v : 'tv_reg_ptn_src = 
# 305 "imp_parser.mly"
            ( Rcd_Ptn.A _1 )
# 5702 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv624)) : 'freshtv626)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv633 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv629 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv627 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_src)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op_src = 
# 316 "imp_parser.mly"
                      ( Some _2 )
# 5723 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op_src _menhir_env _menhir_stack _menhir_s _v) : 'freshtv628)) : 'freshtv630)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv631 * _menhir_state) * _menhir_state * 'tv_reg_src) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv632)) : 'freshtv634)
    | _ ->
        _menhir_fail ()) : 'freshtv636)) : 'freshtv638)

and _menhir_run213 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv621 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState213 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
        | OP | R_RCD ->
            _menhir_reduce154 _menhir_env (Obj.magic _menhir_stack) MenhirState214
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214) : 'freshtv622)
    | L_RCD ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | NAM _v ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
    | WC ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | OP | R_RCD ->
        _menhir_reduce156 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213

and _menhir_run34 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_run36 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv613 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (int)
# 5832 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv611 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 17 "imp_parser.mly"
       (int)
# 5840 "imp_parser.ml"
        )) : (
# 17 "imp_parser.mly"
       (int)
# 5844 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 415 "imp_parser.mly"
                ( Prj(_1,Rcd_Ptn.Idx(_3,Rcd_Ptn.End)) )
# 5851 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)) : 'freshtv614)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 5860 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv615 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 16 "imp_parser.mly"
       (string)
# 5868 "imp_parser.ml"
        )) : (
# 16 "imp_parser.mly"
       (string)
# 5872 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 416 "imp_parser.mly"
                ( Prj(_1,Rcd_Ptn.Lb(_3,Rcd_Ptn.End)) )
# 5879 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv616)) : 'freshtv618)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv620)

and _menhir_run39 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run45 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run41 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run47 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run43 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv609 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv605 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv603 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 6153 "imp_parser.ml"
        ) = 
# 41 "imp_parser.mly"
  (
    ( try
      let (i,a) = Ast.tk_agl _1 in
      Line_Agl (i,a)
      with _ -> Line _1 ) )
# 6161 "imp_parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)) : 'freshtv606)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv607 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv608)) : 'freshtv610)

and _menhir_run3 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp_lst_lb -> (
# 16 "imp_parser.mly"
       (string)
# 6175 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv595 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 6187 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | CHO _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | EXN ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | IDX _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | INJ _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | L_LST ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_OPN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_RCD ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | NAM _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | R2 _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv596)
    | RM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv599 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 6239 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 6246 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst_lb)), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 6251 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_exp_lst_lb = 
# 389 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 6257 "imp_parser.ml"
         in
        _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv598)) : 'freshtv600)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv601 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 6267 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv602)

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv581 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv579 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), (_2 : 'tv_nls)), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 83 "imp_parser.mly"
                            ( _1::_3 )
# 6285 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv580)) : 'freshtv582)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv593 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 6293 "imp_parser.ml"
        )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv589 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 6303 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv587 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 6310 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 6315 "imp_parser.ml"
            ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 53 "imp_parser.mly"
                               ( (_2,_3) )
# 6322 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv585) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_def_mdl) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv583 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                _menhir_run348 _menhir_env (Obj.magic _menhir_stack) MenhirState350
            | MDL ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState350
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState350) : 'freshtv584)) : 'freshtv586)) : 'freshtv588)) : 'freshtv590)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv591 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 6349 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv592)) : 'freshtv594)
    | _ ->
        _menhir_fail ()

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6359 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv575 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6371 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv573) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState84 in
            let (_v : (
# 16 "imp_parser.mly"
       (string)
# 6383 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | NAM _v ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
            | WC ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv574)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv576)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv577 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6410 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv578)

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv571) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg = 
# 327 "imp_parser.mly"
       ( let v = newvar () in rm := ("_",v)::!rm; v)
# 6425 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv572)

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6432 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 6442 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 6446 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg = 
# 328 "imp_parser.mly"
        (
     let v = newvar () in rm := (_1,v)::!rm; v )
# 6452 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState88 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
        | OP | R_RCD ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89) : 'freshtv568)
    | L_RCD ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | NAM _v ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
    | WC ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | OP | R_RCD ->
        _menhir_reduce150 _menhir_env (Obj.magic _menhir_stack) MenhirState88
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88

and _menhir_run107 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 6501 "imp_parser.ml"
    ) = 
# 181 "imp_parser.mly"
      ( zn (Prm Z_u) )
# 6505 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6512 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv563) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 6522 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 6526 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 6531 "imp_parser.ml"
    ) = 
# 179 "imp_parser.mly"
        ( Prm(EqT _1) )
# 6535 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv564)

and _menhir_run109 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv561) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 6549 "imp_parser.ml"
    ) = 
# 186 "imp_parser.mly"
            ( Prm Stg )
# 6553 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv562)

and _menhir_run110 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv559) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 6567 "imp_parser.ml"
    ) = 
# 185 "imp_parser.mly"
        ( Prm Sgn )
# 6571 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6578 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv557) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 189 "imp_parser.mly"
    ( 0 )
# 6588 "imp_parser.ml"
     in
    _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv558)

and _menhir_run114 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6595 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv555) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 6605 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 6609 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 6614 "imp_parser.ml"
    ) = 
# 180 "imp_parser.mly"
        ( Prm (Name _1) )
# 6618 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)

and _menhir_run115 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv553) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 6632 "imp_parser.ml"
    ) = 
# 182 "imp_parser.mly"
      ( Prm N )
# 6636 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv554)

and _menhir_run116 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv551 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState116 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _v
        | R_RCD ->
            _menhir_reduce190 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv552)
    | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce192 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116

and _menhir_run120 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | L_OPN ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | L_PRN ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | N ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | ROT _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | SGN ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | TYP_STG ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | VAL _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | Z ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120

and _menhir_run121 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | L_OPN ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | L_PRN ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | N ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
    | ROT _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
    | SGN ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | TYP_STG ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | VAL _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
    | Z ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState121
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121

and _menhir_run122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | L_OPN ->
        _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | L_PRN ->
        _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | N ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
    | ROT _v ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
    | SGN ->
        _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | TYP_STG ->
        _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | VAL _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
    | Z ->
        _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122

and _menhir_run272 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6773 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv547 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6785 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv543 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6795 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "imp_parser.mly"
       (string)
# 6800 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv539 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6811 "imp_parser.ml"
                ))) * (
# 16 "imp_parser.mly"
       (string)
# 6815 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run277 _menhir_env (Obj.magic _menhir_stack) MenhirState275
                | ORD_LEX_COPRD ->
                    _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState275
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState275) : 'freshtv540)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv541 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6835 "imp_parser.ml"
                ))) * (
# 16 "imp_parser.mly"
       (string)
# 6839 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv542)) : 'freshtv544)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv545 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6850 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv546)) : 'freshtv548)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6861 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv550)

and _menhir_run303 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6869 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv535 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6881 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run329 _menhir_env (Obj.magic _menhir_stack) MenhirState304
        | NAM _v ->
            _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState304 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState304) : 'freshtv536)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv537 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 6901 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)

and _menhir_run305 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6909 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv529) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run310 _menhir_env (Obj.magic _menhir_stack) MenhirState306
        | VAL _v ->
            _menhir_run307 _menhir_env (Obj.magic _menhir_stack) MenhirState306 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState306) : 'freshtv530)
    | COPRD | DTA | DTA_GRM | EQ | LCE | MDL_END | NL | PRD | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531) = Obj.magic _menhir_stack in
        ((let _v : 'tv_def_arg = 
# 64 "imp_parser.mly"
    ( ([],[]) )
# 6936 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv532)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv533 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6946 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv534)

and _menhir_run329 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv525 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 6963 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv521 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 6974 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run332 _menhir_env (Obj.magic _menhir_stack) MenhirState331 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState331) : 'freshtv522)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv523 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 6992 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv524)) : 'freshtv526)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv527 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv528)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv515 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | CHO _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | EXN ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | IDX _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | INJ _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | L_LST ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | L_OPN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | L_RCD ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | NAM _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv509 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState61 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | CHO _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | EXN ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | IDX _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | INJ _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | L_LST ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | L_OPN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | L_PRN ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | L_RCD ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | NAM _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | R2 _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | R64 _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | ROT _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | SGN ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | SLF _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | STG _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | VAL _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | VCT_INI ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv510)
        | R2 _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv513 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState61 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv511 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 417 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 7111 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv512)) : 'freshtv514)
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61) : 'freshtv516)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv519 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | CHO _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | EXN ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | IDX _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | INJ _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | L_LST ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | L_OPN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | L_RCD ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | NAM _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | R2 _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv517 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 377 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 7179 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv520)
    | _ ->
        _menhir_fail ()

and _menhir_reduce129 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 426 "imp_parser.mly"
    ( App(Atm (Name "nil"),Rcd [||]) )
# 7194 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv435 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | AGL | CHO _ | EOF | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv433 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp = 
# 391 "imp_parser.mly"
                          ( Agl_Op _2 )
# 7230 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv436)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv439 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv437 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 398 "imp_parser.mly"
                ( App(Atm (Name "⊵"),Rcd [|_1;_3|]) )
# 7261 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv440)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv443 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OP | PLS | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv441 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 406 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Pls),Rcd [|_1;_3|]) )
# 7288 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv444)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv447 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv445 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 407 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Mlt),Rcd [|_1;_3|]) )
# 7313 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv448)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv451 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | AGL | APP | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv449 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 414 "imp_parser.mly"
                ( App(_1,_3) )
# 7336 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv450)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv452)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv455 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OP | PLS | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv453 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 408 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Pls),Rcd [|_1;App(Atm(Fnc Tkn.Mns),_3)|]) )
# 7363 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46) : 'freshtv456)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv459 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv457 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 410 "imp_parser.mly"
               ( App(Atm(Fnc Tkn.Eq),Rcd [|_1;_3|]) )
# 7396 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv458)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv460)
    | MenhirState51 | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | CHO _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | EXN ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | IDX _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | INJ _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | L_LST ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | L_OPN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | L_RCD ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | NAM _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | R2 _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | R_LST ->
            _menhir_reduce129 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv462)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv467 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv465 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState53 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv463 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 422 "imp_parser.mly"
                    ( App(Atm (Name "‹"),_2) )
# 7499 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv464)) : 'freshtv466)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv468)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv473 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv471 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState55 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv469 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 409 "imp_parser.mly"
                        ( App(Atm(Fnc Tkn.Mns),_3) )
# 7541 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv470)) : 'freshtv472)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv474)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv479 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv477 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState57 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv475 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 411 "imp_parser.mly"
                    ( _2 )
# 7582 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv476)) : 'freshtv478)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv480)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv485 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv483 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState59 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv481 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp_lst_lb)), _, (_5 : 'tv_exp)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 420 "imp_parser.mly"
                                     ( Rcd_Lb (Some _5,Array.of_list _3) )
# 7625 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv482)) : 'freshtv484)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv486)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv491 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv489 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState64 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv487 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)), _), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 418 "imp_parser.mly"
                               ( Rcd (Array.of_list _2) )
# 7667 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)) : 'freshtv490)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv492)
    | MenhirState77 | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv495 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | AGL | CHO _ | EOF | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R2 _ | R64 _ | ROT _ | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv493 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 384 "imp_parser.mly"
                 ( _1@[_2] )
# 7703 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv494)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv496)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv499 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 7715 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | EOF | NAM _ | OP | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv497 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 7739 "imp_parser.ml"
            ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst_lb)), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 7744 "imp_parser.ml"
            ))), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_exp_lst_lb = 
# 388 "imp_parser.mly"
                           ( _1@[(_2,Some _4)] )
# 7750 "imp_parser.ml"
             in
            _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv498)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv500)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv501 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 380 "imp_parser.mly"
            ( _2 )
# 7785 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv502)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv504)
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv507 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv505 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState209 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState210
            | NAM _v ->
                _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _v
            | WC ->
                _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState210
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState210) : 'freshtv506)
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209) : 'freshtv508)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv415 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv411 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 378 "imp_parser.mly"
                  ( Rcd_Lb(None,Array.of_list _2) )
# 7857 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv412)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv413 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv414)) : 'freshtv416)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv425 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv417 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | CHO _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | EXN ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | IDX _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | INJ _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | L_LST ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | L_OPN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | L_PRN ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | L_RCD ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | NAM _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | R2 _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | R64 _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | ROT _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | SGN ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | SLF _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | STG _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | VAL _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | VCT_INI ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv418)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv421 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv419 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 419 "imp_parser.mly"
                              ( Rcd_Lb (None,Array.of_list _3) )
# 7936 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)) : 'freshtv422)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv423 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv424)) : 'freshtv426)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv431 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv427 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 379 "imp_parser.mly"
                      ( Rcd_Lb(Some Rot,Array.of_list _3) )
# 7963 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv428)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv429 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)) : 'freshtv432)
    | _ ->
        _menhir_fail ()

and _menhir_reduce73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 82 "imp_parser.mly"
      ( [] )
# 7981 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv409 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState82 in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 7998 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv407 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8009 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState264 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | L_OPN ->
                _menhir_run121 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | L_PRN ->
                _menhir_run120 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | L_RCD ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | N ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | NAM _v ->
                _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
            | ROT _v ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
            | SGN ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | TYP_STG ->
                _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | VAL _v ->
                _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
            | Z ->
                _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState265
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState265) : 'freshtv408)
        | L_RCD ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | NAM _v ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState264 _v
        | WC ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState264
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState264) : 'freshtv410)
    | SLF _v ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82

and _menhir_run271 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run272 _menhir_env (Obj.magic _menhir_stack) MenhirState271 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState271

and _menhir_run302 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run329 _menhir_env (Obj.magic _menhir_stack) MenhirState302
    | NAM _v ->
        _menhir_run305 _menhir_env (Obj.magic _menhir_stack) MenhirState302 _v
    | SLF _v ->
        _menhir_run303 _menhir_env (Obj.magic _menhir_stack) MenhirState302 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState302

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8092 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8103 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8111 "imp_parser.ml"
        )) : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8115 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv400)) : 'freshtv402)
    | MenhirState350 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv405 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8125 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8133 "imp_parser.ml"
        )) : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8137 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8143 "imp_parser.ml"
        ) = 
# 50 "imp_parser.mly"
                 ( _1::_2 )
# 8147 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv404)) : 'freshtv406)
    | _ ->
        _menhir_fail ()

and _menhir_reduce62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 383 "imp_parser.mly"
    ( [] )
# 8158 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 397 "imp_parser.mly"
            ( App(Atm (Name "#"),Rcd [||])  )
# 8172 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 8179 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 8189 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 8193 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 396 "imp_parser.mly"
        ( Prj(Rot,Rcd_Ptn.Lb(_1,Rcd_Ptn.End)) )
# 8198 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 8205 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv393) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 8215 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 8219 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 404 "imp_parser.mly"
        ( Atm (Stg _1) )
# 8224 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 8231 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv391) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 8241 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 8245 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 405 "imp_parser.mly"
        ( Atm(Fnc Tkn.Fix) )
# 8250 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv389) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 403 "imp_parser.mly"
        ( App(Atm (Name "&"),Rcd [||]) )
# 8264 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 8271 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv387) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 8281 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 8285 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 394 "imp_parser.mly"
        ( Rot )
# 8290 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int64)
# 8297 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv385) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (int64)
# 8307 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (int64)
# 8311 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 412 "imp_parser.mly"
        ( Atm(R64 _1) )
# 8316 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (bool)
# 8323 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv383) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 19 "imp_parser.mly"
       (bool)
# 8333 "imp_parser.ml"
    )) : (
# 19 "imp_parser.mly"
       (bool)
# 8337 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 413 "imp_parser.mly"
       ( Atm(R2 _1) )
# 8342 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 8349 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8361 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv373 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8371 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "imp_parser.mly"
       (string)
# 8376 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv371 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8383 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let ((_3 : (
# 16 "imp_parser.mly"
       (string)
# 8388 "imp_parser.ml"
            )) : (
# 16 "imp_parser.mly"
       (string)
# 8392 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 8397 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 402 "imp_parser.mly"
                ( Atm(Name (_1^"."^_3)) )
# 8403 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)) : 'freshtv374)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv375 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8413 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)) : 'freshtv378)
    | AGL | APP | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | PRJ | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8422 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 8427 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 401 "imp_parser.mly"
         ( Atm (Name _1) )
# 8432 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8442 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState17 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState18) : 'freshtv370)
    | AGL | CHO _ | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R2 _ | R64 _ | ROT _ | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
        _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | MNS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState22 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | CHO _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | EXN ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | IDX _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | INJ _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | L_LST ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | L_OPN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | L_RCD ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | NAM _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | R2 _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv368)
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | R_OPN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState24 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv363 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 421 "imp_parser.mly"
                ( App(Atm(Name "‹›"),Rcd [||]) )
# 8614 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)) : 'freshtv366)
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | R_LST ->
        _menhir_reduce129 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 8686 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv361) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 8696 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 8700 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 392 "imp_parser.mly"
        ( Atm(Z _1) )
# 8705 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 8712 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv359) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 8722 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 8726 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 399 "imp_parser.mly"
        ( Atm(Fnc(Tkn.Inj _1)) )
# 8731 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 8738 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv357) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 8748 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 8752 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 395 "imp_parser.mly"
        ( Prj(Rot,Rcd_Ptn.Idx(_1,Rcd_Ptn.End)) )
# 8757 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv355) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 393 "imp_parser.mly"
        ( Atm (Fnc Tkn.Exn_Ini) )
# 8771 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 8778 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv353) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 8788 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 8792 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 400 "imp_parser.mly"
        ( Atm(Fnc(Tkn.Cho _1))  )
# 8797 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_reduce64 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst_lb = 
# 387 "imp_parser.mly"
    ( [] )
# 8855 "imp_parser.ml"
     in
    _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 8862 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 8871 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 8879 "imp_parser.ml"
    )) : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 8883 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv350)) : 'freshtv352)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState350 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState340 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv31 * _menhir_state * 'tv_mdl_etr) * 'tv_nls) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState335 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 8905 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState332 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8914 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState331 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 8923 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState325 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv39 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 8932 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 8936 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState324 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 8945 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8954 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 8958 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState320 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8967 "imp_parser.ml"
        )) * 'tv_def_arg) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState318 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv47 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 8976 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState315 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState314 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 8990 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState310 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState308 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9004 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState306 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)
    | MenhirState304 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 9017 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState299 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv65 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 9036 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 9040 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState292 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState285 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState275 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 9079 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 9083 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState271 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv83 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9097 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9101 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9105 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv85 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9114 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9118 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9127 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9131 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv89 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9140 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state) * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9149 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 9158 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv95 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState254 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv97 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState251 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState244 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv105 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState240 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv111 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv115 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv121 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn_src)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState226 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv129 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv131 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9257 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn_src) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9266 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv139 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv147 * _menhir_state) * _menhir_state * 'tv_ir_ptn) * _menhir_state * 'tv_ir_ptn_eq)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv149 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 9310 "imp_parser.ml"
        ))) * 'tv_ir_ptn_cst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv151 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 9319 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 9323 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv153 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 9332 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 9336 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155 * _menhir_state) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv163 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_ir_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9370 "imp_parser.ml"
        ))) * _menhir_state * 'tv_ir_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9379 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv169 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv177 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9413 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv181 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9422 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv191 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 9451 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv193 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 9460 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv195 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 9469 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9478 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv199) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9487 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9491 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv201) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9500 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9509 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state * 'tv_typs) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9518 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9532 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv211 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv213 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9546 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9550 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv215 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9559 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv217 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9568 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv219 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9577 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9581 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9590 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv223 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9599 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9603 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv225 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9612 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv227 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9621 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9625 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9634 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 9643 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv237 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv239 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9667 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv241 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv246)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv249 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv253 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv255 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9710 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv257 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9719 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv263 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 9738 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 9747 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 9761 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv272)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv275 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv278)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv281 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 9794 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv283 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv285 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv287 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv289 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv291 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv293 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv295 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv297 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv301 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv303 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv305 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv307 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv309 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv311 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv313 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv315 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv317 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv319 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv321 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv327 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv332)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv333 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv337 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv343 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 9953 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
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

and _menhir_run80 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 9979 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run302 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | DTA_GRM ->
            _menhir_run271 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | LCE ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | MDL_END ->
            _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv26)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)

and _menhir_run348 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 10014 "imp_parser.ml"
    ) = 
# 49 "imp_parser.mly"
        ( [] )
# 10018 "imp_parser.ml"
     in
    _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

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
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 10047 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv21) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv5 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv3 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 10075 "imp_parser.ml"
            ) = 
# 46 "imp_parser.mly"
                ( End )
# 10079 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)) : 'freshtv6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)) : 'freshtv10)
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LB ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv12)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv13 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)) : 'freshtv16)
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | CHO _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | EXN ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | IDX _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | INJ _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | L_LST ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | L_OPN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | L_RCD ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | NAM _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | R2 _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv18)
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv20)
    | AGL | CHO _ | EOF | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | R2 _ | R64 _ | ROT _ | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
        _menhir_reduce62 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv22))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 10176 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run348 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | MDL ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 10197 "imp_parser.ml"
