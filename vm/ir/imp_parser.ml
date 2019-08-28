
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
    | DOT
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
# 137 "imp_parser.ml"
  )
    | ARR_REV_IN
    | ARR_REV
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
  | MenhirState219
  | MenhirState214
  | MenhirState213
  | MenhirState209
  | MenhirState206
  | MenhirState204
  | MenhirState202
  | MenhirState200
  | MenhirState196
  | MenhirState193
  | MenhirState191
  | MenhirState188
  | MenhirState187
  | MenhirState183
  | MenhirState181
  | MenhirState180
  | MenhirState178
  | MenhirState175
  | MenhirState173
  | MenhirState172
  | MenhirState170
  | MenhirState165
  | MenhirState164
  | MenhirState161
  | MenhirState158
  | MenhirState155
  | MenhirState150
  | MenhirState149
  | MenhirState146
  | MenhirState143
  | MenhirState139
  | MenhirState136
  | MenhirState132
  | MenhirState129
  | MenhirState123
  | MenhirState121
  | MenhirState118
  | MenhirState116
  | MenhirState113
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState106
  | MenhirState104
  | MenhirState103
  | MenhirState102
  | MenhirState101
  | MenhirState99
  | MenhirState98
  | MenhirState96
  | MenhirState94
  | MenhirState92
  | MenhirState91
  | MenhirState87
  | MenhirState78
  | MenhirState76
  | MenhirState74
  | MenhirState71
  | MenhirState70
  | MenhirState69
  | MenhirState68
  | MenhirState61
  | MenhirState60
  | MenhirState58
  | MenhirState57
  | MenhirState56
  | MenhirState51
  | MenhirState46
  | MenhirState45
  | MenhirState43
  | MenhirState41
  | MenhirState39
  | MenhirState37
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState28
  | MenhirState27
  | MenhirState26
  | MenhirState25
  | MenhirState22
  | MenhirState21
  | MenhirState15
  | MenhirState13
  | MenhirState12
  | MenhirState11
  | MenhirState9
  | MenhirState8
  | MenhirState1
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Lang
  open Ast
  open Imp_parser_header

# 266 "imp_parser.ml"

let rec _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv853) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv851) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 58 "imp_parser.mly"
            ( _1 )
# 281 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv852)) : 'freshtv854)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv845 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 293 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv843 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 301 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 308 "imp_parser.ml"
        ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
        let _v : 'tv_glb_etr_clique = 
# 168 "imp_parser.mly"
                                    ( [_2]@_3 )
# 313 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv844)) : 'freshtv846)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv849 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv847 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 164 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 330 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv848)) : 'freshtv850)
    | _ ->
        _menhir_fail ()

and _menhir_goto_h_frm_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv829 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv827 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_h_frm_list = 
# 256 "imp_parser.mly"
                              ( _1::_3 )
# 350 "imp_parser.ml"
         in
        _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv828)) : 'freshtv830)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv835 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv831 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv832)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv833 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv834)) : 'freshtv836)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv841 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv837 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState136
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv838)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv839 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv840)) : 'freshtv842)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stt_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stt_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState104 | MenhirState94 | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv799 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv793 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | L_HLZ ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
                _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv794)
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv795 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)) = _menhir_stack in
            let _v : 'tv_h_frm_list = 
# 255 "imp_parser.mly"
             ( [_1] )
# 443 "imp_parser.ml"
             in
            _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv796)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv797 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv798)) : 'freshtv800)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv801 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 458 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | OUT _v ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99) : 'freshtv802)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv803 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 476 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | OUT _v ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv804)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv807 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv805 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_prd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_prd_list = 
# 251 "imp_parser.mly"
                                ( _1@[_3] )
# 499 "imp_parser.ml"
         in
        _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv806)) : 'freshtv808)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv811 * _menhir_state * 'tv_code_coprd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv809 * _menhir_state * 'tv_code_coprd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_coprd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_coprd_list = 
# 246 "imp_parser.mly"
                                    ( _1@[_3] )
# 512 "imp_parser.ml"
         in
        _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)) : 'freshtv812)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv825 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 520 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 16 "imp_parser.mly"
       (int)
# 524 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv823 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 530 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 16 "imp_parser.mly"
       (int)
# 534 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 539 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)), (_4 : (
# 16 "imp_parser.mly"
       (int)
# 543 "imp_parser.ml"
        ))), _, (_5 : 'tv_stt_code)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_glb_etr_body = 
# 171 "imp_parser.mly"
                                ( (_1,fst _2,snd _2,_5) )
# 549 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv821) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState58 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv815 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 562 "imp_parser.ml"
            )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState139 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv813 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 574 "imp_parser.ml"
                )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 579 "imp_parser.ml"
                ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
                let _v : 'tv_glb_etr_clique = 
# 167 "imp_parser.mly"
                     ( [_2] )
