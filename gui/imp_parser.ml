
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
    | INJ
    | IN of (
# 15 "imp_parser.mly"
       (int)
# 102 "imp_parser.ml"
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
  | MenhirState259
  | MenhirState248
  | MenhirState247
  | MenhirState243
  | MenhirState240
  | MenhirState238
  | MenhirState236
  | MenhirState234
  | MenhirState230
  | MenhirState227
  | MenhirState225
  | MenhirState222
  | MenhirState221
  | MenhirState219
  | MenhirState217
  | MenhirState213
  | MenhirState212
  | MenhirState210
  | MenhirState207
  | MenhirState205
  | MenhirState190
  | MenhirState187
  | MenhirState184
  | MenhirState180
  | MenhirState177
  | MenhirState173
  | MenhirState170
  | MenhirState167
  | MenhirState166
  | MenhirState163
  | MenhirState161
  | MenhirState158
  | MenhirState156
  | MenhirState154
  | MenhirState150
  | MenhirState149
  | MenhirState148
  | MenhirState145
  | MenhirState143
  | MenhirState142
  | MenhirState140
  | MenhirState139
  | MenhirState137
  | MenhirState136
  | MenhirState135
  | MenhirState131
  | MenhirState129
  | MenhirState127
  | MenhirState126
  | MenhirState125
  | MenhirState122
  | MenhirState117
  | MenhirState116
  | MenhirState114
  | MenhirState113
  | MenhirState108
  | MenhirState105
  | MenhirState104
  | MenhirState99
  | MenhirState98
  | MenhirState97
  | MenhirState83
  | MenhirState82
  | MenhirState81
  | MenhirState80
  | MenhirState79
  | MenhirState75
  | MenhirState74
  | MenhirState72
  | MenhirState70
  | MenhirState68
  | MenhirState66
  | MenhirState63
  | MenhirState62
  | MenhirState61
  | MenhirState60
  | MenhirState59
  | MenhirState58
  | MenhirState56
  | MenhirState55
  | MenhirState54
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState48
  | MenhirState40
  | MenhirState38
  | MenhirState37
  | MenhirState36
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState23
  | MenhirState22
  | MenhirState20
  | MenhirState18
  | MenhirState15
  | MenhirState14
  | MenhirState13
  | MenhirState12
  | MenhirState10
  | MenhirState4
  | MenhirState3
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Types
  open Imp_parser_header

# 256 "imp_parser.ml"

let rec _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv997) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv995) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 64 "imp_parser.mly"
            ( _1 )
# 271 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv996)) : 'freshtv998)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv989 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 283 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv987 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 291 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 298 "imp_parser.ml"
        ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
        let _v : 'tv_glb_etr_clique = 
# 163 "imp_parser.mly"
                                    ( [_2]@_3 )
# 303 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv988)) : 'freshtv990)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv993 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv991 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 159 "imp_parser.mly"
                       ( Etr_Clq _2 )
# 320 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv992)) : 'freshtv994)
    | _ ->
        _menhir_fail ()

and _menhir_goto_h_frm_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv973 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv971 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_h_frm_list = 
# 211 "imp_parser.mly"
                              ( _1::_3 )
# 340 "imp_parser.ml"
         in
        _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv972)) : 'freshtv974)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv979 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv975 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState148
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState148
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148) : 'freshtv976)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv977 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv978)) : 'freshtv980)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv985 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv981 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState177
            | COPRD | COPRD_END | DTA | DTA_GRM | LCE | MDL_END | M_HLZ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState177
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177) : 'freshtv982)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv983 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv984)) : 'freshtv986)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stt_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stt_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState136 | MenhirState145 | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv947 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv941 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState145
            | L_HLZ ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState145
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState145
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145) : 'freshtv942)
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv943 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)) = _menhir_stack in
            let _v : 'tv_h_frm_list = 
# 210 "imp_parser.mly"
             ( [_1] )
# 433 "imp_parser.ml"
             in
            _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv944)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv945 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv946)) : 'freshtv948)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv951 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv949 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_prd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_prd_list = 
# 206 "imp_parser.mly"
                                ( _1@[_3] )
# 453 "imp_parser.ml"
         in
        _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv950)) : 'freshtv952)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv955 * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 461 "imp_parser.ml"
        ))) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv953 * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 467 "imp_parser.ml"
        ))) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 32 "imp_parser.mly"
      (code list)
# 472 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 32 "imp_parser.mly"
      (code list)
# 478 "imp_parser.ml"
        ) = 
# 201 "imp_parser.mly"
                                    ( _1@[_3] )
# 482 "imp_parser.ml"
         in
        _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv954)) : 'freshtv956)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv969 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 490 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 494 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv967 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 500 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 504 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 509 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)), (_4 : (
# 15 "imp_parser.mly"
       (int)
# 513 "imp_parser.ml"
        ))), _, (_5 : 'tv_stt_code)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_glb_etr_body = 
# 166 "imp_parser.mly"
                                ( let (src,dst) =_2 in (_1,src,dst,_5) )
# 519 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv965) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState127 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv959 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 532 "imp_parser.ml"
            )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv957 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 544 "imp_parser.ml"
                )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 549 "imp_parser.ml"
                ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
                let _v : 'tv_glb_etr_clique = 
# 162 "imp_parser.mly"
                     ( [_2] )
# 554 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv958)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv960)
        | MenhirState126 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv963 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv961 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 158 "imp_parser.mly"
                     ( Etr _2 )
# 571 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv962)) : 'freshtv964)
        | _ ->
            _menhir_fail ()) : 'freshtv966)) : 'freshtv968)) : 'freshtv970)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv929 * _menhir_state) * _menhir_state * 'tv_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv927 * _menhir_state) * _menhir_state * 'tv_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_code)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 196 "imp_parser.mly"
             ( _2 )
# 593 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)) : 'freshtv930)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv933 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv931 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : 'tv_code)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 182 "imp_parser.mly"
                        ( Seq (_2,_3) )
# 606 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv932)) : 'freshtv934)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv935 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 614 "imp_parser.ml"
        )) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | OUT _v ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv936)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv939 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv937 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : 'tv_code)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 173 "imp_parser.mly"
                    ( Seq (_1,_2) )
# 636 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv938)) : 'freshtv940)
    | _ ->
        _menhir_fail ()

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv897 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv895 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_tail) : 'tv_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_code = 
# 181 "imp_parser.mly"
             ( _2 )
# 658 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv896)) : 'freshtv898)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv901 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv899 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 183 "imp_parser.mly"
                                    ( Canon (_3,_5) )
# 677 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv900)) : 'freshtv902)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv905 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv903 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : 'tv_code_prd_list)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 186 "imp_parser.mly"
                                              (
    Code_Prd(_2,_3,_5) )
# 696 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv904)) : 'freshtv906)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv909 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 704 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv907 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 712 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : (
# 32 "imp_parser.mly"
      (code list)
# 719 "imp_parser.ml"
        ))) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 184 "imp_parser.mly"
                                                  (
    Code_CoPrd(_2,_3,_5) )
