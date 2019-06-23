
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | WC
    | VCT
    | VAL of (
# 14 "imp_parser.mly"
       (string)
# 14 "imp_parser.ml"
  )
    | TYP_VCT
    | TYP_STG
    | TYP_SGN
    | TYP_OPN_VCT
    | TEST
    | STG of (
# 14 "imp_parser.mly"
       (string)
# 24 "imp_parser.ml"
  )
    | SRC
    | SPL
    | SLH
    | SLF of (
# 15 "imp_parser.mly"
       (int)
# 32 "imp_parser.ml"
  )
    | SGN
    | SEQ
    | R_RCD
    | R_PRN
    | R_OPN
    | R_LST
    | R_HLZ
    | R_BLK
    | ROT of (
# 15 "imp_parser.mly"
       (int)
# 45 "imp_parser.ml"
  )
    | PRJ
    | PRD_END
    | PRD
    | PLS_NAT
    | PLS_EVL
    | PLS
    | OUT of (
# 15 "imp_parser.mly"
       (int)
# 56 "imp_parser.ml"
  )
    | ORD_LEX_COPRD
    | ORD_COPRD
    | NOT_SPL
    | NOT
    | NAT of (
# 15 "imp_parser.mly"
       (int)
# 65 "imp_parser.ml"
  )
    | NAM of (
# 14 "imp_parser.mly"
       (string)
# 70 "imp_parser.ml"
  )
    | N
    | M_HLZ
    | MNS_NAT
    | MNS
    | MLT_NAT
    | MLT_EVL
    | MLT
    | MDL_END
    | MDL
    | MCR
    | L_VCT
    | L_RCD
    | L_PRN
    | L_OPN
    | L_LST
    | L_HLZ
    | L_BLK
    | LET
    | LCE
    | ISO
    | IO
    | INT of (
# 15 "imp_parser.mly"
       (int)
# 96 "imp_parser.ml"
  )
    | INJ of (
# 15 "imp_parser.mly"
       (int)
# 101 "imp_parser.ml"
  )
    | IN of (
# 15 "imp_parser.mly"
       (int)
# 106 "imp_parser.ml"
  )
    | GRM
    | FOR_ALL
    | FNT
    | EXP
    | EXN
    | EQ
    | EOP
    | EOF
    | EMT
    | DTA_GRM
    | DTA
    | DEQ
    | DEF
    | CST
    | COPRD_END
    | COPRD
    | CNT
    | CMM
    | CLN
    | CHO
    | ARR_END
    | ARR
    | APP_EVL
    | APP
    | AGL_TOP
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
  | MenhirState257
  | MenhirState246
  | MenhirState245
  | MenhirState241
  | MenhirState238
  | MenhirState236
  | MenhirState234
  | MenhirState232
  | MenhirState228
  | MenhirState225
  | MenhirState223
  | MenhirState220
  | MenhirState219
  | MenhirState217
  | MenhirState215
  | MenhirState211
  | MenhirState206
  | MenhirState205
  | MenhirState202
  | MenhirState199
  | MenhirState194
  | MenhirState193
  | MenhirState190
  | MenhirState187
  | MenhirState183
  | MenhirState180
  | MenhirState174
  | MenhirState171
  | MenhirState168
  | MenhirState167
  | MenhirState166
  | MenhirState165
  | MenhirState163
  | MenhirState161
  | MenhirState160
  | MenhirState159
  | MenhirState158
  | MenhirState156
  | MenhirState153
  | MenhirState149
  | MenhirState147
  | MenhirState144
  | MenhirState142
  | MenhirState139
  | MenhirState137
  | MenhirState136
  | MenhirState135
  | MenhirState134
  | MenhirState133
  | MenhirState132
  | MenhirState129
  | MenhirState128
  | MenhirState126
  | MenhirState125
  | MenhirState124
  | MenhirState123
  | MenhirState122
  | MenhirState121
  | MenhirState117
  | MenhirState115
  | MenhirState113
  | MenhirState112
  | MenhirState111
  | MenhirState108
  | MenhirState103
  | MenhirState102
  | MenhirState100
  | MenhirState99
  | MenhirState94
  | MenhirState91
  | MenhirState90
  | MenhirState85
  | MenhirState84
  | MenhirState82
  | MenhirState80
  | MenhirState78
  | MenhirState76
  | MenhirState73
  | MenhirState72
  | MenhirState71
  | MenhirState70
  | MenhirState69
  | MenhirState68
  | MenhirState66
  | MenhirState65
  | MenhirState64
  | MenhirState63
  | MenhirState59
  | MenhirState58
  | MenhirState50
  | MenhirState48
  | MenhirState47
  | MenhirState46
  | MenhirState44
  | MenhirState43
  | MenhirState34
  | MenhirState33
  | MenhirState21
  | MenhirState19
  | MenhirState17
  | MenhirState14
  | MenhirState13
  | MenhirState12
  | MenhirState11
  | MenhirState4
  | MenhirState3
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Types
  open Imp_parser_header

# 264 "imp_parser.ml"

let rec _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv985 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 274 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 278 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv983 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 286 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 290 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 297 "imp_parser.ml"
        ))), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 301 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ord)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_clq = 
# 78 "imp_parser.mly"
                                ( (_2,[],_4)::_5 )
# 307 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv984)) : 'freshtv986)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv995 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv993 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 324 "imp_parser.ml"
        ) = 
# 74 "imp_parser.mly"
                    ( _2 )
# 328 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv991) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 336 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv989) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 344 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv987) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 352 "imp_parser.ml"
        )) : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 356 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 71 "imp_parser.mly"
            ( Gram _1 )
# 361 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv988)) : 'freshtv990)) : 'freshtv992)) : 'freshtv994)) : 'freshtv996)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv981 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv979 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 92 "imp_parser.mly"
                      ( _1@[_2] )
# 381 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv980)) : 'freshtv982)

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv977) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv975) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 65 "imp_parser.mly"
            ( _1 )
# 398 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv976)) : 'freshtv978)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv969 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 410 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv967 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 418 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 425 "imp_parser.ml"
        ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
        let _v : 'tv_glb_etr_clique = 
# 169 "imp_parser.mly"
                                    ( [_2]@_3 )
# 430 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv968)) : 'freshtv970)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv973 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv971 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 165 "imp_parser.mly"
                       ( Etr_Clq _2 )
# 447 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv972)) : 'freshtv974)
    | _ ->
        _menhir_fail ()

and _menhir_goto_h_frm_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv953 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv951 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_h_frm_list = 
# 270 "imp_parser.mly"
                              ( _1::_3 )
# 467 "imp_parser.ml"
         in
        _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv952)) : 'freshtv954)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv959 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv955 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156) : 'freshtv956)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv957 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv958)) : 'freshtv960)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv965 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv961 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState180
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState180
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv962)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv963 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv964)) : 'freshtv966)
    | _ ->
        _menhir_fail ()

