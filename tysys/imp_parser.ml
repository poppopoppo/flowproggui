
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | WC
    | VCT
    | VAL of (
# 15 "imp_parser.mly"
       (string)
# 14 "imp_parser.ml"
  )
    | TYP_VCT
    | TYP_STG
    | TYP_SGN
    | TYP_OPN_VCT
    | TEST
    | STG of (
# 15 "imp_parser.mly"
       (string)
# 24 "imp_parser.ml"
  )
    | SRC
    | SPL
    | SLH
    | SLF of (
# 16 "imp_parser.mly"
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
# 16 "imp_parser.mly"
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
# 16 "imp_parser.mly"
       (int)
# 56 "imp_parser.ml"
  )
    | ORD_LEX_COPRD
    | ORD_COPRD
    | NOT_SPL
    | NOT
    | NAT of (
# 16 "imp_parser.mly"
       (int)
# 65 "imp_parser.ml"
  )
    | NAM of (
# 15 "imp_parser.mly"
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
    | L_LST_PLS
    | L_LST
    | L_HLZ
    | L_BLK
    | LET
    | LCE
    | ISO
    | IO
    | INT of (
# 16 "imp_parser.mly"
       (int)
# 97 "imp_parser.ml"
  )
    | INJ of (
# 16 "imp_parser.mly"
       (int)
# 102 "imp_parser.ml"
  )
    | IN of (
# 16 "imp_parser.mly"
       (int)
# 107 "imp_parser.ml"
  )
    | IDX of (
# 16 "imp_parser.mly"
       (int)
# 112 "imp_parser.ml"
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
    | CHO of (
# 16 "imp_parser.mly"
       (int)
# 136 "imp_parser.ml"
  )
    | ARR_END
    | ARR
    | APP_EVL
    | APP
    | AGL_TOP
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
  | MenhirState253
  | MenhirState242
  | MenhirState241
  | MenhirState237
  | MenhirState234
  | MenhirState232
  | MenhirState230
  | MenhirState228
  | MenhirState224
  | MenhirState221
  | MenhirState219
  | MenhirState216
  | MenhirState215
  | MenhirState213
  | MenhirState211
  | MenhirState208
  | MenhirState206
  | MenhirState205
  | MenhirState203
  | MenhirState198
  | MenhirState197
  | MenhirState194
  | MenhirState191
  | MenhirState188
  | MenhirState183
  | MenhirState182
  | MenhirState179
  | MenhirState176
  | MenhirState172
  | MenhirState169
  | MenhirState165
  | MenhirState162
  | MenhirState156
  | MenhirState154
  | MenhirState151
  | MenhirState149
  | MenhirState146
  | MenhirState144
  | MenhirState143
  | MenhirState142
  | MenhirState141
  | MenhirState139
  | MenhirState136
  | MenhirState134
  | MenhirState133
  | MenhirState132
  | MenhirState131
  | MenhirState129
  | MenhirState128
  | MenhirState126
  | MenhirState125
  | MenhirState124
  | MenhirState120
  | MenhirState118
  | MenhirState116
  | MenhirState115
  | MenhirState114
  | MenhirState111
  | MenhirState106
  | MenhirState105
  | MenhirState103
  | MenhirState102
  | MenhirState97
  | MenhirState94
  | MenhirState93
  | MenhirState88
  | MenhirState87
  | MenhirState85
  | MenhirState83
  | MenhirState81
  | MenhirState79
  | MenhirState76
  | MenhirState75
  | MenhirState74
  | MenhirState73
  | MenhirState72
  | MenhirState71
  | MenhirState70
  | MenhirState68
  | MenhirState67
  | MenhirState66
  | MenhirState65
  | MenhirState61
  | MenhirState60
  | MenhirState59
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
  open Ty
  open Imp_parser_header

# 272 "imp_parser.ml"

let rec _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv973) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv971) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 86 "imp_parser.mly"
            ( _1 )
# 287 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv972)) : 'freshtv974)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv965 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 299 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv963 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 307 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 314 "imp_parser.ml"
        ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
        let _v : 'tv_glb_etr_clique = 
# 203 "imp_parser.mly"
                                    ( [_2]@_3 )
# 319 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv964)) : 'freshtv966)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv969 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv967 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 199 "imp_parser.mly"
                       ( Etr_Clq (SgnMap.empty,_2) )
# 336 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv968)) : 'freshtv970)
    | _ ->
        _menhir_fail ()

and _menhir_goto_h_frm_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv949 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv947 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_h_frm_list = 
# 295 "imp_parser.mly"
                              ( _1::_3 )
# 356 "imp_parser.ml"
         in
        _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv948)) : 'freshtv950)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv955 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv951 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState139
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState139
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139) : 'freshtv952)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv953 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv954)) : 'freshtv956)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv961 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv957 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState169
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState169
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169) : 'freshtv958)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv959 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv960)) : 'freshtv962)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stt_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stt_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv913 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 425 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | OUT _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv914)
    | MenhirState125 | MenhirState136 | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv921 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv915 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | L_HLZ ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv916)
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv917 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)) = _menhir_stack in
            let _v : 'tv_h_frm_list = 
# 294 "imp_parser.mly"
             ( [_1] )
# 467 "imp_parser.ml"
             in
            _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv918)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv919 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv920)) : 'freshtv922)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv923 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 482 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | OUT _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState143 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143) : 'freshtv924)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv927 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv925 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_prd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_prd_list = 
# 290 "imp_parser.mly"
                                ( _1@[_3] )
# 505 "imp_parser.ml"
         in
        _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv926)) : 'freshtv928)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv931 * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 513 "imp_parser.ml"
        ))) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv929 * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 519 "imp_parser.ml"
        ))) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 35 "imp_parser.mly"
      (code list)
# 524 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 35 "imp_parser.mly"
      (code list)
# 530 "imp_parser.ml"
        ) = 
# 285 "imp_parser.mly"
                                    ( _1@[_3] )
# 534 "imp_parser.ml"
         in
        _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv930)) : 'freshtv932)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv945 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 542 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 16 "imp_parser.mly"
       (int)
# 546 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv943 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 552 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 16 "imp_parser.mly"
       (int)
# 556 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 561 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)), (_4 : (
# 16 "imp_parser.mly"
       (int)
# 565 "imp_parser.ml"
        ))), _, (_5 : 'tv_stt_code)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_glb_etr_body = 
# 206 "imp_parser.mly"
                                (
    (* let (scm,(src,dst)) = Ty.typing $5 in *)
  (*  let (src,dst) = (Val (Sgn.ini()),Val (Sgn.ini())) in
    let b = Ty.typing_vh [] (Ty.vh_of_code $5) src dst in *
    ($1,SgnMap.empty,Ty.subst b src,Ty.subst b dst,$5) *)
    (_1,Val (Sgn.ini()),Val(Sgn.ini()),_5)
  )
# 577 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv941) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState116 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv935 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 590 "imp_parser.ml"
            )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv933 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 602 "imp_parser.ml"
                )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 607 "imp_parser.ml"
                ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
                let _v : 'tv_glb_etr_clique = 
# 202 "imp_parser.mly"
                     ( [_2] )
# 612 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv934)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv936)
        | MenhirState115 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv939 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv937 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 198 "imp_parser.mly"
                     ( Etr(SgnMap.empty,_2)  )