# 584 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139) : 'freshtv816)
        | MenhirState57 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv819 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv817 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 163 "imp_parser.mly"
                     ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d)  )
# 601 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)) : 'freshtv820)
        | _ ->
            _menhir_fail ()) : 'freshtv822)) : 'freshtv824)) : 'freshtv826)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv781 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_code) : 'tv_code) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 208 "imp_parser.mly"
                     (
    ( match _3 with
      | None -> Some (Ast.E _2)
      | Some x -> Some (Ast.V(Ast.E _2,x)) ) )
# 629 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv782)) : 'freshtv784)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv787 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv785 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 241 "imp_parser.mly"
             ( _2 )
# 646 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv786)) : 'freshtv788)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv791 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv789 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 178 "imp_parser.mly"
                 (
      match _2 with
      | None -> E _1
      | Some x -> V(E _1,x) )
# 665 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv790)) : 'freshtv792)
    | _ ->
        _menhir_fail ()

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv747 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv745 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 212 "imp_parser.mly"
                                    (
    ( match _5 with
      | None -> Some (H _3)
      | Some x -> Some (V(H _3,x))
      )
  )
# 695 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv746)) : 'freshtv748)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv751 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 703 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv749 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 711 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)), _, (_3 : (
# 16 "imp_parser.mly"
       (int)
# 718 "imp_parser.ml"
        ))), _, (_4 : 'tv_stt_code)), _, (_5 : 'tv_eop)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 229 "imp_parser.mly"
                                     (
    let c = F(_2,_3,_4) in
    match _6 with
      | None -> Some c
      | Some x -> Some (V(c,x)) )
# 728 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv750)) : 'freshtv752)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv755 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv753 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_tail) : 'tv_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_code = 
# 207 "imp_parser.mly"
             ( _2 )
# 744 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv754)) : 'freshtv756)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv759 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv757 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)), _, (_3 : 'tv_code_prd_list)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 224 "imp_parser.mly"
                                           (
    let c = P(_2,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (V(c,x))  )
# 766 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv758)) : 'freshtv760)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv763 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv761 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)), _, (_3 : 'tv_code_coprd_list)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 218 "imp_parser.mly"
                                               (
    let (i,a) = Ast.tk_agl _2 in
    let c = A(a,i,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (V(c,x)) )
# 789 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)) : 'freshtv764)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv767 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 797 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv765 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 805 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)), _, (_2 : (
# 16 "imp_parser.mly"
       (int)
# 812 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)), _, (_4 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 200 "imp_parser.mly"
                                 (
    let c = F(_1,_2,_3) in
    match _5 with
      | None -> c
      | Some x -> V(c,x) )
# 821 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv766)) : 'freshtv768)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv771 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv769 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)), _, (_2 : 'tv_code_prd_list)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 194 "imp_parser.mly"
                                       (
    let c = P(_1,_2) in
    match _4 with
    | None -> c
    | Some x -> V(c,x)
  )
# 843 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv770)) : 'freshtv772)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv775 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv773 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)), _, (_2 : 'tv_code_coprd_list)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 187 "imp_parser.mly"
                                           (
    let (i,a) = Ast.tk_agl _1 in
    let c = A(a,i,_2) in
    match _4 with
    | None -> c
    | Some x -> V(c,x)
   )
# 866 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv774)) : 'freshtv776)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv779 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv777 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_h_frm_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stt_code = 
# 182 "imp_parser.mly"
                                (
    match _4 with
    | None -> H _2
    | Some x -> V(H _2,x)
  )
# 888 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv778)) : 'freshtv780)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv733 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv731 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 71 "imp_parser.mly"
                    ( _1::_2 )
# 910 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)) : 'freshtv734)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv743 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv741 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 927 "imp_parser.ml"
        ) = 
# 67 "imp_parser.mly"
                    ( _2 )
# 931 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv739) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 939 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv737) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 947 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv735) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 955 "imp_parser.ml"
        )) : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 959 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 64 "imp_parser.mly"
            ( Gram _1 )
# 964 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)) : 'freshtv738)) : 'freshtv740)) : 'freshtv742)) : 'freshtv744)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv729 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv727 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 89 "imp_parser.mly"
                      ( _1@[_2] )
# 984 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv728)) : 'freshtv730)

and _menhir_run123 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_coprd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | L_HLZ ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123

and _menhir_run118 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | L_HLZ ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState118
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118

and _menhir_reduce110 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_tail = 
# 240 "imp_parser.mly"
    ( None  )
# 1025 "imp_parser.ml"
     in
    _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v

and _menhir_run102 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | EOP ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | OUT _v ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv717 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 1054 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv715 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 1062 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 15 "imp_parser.mly"
       (string)
# 1069 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 134 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 1076 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv716)) : 'freshtv718)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv721 * (
# 15 "imp_parser.mly"
       (string)