and _menhir_run144 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState144
    | AGL_TOP ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState144
    | L_HLZ ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState144
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState144
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv949 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 552 "imp_parser.ml"
    )) * (
# 14 "imp_parser.mly"
       (string)
# 556 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ORD_COPRD ->
        _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState211
    | ORD_LEX_COPRD ->
        _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState211
    | SLF _v ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv947 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 572 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 576 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 581 "imp_parser.ml"
        ))), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 585 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ord)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_clq = 
# 77 "imp_parser.mly"
                          ( [(_2,[],_4)] )
# 591 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv948)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211) : 'freshtv950)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv933 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv929 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv927 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 97 "imp_parser.mly"
                         ( Peg.Option _2 )
# 621 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)) : 'freshtv930)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv931 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv932)) : 'freshtv934)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv941 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv937 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv935 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 96 "imp_parser.mly"
                         ( Peg.List _2 )
# 649 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv936)) : 'freshtv938)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv939 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv940)) : 'freshtv942)
    | MenhirState194 | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv945 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv943 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 95 "imp_parser.mly"
             ( _1 )
# 668 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv944)) : 'freshtv946)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv917 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv915 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 184 "imp_parser.mly"
                    (
      match _2 with
      | None -> Code_Exp _1
      | Some x -> Seq (Code_Exp _1,x) )
# 693 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv921 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv919 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_code) : 'tv_code) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 218 "imp_parser.mly"
                        (
    ( match _3 with
      | None -> Some (Code_Exp _2)
      | Some x -> Some (Seq (Code_Exp _2,x)) ) )
# 713 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv920)) : 'freshtv922)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv925 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv923 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 255 "imp_parser.mly"
             ( _2 )
# 730 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv924)) : 'freshtv926)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stt_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stt_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv881 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 745 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | OUT _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv882)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv885 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv883 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_prd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_prd_list = 
# 265 "imp_parser.mly"
                                ( _1@[_3] )
# 768 "imp_parser.ml"
         in
        _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv884)) : 'freshtv886)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv889 * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 776 "imp_parser.ml"
        ))) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv887 * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 782 "imp_parser.ml"
        ))) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (code list)
# 787 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 33 "imp_parser.mly"
      (code list)
# 793 "imp_parser.ml"
        ) = 
# 260 "imp_parser.mly"
                                    ( _1@[_3] )
# 797 "imp_parser.ml"
         in
        _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv888)) : 'freshtv890)
    | MenhirState122 | MenhirState153 | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv897 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv891 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | AGL_TOP ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | L_HLZ ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv892)
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv893 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)) = _menhir_stack in
            let _v : 'tv_h_frm_list = 
# 269 "imp_parser.mly"
             ( [_1] )
# 831 "imp_parser.ml"
             in
            _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv895 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv896)) : 'freshtv898)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv899 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 846 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState167
        | OUT _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167) : 'freshtv900)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv913 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 864 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 868 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv911 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 874 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 878 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 883 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)), (_4 : (
# 15 "imp_parser.mly"
       (int)
# 887 "imp_parser.ml"
        ))), _, (_5 : 'tv_stt_code)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_glb_etr_body = 
# 172 "imp_parser.mly"
                                (
    (* let (scm,(src,dst)) = Ty.typing $5 in *)
    let (src,dst) = (Val (Sgn.ini()),Val (Sgn.ini())) in
    let b = Ty.typing_vh (Ty.vh_of_code _5) src dst in
    (_1,SgnMap.empty,Ty.subst b src,Ty.subst b dst,_5)
  )
# 898 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv909) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState113 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv903 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 911 "imp_parser.ml"
            )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv901 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 923 "imp_parser.ml"
                )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 928 "imp_parser.ml"
                ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
                let _v : 'tv_glb_etr_clique = 
# 168 "imp_parser.mly"
                     ( [_2] )
# 933 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv902)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183) : 'freshtv904)
        | MenhirState112 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv907 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv905 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 164 "imp_parser.mly"
                     ( Etr _2 )
# 950 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv906)) : 'freshtv908)
        | _ ->
            _menhir_fail ()) : 'freshtv910)) : 'freshtv912)) : 'freshtv914)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code_prd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv873 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv869 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142) : 'freshtv870)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv871 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv872)) : 'freshtv874)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv879 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run144 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv875 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState171
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState171
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171) : 'freshtv876)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv877 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv878)) : 'freshtv880)
    | _ ->
        _menhir_fail ()

and _menhir_goto_eop : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eop -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv863 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1032 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState137) : 'freshtv864)
    | MenhirState129 | MenhirState165 | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv865 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139) : 'freshtv866)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv867 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1064 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168) : 'freshtv868)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv861 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_prd) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv859 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_rule = 
# 84 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 1094 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv857) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule) = _v in
    ((match _menhir_s with
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv851) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv849) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let _v : 'tv_grm_ord = 
# 81 "imp_parser.mly"
             ( [(_1,None)] )
# 1113 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv850)) : 'freshtv852)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv855 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv853 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 82 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 1129 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv854)) : 'freshtv856)
    | _ ->
        _menhir_fail ()) : 'freshtv858)) : 'freshtv860)) : 'freshtv862)

and _menhir_run195 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 1138 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv847) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1148 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1152 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 100 "imp_parser.mly"
        ( Peg.Text _1 )
# 1157 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv848)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv845 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState205 : 'freshtv846)

and _menhir_run198 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 1171 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv843) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1181 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1185 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 101 "imp_parser.mly"
        ( Peg.Name _1 )
# 1190 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv844)

and _menhir_run199 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
    | STG _v ->
        _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199