# 629 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv938)) : 'freshtv940)
        | _ ->
            _menhir_fail ()) : 'freshtv942)) : 'freshtv944)) : 'freshtv946)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv903 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv901 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_code) : 'tv_code) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 248 "imp_parser.mly"
                        (
    ( match _3 with
      | None -> Some (Code_Exp _2)
      | Some x -> Some (Seq (Code_Exp _2,x)) ) )
# 657 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv902)) : 'freshtv904)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv907 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv905 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 280 "imp_parser.mly"
             ( _2 )
# 674 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv906)) : 'freshtv908)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv911 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv909 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 219 "imp_parser.mly"
                    (
      match _2 with
      | None -> Code_Exp _1
      | Some x -> Seq (Code_Exp _1,x) )
# 693 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv910)) : 'freshtv912)
    | _ ->
        _menhir_fail ()

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv867 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv865 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 252 "imp_parser.mly"
                                    (
    ( match _5 with
      | None -> Some (Canon _3)
      | Some x -> Some (Seq(Canon _3,x))
      )
  )
# 723 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv866)) : 'freshtv868)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv871 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 731 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv869 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 739 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : (
# 16 "imp_parser.mly"
       (int)
# 746 "imp_parser.ml"
        ))), _, (_4 : 'tv_stt_code)), _, (_5 : 'tv_eop)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 268 "imp_parser.mly"
                                        (
    let c = Code_IO(_2,_3,_4) in
    match _6 with
      | None -> Some c
      | Some x -> Some (Seq(c,x)) )
# 756 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)) : 'freshtv872)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv875 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv873 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_tail) : 'tv_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_code = 
# 247 "imp_parser.mly"
             ( _2 )
# 772 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv874)) : 'freshtv876)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv879 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv877 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : 'tv_code_prd_list)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 263 "imp_parser.mly"
                                              (
    let c = Code_Prd(_2,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (Seq(c,x))  )
# 794 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv878)) : 'freshtv880)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv883 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 802 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv881 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 810 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_top)), _, (_3 : (
# 35 "imp_parser.mly"
      (code list)
# 817 "imp_parser.ml"
        ))) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 258 "imp_parser.mly"
                                                  (
    let c = Code_CoPrd(_2,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (Seq(c,x)) )
# 828 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv882)) : 'freshtv884)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv887 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 836 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv885 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 844 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : (
# 16 "imp_parser.mly"
       (int)
# 851 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)), _, (_4 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 240 "imp_parser.mly"
                                    (
    let c = Code_IO(_1,_2,_3) in
    match _5 with
      | None -> c
      | Some x -> (Seq(c,x)) )
# 860 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv886)) : 'freshtv888)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv891 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv889 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : 'tv_code_prd_list)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 234 "imp_parser.mly"
                                          (
    let c = Code_Prd(_1,_2) in
    match _4 with
    | None -> c
    | Some x -> Seq(c,x)
  )
# 882 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv890)) : 'freshtv892)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv895 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 890 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv893 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 898 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)), _, (_2 : (
# 35 "imp_parser.mly"
      (code list)
# 905 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 228 "imp_parser.mly"
                                              (
    let c = Code_CoPrd(_1,_2) in
    match _4 with
    | None -> c
    | Some x -> Seq(c,x)
   )
# 916 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv899 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv897 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_h_frm_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stt_code = 
# 223 "imp_parser.mly"
                                (
    match _4 with
    | None -> Canon _2
    | Some x -> Seq(Canon _2,x)
  )
# 938 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv898)) : 'freshtv900)
    | _ ->
        _menhir_fail ()

and _menhir_run156 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 947 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState156
    | L_HLZ ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState156
    | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState156
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156

and _menhir_run151 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState151
    | L_HLZ ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState151
    | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState151
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151

and _menhir_reduce126 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_tail = 
# 279 "imp_parser.mly"
    ( None  )
# 985 "imp_parser.ml"
     in
    _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v

and _menhir_run132 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | EOP ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | OUT _v ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132

and _menhir_goto_code_coprd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 35 "imp_parser.mly"
      (code list)
# 1009 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv857 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 1019 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv853 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 1031 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154) : 'freshtv854)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv855 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 1051 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv856)) : 'freshtv858)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv863 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 1060 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run156 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv859 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 1072 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState165
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState165
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165) : 'freshtv860)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv861 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 1092 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv862)) : 'freshtv864)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code_prd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv845 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv841 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState149
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState149
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv842)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv843 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv844)) : 'freshtv846)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv851 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv847 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState162
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState162
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv848)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv849 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv850)) : 'freshtv852)
    | _ ->
        _menhir_fail ()

and _menhir_goto_eop : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eop -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv835 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1173 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131) : 'freshtv836)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv837 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1191 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv838)
    | MenhirState126 | MenhirState132 | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv839 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv840)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv823 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv821 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 99 "imp_parser.mly"
                    ( _1::_2 )
# 1237 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)) : 'freshtv824)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv833 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv831 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 34 "imp_parser.mly"
      (Peg.grammar)
# 1254 "imp_parser.ml"
        ) = 
# 95 "imp_parser.mly"
                    ( _2 )
# 1258 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv829) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 34 "imp_parser.mly"
      (Peg.grammar)
# 1266 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv827) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 34 "imp_parser.mly"
      (Peg.grammar)
# 1274 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv825) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 34 "imp_parser.mly"
      (Peg.grammar)
# 1282 "imp_parser.ml"
        )) : (
# 34 "imp_parser.mly"
      (Peg.grammar)
# 1286 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 92 "imp_parser.mly"
            ( Gram _1 )
# 1291 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)) : 'freshtv828)) : 'freshtv830)) : 'freshtv832)) : 'freshtv834)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv819 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv817 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 117 "imp_parser.mly"
                      ( _1@[_2] )
# 1311 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)) : 'freshtv820)

and _menhir_reduce16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 35 "imp_parser.mly"
      (code list)
# 1320 "imp_parser.ml"
    ) = 
# 284 "imp_parser.mly"
    ( [] )
# 1324 "imp_parser.ml"
     in
    _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_prd_list = 
# 289 "imp_parser.mly"
    ( [] )
# 1333 "imp_parser.ml"
     in
    _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 1340 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv815) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 1350 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 1354 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_eop = 
# 276 "imp_parser.mly"
        ()
# 1359 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv816)

and _menhir_run130 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv813) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eop = 
# 275 "imp_parser.mly"
        ()
# 1373 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | L_HLZ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv811 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState133 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | L_HLZ ->
            _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
            _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134) : 'freshtv812)
    | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState133
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133

and _menhir_goto_grm_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv809 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv807 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 98 "imp_parser.mly"
            ( [_1] )
