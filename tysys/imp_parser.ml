
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
  | MenhirState243
  | MenhirState232
  | MenhirState231
  | MenhirState227
  | MenhirState224
  | MenhirState222
  | MenhirState220
  | MenhirState218
  | MenhirState214
  | MenhirState211
  | MenhirState209
  | MenhirState206
  | MenhirState205
  | MenhirState203
  | MenhirState201
  | MenhirState197
  | MenhirState192
  | MenhirState191
  | MenhirState188
  | MenhirState185
  | MenhirState180
  | MenhirState179
  | MenhirState176
  | MenhirState173
  | MenhirState169
  | MenhirState166
  | MenhirState162
  | MenhirState159
  | MenhirState153
  | MenhirState151
  | MenhirState148
  | MenhirState146
  | MenhirState143
  | MenhirState141
  | MenhirState140
  | MenhirState139
  | MenhirState138
  | MenhirState136
  | MenhirState133
  | MenhirState131
  | MenhirState130
  | MenhirState129
  | MenhirState128
  | MenhirState126
  | MenhirState125
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

# 249 "imp_parser.ml"

let rec _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv941) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv939) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 65 "imp_parser.mly"
            ( _1 )
# 264 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv940)) : 'freshtv942)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv933 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 276 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv931 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 284 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 291 "imp_parser.ml"
        ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
        let _v : 'tv_glb_etr_clique = 
# 169 "imp_parser.mly"
                                    ( [_2]@_3 )
# 296 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv932)) : 'freshtv934)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv937 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv935 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 165 "imp_parser.mly"
                       ( Etr_Clq _2 )
# 313 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv936)) : 'freshtv938)
    | _ ->
        _menhir_fail ()

and _menhir_goto_h_frm_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv917 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv915 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_h_frm_list = 
# 258 "imp_parser.mly"
                              ( _1::_3 )
# 333 "imp_parser.ml"
         in
        _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv923 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv919 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv920)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv921 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv922)) : 'freshtv924)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv929 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv925 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv926)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv927 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv928)) : 'freshtv930)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stt_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stt_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv881 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 402 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | OUT _v ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv882)
    | MenhirState122 | MenhirState133 | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv889 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv883 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | L_HLZ ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133) : 'freshtv884)
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv885 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)) = _menhir_stack in
            let _v : 'tv_h_frm_list = 
# 257 "imp_parser.mly"
             ( [_1] )
# 444 "imp_parser.ml"
             in
            _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv886)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv887 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv888)) : 'freshtv890)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv891 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 459 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState140
        | OUT _v ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv892)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv895 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv893 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_prd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_prd_list = 
# 253 "imp_parser.mly"
                                ( _1@[_3] )
# 482 "imp_parser.ml"
         in
        _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv899 * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 490 "imp_parser.ml"
        ))) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv897 * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 496 "imp_parser.ml"
        ))) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 33 "imp_parser.mly"
      (code list)
# 501 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 33 "imp_parser.mly"
      (code list)
# 507 "imp_parser.ml"
        ) = 
# 248 "imp_parser.mly"
                                    ( _1@[_3] )
# 511 "imp_parser.ml"
         in
        _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv898)) : 'freshtv900)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv913 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 519 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 523 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv911 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 529 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 533 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 538 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)), (_4 : (
# 15 "imp_parser.mly"
       (int)
# 542 "imp_parser.ml"
        ))), _, (_5 : 'tv_stt_code)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_glb_etr_body = 
# 172 "imp_parser.mly"
                                (
    let (src,dst) = Ty.typing _5 in
    (_1,src,dst,_5)
  )
# 551 "imp_parser.ml"
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
# 564 "imp_parser.ml"
            )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv901 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 576 "imp_parser.ml"
                )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 581 "imp_parser.ml"
                ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
                let _v : 'tv_glb_etr_clique = 
# 168 "imp_parser.mly"
                     ( [_2] )
# 586 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv902)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169) : 'freshtv904)
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
# 603 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv906)) : 'freshtv908)
        | _ ->
            _menhir_fail ()) : 'freshtv910)) : 'freshtv912)) : 'freshtv914)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv871 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv869 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_code) : 'tv_code) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 211 "imp_parser.mly"
                        (
    ( match _3 with
      | None -> Some (Code_Exp _2)
      | Some x -> Some (Seq (Code_Exp _2,x)) ) )
# 631 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)) : 'freshtv872)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv875 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv873 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 243 "imp_parser.mly"
             ( _2 )
# 648 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv874)) : 'freshtv876)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv879 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv877 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 182 "imp_parser.mly"
                    (
      match _2 with
      | None -> Code_Exp _1
      | Some x -> Seq (Code_Exp _1,x) )
# 667 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv878)) : 'freshtv880)
    | _ ->
        _menhir_fail ()

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv835 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv833 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 215 "imp_parser.mly"
                                    (
    ( match _5 with
      | None -> Some (Canon _3)
      | Some x -> Some (Seq(Canon _3,x))
      )
  )
# 697 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv834)) : 'freshtv836)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv839 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 705 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv837 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 713 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : (
# 15 "imp_parser.mly"
       (int)
# 720 "imp_parser.ml"
        ))), _, (_4 : 'tv_stt_code)), _, (_5 : 'tv_eop)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 231 "imp_parser.mly"
                                        (
    let c = Code_IO(_2,_4) in
    match _6 with
      | None -> Some c
      | Some x -> Some (Seq(c,x)) )
# 730 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv838)) : 'freshtv840)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv843 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv841 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_tail) : 'tv_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_code = 
# 210 "imp_parser.mly"
             ( _2 )