and _menhir_run202 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _v
    | STG _v ->
        _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv801 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1232 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv799 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1240 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : (
# 15 "imp_parser.mly"
       (int)
# 1247 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)), _, (_4 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 210 "imp_parser.mly"
                                    (
    let c = Code_IO(_1,_3) in
    match _5 with
      | None -> c
      | Some x -> (Seq(c,x)) )
# 1256 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv800)) : 'freshtv802)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv805 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv803 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_tail) : 'tv_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_code = 
# 217 "imp_parser.mly"
             ( _2 )
# 1272 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv804)) : 'freshtv806)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv809 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv807 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : 'tv_code_prd_list)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 204 "imp_parser.mly"
                                          (
    let c = Code_Prd(_1,_2) in
    match _4 with
    | None -> c
    | Some x -> Seq(c,x)
  )
# 1294 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)) : 'freshtv810)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv813 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1302 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv811 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1310 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : (
# 33 "imp_parser.mly"
      (code list)
# 1317 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 193 "imp_parser.mly"
                                              (
    let c = Code_CoPrd(_1,_2) in
    match _4 with
    | None -> c
    | Some x -> Seq(c,x)
   )
# 1328 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv812)) : 'freshtv814)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv817 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv815 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 222 "imp_parser.mly"
                                    (
    ( match _5 with
      | None -> Some (Canon _3)
      | Some x -> Some (Seq(Canon _3,x))
      )
  )
# 1352 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv816)) : 'freshtv818)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv821 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1360 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1364 "imp_parser.ml"
        )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1368 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv819 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1376 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1380 "imp_parser.ml"
        )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1384 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_8 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((((((_menhir_stack, _menhir_s), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 1391 "imp_parser.ml"
        ))), _), _, (_5 : (
# 34 "imp_parser.mly"
      (opr)
# 1395 "imp_parser.ml"
        ))), _, (_6 : (
# 33 "imp_parser.mly"
      (code list)
# 1399 "imp_parser.ml"
        ))) = _menhir_stack in
        let _7 = () in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 233 "imp_parser.mly"
                                                           (
    let c = Code_Agl(_3,_5,_6) in
    match _8 with
    | None -> Some c
    | Some x -> Some(Seq(c,x)) )
# 1412 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv820)) : 'freshtv822)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv825 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1420 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv823 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1428 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : (
# 15 "imp_parser.mly"
       (int)
# 1435 "imp_parser.ml"
        ))), _, (_4 : 'tv_stt_code)), _, (_5 : 'tv_eop)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 243 "imp_parser.mly"
                                        (
    let c = Code_IO(_2,_4) in
    match _6 with
      | None -> Some c
      | Some x -> Some (Seq(c,x)) )
# 1445 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv824)) : 'freshtv826)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv829 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv827 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : 'tv_code_prd_list)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 238 "imp_parser.mly"
                                              (
    let c = Code_Prd(_2,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (Seq(c,x))  )
# 1467 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv828)) : 'freshtv830)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv833 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1475 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv831 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1483 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : (
# 33 "imp_parser.mly"
      (code list)
# 1490 "imp_parser.ml"
        ))) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 228 "imp_parser.mly"
                                                  (
    let c = Code_CoPrd(_2,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (Seq(c,x)) )
# 1501 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv832)) : 'freshtv834)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv837 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1509 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1513 "imp_parser.ml"
        )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1517 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv835 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1525 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1529 "imp_parser.ml"
        )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1533 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_7 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 1540 "imp_parser.ml"
        ))), _), _, (_4 : (
# 34 "imp_parser.mly"
      (opr)
# 1544 "imp_parser.ml"
        ))), _, (_5 : (
# 33 "imp_parser.mly"
      (code list)
# 1548 "imp_parser.ml"
        ))) = _menhir_stack in
        let _6 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stt_code = 
# 199 "imp_parser.mly"
                                                       (
     let c = Code_Agl(_2,_4,_5) in
     match _7 with
     | None -> c
     | Some x -> Seq(c,x) )
# 1560 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv836)) : 'freshtv838)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv841 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv839 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_h_frm_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stt_code = 
# 188 "imp_parser.mly"
                                (
    match _4 with
    | None -> Canon _2
    | Some x -> Seq(Canon _2,x)
  )
# 1582 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv840)) : 'freshtv842)
    | _ ->
        _menhir_fail ()

and _menhir_reduce19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_prd_list = 
# 264 "imp_parser.mly"
    ( [] )
# 1593 "imp_parser.ml"
     in
    _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run130 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 1600 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv797) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 1610 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 1614 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_eop = 
# 251 "imp_parser.mly"
        ()
# 1619 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv795) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eop = 
# 250 "imp_parser.mly"
        ()
# 1633 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv796)

and _menhir_run132 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | AGL_TOP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv791 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState132 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | APP_EVL ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | CHO ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | CNT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | EMT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | EXN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | INJ _v ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | L_LST ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | L_OPN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | L_PRN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | L_RCD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | MLT_EVL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | NAM _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | PLS_EVL ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | ROT _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | SGN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | SLF _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | STG _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
        | VCT ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState158
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158) : 'freshtv792)
    | L_HLZ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv793 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState132 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | AGL_TOP ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | L_HLZ ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
            _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133) : 'freshtv794)
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv785 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | L_OPN ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState194
        | NAM _v ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _v
        | NOT_SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv777) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState194 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv775) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 109 "imp_parser.mly"
            ( Peg.Not )
# 1752 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv776)) : 'freshtv778)
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv781) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState194 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv779) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 108 "imp_parser.mly"
        ( Peg.And )
# 1767 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)) : 'freshtv782)
        | STG _v ->
            _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _v
        | DTA | DTA_GRM | LCE | MDL_END | ORD_COPRD | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv783) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState194 in
            ((let _v : 'tv_grm_prd = 
# 104 "imp_parser.mly"
    ( None )
# 1779 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv784)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState194) : 'freshtv786)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv789 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | L_OPN ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | NAM _v ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
        | STG _v ->
            _menhir_run195 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
        | DTA | DTA_GRM | LCE | MDL_END | ORD_COPRD | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv787 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 105 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1807 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv788)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206) : 'freshtv790)
    | _ ->
        _menhir_fail ()

and _menhir_reduce123 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_tail = 
# 254 "imp_parser.mly"
    ( None  )
# 1822 "imp_parser.ml"
     in
    _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | EOP ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | OUT _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129

and _menhir_run149 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1846 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | AGL_TOP ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | L_HLZ ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv773 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exp_top) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv771 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_exp_top) : 'tv_exp_top) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typ_ept)) = _menhir_stack in
    let _v : 'tv_vh_frm_top = 
# 274 "imp_parser.mly"
                    ( let (e,m) = _2 in (_1,e,m) )
# 1879 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv769) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_top) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv759 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv755 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv753 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 1903 "imp_parser.ml"
            ) = 
# 37 "imp_parser.mly"
                   ( Evo (Code_Exp _1) )
# 1907 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv754)) : 'freshtv756)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv757 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv758)) : 'freshtv760)
    | MenhirState121 | MenhirState122 | MenhirState166 | MenhirState153 | MenhirState149 | MenhirState144 | MenhirState135 | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv763 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | EOP ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv761 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState134 in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 1934 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | AGL_TOP ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | L_HLZ ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv762)
        | OUT _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | PRD | PRD_END ->
            _menhir_reduce19 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | COPRD | COPRD_END ->
            _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134) : 'freshtv764)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv767 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | EOP ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv765 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState165 in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 1979 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | AGL_TOP ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | L_HLZ ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv766)
        | OUT _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
        | PRD | PRD_END ->
            _menhir_reduce19 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | COPRD | COPRD_END ->
            _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165) : 'freshtv768)
    | _ ->
        _menhir_fail ()) : 'freshtv770)) : 'freshtv772)) : 'freshtv774)