# 727 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv908)) : 'freshtv910)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv913 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 735 "imp_parser.ml"
        )) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv911 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 743 "imp_parser.ml"
        )) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 750 "imp_parser.ml"
        ))), _, (_2 : 'tv_vh_frm_top)), _, (_3 : 'tv_code)), _, (_4 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_code = 
# 188 "imp_parser.mly"
                                ( Code_IO(_1,_2,_3,_5) )
# 755 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv912)) : 'freshtv914)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv917 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv915 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : 'tv_code_prd_list)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 177 "imp_parser.mly"
                                          (
    Code_Prd(_1,_2,_4) )
# 773 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv921 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 781 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv919 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 789 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : (
# 32 "imp_parser.mly"
      (code list)
# 796 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 175 "imp_parser.mly"
                                              (
    Code_CoPrd(_1,_2,_4) )
# 803 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv920)) : 'freshtv922)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv925 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv923 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_h_frm_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stt_code = 
# 174 "imp_parser.mly"
                                ( Canon (_2,_4) )
# 821 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv924)) : 'freshtv926)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_grm_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_grm_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv889 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 835 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 839 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_grm_pattern_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_grm_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv887 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 847 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 851 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_grm_pattern_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_grm_clique) : 'tv_def_grm_clique) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 858 "imp_parser.ml"
        ))), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 862 "imp_parser.ml"
        ))), _, (_4 : 'tv_def_grm_pattern_ord)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_grm_clique = 
# 74 "imp_parser.mly"
                                                   ()
# 868 "imp_parser.ml"
         in
        _menhir_goto_def_grm_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv888)) : 'freshtv890)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv893 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_grm_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv891 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_grm_clique) : 'tv_def_grm_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 70 "imp_parser.mly"
                           ( Flow_Clq [] )
# 885 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv892)) : 'freshtv894)
    | _ ->
        _menhir_fail ()

and _menhir_run163 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 894 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState163
    | L_HLZ ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState163
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState163
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState163

and _menhir_run158 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState158
    | L_HLZ ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState158
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState158
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158

and _menhir_reduce121 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_tail = 
# 195 "imp_parser.mly"
    ( Rtn 0 )
# 932 "imp_parser.ml"
     in
    _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v

and _menhir_run149 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | EOP ->
        _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState149
    | IN _v ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
    | OUT _v ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState149 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149

and _menhir_goto_def_grm_pattern_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_grm_pattern_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv885 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 962 "imp_parser.ml"
    )) * (
# 14 "imp_parser.mly"
       (string)
# 966 "imp_parser.ml"
    ))) * _menhir_state * 'tv_def_grm_pattern_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ORD_COPRD ->
        _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState212
    | ORD_LEX_COPRD ->
        _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState212
    | SLF _v ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState212 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv883 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 982 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 986 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_grm_pattern_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 991 "imp_parser.ml"
        ))), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 995 "imp_parser.ml"
        ))), _, (_4 : 'tv_def_grm_pattern_ord)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_grm_clique = 
# 73 "imp_parser.mly"
                                      ()
# 1001 "imp_parser.ml"
         in
        _menhir_goto_def_grm_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv884)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212) : 'freshtv886)

and _menhir_goto_code_coprd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 32 "imp_parser.mly"
      (code list)
# 1012 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv875 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 1022 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv871 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 1034 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161) : 'freshtv872)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv873 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 1054 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv874)) : 'freshtv876)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv881 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 1063 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv877 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 1075 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState173
            | COPRD | COPRD_END | DTA | DTA_GRM | LCE | MDL_END | M_HLZ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState173
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173) : 'freshtv878)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv879 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 1095 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv880)) : 'freshtv882)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code_prd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv863 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv859 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState156
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156) : 'freshtv860)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv861 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv862)) : 'freshtv864)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv869 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv865 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState170
            | COPRD | COPRD_END | DTA | DTA_GRM | LCE | MDL_END | M_HLZ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState170
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv866)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv867 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv868)) : 'freshtv870)
    | _ ->
        _menhir_fail ()

and _menhir_goto_eop : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eop -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState137 | MenhirState140 | MenhirState154 | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv855 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv856)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv857 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1190 "imp_parser.ml"
        )) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState167
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState167
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167) : 'freshtv858)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_grm_predictive : _menhir_env -> 'ttv_tail -> 'tv_def_grm_predictive -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv853 * _menhir_state * 'tv_def_grm_pattern_list) = Obj.magic _menhir_stack in
    let (_v : 'tv_def_grm_predictive) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv851 * _menhir_state * 'tv_def_grm_pattern_list) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_def_grm_predictive) : 'tv_def_grm_predictive) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_grm_pattern_list)) = _menhir_stack in
    let _v : 'tv_def_grm_rule = 
# 85 "imp_parser.mly"
                                            ()
# 1218 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv849) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_grm_rule) = _v in
    ((match _menhir_s with
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv843 * _menhir_state * 'tv_ord_coprd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv841 * _menhir_state * 'tv_ord_coprd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_grm_rule) : 'tv_def_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_ord_coprd)) = _menhir_stack in
        let _v : 'tv_def_grm_pattern_ord = 
# 77 "imp_parser.mly"
                           ()
# 1238 "imp_parser.ml"
         in
        _menhir_goto_def_grm_pattern_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv842)) : 'freshtv844)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv847 * _menhir_state * 'tv_def_grm_pattern_ord) * _menhir_state * 'tv_ord_coprd) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv845 * _menhir_state * 'tv_def_grm_pattern_ord) * _menhir_state * 'tv_ord_coprd) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_grm_rule) : 'tv_def_grm_rule) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_def_grm_pattern_ord)), _, (_2 : 'tv_ord_coprd)) = _menhir_stack in
        let _v : 'tv_def_grm_pattern_ord = 
# 78 "imp_parser.mly"
                                                ()
# 1254 "imp_parser.ml"
         in
        _menhir_goto_def_grm_pattern_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv846)) : 'freshtv848)
    | _ ->
        _menhir_fail ()) : 'freshtv850)) : 'freshtv852)) : 'freshtv854)

and _menhir_reduce16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 32 "imp_parser.mly"
      (code list)
# 1265 "imp_parser.ml"
    ) = 
# 200 "imp_parser.mly"
    ( [] )
# 1269 "imp_parser.ml"
     in
    _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_prd_list = 
# 205 "imp_parser.mly"
    ( [] )
# 1278 "imp_parser.ml"
     in
    _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run138 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 1285 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv839) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 1295 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 1299 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_eop = 
# 192 "imp_parser.mly"
        ()
# 1304 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv840)

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 1311 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | AGL | APP_EVL | ARR | CHO | CNT | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState139
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139

and _menhir_run141 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv837) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eop = 
# 191 "imp_parser.mly"
        ()
# 1337 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv838)

and _menhir_run142 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState142
    | L_HLZ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv835 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState142 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | L_HLZ ->
            _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
            _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143) : 'freshtv836)
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState142
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142