# 746 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv842)) : 'freshtv844)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv847 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv845 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : 'tv_code_prd_list)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 226 "imp_parser.mly"
                                              (
    let c = Code_Prd(_2,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (Seq(c,x))  )
# 768 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv846)) : 'freshtv848)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv851 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 776 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv849 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 784 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : (
# 33 "imp_parser.mly"
      (code list)
# 791 "imp_parser.ml"
        ))) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 221 "imp_parser.mly"
                                                  (
    let c = Code_CoPrd(_2,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (Seq(c,x)) )
# 802 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv850)) : 'freshtv852)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv855 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 810 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv853 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 818 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : (
# 15 "imp_parser.mly"
       (int)
# 825 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)), _, (_4 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 203 "imp_parser.mly"
                                    (
    let c = Code_IO(_1,_3) in
    match _5 with
      | None -> c
      | Some x -> (Seq(c,x)) )
# 834 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv854)) : 'freshtv856)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv859 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv857 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : 'tv_code_prd_list)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 197 "imp_parser.mly"
                                          (
    let c = Code_Prd(_1,_2) in
    match _4 with
    | None -> c
    | Some x -> Seq(c,x)
  )
# 856 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv858)) : 'freshtv860)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv863 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 864 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv861 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 872 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : (
# 33 "imp_parser.mly"
      (code list)
# 879 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 191 "imp_parser.mly"
                                              (
    let c = Code_CoPrd(_1,_2) in
    match _4 with
    | None -> c
    | Some x -> Seq(c,x)
   )
# 890 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv862)) : 'freshtv864)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv867 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv865 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_h_frm_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stt_code = 
# 186 "imp_parser.mly"
                                (
    match _4 with
    | None -> Canon _2
    | Some x -> Seq(Canon _2,x)
  )
# 912 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv866)) : 'freshtv868)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv821 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 926 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 930 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv819 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 938 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 942 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 949 "imp_parser.ml"
        ))), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 953 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ord)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_clq = 
# 78 "imp_parser.mly"
                                ( (_2,[],_4)::_5 )
# 959 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv820)) : 'freshtv822)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv831 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv829 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 976 "imp_parser.ml"
        ) = 
# 74 "imp_parser.mly"
                    ( _2 )
# 980 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv827) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 988 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv825) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 996 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv823) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 1004 "imp_parser.ml"
        )) : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 1008 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 71 "imp_parser.mly"
            ( Gram _1 )
# 1013 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv824)) : 'freshtv826)) : 'freshtv828)) : 'freshtv830)) : 'freshtv832)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv817 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv815 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 92 "imp_parser.mly"
                      ( _1@[_2] )
# 1033 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv816)) : 'freshtv818)

and _menhir_run153 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1040 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState153
    | L_HLZ ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState153
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState153
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153

and _menhir_run148 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | L_HLZ ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148

and _menhir_reduce121 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_tail = 
# 242 "imp_parser.mly"
    ( None  )
# 1078 "imp_parser.ml"
     in
    _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | EOP ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | OUT _v ->
        _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv813 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1106 "imp_parser.ml"
    )) * (
# 14 "imp_parser.mly"
       (string)
# 1110 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ORD_COPRD ->
        _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState197
    | ORD_LEX_COPRD ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState197
    | SLF _v ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState197 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv811 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1126 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 1130 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 1135 "imp_parser.ml"
        ))), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 1139 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ord)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_clq = 
# 77 "imp_parser.mly"
                          ( [(_2,[],_4)] )
# 1145 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv812)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState197) : 'freshtv814)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv797 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv793 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv791 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 97 "imp_parser.mly"
                         ( Peg.Option _2 )
# 1175 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)) : 'freshtv794)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv795 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv796)) : 'freshtv798)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv805 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv801 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv799 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 96 "imp_parser.mly"
                         ( Peg.List _2 )
# 1203 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv800)) : 'freshtv802)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv803 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv804)) : 'freshtv806)
    | MenhirState180 | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv809 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv807 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 95 "imp_parser.mly"
             ( _1 )
# 1222 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)) : 'freshtv810)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code_coprd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "imp_parser.mly"
      (code list)
# 1231 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv783 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1241 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv779 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1253 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState151
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv780)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv781 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1273 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv782)) : 'freshtv784)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv789 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1282 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv785 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1294 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState162
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState162
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv786)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv787 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 1314 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv788)) : 'freshtv790)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code_prd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv771 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv767 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv768)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv769 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv770)) : 'freshtv772)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv777 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv773 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState159
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState159
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv774)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv775 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv776)) : 'freshtv778)
    | _ ->
        _menhir_fail ()

and _menhir_goto_eop : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eop -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv761 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1395 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv762)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv763 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1413 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv764)
    | MenhirState123 | MenhirState129 | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv765 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce121 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143) : 'freshtv766)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv759 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_prd) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv757 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_rule = 
# 84 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 1457 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv755) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule) = _v in
    ((match _menhir_s with
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv749) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv747) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let _v : 'tv_grm_ord = 
# 81 "imp_parser.mly"
             ( [(_1,None)] )
# 1476 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv748)) : 'freshtv750)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv753 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv751 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 82 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 1492 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv752)) : 'freshtv754)
    | _ ->
        _menhir_fail ()) : 'freshtv756)) : 'freshtv758)) : 'freshtv760)

and _menhir_run181 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 1501 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv745) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1511 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1515 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 100 "imp_parser.mly"
        ( Peg.Text _1 )
# 1520 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv746)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv743 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState191 : 'freshtv744)

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 1534 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv741) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1544 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1548 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 101 "imp_parser.mly"
        ( Peg.Name _1 )
# 1553 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv742)

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | STG _v ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _v
    | STG _v ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188