and _menhir_reduce98 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 91 "imp_parser.mly"
    ( [] )
# 2015 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_code_coprd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "imp_parser.mly"
      (code list)
# 2022 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv733 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2032 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2036 "imp_parser.ml"
        )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2040 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run149 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv729 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2052 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2056 "imp_parser.ml"
            )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2060 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState128
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState128
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv730)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv731 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2080 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2084 "imp_parser.ml"
            )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2088 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv732)) : 'freshtv734)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv739 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2097 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run149 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv735 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2109 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv736)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv737 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2129 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv738)) : 'freshtv740)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv745 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2138 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2142 "imp_parser.ml"
        )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2146 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run149 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv741 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2158 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2162 "imp_parser.ml"
            )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2166 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState163
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState163) : 'freshtv742)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((((('freshtv743 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2186 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2190 "imp_parser.ml"
            )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2194 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv744)) : 'freshtv746)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv751 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2203 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run149 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv747 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2215 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174) : 'freshtv748)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv749 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 2235 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv750)) : 'freshtv752)
    | _ ->
        _menhir_fail ()

and _menhir_goto_macro : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_macro -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv723 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2250 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv721 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2258 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_macro) : 'tv_macro) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 2265 "imp_parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_exp_top = 
# 278 "imp_parser.mly"
                  ( (_2,_3) )
# 2271 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv722)) : 'freshtv724)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv727 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv725 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_macro) : 'tv_macro) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
        let _v : 'tv_exp_top = 
# 277 "imp_parser.mly"
                  ( (Opr_Rcd _1,_2) )
# 2287 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv726)) : 'freshtv728)
    | _ ->
        _menhir_fail ()

and _menhir_run122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | AGL_TOP ->
        _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | L_HLZ ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122

and _menhir_run123 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv719 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce98 _menhir_env (Obj.magic _menhir_stack) MenhirState193 : 'freshtv720)

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv713 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv709 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv707 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 2392 "imp_parser.ml"
            ) = 
# 327 "imp_parser.mly"
                         ( _2 )
# 2396 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv708)) : 'freshtv710)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv711 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv712)) : 'freshtv714)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv717 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2411 "imp_parser.ml"
        )) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv715 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2417 "imp_parser.ml"
        )) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 2422 "imp_parser.ml"
        ))), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 335 "imp_parser.mly"
                 ( Opr_App (Opr_Name "cns",Opr_Rcd [_1;_2]) )
# 2427 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv716)) : 'freshtv718)
    | _ ->
        _menhir_fail ()

and _menhir_reduce17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 33 "imp_parser.mly"
      (code list)
# 2438 "imp_parser.ml"
    ) = 
# 259 "imp_parser.mly"
    ( [] )
# 2442 "imp_parser.ml"
     in
    _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_macro_list : _menhir_env -> 'ttv_tail -> 'tv_macro_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv705 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv699 * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv695 * 'tv_macro_list)) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 2466 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LET ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv691 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 2477 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | AGL ->
                    _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | APP_EVL ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | CHO ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | CNT ->
                    _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | EMT ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | EXN ->
                    _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | INJ _v ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                | INT _v ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                | L_LST ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | L_OPN ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | L_PRN ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | L_RCD ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | MLT_EVL ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | NAM _v ->
                    _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                | PLS_EVL ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | ROT _v ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                | SGN ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | SLF _v ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                | STG _v ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState90 _v
                | VCT ->
                    _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState90
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv692)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv693 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 2533 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv694)) : 'freshtv696)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv697 * 'tv_macro_list)) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv698)) : 'freshtv700)
    | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv701 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_macro_list)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_macro = 
# 282 "imp_parser.mly"
                    ( _2 )
# 2550 "imp_parser.ml"
         in
        _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v) : 'freshtv702)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv703 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv704)) : 'freshtv706)

and _menhir_reduce105 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_macro = 
# 281 "imp_parser.mly"
    ( [] )
# 2566 "imp_parser.ml"
     in
    _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv689) = Obj.magic _menhir_stack in
    ((let _v : 'tv_macro_list = 
# 285 "imp_parser.mly"
    ( [] )
# 2579 "imp_parser.ml"
     in
    _menhir_goto_macro_list _menhir_env _menhir_stack _v) : 'freshtv690)

and _menhir_run61 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2586 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv685 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2598 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "imp_parser.mly"
       (int)
# 2603 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv683 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2610 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 15 "imp_parser.mly"
       (int)
# 2615 "imp_parser.ml"
        )) : (
# 15 "imp_parser.mly"
       (int)
# 2619 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 2624 "imp_parser.ml"
        ))), _) = _menhir_stack in
        let _2 = () in
        let _v : (
# 34 "imp_parser.mly"
      (opr)
# 2630 "imp_parser.ml"
        ) = 
# 323 "imp_parser.mly"
                ( Prj (_1,_3) )
# 2634 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)) : 'freshtv686)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv687 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2644 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv688)

and _menhir_run63 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2652 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run70 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2707 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_run65 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2762 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65

and _menhir_run72 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2817 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72

and _menhir_run67 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2872 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv681 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2880 "imp_parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 2886 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 2892 "imp_parser.ml"
    ) = 
# 318 "imp_parser.mly"
            ( Opr_App(Opr_Name "//",_1) )
# 2896 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv682)

and _menhir_run68 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2903 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv671 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2963 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv669 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2971 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 2978 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 135 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 2985 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)) : 'freshtv672)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv675 * (
# 14 "imp_parser.mly"
       (string)
# 2993 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv673 * (
# 14 "imp_parser.mly"
       (string)
# 3001 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3008 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 125 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 3014 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv674)) : 'freshtv676)
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv679 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3022 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv677 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3030 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3037 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 117 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 3043 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv678)) : 'freshtv680)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv659 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 3057 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv657 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 3065 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 3072 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 139 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 3079 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv658)) : 'freshtv660)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv663 * (
# 14 "imp_parser.mly"
       (string)
# 3087 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv661 * (
# 14 "imp_parser.mly"
       (string)
# 3095 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3102 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 126 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 3108 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv662)) : 'freshtv664)
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv667 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3116 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv665 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3124 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3131 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 118 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 3137 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv666)) : 'freshtv668)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv655 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | DTA_GRM ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | LCE ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | MDL_END ->
        _menhir_reduce80 _menhir_env (Obj.magic _menhir_stack) MenhirState257
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257) : 'freshtv656)

and _menhir_run17 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | L_RCD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | N ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | L_RCD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | N ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run21 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_RCD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | N ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv653 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3255 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3265 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv645 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3275 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 3280 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | AGL_TOP ->
                _menhir_run123 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | L_HLZ ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv646)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv647 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3305 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv648)) : 'freshtv650)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv651 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3316 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv652)) : 'freshtv654)