# 1084 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv719 * (
# 15 "imp_parser.mly"
       (string)
# 1092 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 1099 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 122 "imp_parser.mly"
                                (
    let a = _2 in
    Def_CoPrd (_1,a,List.map (fun (y,n) -> (y,n)) _4) )
# 1107 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv720)) : 'freshtv722)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv725 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 1115 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv723 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 1123 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 1130 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 115 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 1136 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv724)) : 'freshtv726)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv705 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 1150 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv703 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 1158 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 15 "imp_parser.mly"
       (string)
# 1165 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 138 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 1172 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv704)) : 'freshtv706)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv709 * (
# 15 "imp_parser.mly"
       (string)
# 1180 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv707 * (
# 15 "imp_parser.mly"
       (string)
# 1188 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 1195 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 125 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 1201 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv708)) : 'freshtv710)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv713 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 1209 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv711 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 1217 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 1224 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 116 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 1230 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv712)) : 'freshtv714)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv701 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv699 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 70 "imp_parser.mly"
            ( [_1] )
# 1253 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv700)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175) : 'freshtv702)

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv697 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1268 "imp_parser.ml"
    )) * (
# 15 "imp_parser.mly"
       (string)
# 1272 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ORD_COPRD ->
        _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | ORD_LEX_COPRD ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv695 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1286 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 1290 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 1295 "imp_parser.ml"
        ))), (_2 : (
# 15 "imp_parser.mly"
       (string)
# 1299 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ord)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_etr = 
# 74 "imp_parser.mly"
                          ( (_2,[],_4) )
# 1305 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170) : 'freshtv698)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv693 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce90 _menhir_env (Obj.magic _menhir_stack) MenhirState164 : 'freshtv694)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv667 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv665 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 95 "imp_parser.mly"
                         ( Peg.Option _2 )
# 1342 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv666)) : 'freshtv668)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv669 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv670)) : 'freshtv672)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv679 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv675 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv673 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 94 "imp_parser.mly"
                             ( Peg.List _2 )
# 1370 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv674)) : 'freshtv676)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv677 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv678)) : 'freshtv680)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv687 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv683 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv681 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 93 "imp_parser.mly"
                         ( Peg.List _2 )
# 1398 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv682)) : 'freshtv684)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv685 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv686)) : 'freshtv688)
    | MenhirState173 | MenhirState150 | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv691 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv689 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 92 "imp_parser.mly"
             ( _1 )
# 1417 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv690)) : 'freshtv692)
    | _ ->
        _menhir_fail ()

and _menhir_run74 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_OPN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | NAM _v ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | SGN ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | TYP_STG ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | VAL _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | Z ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74

and _menhir_run76 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | L_OPN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | NAM _v ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | SGN ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | TYP_STG ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | VAL _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | Z ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76

and _menhir_run78 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | L_OPN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | NAM _v ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | SGN ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | TYP_STG ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | VAL _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | Z ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv663 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState219
    | DTA_GRM ->
        _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState219
    | LCE ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState219
    | MDL_END ->
        _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState219
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219) : 'freshtv664)

and _menhir_goto_code_coprd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_coprd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv655 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv651 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState121
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv652)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv653 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv654)) : 'freshtv656)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv661 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run123 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv657 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState132
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState132
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132) : 'freshtv658)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv659 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv660)) : 'freshtv662)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code_prd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv643 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv639 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv640)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv641 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv642)) : 'freshtv644)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run118 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv645 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv646)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv647 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv648)) : 'freshtv650)
    | _ ->
        _menhir_fail ()

and _menhir_goto_eop : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eop -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv633 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1667 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101) : 'freshtv634)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv635 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1685 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv636)
    | MenhirState96 | MenhirState102 | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv637 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv638)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv593 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv591 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 149 "imp_parser.mly"
                        (  )
# 1737 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)) : 'freshtv594)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv595 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv596)) : 'freshtv598)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv603) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv599) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | DEF | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
                _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState87
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87) : 'freshtv600)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv601) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv602)) : 'freshtv604)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv607) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv605) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 175 "imp_parser.mly"
                            ( (_2,_4) )
# 1785 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv606)) : 'freshtv608)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv615 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv611 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 15 "imp_parser.mly"
       (string)
# 1806 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState191
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv609 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 1819 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 15 "imp_parser.mly"
       (string)
# 1824 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 137 "imp_parser.mly"
                         ( [(_2,_4)] )
# 1831 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv610)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191) : 'freshtv612)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv613 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv614)) : 'freshtv616)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv617 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv618)) : 'freshtv620)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv631 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv627 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv623 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 15 "imp_parser.mly"
       (string)
# 1870 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState196
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv621 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 1883 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 15 "imp_parser.mly"
       (string)
# 1888 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 133 "imp_parser.mly"
                           ( [(_2,_4)] )