and _menhir_reduce16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 33 "imp_parser.mly"
      (code list)
# 1592 "imp_parser.ml"
    ) = 
# 247 "imp_parser.mly"
    ( [] )
# 1596 "imp_parser.ml"
     in
    _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_prd_list = 
# 252 "imp_parser.mly"
    ( [] )
# 1605 "imp_parser.ml"
     in
    _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run124 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 1612 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv739) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 1622 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 1626 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_eop = 
# 239 "imp_parser.mly"
        ()
# 1631 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv740)

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv737) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eop = 
# 238 "imp_parser.mly"
        ()
# 1645 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv738)

and _menhir_run130 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState130
    | L_HLZ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv735 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState130 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | L_HLZ ->
            _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
            _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131) : 'freshtv736)
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState130
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv729 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | L_OPN ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | NAM _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
        | NOT_SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv721) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState180 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv719) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 109 "imp_parser.mly"
            ( Peg.Not )
# 1710 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv720)) : 'freshtv722)
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv725) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState180 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv723) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 108 "imp_parser.mly"
        ( Peg.And )
# 1725 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv724)) : 'freshtv726)
        | STG _v ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
        | DTA | DTA_GRM | LCE | MDL_END | ORD_COPRD | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv727) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState180 in
            ((let _v : 'tv_grm_prd = 
# 104 "imp_parser.mly"
    ( None )
# 1737 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv728)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv730)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv733 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | L_OPN ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState192
        | NAM _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _v
        | STG _v ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState192 _v
        | DTA | DTA_GRM | LCE | MDL_END | ORD_COPRD | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv731 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 105 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1765 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState192) : 'freshtv734)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv717 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exp_top) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv715 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_exp_top) : 'tv_exp_top) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typ_ept)) = _menhir_stack in
    let _v : 'tv_vh_frm_top = 
# 262 "imp_parser.mly"
                    ( let (e,m) = _2 in (_1,e,m) )
# 1789 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv713) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_top) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv703 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv699 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv697 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 1813 "imp_parser.ml"
            ) = 
# 37 "imp_parser.mly"
                   ( Evo (Code_Exp _1) )
# 1817 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv698)) : 'freshtv700)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv701 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv702)) : 'freshtv704)
    | MenhirState121 | MenhirState153 | MenhirState148 | MenhirState139 | MenhirState133 | MenhirState131 | MenhirState125 | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv707 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | EOP ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv705 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState123 in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 1844 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | L_HLZ ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv706)
        | OUT _v ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | PRD | PRD_END ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | COPRD | COPRD_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv708)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv711 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | EOP ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv709 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState138 in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 1887 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState139
            | L_HLZ ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState139
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState139
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139) : 'freshtv710)
        | OUT _v ->
            _menhir_run124 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
        | PRD | PRD_END ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | COPRD | COPRD_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv712)
    | _ ->
        _menhir_fail ()) : 'freshtv714)) : 'freshtv716)) : 'freshtv718)

and _menhir_reduce97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 91 "imp_parser.mly"
    ( [] )
# 1921 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_macro : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_macro -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv691 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1933 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv689 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 1941 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_macro) : 'tv_macro) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 1948 "imp_parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_exp_top = 
# 266 "imp_parser.mly"
                  ( (_2,_3) )
# 1954 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv690)) : 'freshtv692)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv695 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv693 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_macro) : 'tv_macro) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
        let _v : 'tv_exp_top = 
# 265 "imp_parser.mly"
                  ( (Opr_Rcd _1,_2) )
# 1970 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv694)) : 'freshtv696)
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
    | L_HLZ ->
        _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState122
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv687 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce97 _menhir_env (Obj.magic _menhir_stack) MenhirState179 : 'freshtv688)

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv681 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv677 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv675 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 2022 "imp_parser.ml"
            ) = 
# 315 "imp_parser.mly"
                         ( _2 )
# 2026 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv676)) : 'freshtv678)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv679 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv680)) : 'freshtv682)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv685 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2041 "imp_parser.ml"
        )) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv683 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2047 "imp_parser.ml"
        )) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 2052 "imp_parser.ml"
        ))), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 323 "imp_parser.mly"
                 ( Opr_App (Opr_Name "cns",Opr_Rcd [_1;_2]) )
# 2057 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)) : 'freshtv686)
    | _ ->
        _menhir_fail ()

and _menhir_goto_macro_list : _menhir_env -> 'ttv_tail -> 'tv_macro_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv673 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv667 * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv663 * 'tv_macro_list)) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 2083 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LET ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv659 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 2094 "imp_parser.ml"
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
                | INJ ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState90
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
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv660)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv661 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 2150 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv662)) : 'freshtv664)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv665 * 'tv_macro_list)) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv666)) : 'freshtv668)
    | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv669 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_macro_list)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_macro = 
# 270 "imp_parser.mly"
                    ( _2 )
# 2167 "imp_parser.ml"
         in
        _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv672)) : 'freshtv674)

and _menhir_reduce104 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_macro = 
# 269 "imp_parser.mly"
    ( [] )
# 2183 "imp_parser.ml"
     in
    _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv657) = Obj.magic _menhir_stack in
    ((let _v : 'tv_macro_list = 
# 273 "imp_parser.mly"
    ( [] )
# 2196 "imp_parser.ml"
     in
    _menhir_goto_macro_list _menhir_env _menhir_stack _v) : 'freshtv658)

and _menhir_run61 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2203 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv653 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2215 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "imp_parser.mly"
       (int)
# 2220 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv651 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2227 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 15 "imp_parser.mly"
       (int)
# 2232 "imp_parser.ml"
        )) : (
# 15 "imp_parser.mly"
       (int)
# 2236 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 2241 "imp_parser.ml"
        ))), _) = _menhir_stack in
        let _2 = () in
        let _v : (
# 34 "imp_parser.mly"
      (opr)
# 2247 "imp_parser.ml"
        ) = 