and _menhir_goto_def_grm_pattern_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_grm_pattern_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState213 | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv829 * _menhir_state * 'tv_def_grm_pattern_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NOT_SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv823) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | L_OPN ->
                _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState207
            | NAM _v ->
                _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
            | STG _v ->
                _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207) : 'freshtv824)
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv825) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | L_OPN ->
                _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | NAM _v ->
                _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
            | STG _v ->
                _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv826)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv827 * _menhir_state * 'tv_def_grm_pattern_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv828)) : 'freshtv830)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv833 * _menhir_state * 'tv_def_grm_pattern) * _menhir_state * 'tv_def_grm_pattern_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv831 * _menhir_state * 'tv_def_grm_pattern) * _menhir_state * 'tv_def_grm_pattern_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_def_grm_pattern)), _, (_2 : 'tv_def_grm_pattern_list)) = _menhir_stack in
        let _v : 'tv_def_grm_pattern_list = 
# 89 "imp_parser.mly"
                                          ()
# 1436 "imp_parser.ml"
         in
        _menhir_goto_def_grm_pattern_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv832)) : 'freshtv834)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_grm_pattern : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_grm_pattern -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv815) * _menhir_state * 'tv_def_grm_pattern) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv813) * _menhir_state * 'tv_def_grm_pattern) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_def_grm_pattern)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_grm_predictive = 
# 100 "imp_parser.mly"
                        ()
# 1456 "imp_parser.ml"
         in
        _menhir_goto_def_grm_predictive _menhir_env _menhir_stack _v) : 'freshtv814)) : 'freshtv816)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv819) * _menhir_state * 'tv_def_grm_pattern) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv817) * _menhir_state * 'tv_def_grm_pattern) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_def_grm_pattern)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_grm_predictive = 
# 101 "imp_parser.mly"
                            ()
# 1469 "imp_parser.ml"
         in
        _menhir_goto_def_grm_predictive _menhir_env _menhir_stack _v) : 'freshtv818)) : 'freshtv820)
    | MenhirState213 | MenhirState210 | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv821 * _menhir_state * 'tv_def_grm_pattern) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | L_OPN ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | NAM _v ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _v
        | STG _v ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState210 _v
        | NOT_SPL | SPL ->
            _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) MenhirState210
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState210) : 'freshtv822)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv811 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exp_top) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv809 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_exp_top) : 'tv_exp_top) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typ_ept)) = _menhir_stack in
    let _v : 'tv_vh_frm_top = 
# 215 "imp_parser.mly"
                    ( let (e,m) = _2 in (_1,e,m) )
# 1509 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv807) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_top) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv799 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv795 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv793 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 1533 "imp_parser.ml"
            ) = 
# 36 "imp_parser.mly"
                   ( Evo (Seq (_1,Rtn 0)) )
# 1537 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv794)) : 'freshtv796)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv797 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv798)) : 'freshtv800)
    | MenhirState135 | MenhirState163 | MenhirState158 | MenhirState145 | MenhirState143 | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv801 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | EOP ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | IN _v ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _v
        | OUT _v ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _v
        | PRD | PRD_END ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | COPRD | COPRD_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState137) : 'freshtv802)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv803 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1574 "imp_parser.ml"
        )) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | EOP ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | IN _v ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | OUT _v ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv804)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv805 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | EOP ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | IN _v ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
        | OUT _v ->
            _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
        | PRD | PRD_END ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | COPRD | COPRD_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154) : 'freshtv806)
    | _ ->
        _menhir_fail ()) : 'freshtv808)) : 'freshtv810)) : 'freshtv812)

and _menhir_reduce32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_def_grm_pattern_list = 
# 88 "imp_parser.mly"
    ()
# 1621 "imp_parser.ml"
     in
    _menhir_goto_def_grm_pattern_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run191 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 1628 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv791) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1638 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1642 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_def_grm_pattern = 
# 92 "imp_parser.mly"
        ()
# 1647 "imp_parser.ml"
     in
    _menhir_goto_def_grm_pattern _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)

and _menhir_run192 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 1654 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv789) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1664 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1668 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_def_grm_pattern = 
# 93 "imp_parser.mly"
        ()
# 1673 "imp_parser.ml"
     in
    _menhir_goto_def_grm_pattern _menhir_env _menhir_stack _menhir_s _v) : 'freshtv790)

and _menhir_run193 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv777 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 1689 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv773 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1700 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv771 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1707 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 1712 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_grm_pattern = 
# 95 "imp_parser.mly"
                    ()
# 1719 "imp_parser.ml"
             in
            _menhir_goto_def_grm_pattern _menhir_env _menhir_stack _menhir_s _v) : 'freshtv772)) : 'freshtv774)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv775 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1729 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv776)) : 'freshtv778)
    | STG _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv785 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 1739 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv781 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1750 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv779 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1757 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 1762 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_grm_pattern = 
# 97 "imp_parser.mly"
                    ()
# 1769 "imp_parser.ml"
             in
            _menhir_goto_def_grm_pattern _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)) : 'freshtv782)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv783 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1779 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv784)) : 'freshtv786)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv787 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)

and _menhir_run198 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv759 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 1803 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv755 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1814 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv753 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1821 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 1826 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_grm_pattern = 
# 94 "imp_parser.mly"
                    ()
# 1833 "imp_parser.ml"
             in
            _menhir_goto_def_grm_pattern _menhir_env _menhir_stack _menhir_s _v) : 'freshtv754)) : 'freshtv756)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv757 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1843 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv758)) : 'freshtv760)
    | STG _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv767 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 1853 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv763 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1864 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv761 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1871 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 1876 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_grm_pattern = 
# 96 "imp_parser.mly"
                    ()
# 1883 "imp_parser.ml"
             in
            _menhir_goto_def_grm_pattern _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)) : 'freshtv764)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv765 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 1893 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv766)) : 'freshtv768)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv769 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv770)

and _menhir_goto_macro : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_macro -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv747 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 1913 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv745 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 1921 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_macro) : 'tv_macro) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 33 "imp_parser.mly"
      (opr)
# 1928 "imp_parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_exp_top = 
# 219 "imp_parser.mly"
                  ( (_2,_3) )
# 1934 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv746)) : 'freshtv748)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv751 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv749 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_macro) : 'tv_macro) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
        let _v : 'tv_exp_top = 
# 218 "imp_parser.mly"
                  ( (Opr_Rcd _1,_2) )
# 1950 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv750)) : 'freshtv752)
    | _ ->
        _menhir_fail ()

and _menhir_run136 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState136
    | L_HLZ ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState136
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState136
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136

and _menhir_goto_ord_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv741 * _menhir_state * 'tv_ord_coprd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState190
        | L_OPN ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState190
        | NAM _v ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
        | STG _v ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
        | NOT_SPL | SPL ->
            _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) MenhirState190
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190) : 'freshtv742)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv743 * _menhir_state * 'tv_def_grm_pattern_ord) * _menhir_state * 'tv_ord_coprd) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run198 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | L_OPN ->
            _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | NAM _v ->
            _menhir_run192 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
        | STG _v ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
        | NOT_SPL | SPL ->
            _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213) : 'freshtv744)
    | _ ->
        _menhir_fail ()

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv735 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv731 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv729 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 2042 "imp_parser.ml"
            ) = 
# 268 "imp_parser.mly"
                         ( _2 )
# 2046 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv730)) : 'freshtv732)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv733 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv734)) : 'freshtv736)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv739 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2061 "imp_parser.ml"
        )) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv737 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2067 "imp_parser.ml"
        )) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (opr)
# 2072 "imp_parser.ml"
        ))), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 277 "imp_parser.mly"
                 ( App (Opr_Name "cns",Opr_Rcd [_1;_2]) )
# 2077 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv738)) : 'freshtv740)
    | _ ->
        _menhir_fail ()