# 1895 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv622)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196) : 'freshtv624)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv625 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv626)) : 'freshtv628)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv629 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv630)) : 'freshtv632)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv585 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv583 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
        let _v : 'tv_grm_rule = 
# 81 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 1935 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv581) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((match _menhir_s with
        | MenhirState146 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv575) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_grm_rule) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv573) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
            ((let _v : 'tv_grm_ord = 
# 78 "imp_parser.mly"
             ( [(_1,None)] )
# 1954 "imp_parser.ml"
             in
            _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv574)) : 'freshtv576)
        | MenhirState170 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv579 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_grm_rule) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv577 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
            let _v : 'tv_grm_ord = 
# 79 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 1970 "imp_parser.ml"
             in
            _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)) : 'freshtv580)
        | _ ->
            _menhir_fail ()) : 'freshtv582)) : 'freshtv584)) : 'freshtv586)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv589 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1980 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 1984 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv587 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 1992 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 1996 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 2003 "imp_parser.ml"
        ))), (_2 : (
# 15 "imp_parser.mly"
       (string)
# 2007 "imp_parser.ml"
        ))), _, (_4 : 'tv_grm_ptns)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_grm_etr = 
# 75 "imp_parser.mly"
                                ( (_2,[],[((Peg.Synt,_4,_5),None)]) )
# 2013 "imp_parser.ml"
         in
        _menhir_goto_grm_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)) : 'freshtv590)
    | _ ->
        _menhir_fail ()

and _menhir_reduce84 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_prd = 
# 102 "imp_parser.mly"
    ( None )
# 2024 "imp_parser.ml"
     in
    _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v

and _menhir_run151 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 2031 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv571) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 2041 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 2045 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 98 "imp_parser.mly"
        ( Peg.Text _1 )
# 2050 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv572)

and _menhir_run152 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_prd_flg = 
# 106 "imp_parser.mly"
        ( Peg.And )
# 2064 "imp_parser.ml"
     in
    _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)

and _menhir_run153 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv567) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_prd_flg = 
# 107 "imp_parser.mly"
            ( Peg.Not )
# 2078 "imp_parser.ml"
     in
    _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)

and _menhir_run154 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 2085 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 2095 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 2099 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 99 "imp_parser.mly"
        ( Peg.Name _1 )
# 2104 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)

and _menhir_run155 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
    | STG _v ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155

and _menhir_run158 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
    | STG _v ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158

and _menhir_run161 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _v
    | STG _v ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv559 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 2161 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv557 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 2169 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 2176 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 111 "imp_parser.mly"
                                        ( [_2]@_3 )
# 2181 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv558)) : 'freshtv560)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv563 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv561 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 62 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2198 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv562)) : 'freshtv564)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv505 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv501 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv499 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 153 "imp_parser.mly"
                    (  )
# 2232 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv503 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv504)) : 'freshtv506)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv511 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv507 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 151 "imp_parser.mly"
                (  )
# 2258 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv508)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv509 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv510)) : 'freshtv512)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv517 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv513 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 158 "imp_parser.mly"
                ( )
# 2284 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv514)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv515 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv516)) : 'freshtv518)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv523 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_RCD | MDL_END | N | NAM _ | R_LST | R_OPN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv519 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 150 "imp_parser.mly"
                (  )
# 2312 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv521 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv522)) : 'freshtv524)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv531 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv527 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv525 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 152 "imp_parser.mly"
                    (  )
# 2346 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv526)) : 'freshtv528)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv529 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv530)) : 'freshtv532)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv537 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | L_LST | L_OPN | L_RCD | N | NAM _ | R_RCD | SGN | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv533 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typs = 
# 146 "imp_parser.mly"
             ( )
# 2375 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv535 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv536)) : 'freshtv538)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | R_RCD | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv539 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 142 "imp_parser.mly"
            ( Var (ref Types.WC) )
# 2405 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv540)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv541 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv542)) : 'freshtv544)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv549 * (
# 15 "imp_parser.mly"
       (string)
# 2420 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv545 * (
# 15 "imp_parser.mly"
       (string)
# 2436 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 2441 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body_clq = 
# 126 "imp_parser.mly"
                        ( Def_EqT (_1,_2,Var (ref Types.WC)) )
# 2447 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv546)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv547 * (
# 15 "imp_parser.mly"
       (string)
# 2457 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv548)) : 'freshtv550)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv555 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 2466 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv551 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 2482 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 2487 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 118 "imp_parser.mly"
                        ( Def_EqT (_1,_2,Var (ref Types.WC)) )
# 2493 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv553 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 2503 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv554)) : 'freshtv556)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv497) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv495) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 59 "imp_parser.mly"
            ( _1 )
# 2523 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)) : 'freshtv498)

and _menhir_reduce12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_coprd_list = 
# 245 "imp_parser.mly"
    ( [] )
# 2532 "imp_parser.ml"
     in
    _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_prd_list = 