# 311 "imp_parser.mly"
                ( Prj (_1,_3) )
# 2251 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv652)) : 'freshtv654)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv655 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2261 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv656)

and _menhir_run63 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2269 "imp_parser.ml"
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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState63
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
# 2324 "imp_parser.ml"
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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState70
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
# 2379 "imp_parser.ml"
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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState65
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
# 2434 "imp_parser.ml"
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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState72
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
# 2489 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv649 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2497 "imp_parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 2503 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 2509 "imp_parser.ml"
    ) = 
# 306 "imp_parser.mly"
            ( Opr_App(Opr_Name "//",_1) )
# 2513 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv650)

and _menhir_run68 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 2520 "imp_parser.ml"
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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState68
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
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv639 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2580 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv637 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2588 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 2595 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 135 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 2602 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)) : 'freshtv640)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv643 * (
# 14 "imp_parser.mly"
       (string)
# 2610 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv641 * (
# 14 "imp_parser.mly"
       (string)
# 2618 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2625 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 125 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 2631 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv642)) : 'freshtv644)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv647 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2639 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv645 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2647 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2654 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 117 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 2660 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv646)) : 'freshtv648)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv627 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2674 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv625 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 2682 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 2689 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 139 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 2696 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv626)) : 'freshtv628)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv631 * (
# 14 "imp_parser.mly"
       (string)
# 2704 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv629 * (
# 14 "imp_parser.mly"
       (string)
# 2712 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2719 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 126 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 2725 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv630)) : 'freshtv632)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv635 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2733 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv633 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2741 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2748 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 118 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 2754 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv634)) : 'freshtv636)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv623 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | DTA_GRM ->
        _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | LCE ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | MDL_END ->
        _menhir_reduce79 _menhir_env (Obj.magic _menhir_stack) MenhirState243
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243) : 'freshtv624)

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
    let (_menhir_stack : ('freshtv621 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2872 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2882 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv613 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2892 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 2897 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | L_HLZ ->
                _menhir_run122 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv614)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv615 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2920 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv616)) : 'freshtv618)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2931 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv620)) : 'freshtv622)

and _menhir_run177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv611) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 88 "imp_parser.mly"
                  ( Peg.Lex )
# 2946 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)

and _menhir_run178 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv609) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 87 "imp_parser.mly"
              ( Peg.Synt )
# 2960 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv610)

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv603 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2972 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv601 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2980 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2987 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 131 "imp_parser.mly"
                  ( _1::_2 )
# 2992 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv602)) : 'freshtv604)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv607 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 3000 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv605 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 3008 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 3015 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 119 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3022 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv606)) : 'freshtv608)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
        | INJ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState44
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
            let (_menhir_stack : ('freshtv595 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState44 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv593 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3084 "imp_parser.ml"
            ) = 
# 312 "imp_parser.mly"
                        ( Opr_Rcd _2 )
# 3088 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)) : 'freshtv596)
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv598)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv599 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
        | INJ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState94
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
            _menhir_reduce104 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv600)
    | _ ->
        _menhir_fail ()

and _menhir_reduce102 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 322 "imp_parser.mly"
    ( Opr_App (Opr_Name "nil",Opr_Rcd []) )
# 3165 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 34 "imp_parser.mly"
      (opr)
# 3172 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv541 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3182 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv539 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3206 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState59 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv537 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3214 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 3220 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3227 "imp_parser.ml"
            ) = 
# 287 "imp_parser.mly"
                  ( Agl _2 )
# 3231 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv538)) : 'freshtv540)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv542)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv545 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3243 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3247 "imp_parser.ml"
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
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv543 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3265 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3269 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3274 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3278 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3284 "imp_parser.ml"
            ) = 
# 303 "imp_parser.mly"
                ( Opr_App (Opr_Name "+",Opr_Rcd [_1;_3]) )
# 3288 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv544)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv546)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv549 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3300 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3304 "imp_parser.ml"
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
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv547 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3320 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3324 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3329 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3333 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3339 "imp_parser.ml"
            ) = 
# 304 "imp_parser.mly"
                ( Opr_App (Opr_Name "*",Opr_Rcd [_1;_3]) )
# 3343 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv550)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv553 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3355 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3359 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CST ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | PRJ ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | AGL | APP | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv551 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3373 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3377 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3382 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3386 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3392 "imp_parser.ml"
            ) = 
# 310 "imp_parser.mly"
                ( Opr_App (_1,_3) )
# 3396 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv554)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv557 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3408 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3412 "imp_parser.ml"
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
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv555 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3430 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3434 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3439 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3443 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3449 "imp_parser.ml"
            ) = 
# 305 "imp_parser.mly"
                ( Opr_App (Opr_Name "+",Opr_Rcd [_1;Opr_App (Opr_Name "-",_3)]) )
# 3453 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv558)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv561 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3465 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3469 "imp_parser.ml"
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
        | AGL | APP_EVL | ARR | CHO | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv559 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3491 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3495 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 34 "imp_parser.mly"
      (opr)
# 3500 "imp_parser.ml"
            ))), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3504 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3510 "imp_parser.ml"
            ) = 
# 308 "imp_parser.mly"
               ( Opr_App(Opr_Name "=",Opr_Rcd [_1;_3]) )