# 1427 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState208) : 'freshtv810)

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv805 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1442 "imp_parser.ml"
    )) * (
# 15 "imp_parser.mly"
       (string)
# 1446 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ORD_COPRD ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState203
    | ORD_LEX_COPRD ->
        _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState203
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv803 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1460 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 1464 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 1469 "imp_parser.ml"
        ))), (_2 : (
# 15 "imp_parser.mly"
       (string)
# 1473 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ord)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_etr = 
# 102 "imp_parser.mly"
                          ( (_2,[],_4) )
# 1479 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv804)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState203) : 'freshtv806)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv801 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce102 _menhir_env (Obj.magic _menhir_stack) MenhirState197 : 'freshtv802)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv779 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv775 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv773 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 123 "imp_parser.mly"
                         ( Peg.Option _2 )
# 1516 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv774)) : 'freshtv776)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv777 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv778)) : 'freshtv780)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv787 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv781 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 122 "imp_parser.mly"
                             ( Peg.List _2 )
# 1544 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv782)) : 'freshtv784)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv786)) : 'freshtv788)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv795 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv791 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv789 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 121 "imp_parser.mly"
                         ( Peg.List _2 )
# 1572 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv790)) : 'freshtv792)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv793 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv794)) : 'freshtv796)
    | MenhirState206 | MenhirState183 | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv799 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv797 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 120 "imp_parser.mly"
             ( _1 )
# 1591 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)) : 'freshtv800)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv771 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exp_top) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv769 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_exp_top) : 'tv_exp_top) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typ_ept)) = _menhir_stack in
    let _v : 'tv_vh_frm_top = 
# 299 "imp_parser.mly"
                    ( let (e,m) = _2 in (_1,e,m) )
# 1611 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv767) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_top) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv757 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv753 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv751 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 33 "imp_parser.mly"
      (Types.buffer)
# 1635 "imp_parser.ml"
            ) = 
# 39 "imp_parser.mly"
                   (
    let (_,o,_) = _1 in
    Evo (nd_of_opr o) )
# 1641 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv752)) : 'freshtv754)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv755 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv756)) : 'freshtv758)
    | MenhirState124 | MenhirState156 | MenhirState151 | MenhirState142 | MenhirState136 | MenhirState134 | MenhirState128 | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv761 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | EOP ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv759 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState126 in
            let (_v : (
# 16 "imp_parser.mly"
       (int)
# 1668 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState128
            | L_HLZ ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState128
            | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState128
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv760)
        | OUT _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
        | PRD | PRD_END ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | COPRD | COPRD_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv762)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv765 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | EOP ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv763 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState141 in
            let (_v : (
# 16 "imp_parser.mly"
       (int)
# 1711 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | L_HLZ ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState142
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState142) : 'freshtv764)
        | OUT _v ->
            _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
        | PRD | PRD_END ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | COPRD | COPRD_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv766)
    | _ ->
        _menhir_fail ()) : 'freshtv768)) : 'freshtv770)) : 'freshtv772)

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv745 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv743 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_rule = 
# 109 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 1756 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv741) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((match _menhir_s with
        | MenhirState179 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv735) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_grm_rule) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv733) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
            ((let _v : 'tv_grm_ord = 
# 106 "imp_parser.mly"
             ( [(_1,None)] )
# 1775 "imp_parser.ml"
             in
            _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv734)) : 'freshtv736)
        | MenhirState203 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv739 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_grm_rule) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv737 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
            let _v : 'tv_grm_ord = 
# 107 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 1791 "imp_parser.ml"
             in
            _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv738)) : 'freshtv740)
        | _ ->
            _menhir_fail ()) : 'freshtv742)) : 'freshtv744)) : 'freshtv746)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv749 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1801 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 1805 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv747 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1813 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 1817 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 1824 "imp_parser.ml"
        ))), (_2 : (
# 15 "imp_parser.mly"
       (string)
# 1828 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_etr = 
# 103 "imp_parser.mly"
                                ( (_2,[],[((Peg.Synt,_4,_5),None)]) )
# 1834 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv748)) : 'freshtv750)
    | _ ->
        _menhir_fail ()

and _menhir_reduce96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_prd = 
# 130 "imp_parser.mly"
    ( None )
# 1845 "imp_parser.ml"
     in
    _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 1852 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv731) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 1862 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 1866 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 126 "imp_parser.mly"
        ( Peg.Text _1 )
# 1871 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv729) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_prd_flg = 
# 134 "imp_parser.mly"
        ( Peg.And )
# 1885 "imp_parser.ml"
     in
    _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv730)

and _menhir_run186 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv727) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_prd_flg = 
# 135 "imp_parser.mly"
            ( Peg.Not )
# 1899 "imp_parser.ml"
     in
    _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv728)

and _menhir_run187 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 1906 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv725) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 1916 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 1920 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 127 "imp_parser.mly"
        ( Peg.Name _1 )
# 1925 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv726)

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _v
    | STG _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState188 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188

and _menhir_run191 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _v
    | STG _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191

and _menhir_run194 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _v
    | STG _v ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState194 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState194

and _menhir_goto_macro : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_macro -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv719 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 1982 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv717 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 1990 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_macro) : 'tv_macro) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (opr)
# 1997 "imp_parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_exp_top = 
# 303 "imp_parser.mly"
                  ( (_2,_3) )
# 2003 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv718)) : 'freshtv720)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv723 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv721 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_macro) : 'tv_macro) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
        let _v : 'tv_exp_top = 
# 302 "imp_parser.mly"
                  ( (Opr_Rcd _1,_2) )
# 2019 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv722)) : 'freshtv724)
    | _ ->
        _menhir_fail ()

and _menhir_run125 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | L_HLZ ->
        _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState125
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv715 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce102 _menhir_env (Obj.magic _menhir_stack) MenhirState182 : 'freshtv716)

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv707 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | L_LST_PLS ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | L_OPN ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | NAM _v ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | NOT_SPL ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | SPL ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | STG _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | DTA | DTA_GRM | LCE | MDL_END | ORD_COPRD | ORD_LEX_COPRD | SLF _ ->
            _menhir_reduce96 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183) : 'freshtv708)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv711 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState198
        | L_LST_PLS ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState198
        | L_OPN ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState198
        | NAM _v ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _v
        | STG _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState198 _v
        | DTA | DTA_GRM | LCE | MDL_END | ORD_COPRD | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv709 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 131 "imp_parser.mly"
                     ( Some (_1,_2) )
# 2102 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv710)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198) : 'freshtv712)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv713 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 2114 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 2118 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run194 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | L_LST_PLS ->
            _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | L_OPN ->
            _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | NAM _v ->
            _menhir_run187 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
        | NOT_SPL ->
            _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | SPL ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | STG _v ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState206 _v
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            _menhir_reduce96 _menhir_env (Obj.magic _menhir_stack) MenhirState206
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206) : 'freshtv714)
    | _ ->
        _menhir_fail ()

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv701 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv697 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv695 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 2168 "imp_parser.ml"
            ) = 
# 354 "imp_parser.mly"
                         ( _2 )
# 2172 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)) : 'freshtv698)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv699 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv700)) : 'freshtv702)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv705 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2187 "imp_parser.ml"
        )) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv703 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2193 "imp_parser.ml"
        )) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (opr)
# 2198 "imp_parser.ml"
        ))), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 362 "imp_parser.mly"
                 ( Opr_App (Opr_Name "cns",Opr_Rcd [_1;_2]) )
# 2203 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv704)) : 'freshtv706)
    | _ ->
        _menhir_fail ()

and _menhir_goto_macro_list : _menhir_env -> 'ttv_tail -> 'tv_macro_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv693 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv687 * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv683 * 'tv_macro_list)) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (string)
# 2229 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LET ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv679 * 'tv_macro_list)) * (
# 15 "imp_parser.mly"
       (string)