# 250 "imp_parser.mly"
    ( [] )
# 2541 "imp_parser.ml"
     in
    _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 2548 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv493) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 2558 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 2562 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_eop = 
# 237 "imp_parser.mly"
        ()
# 2567 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv494)

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv491) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eop = 
# 236 "imp_parser.mly"
        ()
# 2581 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv492)

and _menhir_run103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | L_HLZ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv489 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState103 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | L_HLZ ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
            _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv490)
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv483 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv479 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv477 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 291 "imp_parser.mly"
                         ( _2 )
# 2640 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)) : 'freshtv480)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv481 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv482)) : 'freshtv484)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv487 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 295 "imp_parser.mly"
                 ( App(Atm (Name "cns"),Rcd [|_1;_2|]) )
# 2659 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
    | _ ->
        _menhir_fail ()

and _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv473 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (int)
# 2677 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv471 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 16 "imp_parser.mly"
       (int)
# 2685 "imp_parser.ml"
        )) : (
# 16 "imp_parser.mly"
       (int)
# 2689 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 287 "imp_parser.mly"
                ( Prj(_1,_3) )
# 2696 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv472)) : 'freshtv474)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv475 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv476)

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run31 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run33 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run29 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | L_HLZ ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv469 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | L_OPN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | NAM _v ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | SGN ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TYP_STG ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | VAL _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | Z ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | CLN | DEF | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv467 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 141 "imp_parser.mly"
         ( Var (ref Types.WC) )
# 2972 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv468)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv470)

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv465 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce90 _menhir_env (Obj.magic _menhir_stack) MenhirState149 : 'freshtv466)

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv457 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | L_LST_PLS ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | L_OPN ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | NAM _v ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
        | NOT_SPL ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | SPL ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | STG _v ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
        | DTA | DTA_GRM | LCE | MDL_END | ORD_COPRD | ORD_LEX_COPRD | SLF _ ->
            _menhir_reduce84 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv458)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv461 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | L_LST_PLS ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | L_OPN ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState165
        | NAM _v ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
        | STG _v ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState165 _v
        | DTA | DTA_GRM | LCE | MDL_END | ORD_COPRD | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv459 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 103 "imp_parser.mly"
                     ( Some (_1,_2) )
# 3040 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv460)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState165) : 'freshtv462)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv463 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 3052 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 3056 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState173
        | L_LST_PLS ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState173
        | L_OPN ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState173
        | NAM _v ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _v
        | NOT_SPL ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState173
        | SPL ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState173
        | STG _v ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _v
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            _menhir_reduce84 _menhir_env (Obj.magic _menhir_stack) MenhirState173
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173) : 'freshtv464)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ_body_clq : _menhir_env -> 'ttv_tail -> 'tv_def_typ_body_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv455 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 3091 "imp_parser.ml"
    )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState202 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv453 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 3103 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (int)
# 3108 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 110 "imp_parser.mly"
                         ( [_2] )
# 3113 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202) : 'freshtv456)

and _menhir_run188 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState188
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState188
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188

and _menhir_run193 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState193
    | CLN | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState193
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv451) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 156 "imp_parser.mly"
      ( )
# 3161 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv452)

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 3168 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv449) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 3178 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 3182 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 154 "imp_parser.mly"
        ( )
# 3187 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv450)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv447) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 160 "imp_parser.mly"
            ( )
# 3201 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv448)

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv445) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 159 "imp_parser.mly"
        ( )
# 3215 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 3222 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv443) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 3232 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 3236 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 155 "imp_parser.mly"
        ( )
# 3241 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv444)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv441) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 157 "imp_parser.mly"
      (  )
# 3255 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | L_LST | L_OPN | L_RCD | N | NAM _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState68
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | L_OPN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | NAM _v ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | SGN ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TYP_STG ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | VAL _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | Z ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_run71 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | L_OPN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | NAM _v ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | SGN ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | TYP_STG ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | VAL _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
    | Z ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState71
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv435 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3340 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv433 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3348 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 3355 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 51 "imp_parser.mly"
                 ( _1::_3 )
# 3361 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)) : 'freshtv436)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv439 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv437 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 47 "imp_parser.mly"
             ( _2 )
# 3378 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)) : 'freshtv440)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv431 * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv429 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_def_typ_body) : 'tv_def_typ_body) = _v in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_typ = 
# 63 "imp_parser.mly"
                     ( Flow _2 )
# 3399 "imp_parser.ml"
     in
    _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv430)) : 'freshtv432)

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv419 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv415 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv413 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 3423 "imp_parser.ml"
            ) = 
# 36 "imp_parser.mly"
                ( Line _1 )