and _menhir_goto_macro_list : _menhir_env -> 'ttv_tail -> 'tv_macro_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv727 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv721 * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv717 * 'tv_macro_list)) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 2103 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LET ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv713 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 2114 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | AGL ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | APP_EVL ->
                    _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | CHO ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | CNT ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | EMT ->
                    _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | EXN ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | INJ ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | INT _v ->
                    _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
                | L_LST ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | L_OPN ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | L_PRN ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | L_RCD ->
                    _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | L_VCT ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | MLT_EVL ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | NAM _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
                | PLS_EVL ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | ROT _v ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
                | SGN ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | SLF _v ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
                | STG _v ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
                | VCT ->
                    _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv714)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv715 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 2172 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv716)) : 'freshtv718)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv719 * 'tv_macro_list)) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv720)) : 'freshtv722)
    | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv723 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_macro_list)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_macro = 
# 223 "imp_parser.mly"
                    ( _2 )
# 2189 "imp_parser.ml"
         in
        _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v) : 'freshtv724)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv725 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv726)) : 'freshtv728)

and _menhir_reduce105 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_macro = 
# 222 "imp_parser.mly"
    ( [] )
# 2205 "imp_parser.ml"
     in
    _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv711) = Obj.magic _menhir_stack in
    ((let _v : 'tv_macro_list = 
# 226 "imp_parser.mly"
    ( [] )
# 2218 "imp_parser.ml"
     in
    _menhir_goto_macro_list _menhir_env _menhir_stack _v) : 'freshtv712)

and _menhir_goto_subst_list : _menhir_env -> 'ttv_tail -> 'tv_subst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv709 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2229 "imp_parser.ml"
    )) * _menhir_state) * 'tv_subst_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv701 * 'tv_subst_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | APP_EVL ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | CHO ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | CNT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | EMT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | EXN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | INJ ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | INT _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | L_LST ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | L_OPN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | L_PRN ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | L_RCD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | L_VCT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | MLT_EVL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | NAM _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | PLS_EVL ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | ROT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | SGN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | SLF _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | STG _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | VCT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv702)
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv705 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2291 "imp_parser.ml"
        )) * _menhir_state) * 'tv_subst_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv703 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2298 "imp_parser.ml"
        )) * _menhir_state) * 'tv_subst_list) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 33 "imp_parser.mly"
      (opr)
# 2303 "imp_parser.ml"
        ))), _), (_4 : 'tv_subst_list)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (
# 33 "imp_parser.mly"
      (opr)
# 2311 "imp_parser.ml"
        ) = 
# 269 "imp_parser.mly"
                                   ( raise @@ Failure "macro:1" )
# 2315 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv704)) : 'freshtv706)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv707 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2325 "imp_parser.ml"
        )) * _menhir_state) * 'tv_subst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv708)) : 'freshtv710)

and _menhir_run51 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2333 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run53 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2390 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_run60 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2447 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60

and _menhir_run55 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2504 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_run62 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2561 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState62
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62

and _menhir_run57 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2618 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv699 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2626 "imp_parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (opr)
# 2632 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 2638 "imp_parser.ml"
    ) = 
# 259 "imp_parser.mly"
            ( Cast _1 )
# 2642 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv700)

and _menhir_run58 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 2649 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv689 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2711 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv687 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2719 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 2726 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 127 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 2733 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)) : 'freshtv690)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv693 * (
# 14 "imp_parser.mly"
       (string)
# 2741 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv691 * (
# 14 "imp_parser.mly"
       (string)
# 2749 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2756 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 117 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 2762 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv692)) : 'freshtv694)
    | MenhirState240 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv697 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2770 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv695 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2778 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2785 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 109 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 2791 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)) : 'freshtv698)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv677 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2805 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv675 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2813 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 2820 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 131 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 2827 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv676)) : 'freshtv678)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv681 * (
# 14 "imp_parser.mly"
       (string)
# 2835 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv679 * (
# 14 "imp_parser.mly"
       (string)
# 2843 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2850 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 118 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 2856 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv680)) : 'freshtv682)
    | MenhirState240 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv685 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2864 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv683 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2872 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2879 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 110 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 2885 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)) : 'freshtv686)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv673 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | DTA_GRM ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | LCE ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | MDL_END ->
        _menhir_reduce94 _menhir_env (Obj.magic _menhir_stack) MenhirState259
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState259) : 'freshtv674)

and _menhir_run18 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | L_RCD ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | N ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_run20 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | L_RCD ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | N ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20

and _menhir_run22 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_BLK ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState22 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | APP_EVL ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | CHO ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | CNT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | EMT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | EXN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | INJ ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | INT _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | L_LST ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | L_OPN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | L_PRN ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | L_RCD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | L_VCT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | MLT_EVL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | NAM _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | PLS_EVL ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | ROT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | SGN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | SLF _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | STG _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | VCT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv672)
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | L_RCD ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | N ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv669 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3057 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv665 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3067 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv661 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3077 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 3082 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | L_HLZ ->
                _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState135
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv662)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv663 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3105 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv664)) : 'freshtv666)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv667 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3116 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv668)) : 'freshtv670)

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv659) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_coprd = 
# 82 "imp_parser.mly"
                  ()
# 3131 "imp_parser.ml"
     in
    _menhir_goto_ord_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv660)

and _menhir_run189 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv657) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord_coprd = 
# 81 "imp_parser.mly"
              ()
# 3145 "imp_parser.ml"
     in
    _menhir_goto_ord_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv658)

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv651 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3157 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv649 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3165 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3172 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 123 "imp_parser.mly"
                  ( _1::_2 )
# 3177 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv650)) : 'freshtv652)
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv655 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 3185 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv653 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 3193 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 3200 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 111 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3207 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)) : 'freshtv656)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv645 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | APP_EVL ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | CHO ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | CNT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | EMT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | EXN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | INJ ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | INT _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | L_LST ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_OPN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_PRN ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_RCD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | L_VCT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MLT_EVL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | NAM _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | PLS_EVL ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | ROT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv643 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState34 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv641 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3271 "imp_parser.ml"
            ) = 
# 265 "imp_parser.mly"
                        ( Opr_Rcd _2 )
# 3275 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv642)) : 'freshtv644)
        | SGN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | SLF _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | STG _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | VCT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv646)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv647 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | APP_EVL ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | CHO ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | CNT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | EMT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | EXN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | INJ ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | INT _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | L_LST ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | L_OPN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | L_PRN ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | L_RCD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | L_VCT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | MLT_EVL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | NAM _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | PLS_EVL ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | ROT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | SGN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | SLF _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | SPL ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | STG _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | VCT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            _menhir_reduce105 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv648)
    | _ ->
        _menhir_fail ()

and _menhir_reduce103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 276 "imp_parser.mly"
    ( App (Opr_Name "nil",Opr_Rcd []) )
# 3354 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "imp_parser.mly"
      (opr)
# 3361 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv565 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3371 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | R_BLK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv563 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3395 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState49 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv561 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3403 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 33 "imp_parser.mly"
      (opr)
# 3409 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3416 "imp_parser.ml"
            ) = 
# 240 "imp_parser.mly"
                  ( Agl _2 )