# 2240 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | AGL ->
                    _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | AGL_TOP ->
                    _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | APP_EVL ->
                    _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | CHO _v ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
                | CNT ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | EMT ->
                    _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | EXN ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | IDX _v ->
                    _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
                | INJ _v ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
                | INT _v ->
                    _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
                | L_LST ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | L_OPN ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | L_PRN ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | L_RCD ->
                    _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | MLT_EVL ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | NAM _v ->
                    _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
                | PLS_EVL ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | ROT _v ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
                | SGN ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | SLF _v ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
                | STG _v ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
                | VCT ->
                    _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState93
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93) : 'freshtv680)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv681 * 'tv_macro_list)) * (
# 15 "imp_parser.mly"
       (string)
# 2300 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv682)) : 'freshtv684)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv685 * 'tv_macro_list)) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv686)) : 'freshtv688)
    | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv689 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_macro_list)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_macro = 
# 307 "imp_parser.mly"
                    ( _2 )
# 2317 "imp_parser.ml"
         in
        _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v) : 'freshtv690)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv691 * _menhir_state) * 'tv_macro_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv692)) : 'freshtv694)

and _menhir_reduce109 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_macro = 
# 306 "imp_parser.mly"
    ( [] )
# 2333 "imp_parser.ml"
     in
    _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv677) = Obj.magic _menhir_stack in
    ((let _v : 'tv_macro_list = 
# 310 "imp_parser.mly"
    ( [] )
# 2346 "imp_parser.ml"
     in
    _menhir_goto_macro_list _menhir_env _menhir_stack _v) : 'freshtv678)

and _menhir_run63 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2353 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv673 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2365 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (int)
# 2370 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2377 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 16 "imp_parser.mly"
       (int)
# 2382 "imp_parser.ml"
        )) : (
# 16 "imp_parser.mly"
       (int)
# 2386 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (opr)
# 2391 "imp_parser.ml"
        ))), _) = _menhir_stack in
        let _2 = () in
        let _v : (
# 36 "imp_parser.mly"
      (opr)
# 2397 "imp_parser.ml"
        ) = 
# 350 "imp_parser.mly"
                ( Prj (_1,_3) )
# 2401 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv672)) : 'freshtv674)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv675 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2411 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv676)

and _menhir_run65 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2419 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState65
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
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
# 36 "imp_parser.mly"
      (opr)
# 2478 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
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
# 36 "imp_parser.mly"
      (opr)
# 2537 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_run74 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2596 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74

and _menhir_run69 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2655 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv669 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2663 "imp_parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (opr)
# 2669 "imp_parser.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 2675 "imp_parser.ml"
    ) = 
# 345 "imp_parser.mly"
            ( Opr_App(Opr_Name "//",_1) )
# 2679 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)

and _menhir_run70 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 2686 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
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

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv659 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 2750 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv657 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 2758 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 15 "imp_parser.mly"
       (string)
# 2765 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 163 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 2772 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv658)) : 'freshtv660)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv663 * (
# 15 "imp_parser.mly"
       (string)
# 2780 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv661 * (
# 15 "imp_parser.mly"
       (string)
# 2788 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 2795 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 151 "imp_parser.mly"
                                (
    let (a,_) = _2 in
    Def_CoPrd (_1,a,List.map (fun (y,n) -> (y,n)) _4) )
# 2803 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv662)) : 'freshtv664)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv667 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 2811 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv665 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 2819 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 2826 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 143 "imp_parser.mly"
                                ( Def_CoPrd (_1,fst _2,_4) )
# 2832 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv666)) : 'freshtv668)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv647 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 2846 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv645 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 2854 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 15 "imp_parser.mly"
       (string)
# 2861 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 167 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 2868 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv646)) : 'freshtv648)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv651 * (
# 15 "imp_parser.mly"
       (string)
# 2876 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv649 * (
# 15 "imp_parser.mly"
       (string)
# 2884 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 2891 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 154 "imp_parser.mly"
                             ( Def_Prd (_1,fst _2,_4) )
# 2897 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv650)) : 'freshtv652)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv655 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 2905 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv653 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 2913 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 2920 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 144 "imp_parser.mly"
                             ( Def_Prd (_1,fst _2,_4) )
# 2926 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)) : 'freshtv656)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv643 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState253
    | DTA_GRM ->
        _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState253
    | LCE ->
        _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState253
    | MDL_END ->
        _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState253
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState253) : 'freshtv644)

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
    let (_menhir_stack : ('freshtv641 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3044 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv637 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3054 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv633 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3064 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "imp_parser.mly"
       (int)
# 3069 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | L_HLZ ->
                _menhir_run125 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOP | EXN | EXP | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
                _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv634)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv635 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3092 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv636)) : 'freshtv638)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv639 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3103 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv640)) : 'freshtv642)

and _menhir_run180 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv631) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 113 "imp_parser.mly"
                  ( Peg.Lex )
# 3118 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv632)

and _menhir_run181 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv629) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 112 "imp_parser.mly"
              ( Peg.Synt )
# 3132 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)

and _menhir_reduce102 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 116 "imp_parser.mly"
    ( [] )
# 3141 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv623 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3153 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv621 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3161 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 3168 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 159 "imp_parser.mly"
                  ( _1::_2 )
# 3173 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv622)) : 'freshtv624)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv627 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 3181 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv625 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 3189 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 15 "imp_parser.mly"
       (string)
# 3196 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 145 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3203 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv626)) : 'freshtv628)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | AGL_TOP ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | APP_EVL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | CHO _v ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
        | CNT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | EMT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | EXN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | IDX _v ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
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
            let (_menhir_stack : ('freshtv615 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState44 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv613 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3269 "imp_parser.ml"
            ) = 
# 351 "imp_parser.mly"
                        ( Opr_Rcd _2 )
# 3273 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv614)) : 'freshtv616)
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv618)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv619 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | AGL_TOP ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | APP_EVL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | CHO _v ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | CNT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | EMT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | EXN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | IDX _v ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | INJ _v ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | L_LST ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | L_OPN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | L_PRN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | L_RCD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | MLT_EVL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | NAM _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | PLS_EVL ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | ROT _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | SGN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | SLF _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | SPL ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | STG _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | VCT ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            _menhir_reduce109 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97) : 'freshtv620)
    | _ ->
        _menhir_fail ()

and _menhir_reduce107 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 361 "imp_parser.mly"
    ( Opr_App (Opr_Name "nil",Opr_Rcd []) )
# 3354 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 36 "imp_parser.mly"
      (opr)
# 3361 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv557 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3371 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | R_BLK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv555 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3395 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState61 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv553 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3403 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (opr)
# 3409 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3416 "imp_parser.ml"
            ) = 
# 324 "imp_parser.mly"
                  ( Agl _2 )