# 3427 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv417 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv418)) : 'freshtv420)
    | MenhirState91 | MenhirState92 | MenhirState98 | MenhirState123 | MenhirState118 | MenhirState109 | MenhirState104 | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv423 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | EOP ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv421 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState96 in
            let (_v : (
# 16 "imp_parser.mly"
       (int)
# 3454 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | L_HLZ ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
                _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv422)
        | OUT _v ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | PRD | PRD_END ->
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | COPRD | COPRD_END ->
            _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv424)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv427 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | EOP ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv425 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState108 in
            let (_v : (
# 16 "imp_parser.mly"
       (int)
# 3497 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | L_HLZ ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
                _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109) : 'freshtv426)
        | OUT _v ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
        | PRD | PRD_END ->
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | COPRD | COPRD_END ->
            _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv428)
    | _ ->
        _menhir_fail ()

and _menhir_reduce95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 294 "imp_parser.mly"
    ( App(Atm (Name "nil"),Rcd [||]) )
# 3531 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv363 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | MNS ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | PLS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv361 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp = 
# 268 "imp_parser.mly"
                          ( _2 )
# 3565 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22) : 'freshtv364)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv367 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv365 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 280 "imp_parser.mly"
                ( App(Atm Pls,Rcd [|_1;_3|]) )
# 3592 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv368)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv371 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv369 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 281 "imp_parser.mly"
                ( App(Atm Mlt,Rcd [|_1;_3|]) )
# 3617 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv372)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv375 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | AGL | APP | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv373 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 286 "imp_parser.mly"
                ( App(_1,_3) )
# 3640 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv376)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv379 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv377 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 282 "imp_parser.mly"
                ( App(Atm Pls,Rcd [|_1;App(Atm Mns,_3)|]) )
# 3667 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv378)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv380)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv383 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MNS ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PLS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv381 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 284 "imp_parser.mly"
               ( App(Atm Eq,Rcd [|_1;_3|]) )
# 3698 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv382)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv384)
    | MenhirState37 | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | CHO _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | EXN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | IDX _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | INJ _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | INT _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | L_LST ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | L_OPN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | L_PRN ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | L_RCD ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | MNS ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | PLS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | VCT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | R_LST ->
            _menhir_reduce95 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37) : 'freshtv386)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv391 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | MNS ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | PLS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv389 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState39 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv387 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 290 "imp_parser.mly"
                    ( App(Atm (Name "‹"),_2) )
# 3793 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)) : 'freshtv390)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv392)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv397 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MNS ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | PLS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv395 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState41 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv393 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 283 "imp_parser.mly"
                        ( App(Atm Mns,_3) )
# 3833 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)) : 'freshtv396)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv398)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | MNS ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | PLS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv401 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState43 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv399 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 285 "imp_parser.mly"
                    ( _2 )
# 3872 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv400)) : 'freshtv402)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv404)
    | MenhirState51 | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv407 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MNS ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PLS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv405 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 264 "imp_parser.mly"
                 ( _1@[_2] )
# 3904 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv406)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv408)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv411 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | EQ ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | MLT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | MNS ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | PLS ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | PRJ ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv409 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 260 "imp_parser.mly"
            ( _2 )
# 3937 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv410)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46) : 'freshtv412)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv359 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3959 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv355 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3969 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv351 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 3979 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "imp_parser.mly"
       (int)
# 3984 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | L_HLZ ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
                _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv352)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv353 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4007 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv354)) : 'freshtv356)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv357 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4018 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)) : 'freshtv360)

and _menhir_reduce128 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 145 "imp_parser.mly"
    ( )
# 4028 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | L_OPN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | L_RCD ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | N ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | NAM _v ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | SGN ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | TYP_STG ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | VAL _v ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | Z ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61

and _menhir_run147 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 85 "imp_parser.mly"
                  ( Peg.Lex )
# 4071 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)

and _menhir_run148 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 84 "imp_parser.mly"
              ( Peg.Synt )
# 4085 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv348)

and _menhir_reduce90 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 88 "imp_parser.mly"
    ( [] )
# 4094 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv335 * (
# 15 "imp_parser.mly"
       (string)
# 4107 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv327 * (
# 15 "imp_parser.mly"
       (string)
# 4117 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState200
            | L_OPN ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState200
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState200
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState200
            | NAM _v ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
            | SGN ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState200
            | TYP_STG ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState200
            | VAL _v ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
            | Z ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState200
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200) : 'freshtv328)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv329 * (
# 15 "imp_parser.mly"
       (string)
# 4149 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState187
            | PRD ->
                _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState187
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187) : 'freshtv330)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv331 * (
# 15 "imp_parser.mly"
       (string)
# 4167 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 4172 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body_clq = 
# 121 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 4177 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv332)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv333 * (
# 15 "imp_parser.mly"
       (string)