and _menhir_run191 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv643) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 88 "imp_parser.mly"
                  ( Peg.Lex )
# 3331 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv644)

and _menhir_run192 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv641) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 87 "imp_parser.mly"
              ( Peg.Synt )
# 3345 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv642)

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv635 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3357 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv633 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3365 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3372 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 131 "imp_parser.mly"
                  ( _1::_2 )
# 3377 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv634)) : 'freshtv636)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv639 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 3385 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv637 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 3393 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 3400 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 119 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3407 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)) : 'freshtv640)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv629 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | APP_EVL ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | CHO ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | CNT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | EMT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | EXN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | INJ _v ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | L_LST ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | L_OPN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | L_PRN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | L_RCD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | MLT_EVL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | NAM _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | PLS_EVL ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | ROT _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv627 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState44 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv625 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3469 "imp_parser.ml"
            ) = 
# 324 "imp_parser.mly"
                        ( Opr_Rcd _2 )
# 3473 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv626)) : 'freshtv628)
        | SGN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | SLF _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | STG _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | VCT ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv630)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv631 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | APP_EVL ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | CHO ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | CNT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | EMT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | EXN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | INJ _v ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | L_LST ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | L_OPN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | L_PRN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | L_RCD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | MLT_EVL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | NAM _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | PLS_EVL ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | ROT _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | SGN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | SLF _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | SPL ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | STG _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
        | VCT ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            _menhir_reduce105 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv632)
    | _ ->
        _menhir_fail ()

and _menhir_reduce103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 334 "imp_parser.mly"
    ( Opr_App (Opr_Name "nil",Opr_Rcd []) )
# 3550 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 34 "imp_parser.mly"
      (opr)
# 3557 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv561 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3567 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | R_BLK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv559 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3591 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState59 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv557 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3599 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 3605 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3612 "imp_parser.ml"
            ) = 
# 299 "imp_parser.mly"
                  ( Agl _2 )
# 3616 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv558)) : 'freshtv560)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv562)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv565 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3628 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3632 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv563 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3650 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3654 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3659 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3663 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3669 "imp_parser.ml"
            ) = 
# 315 "imp_parser.mly"
                ( Opr_App (Opr_Name "+",Opr_Rcd [_1;_3]) )
# 3673 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv564)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv566)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv569 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3685 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3689 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv567 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3705 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3709 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3714 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3718 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3724 "imp_parser.ml"
            ) = 
# 316 "imp_parser.mly"
                ( Opr_App (Opr_Name "*",Opr_Rcd [_1;_3]) )
# 3728 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv570)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv573 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3740 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3744 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | AGL | APP | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv571 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3758 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3762 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3767 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3771 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3777 "imp_parser.ml"
            ) = 
# 322 "imp_parser.mly"
                ( Opr_App (_1,_3) )
# 3781 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv572)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv574)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv577 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3793 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3797 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv575 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3815 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3819 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3824 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3828 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3834 "imp_parser.ml"
            ) = 
# 317 "imp_parser.mly"
                ( Opr_App (Opr_Name "+",Opr_Rcd [_1;Opr_App (Opr_Name "-",_3)]) )
# 3838 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv578)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv581 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3850 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3854 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv579 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3876 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3880 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3885 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3889 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3895 "imp_parser.ml"
            ) = 
# 320 "imp_parser.mly"
               ( Opr_App(Opr_Name "=",Opr_Rcd [_1;_3]) )
# 3899 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv580)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv582)
    | MenhirState76 | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv583 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3911 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | APP_EVL ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | CHO ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | CNT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | EMT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | EXN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | INJ _v ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | L_LST ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | L_OPN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | L_PRN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | L_RCD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MLT_EVL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | NAM _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PLS_EVL ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | ROT _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | SGN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | SLF _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | STG _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | VCT ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | R_LST ->
            _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv584)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3981 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4005 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState78 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv585 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4013 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 4019 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 4026 "imp_parser.ml"
            ) = 
# 326 "imp_parser.mly"
                    ( Opr_App(Opr_Name "‹",_2) )
# 4030 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)) : 'freshtv588)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv590)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv595 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4042 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv593 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4066 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState80 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv591 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4074 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 4080 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 4088 "imp_parser.ml"
            ) = 
# 319 "imp_parser.mly"
                        ( Opr_App (Opr_Name "-",_3) )
# 4092 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)) : 'freshtv594)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv596)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv601 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4104 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv599 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4128 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState82 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4136 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 4142 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 4149 "imp_parser.ml"
            ) = 
# 321 "imp_parser.mly"
                    ( _2 )
# 4153 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv598)) : 'freshtv600)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv602)
    | MenhirState94 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv605 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4165 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv603 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4189 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 4194 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 295 "imp_parser.mly"
                 ( _1@[_2] )
# 4199 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv606)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv607 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4211 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | SPL ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            _menhir_reduce105 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv608)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv611 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 4243 "imp_parser.ml"
        ))) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4247 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | ARR | CMM | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv609 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 4271 "imp_parser.ml"
            ))) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4275 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : 'tv_macro_list)), (_3 : (
# 14 "imp_parser.mly"
       (string)
# 4280 "imp_parser.ml"
            ))), _, (_5 : (
# 34 "imp_parser.mly"
      (opr)
# 4284 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_macro_list = 
# 286 "imp_parser.mly"
                                ( _1@[(_3,_5)] )
# 4291 "imp_parser.ml"
             in
            _menhir_goto_macro_list _menhir_env _menhir_stack _v) : 'freshtv610)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv612)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv615 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4303 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv613 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4327 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState124 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | APP_EVL ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | CHO ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | CNT ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | EMT ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | EXN ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | INJ _v ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | INT _v ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | L_LST ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | L_OPN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | L_PRN ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | L_RCD ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | MLT_EVL ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | NAM _v ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | PLS_EVL ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | ROT _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | SGN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | SLF _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | STG _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | VCT ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv614)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv616)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv617 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4387 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4391 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | COPRD | COPRD_END ->
            _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv618)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv621 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4421 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv619 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4445 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState159 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | APP_EVL ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | CHO ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | CNT ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | EMT ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | EXN ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | INJ _v ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | INT _v ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | L_LST ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | L_OPN ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | L_PRN ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | L_RCD ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | MLT_EVL ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | NAM _v ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | PLS_EVL ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | ROT _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | SGN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | SLF _v ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | STG _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
            | VCT ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState160
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160) : 'freshtv620)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv622)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv623 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4505 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 4509 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | EQ ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | MLT ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | MNS ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | PLS ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | COPRD | COPRD_END ->
            _menhir_reduce17 _menhir_env (Obj.magic _menhir_stack) MenhirState161
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161) : 'freshtv624)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv513 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv509 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv507 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 150 "imp_parser.mly"
                        ( _2 )