# 3514 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv562)
    | MenhirState76 | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv563 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3526 "imp_parser.ml"
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
        | INJ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState76
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
            _menhir_reduce102 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv564)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv569 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3596 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv567 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3620 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState78 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv565 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3628 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 3634 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3641 "imp_parser.ml"
            ) = 
# 314 "imp_parser.mly"
                    ( Opr_App(Opr_Name "‹",_2) )
# 3645 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)) : 'freshtv568)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv570)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv575 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3657 "imp_parser.ml"
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
            let (_menhir_stack : (('freshtv573 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3681 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState80 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv571 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3689 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : (
# 34 "imp_parser.mly"
      (opr)
# 3695 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3703 "imp_parser.ml"
            ) = 
# 307 "imp_parser.mly"
                        ( Opr_App (Opr_Name "-",_3) )
# 3707 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv572)) : 'freshtv574)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv576)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv581 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3719 "imp_parser.ml"
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
            let (_menhir_stack : ('freshtv579 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3743 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState82 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv577 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3751 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 3757 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 34 "imp_parser.mly"
      (opr)
# 3764 "imp_parser.ml"
            ) = 
# 309 "imp_parser.mly"
                    ( _2 )
# 3768 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)) : 'freshtv580)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv582)
    | MenhirState94 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv585 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3780 "imp_parser.ml"
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
        | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv583 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3804 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : (
# 34 "imp_parser.mly"
      (opr)
# 3809 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 283 "imp_parser.mly"
                 ( _1@[_2] )
# 3814 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv586)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3826 "imp_parser.ml"
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
            _menhir_reduce104 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv588)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv591 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 3858 "imp_parser.ml"
        ))) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3862 "imp_parser.ml"
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
            let (_menhir_stack : (((('freshtv589 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 3886 "imp_parser.ml"
            ))) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 3890 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : 'tv_macro_list)), (_3 : (
# 14 "imp_parser.mly"
       (string)
# 3895 "imp_parser.ml"
            ))), _, (_5 : (
# 34 "imp_parser.mly"
      (opr)
# 3899 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_macro_list = 
# 274 "imp_parser.mly"
                                ( _1@[(_3,_5)] )
# 3906 "imp_parser.ml"
             in
            _menhir_goto_macro_list _menhir_env _menhir_stack _v) : 'freshtv590)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv592)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv493 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv489 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv487 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 150 "imp_parser.mly"
                        ( _2 )
# 3938 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)) : 'freshtv490)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv491 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv492)) : 'freshtv494)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv501 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv497 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv495 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_ept = 
# 278 "imp_parser.mly"
                    ( _2 )
# 3966 "imp_parser.ml"
             in
            _menhir_goto_typ_ept _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)) : 'freshtv498)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv499 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv500)) : 'freshtv502)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv507) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv503) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | DEF | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
                _menhir_reduce141 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv504)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv505) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv506)) : 'freshtv508)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv511) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv509) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 179 "imp_parser.mly"
                            ( (_2,_4) )
# 4014 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv510)) : 'freshtv512)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv523 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv519 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv515 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4035 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState209
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv513 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 4048 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 4053 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 138 "imp_parser.mly"
                         ( [(_2,_4)] )
# 4060 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv514)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209) : 'freshtv516)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv517 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv518)) : 'freshtv520)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv521 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv522)) : 'freshtv524)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv535 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv531 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv527 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4099 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState214
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv525 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 4112 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 4117 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 134 "imp_parser.mly"
                           ( [(_2,_4)] )
# 4124 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv526)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214) : 'freshtv528)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv529 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv530)) : 'freshtv532)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv533 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv534)) : 'freshtv536)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv485) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv483) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 66 "imp_parser.mly"
            ( _1 )
# 4161 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv484)) : 'freshtv486)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv477 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4173 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv475 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4181 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 4188 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 113 "imp_parser.mly"
                                        ( [_2]@_3 )
# 4193 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv476)) : 'freshtv478)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv481 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv479 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 69 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 4210 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv480)) : 'freshtv482)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv419 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv417 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 154 "imp_parser.mly"
                    ( Typ_App (Typ_Name "⟦⟧",_2) )
# 4244 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)) : 'freshtv420)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv421 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv422)) : 'freshtv424)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv429 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv425 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 152 "imp_parser.mly"
                ( Typ_Vct (_1,_3) )
# 4270 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv427 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv428)) : 'freshtv430)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv435 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv431 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 159 "imp_parser.mly"
                ( Typ_Imp (_1,_3) )
# 4296 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv433 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv434)) : 'freshtv436)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv441 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv437 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 151 "imp_parser.mly"
                ( Typ_App (_1,_3) )
# 4324 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv439 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv440)) : 'freshtv442)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv449 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv445 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv443 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 153 "imp_parser.mly"
                    ( Typ_App (Typ_Name "‹›",_2) )
# 4358 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv444)) : 'freshtv446)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv447 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv448)) : 'freshtv450)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv455 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv451 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typs = 
# 147 "imp_parser.mly"
             ( _1@[_2] )
# 4387 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv452)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv453 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)) : 'freshtv456)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv461 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv457 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 143 "imp_parser.mly"
            ( _2 )
# 4417 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv458)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv459 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv460)) : 'freshtv462)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv467 * (
# 14 "imp_parser.mly"
       (string)