# 3420 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv554)) : 'freshtv556)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61) : 'freshtv558)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv561 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3432 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3436 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv559 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3454 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3458 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (opr)
# 3463 "imp_parser.ml"
            ))), _), _, (_3 : (
# 36 "imp_parser.mly"
      (opr)
# 3467 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3473 "imp_parser.ml"
            ) = 
# 342 "imp_parser.mly"
                ( Opr_App (Opr_Name "+",Opr_Rcd [_1;_3]) )
# 3477 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv562)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv565 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3489 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3493 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv563 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3509 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3513 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (opr)
# 3518 "imp_parser.ml"
            ))), _), _, (_3 : (
# 36 "imp_parser.mly"
      (opr)
# 3522 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3528 "imp_parser.ml"
            ) = 
# 343 "imp_parser.mly"
                ( Opr_App (Opr_Name "*",Opr_Rcd [_1;_3]) )
# 3532 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv564)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv566)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv569 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3544 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3548 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | AGL | AGL_TOP | APP | APP_EVL | ARR | CHO _ | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv567 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3562 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3566 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (opr)
# 3571 "imp_parser.ml"
            ))), _), _, (_3 : (
# 36 "imp_parser.mly"
      (opr)
# 3575 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3581 "imp_parser.ml"
            ) = 
# 349 "imp_parser.mly"
                ( Opr_App (_1,_3) )
# 3585 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv570)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv573 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3597 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3601 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | MNS | NAM _ | OUT _ | PLS | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv571 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3619 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3623 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (opr)
# 3628 "imp_parser.ml"
            ))), _), _, (_3 : (
# 36 "imp_parser.mly"
      (opr)
# 3632 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3638 "imp_parser.ml"
            ) = 
# 344 "imp_parser.mly"
                ( Opr_App (Opr_Name "+",Opr_Rcd [_1;Opr_App (Opr_Name "-",_3)]) )
# 3642 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv572)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv574)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv577 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3654 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3658 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv575 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3680 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3684 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (opr)
# 3689 "imp_parser.ml"
            ))), _), _, (_3 : (
# 36 "imp_parser.mly"
      (opr)
# 3693 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3699 "imp_parser.ml"
            ) = 
# 347 "imp_parser.mly"
               ( Opr_App(Opr_App(Opr_Name "=",_1),_3) )
# 3703 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv578)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv581 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3715 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CMM | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_BLK | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv579 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3739 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (opr)
# 3744 "imp_parser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3750 "imp_parser.ml"
            ) = 
# 325 "imp_parser.mly"
                              ( Agl _2 )
# 3754 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv580)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv582)
    | MenhirState79 | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv583 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3766 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | AGL_TOP ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | APP_EVL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | CHO _v ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | CNT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | EMT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | EXN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | IDX _v ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | INJ _v ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | INT _v ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | L_LST ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | L_OPN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | L_PRN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | L_RCD ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | MLT_EVL ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | NAM _v ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | PLS_EVL ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | ROT _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | SGN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | SLF _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | STG _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
        | VCT ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | R_LST ->
            _menhir_reduce107 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv584)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3840 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3864 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState81 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv585 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3872 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (opr)
# 3878 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3885 "imp_parser.ml"
            ) = 
# 353 "imp_parser.mly"
                    ( Opr_App(Opr_Name "‹",_2) )
# 3889 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)) : 'freshtv588)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv590)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv595 * _menhir_state) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3901 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv593 * _menhir_state) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3925 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState83 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv591 * _menhir_state) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3933 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : (
# 36 "imp_parser.mly"
      (opr)
# 3939 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 3947 "imp_parser.ml"
            ) = 
# 346 "imp_parser.mly"
                        ( Opr_App (Opr_Name "-",_3) )
# 3951 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)) : 'freshtv594)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv596)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv601 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3963 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv599 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3987 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState85 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 3995 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (opr)
# 4001 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (opr)
# 4008 "imp_parser.ml"
            ) = 
# 348 "imp_parser.mly"
                    ( _2 )
# 4012 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv598)) : 'freshtv600)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv602)
    | MenhirState97 | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv605 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 4024 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | R_RCD | SGN | SLF _ | SPL | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv603 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 4048 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : (
# 36 "imp_parser.mly"
      (opr)
# 4053 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 320 "imp_parser.mly"
                 ( _1@[_2] )
# 4058 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87) : 'freshtv606)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv607 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 4070 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | SPL ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            _menhir_reduce109 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv608)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv611 * 'tv_macro_list)) * (
# 15 "imp_parser.mly"
       (string)
# 4102 "imp_parser.ml"
        ))) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 4106 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | CST ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | EQ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | MLT ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | MNS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | PLS ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | PRJ ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | ARR | CMM | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv609 * 'tv_macro_list)) * (
# 15 "imp_parser.mly"
       (string)
# 4130 "imp_parser.ml"
            ))) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 4134 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : 'tv_macro_list)), (_3 : (
# 15 "imp_parser.mly"
       (string)
# 4139 "imp_parser.ml"
            ))), _, (_5 : (
# 36 "imp_parser.mly"
      (opr)
# 4143 "imp_parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_macro_list = 
# 311 "imp_parser.mly"
                                ( _1@[(_3,_5)] )
# 4150 "imp_parser.ml"
             in
            _menhir_goto_macro_list _menhir_env _menhir_stack _v) : 'freshtv610)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv612)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv509 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv505 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv503 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 178 "imp_parser.mly"
                        ( _2 )
# 4182 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)) : 'freshtv506)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv507 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv508)) : 'freshtv510)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv517 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv513 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv511 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_ept = 
# 315 "imp_parser.mly"
                    ( _2 )
# 4210 "imp_parser.ml"
             in
            _menhir_goto_typ_ept _menhir_env _menhir_stack _menhir_s _v) : 'freshtv512)) : 'freshtv514)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv515 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv516)) : 'freshtv518)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv523) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv519) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState120
            | DEF | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
                _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack) MenhirState120
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120) : 'freshtv520)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv521) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv522)) : 'freshtv524)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv527) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv525) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 216 "imp_parser.mly"
                            ( (_2,_4) )
# 4258 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv526)) : 'freshtv528)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv539 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv535 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv531 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 15 "imp_parser.mly"
       (string)
# 4279 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState219
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv529 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 4292 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 15 "imp_parser.mly"
       (string)
# 4297 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 166 "imp_parser.mly"
                         ( [(_2,_4)] )
# 4304 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv530)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219) : 'freshtv532)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv533 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv534)) : 'freshtv536)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv537 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)) : 'freshtv540)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv551 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv547 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv543 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 15 "imp_parser.mly"
       (string)
# 4343 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState224
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv541 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 4356 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 15 "imp_parser.mly"
       (string)
# 4361 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 162 "imp_parser.mly"
                           ( [(_2,_4)] )
# 4368 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv542)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState224) : 'freshtv544)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv545 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv546)) : 'freshtv548)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv549 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv550)) : 'freshtv552)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv501) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv499) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 87 "imp_parser.mly"
            ( _1 )
# 4405 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv493 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 4417 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv491 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 4425 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 4432 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 139 "imp_parser.mly"
                                        ( [_2]@_3 )
# 4437 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv492)) : 'freshtv494)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv497 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv495 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 90 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 4454 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)) : 'freshtv498)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv439 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv435 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv433 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 182 "imp_parser.mly"
                    ( lst<+_2 )
# 4488 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)) : 'freshtv436)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv438)) : 'freshtv440)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv445 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv441 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 180 "imp_parser.mly"
                ( vct<+_1<+_3 )
# 4514 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv443 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv444)) : 'freshtv446)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv451 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv447 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 193 "imp_parser.mly"
                ( _1-*_3 )
# 4540 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv448)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv449 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv450)) : 'freshtv452)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv457 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv453 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 179 "imp_parser.mly"
                ( _1<+_3 )
# 4568 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv455 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv456)) : 'freshtv458)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv465 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv461 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv459 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 181 "imp_parser.mly"
                    ( opn<+_2 )
# 4602 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv460)) : 'freshtv462)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv463 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)) : 'freshtv466)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv471 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv467 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typs = 
# 175 "imp_parser.mly"
             ( _1@[_2] )
# 4631 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv468)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)) : 'freshtv472)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv477 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv473 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 171 "imp_parser.mly"
            ( _2 )