# 4559 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv508)) : 'freshtv510)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv511 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv512)) : 'freshtv514)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv521 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv517 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv515 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_ept = 
# 290 "imp_parser.mly"
                    ( _2 )
# 4587 "imp_parser.ml"
             in
            _menhir_goto_typ_ept _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)) : 'freshtv518)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv519 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv520)) : 'freshtv522)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv527) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv523) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | DEF | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
                _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv524)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv525) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv526)) : 'freshtv528)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv531) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv529) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 181 "imp_parser.mly"
                            ( (_2,_4) )
# 4635 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv530)) : 'freshtv532)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv539 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv535 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4656 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState223
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv533 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 4669 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 4674 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 138 "imp_parser.mly"
                         ( [(_2,_4)] )
# 4681 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState223) : 'freshtv536)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv537 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)) : 'freshtv540)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv541 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv542)) : 'freshtv544)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv555 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv551 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv547 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4720 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState228
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv545 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 4733 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 4738 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 134 "imp_parser.mly"
                           ( [(_2,_4)] )
# 4745 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv546)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228) : 'freshtv548)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv549 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv550)) : 'freshtv552)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv553 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv554)) : 'freshtv556)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv505) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv503) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 66 "imp_parser.mly"
            ( _1 )
# 4782 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)) : 'freshtv506)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4794 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv495 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4802 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 4809 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 113 "imp_parser.mly"
                                        ( [_2]@_3 )
# 4814 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)) : 'freshtv498)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv501 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv499 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 69 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 4831 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv443 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv439 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 154 "imp_parser.mly"
                    ( Typ_App (Typ_Name "⟦⟧",_2) )
# 4865 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)) : 'freshtv440)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv441 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv442)) : 'freshtv444)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv449 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv445 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 152 "imp_parser.mly"
                ( Typ_Vct (_1,_3) )
# 4891 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv447 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv448)) : 'freshtv450)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv455 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv451 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 159 "imp_parser.mly"
                ( Typ_Imp (_1,_3) )
# 4917 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv452)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv453 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)) : 'freshtv456)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv461 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv457 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 151 "imp_parser.mly"
                ( Typ_App (_1,_3) )
# 4945 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv458)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv459 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv460)) : 'freshtv462)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv469 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv465 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv463 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 153 "imp_parser.mly"
                    ( Typ_App (Typ_Name "‹›",_2) )
# 4979 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv464)) : 'freshtv466)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv467 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv468)) : 'freshtv470)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv475 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | L_LST | L_OPN | L_RCD | N | NAM _ | R_RCD | SGN | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv471 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typs = 
# 147 "imp_parser.mly"
             ( _1@[_2] )
# 5008 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv472)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv473 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv474)) : 'freshtv476)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv481 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | R_RCD | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv477 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 143 "imp_parser.mly"
            ( _2 )
# 5038 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv479 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv480)) : 'freshtv482)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv487 * (
# 14 "imp_parser.mly"
       (string)
# 5053 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv483 * (
# 14 "imp_parser.mly"
       (string)
# 5069 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5074 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body_clq = 
# 127 "imp_parser.mly"
                         ( Def_Eqv (_1,_2,_4) )
# 5080 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv484)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv485 * (
# 14 "imp_parser.mly"
       (string)
# 5090 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv486)) : 'freshtv488)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv493 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5099 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv489 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5115 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5120 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 121 "imp_parser.mly"
                         ( Def_Eqv (_1,_2,_4) )
# 5126 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv490)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv491 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5136 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv492)) : 'freshtv494)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv415 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv413 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 62 "imp_parser.mly"
                        ( _1::_2 )
# 5156 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv435) * (
# 14 "imp_parser.mly"
       (string)
# 5164 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv431) * (
# 14 "imp_parser.mly"
       (string)
# 5174 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv429) * (
# 14 "imp_parser.mly"
       (string)
# 5180 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_2 : (
# 14 "imp_parser.mly"
       (string)
# 5185 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_arg)), _, (_5 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 44 "imp_parser.mly"
                                           ( (_2,_3,_5) )
# 5193 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv427) = _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv425) = Obj.magic _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv423) = Obj.magic _menhir_stack in
            let ((_1 : 'tv_def_mdl) : 'tv_def_mdl) = _v in
            ((let _v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5207 "imp_parser.ml"
            ) = 
# 41 "imp_parser.mly"
            ( Util.pnt flg "parse:file\n"; _1 )
# 5211 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv421) = _menhir_stack in
            let (_v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5218 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv419) = Obj.magic _menhir_stack in
            let (_v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5225 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv417) = Obj.magic _menhir_stack in
            let ((_1 : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5232 "imp_parser.ml"
            )) : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5236 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv418)) : 'freshtv420)) : 'freshtv422)) : 'freshtv424)) : 'freshtv426)) : 'freshtv428)) : 'freshtv430)) : 'freshtv432)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv433) * (
# 14 "imp_parser.mly"
       (string)
# 5246 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv434)) : 'freshtv436)
    | _ ->
        _menhir_fail ()

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5256 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113

and _menhir_run114 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5273 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv408)
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv409) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 180 "imp_parser.mly"
    ( (Typ_Val (-1),Typ_Val (-1)) )
# 5300 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv410)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv411 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5310 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv412)

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5318 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5330 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5335 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv399 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5346 "imp_parser.ml"
            )) * (
# 14 "imp_parser.mly"
       (string)
# 5350 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ORD_COPRD ->
                _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState190
            | ORD_LEX_COPRD ->
                _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState190
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190) : 'freshtv400)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv401 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5370 "imp_parser.ml"
            )) * (
# 14 "imp_parser.mly"
       (string)
# 5374 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv402)) : 'freshtv404)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv405 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5385 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv406)

and _menhir_run216 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5393 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5406 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END | SLF _ ->
            _menhir_reduce21 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217) : 'freshtv396)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv397 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5427 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv398)

and _menhir_run246 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5435 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState246 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv393 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5449 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5454 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 130 "imp_parser.mly"
        ( [_1] )
# 5459 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState246

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 48 "imp_parser.mly"
             ( _2 )
# 5484 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)) : 'freshtv388)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_args = 
# 51 "imp_parser.mly"
             ( [_1]@_2 )
# 5500 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)) : 'freshtv392)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arg_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv383 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv381 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState103 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv379 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_arg_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_arg = 
# 54 "imp_parser.mly"
                          ( Arg_Rcd _2 )
# 5530 "imp_parser.ml"
         in
        _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)) : 'freshtv382)
    | VAL _v ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv384)

and _menhir_reduce75 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 294 "imp_parser.mly"
    ( [] )
# 5545 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv377) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5559 "imp_parser.ml"
    ) = 