# 3420 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv562)) : 'freshtv564)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv566)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv569 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3432 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3436 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv567 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3442 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3446 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (opr)
# 3451 "imp_parser.ml"
        ))), _), _, (_3 : (
# 33 "imp_parser.mly"
      (opr)
# 3455 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3461 "imp_parser.ml"
        ) = 
# 264 "imp_parser.mly"
                ( Prj (_1,_3) )
# 3465 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)) : 'freshtv570)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv573 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3473 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3477 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | LET | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv571 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3495 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3499 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (opr)
# 3504 "imp_parser.ml"
            ))), _), _, (_3 : (
# 33 "imp_parser.mly"
      (opr)
# 3508 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3514 "imp_parser.ml"
            ) = 
# 256 "imp_parser.mly"
                ( App (Opr_Name "+", Opr_Rcd [_1;_3]) )
# 3518 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv572)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54) : 'freshtv574)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv577 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3530 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3534 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | LET | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv575 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3550 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3554 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (opr)
# 3559 "imp_parser.ml"
            ))), _), _, (_3 : (
# 33 "imp_parser.mly"
      (opr)
# 3563 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3569 "imp_parser.ml"
            ) = 
# 257 "imp_parser.mly"
                ( App (Opr_Name "*",Opr_Rcd [_1;_3]) )
# 3573 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv578)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv581 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3585 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3589 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | AGL | APP | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | LET | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv579 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3603 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3607 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (opr)
# 3612 "imp_parser.ml"
            ))), _), _, (_3 : (
# 33 "imp_parser.mly"
      (opr)
# 3616 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3622 "imp_parser.ml"
            ) = 
# 263 "imp_parser.mly"
                ( App (_1,_3) )
# 3626 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv580)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv582)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv585 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3638 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3642 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | LET | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv583 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3660 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3664 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (opr)
# 3669 "imp_parser.ml"
            ))), _), _, (_3 : (
# 33 "imp_parser.mly"
      (opr)
# 3673 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3679 "imp_parser.ml"
            ) = 
# 258 "imp_parser.mly"
                ( App (Opr_Name "+",Opr_Rcd [_1;App (Opr_Name "-",_3)]) )
# 3683 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61) : 'freshtv586)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv589 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3695 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3699 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | LET | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv587 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3721 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3725 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (opr)
# 3730 "imp_parser.ml"
            ))), _), _, (_3 : (
# 33 "imp_parser.mly"
      (opr)
# 3734 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3740 "imp_parser.ml"
            ) = 
# 261 "imp_parser.mly"
               ( App(Opr_Name "=",Opr_Rcd [_1;_3]) )
# 3744 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv590)
    | MenhirState66 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv591 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3756 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | APP_EVL ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | CHO ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | CNT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | EMT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | EXN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | INJ ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | INT _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | L_LST ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | L_OPN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | L_PRN ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | L_RCD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | L_VCT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MLT_EVL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | NAM _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PLS_EVL ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | ROT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | SGN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | SLF _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | STG _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | VCT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | R_LST ->
            _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv592)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3828 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv595 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3852 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState68 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv593 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3860 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 33 "imp_parser.mly"
      (opr)
# 3866 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3873 "imp_parser.ml"
            ) = 
# 267 "imp_parser.mly"
                    ( Opr_Some _2 )
# 3877 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)) : 'freshtv596)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv598)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv603 * _menhir_state) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3889 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv601 * _menhir_state) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3913 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState70 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv599 * _menhir_state) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3921 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : (
# 33 "imp_parser.mly"
      (opr)
# 3927 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3935 "imp_parser.ml"
            ) = 
# 260 "imp_parser.mly"
                        ( App (Opr_Name "-",_3) )
# 3939 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv600)) : 'freshtv602)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv604)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv609 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3951 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv607 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3975 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState72 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv605 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 3983 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 33 "imp_parser.mly"
      (opr)
# 3989 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 33 "imp_parser.mly"
      (opr)
# 3996 "imp_parser.ml"
            ) = 
# 262 "imp_parser.mly"
                    ( _2 )
# 4000 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv606)) : 'freshtv608)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72) : 'freshtv610)
    | MenhirState108 | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv613 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4012 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv611 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4036 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : (
# 33 "imp_parser.mly"
      (opr)
# 4041 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 236 "imp_parser.mly"
                 ( _1@[_2] )
# 4046 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74) : 'freshtv614)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4058 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv617 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4082 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState75 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv615) = Obj.magic _menhir_stack in
            ((let _v : 'tv_subst_list = 
# 272 "imp_parser.mly"
    ( [] )
# 4092 "imp_parser.ml"
             in
            _menhir_goto_subst_list _menhir_env _menhir_stack _v) : 'freshtv616)) : 'freshtv618)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv620)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv623 * 'tv_subst_list)) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4104 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | LET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv621 * 'tv_subst_list)) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4120 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState80 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | APP_EVL ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | CHO ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | CNT ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | EMT ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | EXN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | INJ ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | INT _v ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | L_LST ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | L_OPN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | L_PRN ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | L_RCD ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | L_VCT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | MLT_EVL ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | NAM _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | PLS_EVL ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | ROT _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | SGN ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | SLF _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | STG _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | VCT ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv622)
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv624)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv627 * 'tv_subst_list)) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4190 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4194 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | CMM | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv625 * 'tv_subst_list)) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4218 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4222 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, (_1 : 'tv_subst_list)), _, (_3 : (
# 33 "imp_parser.mly"
      (opr)
# 4227 "imp_parser.ml"
            ))), _), _, (_5 : (
# 33 "imp_parser.mly"
      (opr)
# 4231 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_subst_list = 
# 273 "imp_parser.mly"
                               ( _1@[(_3,_5)] )
# 4238 "imp_parser.ml"
             in
            _menhir_goto_subst_list _menhir_env _menhir_stack _v) : 'freshtv626)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv628)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv633 * _menhir_state * 'tv_typ)) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4250 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | R_BLK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv631 * _menhir_state * 'tv_typ)) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4274 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState83 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv629 * _menhir_state * 'tv_typ)) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4282 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _), _, (_4 : (
# 33 "imp_parser.mly"
      (opr)
# 4288 "imp_parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _2 = () in
            let _v : 'tv_typ = 
# 144 "imp_parser.mly"
                             ( DepTyp (_4,_1) )
# 4296 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)) : 'freshtv632)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv634)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv635 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4308 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | SPL ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            _menhir_reduce105 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99) : 'freshtv636)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv639 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 4340 "imp_parser.ml"
        ))) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4344 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | CST ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EQ ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | MLT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | MNS ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | PLS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | PRJ ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | ARR | CMM | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv637 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 4368 "imp_parser.ml"
            ))) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 4372 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : 'tv_macro_list)), (_3 : (
# 14 "imp_parser.mly"
       (string)
# 4377 "imp_parser.ml"
            ))), _, (_5 : (
# 33 "imp_parser.mly"
      (opr)
# 4381 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_macro_list = 
# 227 "imp_parser.mly"
                                ( _1@[(_3,_5)] )
# 4388 "imp_parser.ml"
             in
            _menhir_goto_macro_list _menhir_env _menhir_stack _v) : 'freshtv638)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105) : 'freshtv640)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv517 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv513 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv511 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 142 "imp_parser.mly"
                        ( _2 )