# 4661 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv474)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv475 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv476)) : 'freshtv478)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv483 * (
# 15 "imp_parser.mly"
       (string)
# 4676 "imp_parser.ml"
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
            let (_menhir_stack : ((('freshtv479 * (
# 15 "imp_parser.mly"
       (string)
# 4692 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 4697 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body_clq = 
# 155 "imp_parser.mly"
                        ( Def_Eqv (_1,fst _2,_4) )
# 4703 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv480)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv481 * (
# 15 "imp_parser.mly"
       (string)
# 4713 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv482)) : 'freshtv484)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv489 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4722 "imp_parser.ml"
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
            let (_menhir_stack : ((('freshtv485 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4738 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 4743 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 147 "imp_parser.mly"
                        ( Def_Eqv (_1,fst _2,_4) )
# 4749 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv487 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4759 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv488)) : 'freshtv490)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState253 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv411 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv409 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 83 "imp_parser.mly"
                        ( _1::_2 )
# 4779 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv410)) : 'freshtv412)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv431) * (
# 15 "imp_parser.mly"
       (string)
# 4787 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv427) * (
# 15 "imp_parser.mly"
       (string)
# 4797 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv425) * (
# 15 "imp_parser.mly"
       (string)
# 4803 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_2 : (
# 15 "imp_parser.mly"
       (string)
# 4808 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_arg)), _, (_5 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 48 "imp_parser.mly"
                                           (
    let (x,_) = Ty.typing_mdl(_2,[],_5) in
    x )
# 4818 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv423) = _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv421) = Obj.magic _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv419) = Obj.magic _menhir_stack in
            let ((_1 : 'tv_def_mdl) : 'tv_def_mdl) = _v in
            ((let _v : (
# 32 "imp_parser.mly"
      (Types.mdl)
# 4832 "imp_parser.ml"
            ) = 
# 45 "imp_parser.mly"
            ( Util.pnt flg "parse:file\n"; _1 )
# 4836 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv417) = _menhir_stack in
            let (_v : (
# 32 "imp_parser.mly"
      (Types.mdl)
# 4843 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv415) = Obj.magic _menhir_stack in
            let (_v : (
# 32 "imp_parser.mly"
      (Types.mdl)
# 4850 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv413) = Obj.magic _menhir_stack in
            let ((_1 : (
# 32 "imp_parser.mly"
      (Types.mdl)
# 4857 "imp_parser.ml"
            )) : (
# 32 "imp_parser.mly"
      (Types.mdl)
# 4861 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv414)) : 'freshtv416)) : 'freshtv418)) : 'freshtv420)) : 'freshtv422)) : 'freshtv424)) : 'freshtv426)) : 'freshtv428)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv429) * (
# 15 "imp_parser.mly"
       (string)
# 4871 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv430)) : 'freshtv432)
    | _ ->
        _menhir_fail ()

and _menhir_run116 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 4881 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116

and _menhir_run117 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 4898 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118) : 'freshtv404)
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv405) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 215 "imp_parser.mly"
    ( (vsgn(),vsgn()) )
# 4925 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv406)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4935 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv408)

and _menhir_run177 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 4943 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 4955 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "imp_parser.mly"
       (string)
# 4960 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv393 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 4971 "imp_parser.ml"
            )) * (
# 15 "imp_parser.mly"
       (string)
# 4975 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce102 _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv394)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv395 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 4984 "imp_parser.ml"
            )) * (
# 15 "imp_parser.mly"
       (string)
# 4988 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ORD_COPRD ->
                _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState179
            | ORD_LEX_COPRD ->
                _menhir_run180 _menhir_env (Obj.magic _menhir_stack) MenhirState179
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179) : 'freshtv396)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv397 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5008 "imp_parser.ml"
            )) * (
# 15 "imp_parser.mly"
       (string)
# 5012 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv398)) : 'freshtv400)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv401 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5023 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv402)

and _menhir_run212 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5031 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "imp_parser.mly"
       (string)
# 5044 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
            _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState213
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213) : 'freshtv390)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5065 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv392)

and _menhir_run242 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 5073 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState242 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5087 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 5092 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 158 "imp_parser.mly"
        ( [_1] )
# 5097 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState242

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 54 "imp_parser.mly"
             ( _2 )
# 5122 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)) : 'freshtv382)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_args = 
# 59 "imp_parser.mly"
             (
    let ((a,m1),(al,m2)) = (_1,_2) in
    let (m3,_) = mrg_stgMap m1 m2 in
    ([a]@al,m3) )
# 5141 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)) : 'freshtv386)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arg_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv377 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv375 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState106 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv373 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_arg_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_arg = 
# 70 "imp_parser.mly"
                          (
    let (al,m) = _2 in
    (rcd_cl al,m) )
# 5173 "imp_parser.ml"
         in
        _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)) : 'freshtv376)
    | VAL _v ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv378)

and _menhir_reduce76 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 319 "imp_parser.mly"
    ( [] )
# 5188 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5202 "imp_parser.ml"
    ) = 
# 335 "imp_parser.mly"
        ( Opr_Name "#" )
# 5206 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 5213 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv369) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 5223 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 5227 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5232 "imp_parser.ml"
    ) = 
# 340 "imp_parser.mly"
        ( Opr_Stg _1 )
# 5236 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5243 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv367) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 5253 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 5257 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5262 "imp_parser.ml"
    ) = 
# 341 "imp_parser.mly"
        ( Opr_Name "@" )
# 5266 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv365) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5280 "imp_parser.ml"
    ) = 
# 339 "imp_parser.mly"
        ( Opr_App(Opr_Name "&",Opr_Rcd []) )
# 5284 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5291 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv363) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 5301 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 5305 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5310 "imp_parser.ml"
    ) = 
# 333 "imp_parser.mly"
        ( Opr_Name "$" )
# 5314 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv361) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5328 "imp_parser.ml"
    ) = 
# 327 "imp_parser.mly"
            ( Opr_Name "+" )
# 5332 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 5339 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv359) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 5349 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 5353 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5358 "imp_parser.ml"
    ) = 
# 338 "imp_parser.mly"
         ( Opr_Name _1 )
# 5362 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv357) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5376 "imp_parser.ml"
    ) = 
# 328 "imp_parser.mly"
            ( Opr_Name "*" )
# 5380 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce76 _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
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
        let (_menhir_stack : 'freshtv355 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState46 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | AGL_TOP ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | APP_EVL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | CHO _v ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | CNT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EMT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EXN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | IDX _v ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv356)
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
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
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
        let (_menhir_stack : 'freshtv353 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState48 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv351 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5557 "imp_parser.ml"
        ) = 
# 352 "imp_parser.mly"
                ( Opr_Name "‹›" )
# 5561 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)) : 'freshtv354)
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
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
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
        _menhir_reduce107 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5637 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 5647 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 5651 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5656 "imp_parser.ml"
    ) = 
# 326 "imp_parser.mly"
        ( Opr_Z _1 )
# 5660 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5667 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 5677 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 5681 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5686 "imp_parser.ml"
    ) = 
# 336 "imp_parser.mly"
        ( Opr_Inj _1 )
# 5690 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv348)

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5697 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv345) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 5707 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 5711 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5716 "imp_parser.ml"
    ) = 
# 334 "imp_parser.mly"
        ( Prj(Opr_Name "$",_1) )
# 5720 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv343) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5734 "imp_parser.ml"
    ) = 