# 308 "imp_parser.mly"
        ( Opr_Name "#" )
# 5563 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv378)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5570 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv375) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 5580 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 5584 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5589 "imp_parser.ml"
    ) = 
# 313 "imp_parser.mly"
        ( Opr_Stg _1 )
# 5593 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5600 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv373) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5610 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5614 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5619 "imp_parser.ml"
    ) = 
# 314 "imp_parser.mly"
        ( Opr_Name ">@" )
# 5623 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5637 "imp_parser.ml"
    ) = 
# 312 "imp_parser.mly"
        ( Opr_Name "&" )
# 5641 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5648 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv369) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5658 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5662 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5667 "imp_parser.ml"
    ) = 
# 307 "imp_parser.mly"
        ( Opr_Name "$" )
# 5671 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv367) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5685 "imp_parser.ml"
    ) = 
# 301 "imp_parser.mly"
            ( Opr_Name "+" )
# 5689 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5696 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv365) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 5706 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 5710 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5715 "imp_parser.ml"
    ) = 
# 311 "imp_parser.mly"
         ( Opr_Name _1 )
# 5719 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv363) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5733 "imp_parser.ml"
    ) = 
# 302 "imp_parser.mly"
            ( Opr_Name "*" )
# 5737 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | MNS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv361 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState46 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | APP_EVL ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | CHO ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | CNT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EMT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EXN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | INJ _v ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | L_LST ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | L_OPN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | L_PRN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | L_RCD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MLT_EVL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | NAM _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | PLS_EVL ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | ROT _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | SGN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | SLF _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | STG _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | VCT ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv362)
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | R_OPN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv359 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState48 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5902 "imp_parser.ml"
        ) = 
# 325 "imp_parser.mly"
                ( Opr_Name "‹›" )
# 5906 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)) : 'freshtv360)
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | R_LST ->
        _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5978 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv355) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5988 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5992 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5997 "imp_parser.ml"
    ) = 
# 300 "imp_parser.mly"
        ( Opr_Z _1 )
# 6001 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 6008 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv353) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 6018 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 6022 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 6027 "imp_parser.ml"
    ) = 
# 309 "imp_parser.mly"
        ( Opr_Inj _1 )
# 6031 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 6045 "imp_parser.ml"
    ) = 
# 306 "imp_parser.mly"
        ( Opr_Name "?" )
# 6049 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 6063 "imp_parser.ml"
    ) = 
# 304 "imp_parser.mly"
        ( Opr_Name "⋎" )
# 6067 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 6081 "imp_parser.ml"
    ) = 
# 305 "imp_parser.mly"
        ( Opr_Name "⋏" )
# 6085 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv348)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv345) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 6099 "imp_parser.ml"
    ) = 
# 310 "imp_parser.mly"
        ( Opr_Name "↓"  )
# 6103 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv343) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 6117 "imp_parser.ml"
    ) = 
# 303 "imp_parser.mly"
            ( Opr_Name "◂" )
# 6121 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | APP_EVL ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | CHO ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | CNT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | EMT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | EXN ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv341 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | L_RCD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | N ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | CLN | DEF | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv339 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 142 "imp_parser.mly"
         ( Typ_Rcd _1 )
# 6209 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv340)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv342)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv337 * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv335 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_def_typ_body) : 'tv_def_typ_body) = _v in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_typ = 
# 70 "imp_parser.mly"
                     ( Flow _2 )
# 6237 "imp_parser.ml"
     in
    _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv336)) : 'freshtv338)

and _menhir_goto_def_typ_body_clq : _menhir_env -> 'ttv_tail -> 'tv_def_typ_body_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv333 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6248 "imp_parser.ml"
    )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState234 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv331 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6260 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 6265 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 112 "imp_parser.mly"
                         ( [_2] )
# 6270 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState234) : 'freshtv334)

and _menhir_run220 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState220
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState220
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220

and _menhir_run225 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState225
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState225
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState225

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 157 "imp_parser.mly"
      ( Typ_Name "ℤ" )
# 6318 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv330)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 6325 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 6335 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 6339 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 155 "imp_parser.mly"
        ( Typ_Val (-1) )
# 6344 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 161 "imp_parser.mly"
            ( Typ_Name "ℾ" )
# 6358 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv326)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 160 "imp_parser.mly"
        ( Typ_Name "&" )
# 6372 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 6379 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 6389 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 6393 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 156 "imp_parser.mly"
        ( Typ_Name _1 )
# 6398 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv319) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 158 "imp_parser.mly"
      ( Typ_Name "ℕ" )
# 6412 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | L_LST | L_OPN | L_RCD | N | NAM _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_RCD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | N ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
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
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | L_RCD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | N ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14

and _menhir_reduce80 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 61 "imp_parser.mly"
      ( [] )
# 6494 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | SLF _v ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112

and _menhir_run187 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState187 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187

and _menhir_run215 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState215 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv311 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 6546 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv305 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6557 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | L_BLK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv301 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6567 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | INT _v ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv297 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6577 "imp_parser.ml"
                        )))) = Obj.magic _menhir_stack in
                        let (_v : (
# 15 "imp_parser.mly"
       (int)
# 6582 "imp_parser.ml"
                        )) = _v in
                        ((let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | R_BLK ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv293 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6593 "imp_parser.ml"
                            )))) * (
# 15 "imp_parser.mly"
       (int)
# 6597 "imp_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | ISO ->
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv289 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6607 "imp_parser.ml"
                                )))) * (
# 15 "imp_parser.mly"
       (int)
# 6611 "imp_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | NAM _v ->
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv285 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6621 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 6625 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    let (_v : (
# 14 "imp_parser.mly"
       (string)
# 6630 "imp_parser.ml"
                                    )) = _v in
                                    ((let _menhir_env = _menhir_discard _menhir_env in
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv283 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6637 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 6641 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    let ((_8 : (
# 14 "imp_parser.mly"
       (string)
# 6646 "imp_parser.ml"
                                    )) : (
# 14 "imp_parser.mly"
       (string)
# 6650 "imp_parser.ml"
                                    )) = _v in
                                    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 6655 "imp_parser.ml"
                                    ))), (_5 : (
# 15 "imp_parser.mly"
       (int)
# 6659 "imp_parser.ml"
                                    ))) = _menhir_stack in
                                    let _7 = () in
                                    let _6 = () in
                                    let _4 = () in
                                    let _3 = () in
                                    let _1 = () in
                                    let _v : 'tv_def_typ_body = 
# 120 "imp_parser.mly"
                                          ( Def_Fnt_Dep (_2,_5,_8) )