# 4432 "imp_parser.ml"
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
            let (_menhir_stack : ((('freshtv463 * (
# 14 "imp_parser.mly"
       (string)
# 4448 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 4453 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body_clq = 
# 127 "imp_parser.mly"
                         ( Def_Eqv (_1,_2,_4) )
# 4459 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv464)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv465 * (
# 14 "imp_parser.mly"
       (string)
# 4469 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv466)) : 'freshtv468)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv473 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4478 "imp_parser.ml"
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
            let (_menhir_stack : ((('freshtv469 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4494 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 4499 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 121 "imp_parser.mly"
                         ( Def_Eqv (_1,_2,_4) )
# 4505 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv470)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv471 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4515 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv472)) : 'freshtv474)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv395 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv393 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 62 "imp_parser.mly"
                        ( _1::_2 )
# 4535 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)) : 'freshtv396)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv415) * (
# 14 "imp_parser.mly"
       (string)
# 4543 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv411) * (
# 14 "imp_parser.mly"
       (string)
# 4553 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv409) * (
# 14 "imp_parser.mly"
       (string)
# 4559 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_2 : (
# 14 "imp_parser.mly"
       (string)
# 4564 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_arg)), _, (_5 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 44 "imp_parser.mly"
                                           ( (_2,_3,_5) )
# 4572 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv407) = _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv405) = Obj.magic _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv403) = Obj.magic _menhir_stack in
            let ((_1 : 'tv_def_mdl) : 'tv_def_mdl) = _v in
            ((let _v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 4586 "imp_parser.ml"
            ) = 
# 41 "imp_parser.mly"
            ( Util.pnt flg "parse:file\n"; _1 )
# 4590 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv401) = _menhir_stack in
            let (_v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 4597 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
            let (_v : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 4604 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
            let ((_1 : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 4611 "imp_parser.ml"
            )) : (
# 30 "imp_parser.mly"
      (Types.mdl)
# 4615 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv398)) : 'freshtv400)) : 'freshtv402)) : 'freshtv404)) : 'freshtv406)) : 'freshtv408)) : 'freshtv410)) : 'freshtv412)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv413) * (
# 14 "imp_parser.mly"
       (string)
# 4625 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv414)) : 'freshtv416)
    | _ ->
        _menhir_fail ()

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4635 "imp_parser.ml"
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
# 4652 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce141 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv388)
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 178 "imp_parser.mly"
    ( (Typ_Val (-1),Typ_Val (-1)) )
# 4679 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv390)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4689 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv392)

and _menhir_run174 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4697 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4709 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4714 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv379 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4725 "imp_parser.ml"
            )) * (
# 14 "imp_parser.mly"
       (string)
# 4729 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ORD_COPRD ->
                _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState176
            | ORD_LEX_COPRD ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState176
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176) : 'freshtv380)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv381 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4749 "imp_parser.ml"
            )) * (
# 14 "imp_parser.mly"
       (string)
# 4753 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)) : 'freshtv384)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4764 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)

and _menhir_run202 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4772 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4785 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState203
        | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END | SLF _ ->
            _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState203
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState203) : 'freshtv376)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4806 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv378)

and _menhir_run232 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 4814 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState232 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4828 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 4833 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 130 "imp_parser.mly"
        ( [_1] )
# 4838 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 48 "imp_parser.mly"
             ( _2 )
# 4863 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)) : 'freshtv368)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_args = 
# 51 "imp_parser.mly"
             ( [_1]@_2 )
# 4879 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)) : 'freshtv372)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arg_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv363 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv361 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState103 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv359 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_arg_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_arg = 
# 54 "imp_parser.mly"
                          ( Arg_Rcd _2 )
# 4909 "imp_parser.ml"
         in
        _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)) : 'freshtv362)
    | VAL _v ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv364)

and _menhir_reduce74 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 282 "imp_parser.mly"
    ( [] )
# 4924 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv357) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 4938 "imp_parser.ml"
    ) = 
# 296 "imp_parser.mly"
        ( Opr_Name "#" )
# 4942 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 4949 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv355) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 4959 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 4963 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 4968 "imp_parser.ml"
    ) = 
# 301 "imp_parser.mly"
        ( Opr_Stg _1 )
# 4972 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4979 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv353) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 4989 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 4993 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 4998 "imp_parser.ml"
    ) = 
# 302 "imp_parser.mly"
        ( Opr_Name ">@" )
# 5002 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5016 "imp_parser.ml"
    ) = 
# 300 "imp_parser.mly"
        ( Opr_Name "&" )
# 5020 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5027 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5037 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5041 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5046 "imp_parser.ml"
    ) = 
# 295 "imp_parser.mly"
        ( Opr_Name "$" )
# 5050 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5064 "imp_parser.ml"
    ) = 
# 289 "imp_parser.mly"
            ( Opr_Name "+" )
# 5068 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv348)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5075 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv345) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 5085 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 5089 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5094 "imp_parser.ml"
    ) = 
# 299 "imp_parser.mly"
         ( Opr_Name _1 )
# 5098 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv343) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5112 "imp_parser.ml"
    ) = 
# 290 "imp_parser.mly"
            ( Opr_Name "*" )
# 5116 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce74 _menhir_env (Obj.magic _menhir_stack) MenhirState43

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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState46
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
        let (_menhir_stack : 'freshtv341 * _menhir_state) = Obj.magic _menhir_stack in
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
        | INJ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState47
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv342)
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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState48
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
        let (_menhir_stack : 'freshtv339 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState48 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5281 "imp_parser.ml"
        ) = 
# 313 "imp_parser.mly"
                ( Opr_Name "‹›" )
# 5285 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)) : 'freshtv340)
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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState50
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
        _menhir_reduce102 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5357 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv335) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5367 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5371 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5376 "imp_parser.ml"
    ) = 
# 288 "imp_parser.mly"
        ( Opr_Z _1 )
# 5380 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv336)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv333) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5394 "imp_parser.ml"
    ) = 
# 297 "imp_parser.mly"
        ( Opr_Name "↑" )
# 5398 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv334)

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv331) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5412 "imp_parser.ml"
    ) = 