# 4420 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv512)) : 'freshtv514)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv515 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv516)) : 'freshtv518)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv525 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv521 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv519 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_ept = 
# 231 "imp_parser.mly"
                    ( _2 )
# 4448 "imp_parser.ml"
             in
            _menhir_goto_typ_ept _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)) : 'freshtv522)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv523 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv524)) : 'freshtv526)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv531) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv527) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState131
            | DEF | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
                _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState131
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131) : 'freshtv528)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv529) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv530)) : 'freshtv532)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv535) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv533) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 170 "imp_parser.mly"
                            ( (_2,_4) )
# 4496 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv534)) : 'freshtv536)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv547 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv543 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv539 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4517 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState225
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv537 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 4530 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 4535 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 130 "imp_parser.mly"
                         ( [(_2,_4)] )
# 4542 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv538)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState225) : 'freshtv540)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv541 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv542)) : 'freshtv544)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv545 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv546)) : 'freshtv548)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv559 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv555 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv551 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4581 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState230
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv549 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 4594 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 4599 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 126 "imp_parser.mly"
                           ( [(_2,_4)] )
# 4606 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv550)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230) : 'freshtv552)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv553 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv554)) : 'freshtv556)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv557 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv558)) : 'freshtv560)
    | _ ->
        _menhir_fail ()

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
# 65 "imp_parser.mly"
            ( _1 )
# 4643 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv508)) : 'freshtv510)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv501 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4655 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv499 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4663 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 4670 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 105 "imp_parser.mly"
                                        ( [_2]@_3 )
# 4675 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv505 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv503 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 68 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 4692 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)) : 'freshtv506)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv441 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv435 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 147 "imp_parser.mly"
                    ( Typ_App (Typ_Name "list",_2) )
# 4726 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv436)) : 'freshtv438)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv439 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv440)) : 'freshtv442)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv447 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv443 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 145 "imp_parser.mly"
                ( Typ_Vct (_1,_3) )
# 4752 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv444)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv445 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv446)) : 'freshtv448)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv453 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv449 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 152 "imp_parser.mly"
                ( Typ_App (_1,_3) )
# 4778 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv450)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv451 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv452)) : 'freshtv454)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv459 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv455 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 143 "imp_parser.mly"
                (Typ_App (_1,_3) )
# 4806 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv456)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv457 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv458)) : 'freshtv460)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv467 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv463 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv461 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 146 "imp_parser.mly"
                    ( Typ_Opn _2 )
# 4840 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)) : 'freshtv464)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv465 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv466)) : 'freshtv468)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv473 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | L_LST | L_OPN | L_RCD | N | NAM _ | R_RCD | SGN | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typs = 
# 139 "imp_parser.mly"
             ( _1@[_2] )
# 4869 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv470)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv471 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv472)) : 'freshtv474)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv479 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4884 "imp_parser.ml"
        ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv475 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4900 "imp_parser.ml"
            ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 4905 "imp_parser.ml"
            ))), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 153 "imp_parser.mly"
                    ( Typ_For_All (_1,_3) )
# 4911 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv476)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv477 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4921 "imp_parser.ml"
            ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv478)) : 'freshtv480)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | R_RCD | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv481 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 135 "imp_parser.mly"
            ( _2 )
# 4945 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv482)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv483 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv484)) : 'freshtv486)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv491 * (
# 14 "imp_parser.mly"
       (string)
# 4960 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv487 * (
# 14 "imp_parser.mly"
       (string)
# 4976 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 4981 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body_clq = 
# 119 "imp_parser.mly"
                         ( Def_Eqv (_1,_2,_4) )
# 4987 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv488)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv489 * (
# 14 "imp_parser.mly"
       (string)
# 4997 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv490)) : 'freshtv492)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv497 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5006 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv493 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5022 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5027 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 113 "imp_parser.mly"
                         ( Def_Eqv (_1,_2,_4) )
# 5033 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv494)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv495 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5043 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv496)) : 'freshtv498)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv413 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv411 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 61 "imp_parser.mly"
                        ( _1::_2 )
# 5063 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv412)) : 'freshtv414)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv433) * (
# 14 "imp_parser.mly"
       (string)
# 5071 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv429) * (
# 14 "imp_parser.mly"
       (string)
# 5081 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv427) * (
# 14 "imp_parser.mly"
       (string)
# 5087 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_2 : (
# 14 "imp_parser.mly"
       (string)
# 5092 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_arg)), _, (_5 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 43 "imp_parser.mly"
                                           ( (_2,_3,_5) )
# 5100 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv425) = _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv423) = Obj.magic _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv421) = Obj.magic _menhir_stack in
            let ((_1 : 'tv_def_mdl) : 'tv_def_mdl) = _v in
            ((let _v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5114 "imp_parser.ml"
            ) = 
# 40 "imp_parser.mly"
            ( Util.pnt flg "parse:file\n"; _1 )
# 5118 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv419) = _menhir_stack in
            let (_v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5125 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv417) = Obj.magic _menhir_stack in
            let (_v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5132 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv415) = Obj.magic _menhir_stack in
            let ((_1 : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5139 "imp_parser.ml"
            )) : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 5143 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv416)) : 'freshtv418)) : 'freshtv420)) : 'freshtv422)) : 'freshtv424)) : 'freshtv426)) : 'freshtv428)) : 'freshtv430)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv431) * (
# 14 "imp_parser.mly"
       (string)
# 5153 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv432)) : 'freshtv434)
    | _ ->
        _menhir_fail ()

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5163 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127

and _menhir_run128 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5180 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv405) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv406)
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 169 "imp_parser.mly"
    ( (Typ_Btm,Typ_Top) )
# 5207 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv408)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv409 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5217 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv410)

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5225 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv401 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5237 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5242 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv397 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5253 "imp_parser.ml"
            )) * (
# 14 "imp_parser.mly"
       (string)
# 5257 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ORD_COPRD ->
                _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState187
            | ORD_LEX_COPRD ->
                _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState187
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187) : 'freshtv398)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv399 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5277 "imp_parser.ml"
            )) * (
# 14 "imp_parser.mly"
       (string)
# 5281 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv400)) : 'freshtv402)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5292 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv404)

and _menhir_run218 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5300 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv393) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5313 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END | SLF _ ->
            _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219) : 'freshtv394)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv395 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5334 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv396)

and _menhir_run248 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5342 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState248 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5356 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5361 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 122 "imp_parser.mly"
        ( [_1] )
# 5366 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState248

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 47 "imp_parser.mly"
             ( _2 )
# 5391 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)) : 'freshtv386)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_args = 
# 50 "imp_parser.mly"
             ( [_1]@_2 )
# 5407 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)) : 'freshtv390)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arg_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv381 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState117
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv379 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState117 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv377 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_arg_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_arg = 
# 53 "imp_parser.mly"
                          ( Arg_Rcd _2 )
# 5437 "imp_parser.ml"
         in
        _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv378)) : 'freshtv380)
    | VAL _v ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv382)

and _menhir_reduce89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 235 "imp_parser.mly"
    ( [] )
# 5452 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv375) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5466 "imp_parser.ml"
    ) = 
# 249 "imp_parser.mly"
        ( Opr_Name "#" )
# 5470 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5477 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv373) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 5487 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 5491 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5496 "imp_parser.ml"
    ) = 