# 6669 "imp_parser.ml"
                                     in
                                    _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)) : 'freshtv286)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv287 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6679 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 6683 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)) : 'freshtv290)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv291 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6694 "imp_parser.ml"
                                )))) * (
# 15 "imp_parser.mly"
       (int)
# 6698 "imp_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)) : 'freshtv294)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv295 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6709 "imp_parser.ml"
                            )))) * (
# 15 "imp_parser.mly"
       (int)
# 6713 "imp_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)) : 'freshtv298)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv299 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6724 "imp_parser.ml"
                        )))) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)) : 'freshtv302)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv303 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6735 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)) : 'freshtv306)
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv307 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6744 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run246 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState245) : 'freshtv308)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv309 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6762 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)) : 'freshtv312)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv313 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)) : 'freshtv316)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState215 in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 6780 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END ->
            _menhir_reduce21 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState236) : 'freshtv318)
    | SLF _v ->
        _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState215 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState215

and _menhir_goto_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv273 * _menhir_state * 'tv_arg_list) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * _menhir_state * 'tv_arg_list) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_arg_list)), _, (_2 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 58 "imp_parser.mly"
                  ( _1@[_2] )
# 6814 "imp_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)) : 'freshtv274)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 57 "imp_parser.mly"
        ( [_1] )
# 6826 "imp_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv276)) : 'freshtv278)
    | MenhirState108 | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | VAL _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | DEF | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
            let _v : 'tv_args = 
# 50 "imp_parser.mly"
        ( [_1] )
# 6846 "imp_parser.ml"
             in
            _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv282)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_ept : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_ept -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState33 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | APP_EVL ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | CHO ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | CNT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | EMT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | EXN ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | INJ _v ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | L_LST ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_OPN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_PRN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_RCD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MLT_EVL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | NAM _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | PLS_EVL ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | ROT _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | SGN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | SLF _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | STG _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | VCT ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv268)
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv270)

and _menhir_reduce143 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 146 "imp_parser.mly"
    ( [] )
# 6928 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | L_RCD ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | N ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv245) * (
# 14 "imp_parser.mly"
       (string)
# 6970 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv241) * (
# 14 "imp_parser.mly"
       (string)
# 6980 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DTA ->
                _menhir_run215 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | DTA_GRM ->
                _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | LCE ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | MDL_END ->
                _menhir_reduce80 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv242)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv243) * (
# 14 "imp_parser.mly"
       (string)
# 7004 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)) : 'freshtv246)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * (
# 14 "imp_parser.mly"
       (string)
# 7013 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv247 * (
# 14 "imp_parser.mly"
       (string)
# 7023 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState232
            | L_OPN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState232
            | L_RCD ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState232
            | N ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState232
            | NAM _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState232 _v
            | SGN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState232
            | TYP_STG ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState232
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState232 _v
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState232
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232) : 'freshtv248)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv249 * (
# 14 "imp_parser.mly"
       (string)
# 7055 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState219
            | PRD ->
                _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState219
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219) : 'freshtv250)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv251 * (
# 14 "imp_parser.mly"
       (string)
# 7073 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 7078 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body_clq = 
# 124 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 7083 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv252)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv253 * (
# 14 "imp_parser.mly"
       (string)
# 7093 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)) : 'freshtv256)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7102 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv257 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7112 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState241
            | L_OPN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState241
            | L_RCD ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState241
            | N ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState241
            | NAM _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState241 _v
            | SGN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState241
            | TYP_STG ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState241
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState241 _v
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState241
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState241) : 'freshtv258)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv259 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7144 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState238
            | PRD ->
                _menhir_run220 _menhir_env (Obj.magic _menhir_stack) MenhirState238
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState238) : 'freshtv260)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv261 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7162 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 7167 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body = 
# 116 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 7172 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv262)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv263 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7182 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)) : 'freshtv266)
    | _ ->
        _menhir_fail ()

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 7192 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv239) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 7202 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 7206 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_arg = 
# 53 "imp_parser.mly"
        ( Arg_Val (-1) )
# 7211 "imp_parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv240)

and _menhir_run102 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | VAL _v ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102

and _menhir_reduce139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typ_ept = 
# 289 "imp_parser.mly"
     ( Typ_Val (-1) )
# 7235 "imp_parser.ml"
     in
    _menhir_goto_typ_ept _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 31 "imp_parser.mly"
      (Types.buffer)
# 7242 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv237) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 7251 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv235) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 7259 "imp_parser.ml"
    )) : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 7263 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv236)) : 'freshtv238)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState246 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7295 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv25 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 7304 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv27 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7313 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv29 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7322 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7331 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7340 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * (
# 14 "imp_parser.mly"
       (string)
# 7349 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv37 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 7358 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 7372 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * (
# 14 "imp_parser.mly"
       (string)
# 7386 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * (
# 14 "imp_parser.mly"
       (string)
# 7395 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv48)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv51 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7408 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 7412 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv65 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7451 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 7455 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7469 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv73 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 7483 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv75 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv77 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7497 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7506 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv81 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7515 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv85 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7529 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7533 "imp_parser.ml"
        )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 7537 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv87 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7546 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7550 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv89 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7559 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv91 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7568 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv97 * _menhir_state * 'tv_stt_code)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 7592 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 7601 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv105 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv109 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7625 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv111 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7634 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7643 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv123 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7672 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7676 "imp_parser.ml"
        )) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 7680 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv125 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7689 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7693 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7702 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7711 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv135 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7730 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 7734 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv137) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv140)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7752 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv145) * (
# 14 "imp_parser.mly"
       (string)
# 7766 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155) * (
# 14 "imp_parser.mly"
       (string)
# 7795 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv156)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv159 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 7808 "imp_parser.ml"
        ))) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7812 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv161 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 7821 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv162)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7829 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv165 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7838 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7847 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7856 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7865 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7874 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7883 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7887 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7896 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7905 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7909 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv181 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7918 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv183 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7927 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7931 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7940 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv187 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7949 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7953 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7962 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv191 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7971 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7975 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv193 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7984 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7993 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv197 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv199 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv211 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv215 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv217 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv227 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv234)

and _menhir_reduce21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_def_arg = 
# 47 "imp_parser.mly"
    ( [] )
# 8097 "imp_parser.ml"
     in
    _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | VAL _v ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100

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
# 31 "imp_parser.mly"
      (Types.buffer)
# 8141 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv19) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv13 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 8171 "imp_parser.ml"
            ) = 
# 38 "imp_parser.mly"
                ( End )
# 8175 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)) : 'freshtv14)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
    | AGL | APP_EVL | CHO | CNT | EMT | EOF | EXN | EXP | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | PLS_EVL | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv20))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 30 "imp_parser.mly"
      (Types.mdl)
# 8195 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | MDL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 8216 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | DEF ->
                _menhir_reduce21 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99) : 'freshtv2)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv4)) : 'freshtv6)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv8)) : 'freshtv10))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 8246 "imp_parser.ml"