# 332 "imp_parser.mly"
        ( Opr_Name "?" )
# 5738 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv341) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5752 "imp_parser.ml"
    ) = 
# 330 "imp_parser.mly"
        ( Opr_Name "⋎" )
# 5756 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv339) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5770 "imp_parser.ml"
    ) = 
# 331 "imp_parser.mly"
        ( Opr_Name "⋏" )
# 5774 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv340)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5781 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv337) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 5791 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 5795 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5800 "imp_parser.ml"
    ) = 
# 337 "imp_parser.mly"
        ( Opr_Cho _1  )
# 5804 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv335) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (opr)
# 5818 "imp_parser.ml"
    ) = 
# 329 "imp_parser.mly"
            ( Opr_Name "◂" )
# 5822 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv336)

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59

and _menhir_run60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | AGL_TOP ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | APP_EVL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | CHO _v ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | CNT ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | EMT ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | EXN ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | IDX _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | INJ _v ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | INT _v ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | L_LST ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | L_OPN ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | L_PRN ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | L_RCD ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | MLT_EVL ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | NAM _v ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | PLS_EVL ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | ROT _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | SGN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | SLF _v ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | STG _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | VCT ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv333 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
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
        let (_menhir_stack : 'freshtv331 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 170 "imp_parser.mly"
         ( rcd_cl _1 )
# 5969 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv334)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv329 * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_def_typ_body) : 'tv_def_typ_body) = _v in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_typ = 
# 91 "imp_parser.mly"
                     ( Flow _2 )
# 5997 "imp_parser.ml"
     in
    _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)) : 'freshtv330)

and _menhir_goto_def_typ_body_clq : _menhir_env -> 'ttv_tail -> 'tv_def_typ_body_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv325 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 6008 "imp_parser.ml"
    )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 6020 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 6025 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 138 "imp_parser.mly"
                         ( [_2] )
# 6030 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230) : 'freshtv326)

and _menhir_run216 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack) MenhirState216
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216

and _menhir_run221 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState221
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack) MenhirState221
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState221

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 191 "imp_parser.mly"
      ( pZ )
# 6078 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 6085 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv319) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 6095 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 6099 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 183 "imp_parser.mly"
        (
    ( try
      let v = StgMap.find _1 !typ_vct in
      v
      with _ -> let v = vsgn() in
      typ_vct:=(StgMap.add _1 v !typ_vct); vsgn()
    ) )
# 6110 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv317) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 195 "imp_parser.mly"
            ( stg )
# 6124 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv315) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 194 "imp_parser.mly"
        ( sgn_sgn )
# 6138 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv316)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 6145 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv313) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 6155 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 6159 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 190 "imp_parser.mly"
        ( Prm (sgn()) )
# 6164 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv311) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 192 "imp_parser.mly"
      ( nat )
# 6178 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv312)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | L_LST | L_OPN | L_RCD | N | NAM _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack) MenhirState11
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

and _menhir_reduce81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 82 "imp_parser.mly"
      ( [] )
# 6260 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run115 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run117 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | SLF _v ->
        _menhir_run116 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115

and _menhir_run176 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176

and _menhir_run211 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState211 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv303 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (string)
# 6312 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv297 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6323 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | L_BLK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv293 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6333 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | INT _v ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv289 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6343 "imp_parser.ml"
                        )))) = Obj.magic _menhir_stack in
                        let (_v : (
# 16 "imp_parser.mly"
       (int)
# 6348 "imp_parser.ml"
                        )) = _v in
                        ((let _menhir_stack = (_menhir_stack, _v) in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        match _tok with
                        | R_BLK ->
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv285 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6359 "imp_parser.ml"
                            )))) * (
# 16 "imp_parser.mly"
       (int)
# 6363 "imp_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let _menhir_env = _menhir_discard _menhir_env in
                            let _tok = _menhir_env._menhir_token in
                            match _tok with
                            | ISO ->
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv281 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6373 "imp_parser.ml"
                                )))) * (
# 16 "imp_parser.mly"
       (int)
# 6377 "imp_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((let _menhir_env = _menhir_discard _menhir_env in
                                let _tok = _menhir_env._menhir_token in
                                match _tok with
                                | NAM _v ->
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv277 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6387 "imp_parser.ml"
                                    )))) * (
# 16 "imp_parser.mly"
       (int)
# 6391 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    let (_v : (
# 15 "imp_parser.mly"
       (string)
# 6396 "imp_parser.ml"
                                    )) = _v in
                                    ((let _menhir_env = _menhir_discard _menhir_env in
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv275 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6403 "imp_parser.ml"
                                    )))) * (
# 16 "imp_parser.mly"
       (int)
# 6407 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    let ((_8 : (
# 15 "imp_parser.mly"
       (string)
# 6412 "imp_parser.ml"
                                    )) : (
# 15 "imp_parser.mly"
       (string)
# 6416 "imp_parser.ml"
                                    )) = _v in
                                    ((let (((_menhir_stack, _menhir_s), (_2 : (
# 15 "imp_parser.mly"
       (string)
# 6421 "imp_parser.ml"
                                    ))), (_5 : (
# 16 "imp_parser.mly"
       (int)
# 6425 "imp_parser.ml"
                                    ))) = _menhir_stack in
                                    let _7 = () in
                                    let _6 = () in
                                    let _4 = () in
                                    let _3 = () in
                                    let _1 = () in
                                    let _v : 'tv_def_typ_body = 
# 146 "imp_parser.mly"
                                          ( Def_Fnt_Dep (_2,_5,_8) )
# 6435 "imp_parser.ml"
                                     in
                                    _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv276)) : 'freshtv278)
                                | _ ->
                                    assert (not _menhir_env._menhir_error);
                                    _menhir_env._menhir_error <- true;
                                    let (_menhir_env : _menhir_env) = _menhir_env in
                                    let (_menhir_stack : (((((('freshtv279 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6445 "imp_parser.ml"
                                    )))) * (
# 16 "imp_parser.mly"
       (int)
# 6449 "imp_parser.ml"
                                    )))) = Obj.magic _menhir_stack in
                                    ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)) : 'freshtv282)
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                let (_menhir_env : _menhir_env) = _menhir_env in
                                let (_menhir_stack : ((((('freshtv283 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6460 "imp_parser.ml"
                                )))) * (
# 16 "imp_parser.mly"
       (int)
# 6464 "imp_parser.ml"
                                ))) = Obj.magic _menhir_stack in
                                ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv284)) : 'freshtv286)
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            let (_menhir_env : _menhir_env) = _menhir_env in
                            let (_menhir_stack : (((('freshtv287 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6475 "imp_parser.ml"
                            )))) * (
# 16 "imp_parser.mly"
       (int)
# 6479 "imp_parser.ml"
                            )) = Obj.magic _menhir_stack in
                            ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)) : 'freshtv290)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((('freshtv291 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6490 "imp_parser.ml"
                        )))) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)) : 'freshtv294)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv295 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6501 "imp_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)) : 'freshtv298)
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv299 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6510 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run242 _menhir_env (Obj.magic _menhir_stack) MenhirState241 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState241) : 'freshtv300)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv301 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6528 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)) : 'freshtv304)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv305 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)) : 'freshtv308)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState211 in
        let (_v : (
# 15 "imp_parser.mly"
       (string)
# 6546 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState232
        | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END ->
            _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState232
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232) : 'freshtv310)
    | SLF _v ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211

and _menhir_goto_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state * 'tv_arg_list) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state * 'tv_arg_list) * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_arg_list)), _, (_2 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 76 "imp_parser.mly"
                  (
    let ((al,ml),(a,m)) = (_1,_2) in
    let (m1,_) = mrg_stgMap ml m in
    (al@[a],m1) )
# 6583 "imp_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv264)) : 'freshtv266)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 75 "imp_parser.mly"
        ( let (a,m) = _1 in ([a],m) )
# 6595 "imp_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)) : 'freshtv270)
    | MenhirState111 | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | VAL _v ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState111 _v
        | DEF | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv271 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arg)) = _menhir_stack in
            let _v : 'tv_args = 