# 4187 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4196 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv337 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4206 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | L_OPN ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | L_RCD ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | N ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | NAM _v ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState209 _v
            | SGN ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | TYP_STG ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | VAL _v ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState209 _v
            | Z ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209) : 'freshtv338)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv339 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4238 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState206
            | PRD ->
                _menhir_run188 _menhir_env (Obj.magic _menhir_stack) MenhirState206
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState206) : 'freshtv340)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv341 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4256 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 4261 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body = 
# 114 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 4266 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv343 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4276 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)) : 'freshtv346)
    | _ ->
        _menhir_fail ()

and _menhir_run182 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 4286 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv321 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4298 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183) : 'freshtv322)
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv323 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4314 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 4319 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 50 "imp_parser.mly"
        ( [_1] )
# 4324 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv325 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4334 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4347 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv313 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 4355 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 4362 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 130 "imp_parser.mly"
                  ( _1::_2 )
# 4367 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)) : 'freshtv316)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv319 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 4375 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv317 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 4383 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 15 "imp_parser.mly"
       (string)
# 4390 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 117 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 4397 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)) : 'freshtv320)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv307 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | CHO _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | EXN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | IDX _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | INJ _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | INT _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | L_LST ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | L_OPN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | L_PRN ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | L_RCD ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv305 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState9 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv303 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 288 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 4451 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)) : 'freshtv306)
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | VCT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState9
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9) : 'freshtv308)
    | MenhirState91 | MenhirState92 | MenhirState94 | MenhirState98 | MenhirState103 | MenhirState123 | MenhirState118 | MenhirState109 | MenhirState104 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | CHO _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | EXN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | IDX _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | INJ _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | INT _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | L_LST ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | L_OPN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | L_PRN ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | L_RCD ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | VCT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv309 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 259 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 4511 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv312)
    | _ ->
        _menhir_fail ()

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 273 "imp_parser.mly"
        ( Atm (Name "#")  )
# 4531 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv302)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 4538 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 4548 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 4552 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 278 "imp_parser.mly"
        ( Atm (Stg _1) )
# 4557 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv300)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 4564 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv297) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 4574 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 4578 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 279 "imp_parser.mly"
        ( Atm Fix )
# 4583 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv298)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv295) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 277 "imp_parser.mly"
        ( App(Atm (Name "&"),Rcd [||]) )
# 4597 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 4604 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv293) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 4614 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 4618 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 271 "imp_parser.mly"
        ( Rot )
# 4623 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv294)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 4630 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (string)
# 4640 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (string)
# 4644 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 276 "imp_parser.mly"
         ( Atm (Name _1) )
# 4649 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv292)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | MNS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState11 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | CHO _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | EXN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | IDX _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | INJ _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | INT _v ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | L_LST ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | L_OPN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | L_PRN ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | L_RCD ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | VCT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv290)
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11
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
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | R_OPN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState13 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 289 "imp_parser.mly"
                ( Atm (Name "‹›") )
# 4790 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)) : 'freshtv288)
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | R_LST ->
        _menhir_reduce95 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 4854 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 4864 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 4868 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 269 "imp_parser.mly"
        ( Atm(Z _1) )
# 4873 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 4880 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 4890 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 4894 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 274 "imp_parser.mly"
        ( Atm(Inj _1) )
# 4899 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv282)

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 4906 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 4916 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 4920 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 272 "imp_parser.mly"
        ( Prj(Rot,_1) )
# 4925 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 270 "imp_parser.mly"
        ( Atm Exn )
# 4939 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv278)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 4946 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv275) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (int)
# 4956 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (int)
# 4960 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 275 "imp_parser.mly"
        ( Atm(Cho _1)  )
# 4965 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv276)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv251 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 55 "imp_parser.mly"
                        ( _1::_2 )
# 5025 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv252)) : 'freshtv254)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv273) * (
# 15 "imp_parser.mly"
       (string)
# 5033 "imp_parser.ml"
        ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv269) * (
# 15 "imp_parser.mly"
       (string)
# 5043 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv267) * (
# 15 "imp_parser.mly"
       (string)
# 5049 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_2 : (
# 15 "imp_parser.mly"
       (string)
# 5054 "imp_parser.ml"
            ))), _, (_4 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 43 "imp_parser.mly"
                                   ( (_2,_4) )
# 5062 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv265) = _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv263) = Obj.magic _menhir_stack in
            let (_v : 'tv_def_mdl) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv261) = Obj.magic _menhir_stack in
            let ((_1 : 'tv_def_mdl) : 'tv_def_mdl) = _v in
            ((let _v : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl)
# 5076 "imp_parser.ml"
            ) = 
# 40 "imp_parser.mly"
            ( Util.pnt flg "parse:file\n"; _1 )
# 5080 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv259) = _menhir_stack in
            let (_v : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl)
# 5087 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv257) = Obj.magic _menhir_stack in
            let (_v : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl)
# 5094 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv255) = Obj.magic _menhir_stack in
            let ((_1 : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl)
# 5101 "imp_parser.ml"
            )) : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl)
# 5105 "imp_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv256)) : 'freshtv258)) : 'freshtv260)) : 'freshtv262)) : 'freshtv264)) : 'freshtv266)) : 'freshtv268)) : 'freshtv270)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv271) * (
# 15 "imp_parser.mly"
       (string)
# 5115 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)) : 'freshtv274)
    | _ ->
        _menhir_fail ()

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5125 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 5142 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | L_LST | L_OPN | L_RCD | N | NAM _ | SGN | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce128 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv246)
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 174 "imp_parser.mly"
    ( (Var (ref Types.WC),Var (ref Types.WC)) )