# 254 "imp_parser.mly"
        ( Opr_Stg _1 )
# 5500 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5507 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5517 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5521 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5526 "imp_parser.ml"
    ) = 
# 255 "imp_parser.mly"
        ( Self _1 )
# 5530 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv369) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5544 "imp_parser.ml"
    ) = 
# 253 "imp_parser.mly"
        ( Opr_Name "&" )
# 5548 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5555 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv367) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5565 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5569 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5574 "imp_parser.ml"
    ) = 
# 248 "imp_parser.mly"
        ( Root _1 )
# 5578 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv365) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5592 "imp_parser.ml"
    ) = 
# 242 "imp_parser.mly"
            ( Opr_Name "+" )
# 5596 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5603 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv363) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 5613 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 5617 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5622 "imp_parser.ml"
    ) = 
# 252 "imp_parser.mly"
         ( Opr_Name _1 )
# 5626 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv361) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5640 "imp_parser.ml"
    ) = 
# 243 "imp_parser.mly"
            ( Opr_Name "*" )
# 5644 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce89 _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | MNS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv359 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState36 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | APP_EVL ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | CHO ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | CNT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | EMT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | EXN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | INJ ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | INT _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | L_LST ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | L_OPN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | L_PRN ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | L_RCD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | L_VCT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | MLT_EVL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | NAM _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | PLS_EVL ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | ROT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | SGN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | SLF _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | STG _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | VCT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37) : 'freshtv360)
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | R_OPN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState38 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv355 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5868 "imp_parser.ml"
        ) = 
# 266 "imp_parser.mly"
                ( Opr_None )
# 5872 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)) : 'freshtv358)
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | R_LST ->
        _menhir_reduce103 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5946 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv353) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5956 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5960 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5965 "imp_parser.ml"
    ) = 
# 241 "imp_parser.mly"
        ( Opr_Z _1 )
# 5969 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 5983 "imp_parser.ml"
    ) = 
# 250 "imp_parser.mly"
        ( Opr_Name "↑" )
# 5987 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 6001 "imp_parser.ml"
    ) = 
# 247 "imp_parser.mly"
        ( Opr_Name "?" )
# 6005 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 6019 "imp_parser.ml"
    ) = 
# 245 "imp_parser.mly"
        ( Opr_Name "⋎" )
# 6023 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv348)

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv345) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 6037 "imp_parser.ml"
    ) = 
# 246 "imp_parser.mly"
        ( Opr_Name "⋏" )
# 6041 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv343) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 6055 "imp_parser.ml"
    ) = 
# 251 "imp_parser.mly"
        ( Opr_Name "↓"  )
# 6059 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv341) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (opr)
# 6073 "imp_parser.ml"
    ) = 
# 244 "imp_parser.mly"
            ( Opr_Name "◂" )
# 6077 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | APP_EVL ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | CHO ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | CNT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | EMT ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | EXN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | INJ ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | INT _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | L_LST ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | L_OPN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | L_PRN ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | L_RCD ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | L_VCT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | MLT_EVL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NAM _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | PLS_EVL ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | ROT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | SGN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | SLF _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | STG _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | VCT ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv339 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_RCD ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | N ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13
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
    | CLN | DEF | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 134 "imp_parser.mly"
         ( Typ_Rcd _1 )
# 6167 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv340)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv335 * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv333 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_def_typ_body) : 'tv_def_typ_body) = _v in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_typ = 
# 69 "imp_parser.mly"
                     ( Flow _2 )
# 6195 "imp_parser.ml"
     in
    _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv334)) : 'freshtv336)

and _menhir_goto_def_typ_body_clq : _menhir_env -> 'ttv_tail -> 'tv_def_typ_body_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv331 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6206 "imp_parser.ml"
    )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv329 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6218 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 6223 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 104 "imp_parser.mly"
                         ( [_2] )
# 6228 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv330)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState236) : 'freshtv332)

and _menhir_run222 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222

and _menhir_run227 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState227
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState227
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState227

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 150 "imp_parser.mly"
      ( Typ_Z )
# 6276 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 6283 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 6293 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 6297 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 148 "imp_parser.mly"
        ( Typ_Val _1 )
# 6302 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv326)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 155 "imp_parser.mly"
            ( Typ_Name "ℾ" )
# 6316 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 154 "imp_parser.mly"
        ( Typ_Sgn )
# 6330 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 6337 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6349 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | L_OPN ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | L_RCD ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | N ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | NAM _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
        | SGN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | TYP_STG ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | VAL _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
        | Z ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv316)
    | APP | CLN | DEF | DTA | DTA_GRM | IO | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6381 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 6386 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_typ = 
# 149 "imp_parser.mly"
        ( Typ_Name _1 )
# 6391 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv319 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6401 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv313) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 151 "imp_parser.mly"
      ( Typ_Name "ℕ")
# 6416 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | L_LST | L_OPN | L_RCD | N | NAM _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce143 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | L_RCD ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | N ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState14
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

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_RCD ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | N ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NAM _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | SGN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | TYP_STG ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | VAL _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_reduce94 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 60 "imp_parser.mly"
      ( [] )
# 6498 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run126 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | SLF _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184

and _menhir_run217 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState217 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv305 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 6550 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv299 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6561 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | L_BLK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv295 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6571 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | INT _v ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv291 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6581 "imp_parser.ml"
                        )))) = Obj.magic _menhir_stack in
                        let (_v : (
# 15 "imp_parser.mly"
       (int)
# 6586 "imp_parser.ml"
                        )) = _v in
                        ((let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | R_BLK ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv287 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6597 "imp_parser.ml"
                            )))) * (
# 15 "imp_parser.mly"
       (int)
# 6601 "imp_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | ISO ->
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv283 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6611 "imp_parser.ml"
                                )))) * (
# 15 "imp_parser.mly"
       (int)
# 6615 "imp_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | NAM _v ->
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv279 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6625 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 6629 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    let (_v : (
# 14 "imp_parser.mly"
       (string)
# 6634 "imp_parser.ml"
                                    )) = _v in
                                    ((let _menhir_env = _menhir_discard _menhir_env in
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv277 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6641 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 6645 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    let ((_8 : (
# 14 "imp_parser.mly"
       (string)
# 6650 "imp_parser.ml"
                                    )) : (
# 14 "imp_parser.mly"
       (string)
# 6654 "imp_parser.ml"
                                    )) = _v in
                                    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 6659 "imp_parser.ml"
                                    ))), (_5 : (
# 15 "imp_parser.mly"
       (int)
# 6663 "imp_parser.ml"
                                    ))) = _menhir_stack in
                                    let _7 = () in
                                    let _6 = () in
                                    let _4 = () in
                                    let _3 = () in
                                    let _1 = () in
                                    let _v : 'tv_def_typ_body = 
# 112 "imp_parser.mly"
                                          ( Def_Fnt_Dep (_2,_5,_8) )