# 56 "imp_parser.mly"
        (
    let (a,m) = _1 in
    ([a],m) )
# 6617 "imp_parser.ml"
             in
            _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv274)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_ept : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_ept -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv261 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv259) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState33 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | AGL_TOP ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | APP_EVL ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | CHO _v ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
        | CNT ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | EMT ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | EXN ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | IDX _v ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv260)
    | AGL | AGL_TOP | APP_EVL | ARR | CHO _ | CNT | COPRD | COPRD_END | EMT | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | OUT _ | PLS_EVL | PRD | PRD_END | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce76 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv262)

and _menhir_reduce146 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 174 "imp_parser.mly"
    ( [] )
# 6703 "imp_parser.ml"
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
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv237) * (
# 15 "imp_parser.mly"
       (string)
# 6745 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv233) * (
# 15 "imp_parser.mly"
       (string)
# 6755 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DTA ->
                _menhir_run211 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | DTA_GRM ->
                _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | LCE ->
                _menhir_run115 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | MDL_END ->
                _menhir_reduce81 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv234)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv235) * (
# 15 "imp_parser.mly"
       (string)
# 6779 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)) : 'freshtv238)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * (
# 15 "imp_parser.mly"
       (string)
# 6788 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv239 * (
# 15 "imp_parser.mly"
       (string)
# 6798 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState228
            | L_OPN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState228
            | L_RCD ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState228
            | N ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState228
            | NAM _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _v
            | SGN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState228
            | TYP_STG ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState228
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _v
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState228
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228) : 'freshtv240)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv241 * (
# 15 "imp_parser.mly"
       (string)
# 6830 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState215
            | PRD ->
                _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState215
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState215) : 'freshtv242)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv243 * (
# 15 "imp_parser.mly"
       (string)
# 6848 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 6853 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body_clq = 
# 150 "imp_parser.mly"
                 ( Def_Abs (_1,fst _2) )
# 6858 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv244)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv245 * (
# 15 "imp_parser.mly"
       (string)
# 6868 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)) : 'freshtv248)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv257 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 6877 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv249 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 6887 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | L_OPN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | L_RCD ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | N ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | NAM _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState237 _v
            | SGN ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | TYP_STG ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | VAL _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState237 _v
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState237
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState237) : 'freshtv250)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv251 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 6919 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run221 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | PRD ->
                _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState234
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState234) : 'freshtv252)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv253 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 6937 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 6942 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body = 
# 142 "imp_parser.mly"
                 ( Def_Abs (_1,fst _2) )
# 6947 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv254)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv255 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 6957 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)) : 'freshtv258)
    | _ ->
        _menhir_fail ()

and _menhir_run104 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 6967 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv231) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 6977 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 6981 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_arg = 
# 64 "imp_parser.mly"
        (
    let v =
      if StgMap.mem _1 !typ_vct then StgMap.find _1 !typ_vct
        else vsgn () in
        typ_vct:=(StgMap.add _1 v !typ_vct);
    (v,StgMap.add _1 v StgMap.empty) )
# 6991 "imp_parser.ml"
     in
    _menhir_goto_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)

and _menhir_run105 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | VAL _v ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_reduce142 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typ_ept = 
# 314 "imp_parser.mly"
     ( vsgn() )
# 7015 "imp_parser.ml"
     in
    _menhir_goto_typ_ept _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "imp_parser.mly"
      (Types.buffer)
# 7022 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv229) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 33 "imp_parser.mly"
      (Types.buffer)
# 7031 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 33 "imp_parser.mly"
      (Types.buffer)
# 7039 "imp_parser.ml"
    )) : (
# 33 "imp_parser.mly"
      (Types.buffer)
# 7043 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv228)) : 'freshtv230)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce146 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState253 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState242 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 7075 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv25 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 7084 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv27 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 7093 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv29 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 7102 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 7111 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7120 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv35 * (
# 15 "imp_parser.mly"
       (string)
# 7129 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv37 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 7138 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 7152 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * (
# 15 "imp_parser.mly"
       (string)
# 7166 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * (
# 15 "imp_parser.mly"
       (string)
# 7175 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv48)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv53 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7193 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 7197 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv55 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7206 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 7210 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv57 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7219 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 7223 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState197 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv73 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7267 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 7271 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7285 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv79 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv81 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 7299 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 7313 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv87 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 35 "imp_parser.mly"
      (code list)
# 7322 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv91 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv95 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7346 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv97 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7355 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState142 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7364 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv101 * _menhir_state) * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv103 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state * 'tv_stt_code)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv113 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7403 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7412 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state * 'tv_vh_frm_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7421 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv123 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 7440 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 16 "imp_parser.mly"
       (int)
# 7444 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv125) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv128)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 7462 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv133) * (
# 15 "imp_parser.mly"
       (string)
# 7476 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * _menhir_state) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143) * (
# 15 "imp_parser.mly"
       (string)
# 7505 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv144)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv147 * 'tv_macro_list)) * (
# 15 "imp_parser.mly"
       (string)
# 7518 "imp_parser.ml"
        ))) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7522 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv149 * 'tv_macro_list)) * (
# 15 "imp_parser.mly"
       (string)
# 7531 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv150)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7539 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153 * _menhir_state * 'tv_exp_lst) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7548 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7557 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv157 * _menhir_state) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7566 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7575 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7584 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7593 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7602 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7606 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7615 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7624 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7628 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7637 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7646 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7650 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7659 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv177 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7668 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7672 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv179 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7681 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7690 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7694 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7703 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (opr)
# 7712 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv197 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_typ_ept) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv226)

and _menhir_reduce20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_def_arg = 
# 53 "imp_parser.mly"
    ( ([],StgMap.empty) )
# 7821 "imp_parser.ml"
     in
    _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_run103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | VAL _v ->
        _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

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
# 33 "imp_parser.mly"
      (Types.buffer)
# 7865 "imp_parser.ml"
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
# 33 "imp_parser.mly"
      (Types.buffer)
# 7895 "imp_parser.ml"
            ) = 
# 42 "imp_parser.mly"
                ( End )
# 7899 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv12)) : 'freshtv14)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
    | AGL | AGL_TOP | APP_EVL | CHO _ | CNT | EMT | EOF | EXN | EXP | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT_EVL | NAM _ | PLS_EVL | ROT _ | SGN | SLF _ | SPL | STG _ | VCT ->
        _menhir_reduce142 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv20))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 32 "imp_parser.mly"
      (Types.mdl)
# 7919 "imp_parser.ml"
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
# 15 "imp_parser.mly"
       (string)
# 7940 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | DEF ->
                _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102) : 'freshtv2)
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
  

# 7970 "imp_parser.ml"