# 5169 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv248)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv249 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5179 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)

and _menhir_run144 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5187 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5199 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "imp_parser.mly"
       (string)
# 5204 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv235 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5215 "imp_parser.ml"
            )) * (
# 15 "imp_parser.mly"
       (string)
# 5219 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce90 _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv236)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv237 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5228 "imp_parser.ml"
            )) * (
# 15 "imp_parser.mly"
       (string)
# 5232 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ORD_COPRD ->
                _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | ORD_LEX_COPRD ->
                _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv238)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv239 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5252 "imp_parser.ml"
            )) * (
# 15 "imp_parser.mly"
       (string)
# 5256 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)) : 'freshtv242)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5267 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)

and _menhir_run179 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (int)
# 5275 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "imp_parser.mly"
       (string)
# 5288 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState180
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv232)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5309 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)

and _menhir_reduce16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_def_arg = 
# 46 "imp_parser.mly"
    ( [] )
# 5319 "imp_parser.ml"
     in
    _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_run181 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState181

and _menhir_run214 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (string)
# 5339 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5353 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (string)
# 5358 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 129 "imp_parser.mly"
        ( [_1] )
# 5363 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv230)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214

and _menhir_reduce64 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 263 "imp_parser.mly"
    ( [] )
# 5376 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | CHO _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | EXN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | IDX _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | INJ _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | INT _v ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | L_LST ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | L_OPN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | L_PRN ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | L_RCD ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 5426 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 5435 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 5443 "imp_parser.ml"
    )) : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 5447 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv226)) : 'freshtv228)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5464 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 5473 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5482 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5491 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5500 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5509 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * (
# 15 "imp_parser.mly"
       (string)
# 5518 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv53 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 5527 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv57 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 15 "imp_parser.mly"
       (string)
# 5541 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv61 * (
# 15 "imp_parser.mly"
       (string)
# 5555 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5564 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * (
# 15 "imp_parser.mly"
       (string)
# 5578 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv68)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv73 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5596 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 5600 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv75 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5609 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 5613 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv77 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5622 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 5626 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState165 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv93 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5670 "imp_parser.ml"
        )) * (
# 15 "imp_parser.mly"
       (string)
# 5674 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv97 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5688 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv103 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv107 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv111 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv115 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5737 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv117 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5746 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv119 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5755 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv121 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv123 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv131 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5789 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv133 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5798 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5807 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv139 * _menhir_state * 'tv_stt_code)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv143 * _menhir_state * (
# 15 "imp_parser.mly"
       (string)
# 5831 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 16 "imp_parser.mly"
       (int)
# 5835 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv145) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv164)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165 * _menhir_state * (
# 16 "imp_parser.mly"
       (int)
# 5893 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv167 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169) * (
# 15 "imp_parser.mly"
       (string)
# 5907 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv170)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv173 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv181 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv189 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv191 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv193 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv197 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv201 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv211 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv217 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv224)

and _menhir_reduce69 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 54 "imp_parser.mly"
      ( [] )
# 6050 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | SLF _v ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run143 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState143 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143

and _menhir_run178 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState178 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv29 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (string)
# 6102 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv25 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6113 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213) : 'freshtv26)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv27 * _menhir_state) * (
# 15 "imp_parser.mly"
       (string)
# 6131 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)) : 'freshtv30)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)) : 'freshtv34)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState178 in
        let (_v : (
# 15 "imp_parser.mly"
       (string)
# 6149 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState204
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204) : 'freshtv36)
    | SLF _v ->
        _menhir_run179 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178

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
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 6195 "imp_parser.ml"
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
        let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 6223 "imp_parser.ml"
            ) = 
# 37 "imp_parser.mly"
                ( End )
# 6227 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)) : 'freshtv18)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AGL | CHO _ | EOF | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv24))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl)
# 6249 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | MDL ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (string)
# 6270 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DEF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv1) * (
# 15 "imp_parser.mly"
       (string)
# 6281 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | DTA ->
                    _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | DTA_GRM ->
                    _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | LCE ->
                    _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | MDL_END ->
                    _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState56
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv2)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv3) * (
# 15 "imp_parser.mly"
       (string)
# 6305 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv4)) : 'freshtv6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv8)) : 'freshtv10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv12)) : 'freshtv14))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 6324 "imp_parser.ml"