# 294 "imp_parser.mly"
        ( Opr_Name "?" )
# 5416 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5430 "imp_parser.ml"
    ) = 
# 292 "imp_parser.mly"
        ( Opr_Name "⋎" )
# 5434 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv330)

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5448 "imp_parser.ml"
    ) = 
# 293 "imp_parser.mly"
        ( Opr_Name "⋏" )
# 5452 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5466 "imp_parser.ml"
    ) = 
# 298 "imp_parser.mly"
        ( Opr_Name "↓"  )
# 5470 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv326)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (opr)
# 5484 "imp_parser.ml"
    ) = 
# 291 "imp_parser.mly"
            ( Opr_Name "◂" )
# 5488 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)

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
    | INJ ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState58
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
    let (_menhir_stack : 'freshtv321 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
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
        let (_menhir_stack : 'freshtv319 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 142 "imp_parser.mly"
         ( Typ_Rcd _1 )
# 5576 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv322)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv317 * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv315 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_def_typ_body) : 'tv_def_typ_body) = _v in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_typ = 
# 70 "imp_parser.mly"
                     ( Flow _2 )
# 5604 "imp_parser.ml"
     in
    _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv316)) : 'freshtv318)

and _menhir_goto_def_typ_body_clq : _menhir_env -> 'ttv_tail -> 'tv_def_typ_body_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv313 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5615 "imp_parser.ml"
    )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv311 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5627 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 5632 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 112 "imp_parser.mly"
                         ( [_2] )
# 5637 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv312)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv314)

and _menhir_run206 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState206
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce141 _menhir_env (Obj.magic _menhir_stack) MenhirState206
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206

and _menhir_run211 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState211
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce141 _menhir_env (Obj.magic _menhir_stack) MenhirState211
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv309) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 157 "imp_parser.mly"
      ( Typ_Name "ℤ" )
# 5685 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5692 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv307) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 5702 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 5706 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 155 "imp_parser.mly"
        ( Typ_Val (-1) )
# 5711 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv308)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv305) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 161 "imp_parser.mly"
            ( Typ_Name "ℾ" )
# 5725 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv306)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv303) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 160 "imp_parser.mly"
        ( Typ_Name "&" )
# 5739 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5746 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 5756 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 5760 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 156 "imp_parser.mly"
        ( Typ_Name _1 )
# 5765 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv302)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 158 "imp_parser.mly"
      ( Typ_Name "ℕ" )
# 5779 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv300)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | L_LST | L_OPN | L_RCD | N | NAM _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce141 _menhir_env (Obj.magic _menhir_stack) MenhirState11
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

and _menhir_reduce79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 61 "imp_parser.mly"
      ( [] )
# 5861 "imp_parser.ml"
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

and _menhir_run173 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run174 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173

and _menhir_run201 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState201 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv291 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5913 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv285 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5924 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | L_BLK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv281 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5934 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | INT _v ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv277 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5944 "imp_parser.ml"
                        )))) = Obj.magic _menhir_stack in
                        let (_v : (
# 15 "imp_parser.mly"
       (int)
# 5949 "imp_parser.ml"
                        )) = _v in
                        ((let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | R_BLK ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv273 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5960 "imp_parser.ml"
                            )))) * (
# 15 "imp_parser.mly"
       (int)
# 5964 "imp_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | ISO ->
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv269 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5974 "imp_parser.ml"
                                )))) * (
# 15 "imp_parser.mly"
       (int)
# 5978 "imp_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | NAM _v ->
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv265 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5988 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 5992 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5997 "imp_parser.ml"
                                    )) = _v in
                                    ((let _menhir_env = _menhir_discard _menhir_env in
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv263 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6004 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 6008 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    let ((_8 : (
# 14 "imp_parser.mly"
       (string)
# 6013 "imp_parser.ml"
                                    )) : (
# 14 "imp_parser.mly"
       (string)
# 6017 "imp_parser.ml"
                                    )) = _v in
                                    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 6022 "imp_parser.ml"
                                    ))), (_5 : (
# 15 "imp_parser.mly"
       (int)
# 6026 "imp_parser.ml"
                                    ))) = _menhir_stack in
                                    let _7 = () in
                                    let _6 = () in
                                    let _4 = () in
                                    let _3 = () in
                                    let _1 = () in
                                    let _v : 'tv_def_typ_body = 
# 120 "imp_parser.mly"
                                          ( Def_Fnt_Dep (_2,_5,_8) )
# 6036 "imp_parser.ml"
                                     in
                                    _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv264)) : 'freshtv266)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv267 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6046 "imp_parser.ml"
                                    )))) * (
# 15 "imp_parser.mly"
       (int)
# 6050 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)) : 'freshtv270)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv271 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6061 "imp_parser.ml"
                                )))) * (
# 15 "imp_parser.mly"
       (int)
# 6065 "imp_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)) : 'freshtv274)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv275 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6076 "imp_parser.ml"
                            )))) * (
# 15 "imp_parser.mly"
       (int)
# 6080 "imp_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)) : 'freshtv278)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv279 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6091 "imp_parser.ml"
                        )))) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)) : 'freshtv282)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv283 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6102 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)) : 'freshtv286)
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv287 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6111 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231) : 'freshtv288)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv289 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6129 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)) : 'freshtv292)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv293 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)) : 'freshtv296)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState201 in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 6147 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState222
        | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END ->
            _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState222
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222) : 'freshtv298)
    | SLF _v ->
        _menhir_run202 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201