# 6673 "imp_parser.ml"
                                     in
                                    _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv278)) : 'freshtv280)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv281 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6683 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 6687 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)) : 'freshtv284)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv285 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6698 "imp_parser.ml"
                                )))) * (
# 15 "imp_parser.mly"
       (int)
# 6702 "imp_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv286)) : 'freshtv288)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv289 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6713 "imp_parser.ml"
                            )))) * (
# 15 "imp_parser.mly"
       (int)
# 6717 "imp_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)) : 'freshtv292)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv293 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6728 "imp_parser.ml"
                        )))) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)) : 'freshtv296)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv297 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6739 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)) : 'freshtv300)
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv301 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6748 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run248 _menhir_env (Obj.magic _menhir_stack) MenhirState247 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState247) : 'freshtv302)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv303 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6766 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)) : 'freshtv306)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv307 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv308)) : 'freshtv310)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState217 in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 6784 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState238
        | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END ->
            _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState238
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState238) : 'freshtv312)
    | SLF _v ->
        _menhir_run218 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217

and _menhir_goto_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv267 * _menhir_state * 'tv_arg_list) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state * 'tv_arg_list) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_arg_list)), _, (_2 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 57 "imp_parser.mly"
                  ( _1@[_2] )
# 6818 "imp_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)) : 'freshtv268)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 56 "imp_parser.mly"
        ( [_1] )
# 6830 "imp_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv270)) : 'freshtv272)
    | MenhirState122 | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | VAL _v ->
            _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | DEF | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv273 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
            let _v : 'tv_args = 
# 49 "imp_parser.mly"
        ( [_1] )
# 6850 "imp_parser.ml"
             in
            _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv276)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_ept : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_ept -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv263 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState97 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | APP_EVL ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | CHO ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | CNT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | EMT ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | EXN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | INJ ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | INT _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
        | L_LST ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | L_OPN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | L_PRN ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | L_RCD ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | L_VCT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | MLT_EVL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | NAM _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
        | PLS_EVL ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | ROT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
        | SGN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | SLF _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
        | STG _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
        | VCT ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv262)
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce89 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97) : 'freshtv264)

and _menhir_reduce143 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 138 "imp_parser.mly"
    ( [] )
# 6934 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | L_OPN ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | L_RCD ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | N ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState4
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
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv239) * (
# 14 "imp_parser.mly"
       (string)
# 6976 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv235) * (
# 14 "imp_parser.mly"
       (string)
# 6986 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DTA ->
                _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | DTA_GRM ->
                _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | LCE ->
                _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | MDL_END ->
                _menhir_reduce94 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv236)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv237) * (
# 14 "imp_parser.mly"
       (string)
# 7010 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)) : 'freshtv240)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv249 * (
# 14 "imp_parser.mly"
       (string)
# 7019 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv241 * (
# 14 "imp_parser.mly"
       (string)
# 7029 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | L_OPN ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | L_RCD ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | N ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | NAM _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState234 _v
            | SGN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | TYP_STG ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState234 _v
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState234) : 'freshtv242)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv243 * (
# 14 "imp_parser.mly"
       (string)
# 7061 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | PRD ->
                _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState221
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState221) : 'freshtv244)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv245 * (
# 14 "imp_parser.mly"
       (string)
# 7079 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 7084 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body_clq = 
# 116 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 7089 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv246)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv247 * (
# 14 "imp_parser.mly"
       (string)
# 7099 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)) : 'freshtv250)
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7108 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv251 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7118 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState243
            | L_OPN ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState243
            | L_RCD ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState243
            | N ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState243
            | NAM _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
            | SGN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState243
            | TYP_STG ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState243
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState243 _v
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState243
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243) : 'freshtv252)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv253 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7150 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run227 _menhir_env (Obj.magic _menhir_stack) MenhirState240
            | PRD ->
                _menhir_run222 _menhir_env (Obj.magic _menhir_stack) MenhirState240
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState240) : 'freshtv254)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv255 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7168 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 7173 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body = 
# 108 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 7178 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv257 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7188 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)) : 'freshtv260)
    | _ ->
        _menhir_fail ()

and _menhir_run115 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 7198 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv233) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 7208 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 7212 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_arg = 
# 52 "imp_parser.mly"
        ( Arg_Val _1 )
# 7217 "imp_parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv234)

and _menhir_run116 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState116
    | VAL _v ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116

and _menhir_reduce139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typ_ept = 
# 230 "imp_parser.mly"
     ( Typ_Top )
# 7241 "imp_parser.ml"
     in
    _menhir_goto_typ_ept _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 31 "imp_parser.mly"
      (Types.buffer)
# 7248 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv231) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 7257 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv229) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 7265 "imp_parser.ml"
    )) : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 7269 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv230)) : 'freshtv232)

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
    | MenhirState259 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7301 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv25 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 7310 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv27 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7319 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState240 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv29 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7328 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7337 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7346 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * (
# 14 "imp_parser.mly"
       (string)
# 7355 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv37 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 7364 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 7378 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * (
# 14 "imp_parser.mly"
       (string)
# 7392 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * (
# 14 "imp_parser.mly"
       (string)
# 7401 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv48)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * 'tv_def_grm_pattern_ord) * _menhir_state * 'tv_ord_coprd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv53 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7419 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 7423 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_grm_pattern_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState210 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state * 'tv_def_grm_pattern) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv60)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state * 'tv_ord_coprd) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv63 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7450 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 7454 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7468 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv69 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 7482 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv73 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv75 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7496 "imp_parser.ml"
        )) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv77 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7505 "imp_parser.ml"
        )) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 7514 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv81 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 32 "imp_parser.mly"
      (code list)
# 7523 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv85 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv87 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv93 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * _menhir_state * 'tv_stt_code)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv97 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv101 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7577 "imp_parser.ml"
        )) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7586 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv109 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 7605 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 7609 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv111) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv114)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7627 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv119) * (
# 14 "imp_parser.mly"
       (string)
# 7641 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129) * (
# 14 "imp_parser.mly"
       (string)
# 7670 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv130)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv133 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 7683 "imp_parser.ml"
        ))) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7687 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv135 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 7696 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv136)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7704 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv143 * _menhir_state * 'tv_typ)) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7723 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv145 * 'tv_subst_list)) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7732 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7736 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv147 * 'tv_subst_list)) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7745 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv149 * 'tv_subst_list)) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7754 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * 'tv_subst_list)) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv152)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7767 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7776 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7785 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7794 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7803 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7812 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7821 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7825 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7834 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7843 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7847 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7856 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7865 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7869 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7878 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv177 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7887 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7891 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv179 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7900 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7909 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7913 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7922 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7931 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state * (
# 33 "imp_parser.mly"
      (opr)
# 7940 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv197 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv205 * _menhir_state * 'tv_typ)) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 8029 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv228)

and _menhir_reduce20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_def_arg = 
# 46 "imp_parser.mly"
    ( [] )
# 8053 "imp_parser.ml"
     in
    _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_run114 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | VAL _v ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState114 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114

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
# 8097 "imp_parser.ml"
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
# 8127 "imp_parser.ml"
            ) = 
# 37 "imp_parser.mly"
                ( End )
# 8131 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)) : 'freshtv14)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
    | AGL | APP_EVL | CHO | CNT | EMT | EOF | EXN | EXP | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | L_VCT | MLT_EVL | NAM _ | PLS_EVL | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce139 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv20))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 30 "imp_parser.mly"
      (Types.mdl)
# 8151 "imp_parser.ml"
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
# 8172 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState113
            | DEF ->
                _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState113
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv2)
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
  

# 8202 "imp_parser.ml"