and _menhir_goto_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state * 'tv_arg_list) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv251 * _menhir_state * 'tv_arg_list) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_arg_list)), _, (_2 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 58 "imp_parser.mly"
                  ( _1@[_2] )
# 6181 "imp_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv252)) : 'freshtv254)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 57 "imp_parser.mly"
        ( [_1] )
# 6193 "imp_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)) : 'freshtv258)
    | MenhirState108 | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | VAL _v ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | DEF | DEQ | DTA | DTA_GRM | ISO | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv259 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
            let _v : 'tv_args = 
# 50 "imp_parser.mly"
        ( [_1] )
# 6213 "imp_parser.ml"
             in
            _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv262)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_ept : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_ept -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv249 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247) = Obj.magic _menhir_stack in
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
        | INJ ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState34
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv248)
    | AGL | APP_EVL | ARR | CHO | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IN _ | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce74 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv250)

and _menhir_reduce141 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 146 "imp_parser.mly"
    ( [] )
# 6295 "imp_parser.ml"
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
        let (_menhir_stack : (('freshtv225) * (
# 14 "imp_parser.mly"
       (string)
# 6337 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv221) * (
# 14 "imp_parser.mly"
       (string)
# 6347 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DTA ->
                _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | DTA_GRM ->
                _menhir_run173 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | LCE ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | MDL_END ->
                _menhir_reduce79 _menhir_env (Obj.magic _menhir_stack) MenhirState111
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv222)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv223) * (
# 14 "imp_parser.mly"
       (string)
# 6371 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)) : 'freshtv226)
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv235 * (
# 14 "imp_parser.mly"
       (string)
# 6380 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv227 * (
# 14 "imp_parser.mly"
       (string)
# 6390 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState218
            | L_OPN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState218
            | L_RCD ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState218
            | N ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState218
            | NAM _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState218 _v
            | SGN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState218
            | TYP_STG ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState218
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState218 _v
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState218
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState218) : 'freshtv228)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv229 * (
# 14 "imp_parser.mly"
       (string)
# 6422 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | PRD ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState205
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv230)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv231 * (
# 14 "imp_parser.mly"
       (string)
# 6440 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 6445 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body_clq = 
# 124 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 6450 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv232)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv233 * (
# 14 "imp_parser.mly"
       (string)
# 6460 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)) : 'freshtv236)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6469 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv237 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6479 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | L_OPN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | L_RCD ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | N ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | NAM _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState227 _v
            | SGN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | TYP_STG ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState227 _v
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState227
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState227) : 'freshtv238)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv239 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6511 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState224
            | PRD ->
                _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState224
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState224) : 'freshtv240)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv241 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6529 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 6534 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body = 
# 116 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 6539 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv243 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6549 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)) : 'freshtv246)
    | _ ->
        _menhir_fail ()

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 6559 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 6569 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 6573 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_arg = 
# 53 "imp_parser.mly"
        ( Arg_Val (-1) )
# 6578 "imp_parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)

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

and _menhir_reduce137 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typ_ept = 
# 277 "imp_parser.mly"
     ( Typ_Val (-1) )
# 6602 "imp_parser.ml"
     in
    _menhir_goto_typ_ept _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 31 "imp_parser.mly"
      (Types.buffer)
# 6609 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv217) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 6618 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 6626 "imp_parser.ml"
    )) : (
# 31 "imp_parser.mly"
      (Types.buffer)
# 6630 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv216)) : 'freshtv218)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce141 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6662 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv25 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6671 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv27 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6680 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv29 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6689 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6698 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6707 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * (
# 14 "imp_parser.mly"
       (string)
# 6716 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv37 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 6725 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 6739 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * (
# 14 "imp_parser.mly"
       (string)
# 6753 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * (
# 14 "imp_parser.mly"
       (string)
# 6762 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv48)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv51 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6775 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 6779 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState192 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv65 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6818 "imp_parser.ml"
        )) * (
# 14 "imp_parser.mly"
       (string)
# 6822 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6836 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv73 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 6850 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv75 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 6864 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 33 "imp_parser.mly"
      (code list)
# 6873 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81 * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv83 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv87 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6897 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv89 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6906 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv91 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6915 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv97 * _menhir_state * 'tv_stt_code)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6954 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6963 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6972 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv115 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6991 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 6995 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv120)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 7013 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv125) * (
# 14 "imp_parser.mly"
       (string)
# 7027 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135) * (
# 14 "imp_parser.mly"
       (string)
# 7056 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv136)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv139 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 7069 "imp_parser.ml"
        ))) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7073 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv141 * 'tv_macro_list)) * (
# 14 "imp_parser.mly"
       (string)
# 7082 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv142)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7090 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv145 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7099 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7108 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv149 * _menhir_state) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7117 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7126 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7135 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7144 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7148 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7157 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7166 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7170 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7179 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv163 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7188 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7192 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv165 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7201 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv167 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7210 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7214 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv169 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7223 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv171 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7232 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7236 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv173 * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7245 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state) * _menhir_state * (
# 34 "imp_parser.mly"
      (opr)
# 7254 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv177 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv179 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv181 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv197 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv211 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv214)

and _menhir_reduce20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_def_arg = 
# 47 "imp_parser.mly"
    ( [] )
# 7358 "imp_parser.ml"
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
# 7402 "imp_parser.ml"
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
# 7432 "imp_parser.ml"
            ) = 
# 38 "imp_parser.mly"
                ( End )
# 7436 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)) : 'freshtv14)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
    | AGL | APP_EVL | CHO | CNT | EMT | EOF | EXN | EXP | INJ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | PLS_EVL | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce137 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv20))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 30 "imp_parser.mly"
      (Types.mdl)
# 7456 "imp_parser.ml"
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
# 7477 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | DEF ->
                _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState99
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
  

# 7507 "imp_parser.ml"
