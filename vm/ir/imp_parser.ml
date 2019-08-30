
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
    | L_LST_PLS
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
# 97 "imp_parser.ml"
  )
    | INJ of (
# 15 "imp_parser.mly"
       (int)
# 102 "imp_parser.ml"
  )
    | IN of (
# 15 "imp_parser.mly"
       (int)
# 107 "imp_parser.ml"
  )
    | IDX of (
# 15 "imp_parser.mly"
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
# 15 "imp_parser.mly"
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
  | MenhirState231
  | MenhirState222
  | MenhirState217
  | MenhirState216
  | MenhirState212
  | MenhirState209
  | MenhirState207
  | MenhirState205
  | MenhirState203
  | MenhirState199
  | MenhirState196
  | MenhirState194
  | MenhirState191
  | MenhirState190
  | MenhirState186
  | MenhirState184
  | MenhirState183
  | MenhirState181
  | MenhirState178
  | MenhirState176
  | MenhirState171
  | MenhirState170
  | MenhirState167
  | MenhirState164
  | MenhirState159
  | MenhirState158
  | MenhirState155
  | MenhirState151
  | MenhirState147
  | MenhirState144
  | MenhirState140
  | MenhirState137
  | MenhirState131
  | MenhirState129
  | MenhirState126
  | MenhirState124
  | MenhirState121
  | MenhirState119
  | MenhirState118
  | MenhirState117
  | MenhirState116
  | MenhirState114
  | MenhirState112
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState107
  | MenhirState106
  | MenhirState104
  | MenhirState102
  | MenhirState100
  | MenhirState99
  | MenhirState95
  | MenhirState84
  | MenhirState82
  | MenhirState80
  | MenhirState77
  | MenhirState76
  | MenhirState75
  | MenhirState74
  | MenhirState73
  | MenhirState63
  | MenhirState62
  | MenhirState60
  | MenhirState59
  | MenhirState58
  | MenhirState55
  | MenhirState53
  | MenhirState48
  | MenhirState47
  | MenhirState45
  | MenhirState43
  | MenhirState41
  | MenhirState39
  | MenhirState36
  | MenhirState35
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState28
  | MenhirState27
  | MenhirState24
  | MenhirState23
  | MenhirState17
  | MenhirState15
  | MenhirState14
  | MenhirState13
  | MenhirState11
  | MenhirState10
  | MenhirState1
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Lang
  open Ast

# 265 "imp_parser.ml"

let rec _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv865 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv863 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 71 "imp_parser.mly"
                    ( _1::_2 )
# 283 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv864)) : 'freshtv866)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv875 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv873 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 300 "imp_parser.ml"
        ) = 
# 67 "imp_parser.mly"
                    ( _2 )
# 304 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv871) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 312 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv869) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 320 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv867) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 328 "imp_parser.ml"
        )) : (
# 32 "imp_parser.mly"
      (Peg.grammar)
# 332 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 64 "imp_parser.mly"
            ( Gram _1 )
# 337 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv868)) : 'freshtv870)) : 'freshtv872)) : 'freshtv874)) : 'freshtv876)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv861 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv859 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 88 "imp_parser.mly"
                      ( _1@[_2] )
# 357 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv860)) : 'freshtv862)

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv857) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv855) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 58 "imp_parser.mly"
            ( _1 )
# 374 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv856)) : 'freshtv858)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv849 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 386 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv847 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 394 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 401 "imp_parser.ml"
        ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
        let _v : 'tv_glb_etr_clique = 
# 168 "imp_parser.mly"
                                    ( [_2]@_3 )
# 406 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv848)) : 'freshtv850)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv853 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv851 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 164 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 423 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv852)) : 'freshtv854)
    | _ ->
        _menhir_fail ()

and _menhir_goto_h_frm_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv833 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv831 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_h_frm_list = 
# 256 "imp_parser.mly"
                              ( _1::_3 )
# 443 "imp_parser.ml"
         in
        _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv832)) : 'freshtv834)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv839 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv835 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv836)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv837 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv838)) : 'freshtv840)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv845 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv841 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv842)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv843 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv844)) : 'freshtv846)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv829 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 510 "imp_parser.ml"
    ))) * (
# 14 "imp_parser.mly"
       (string)
# 514 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState176
    | ORD_LEX_COPRD ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState176
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv827 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 528 "imp_parser.ml"
        ))) * (
# 14 "imp_parser.mly"
       (string)
# 532 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 537 "imp_parser.ml"
        ))), (_3 : (
# 14 "imp_parser.mly"
       (string)
# 541 "imp_parser.ml"
        ))), _, (_5 : 'tv_grm_ord)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 74 "imp_parser.mly"
                              ( (_3,[],_5) )
# 548 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv825) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv823 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv821 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
            let _v : 'tv_grm_clq = 
# 70 "imp_parser.mly"
            ( [_1] )
# 569 "imp_parser.ml"
             in
            _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178) : 'freshtv824)) : 'freshtv826)) : 'freshtv828)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176) : 'freshtv830)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv807 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv803 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv801 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 93 "imp_parser.mly"
                         ( Peg.Option _2 )
# 603 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv802)) : 'freshtv804)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv805 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv806)) : 'freshtv808)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv815 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv811 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv809 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 92 "imp_parser.mly"
                         ( Peg.List _2 )
# 631 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)) : 'freshtv812)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv813 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv814)) : 'freshtv816)
    | MenhirState159 | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv819 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv817 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 91 "imp_parser.mly"
             ( Peg.Atm _1 )
# 650 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)) : 'freshtv820)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stt_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stt_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState112 | MenhirState102 | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv773 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv767 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | L_HLZ ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
                _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102) : 'freshtv768)
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv769 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)) = _menhir_stack in
            let _v : 'tv_h_frm_list = 
# 255 "imp_parser.mly"
             ( [_1] )
# 689 "imp_parser.ml"
             in
            _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv770)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv771 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv772)) : 'freshtv774)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv775 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 704 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | OUT _v ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107) : 'freshtv776)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv777 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 722 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | OUT _v ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState118 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118) : 'freshtv778)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv781 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv779 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_prd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_prd_list = 
# 251 "imp_parser.mly"
                                ( _1@[_3] )
# 745 "imp_parser.ml"
         in
        _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)) : 'freshtv782)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv785 * _menhir_state * 'tv_code_coprd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv783 * _menhir_state * 'tv_code_coprd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_coprd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_coprd_list = 
# 246 "imp_parser.mly"
                                    ( _1@[_3] )
# 758 "imp_parser.ml"
         in
        _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv784)) : 'freshtv786)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv799 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 766 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 770 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv797 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 776 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 780 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 785 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)), (_4 : (
# 15 "imp_parser.mly"
       (int)
# 789 "imp_parser.ml"
        ))), _, (_5 : 'tv_stt_code)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_glb_etr_body = 
# 171 "imp_parser.mly"
                                ( (_1,fst _2,snd _2,_5) )
# 795 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv795) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState60 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv789 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 808 "imp_parser.ml"
            )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv787 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 820 "imp_parser.ml"
                )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 825 "imp_parser.ml"
                ))), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
                let _v : 'tv_glb_etr_clique = 
# 167 "imp_parser.mly"
                     ( [_2] )
# 830 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv788)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv790)
        | MenhirState59 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv793 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv791 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 163 "imp_parser.mly"
                     ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d)  )
# 847 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)) : 'freshtv794)
        | _ ->
            _menhir_fail ()) : 'freshtv796)) : 'freshtv798)) : 'freshtv800)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv757 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv755 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
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
# 875 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv756)) : 'freshtv758)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv761 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv759 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 241 "imp_parser.mly"
             ( _2 )
# 892 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)) : 'freshtv762)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv765 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv763 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 178 "imp_parser.mly"
                 (
      match _2 with
      | None -> E _1
      | Some x -> V(E _1,x) )
# 911 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv764)) : 'freshtv766)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv753 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_prd) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv751 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_rule = 
# 80 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 931 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv749) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule) = _v in
    ((match _menhir_s with
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv743) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv741) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let _v : 'tv_grm_ord = 
# 77 "imp_parser.mly"
             ( [(_1,None)] )
# 950 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv742)) : 'freshtv744)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv747 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv745 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 78 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 966 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv746)) : 'freshtv748)
    | _ ->
        _menhir_fail ()) : 'freshtv750)) : 'freshtv752)) : 'freshtv754)

and _menhir_run160 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 975 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv739) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 985 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 989 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 96 "imp_parser.mly"
        ( (Peg.Text _1) )
# 994 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv740)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv737 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce90 _menhir_env (Obj.magic _menhir_stack) MenhirState170 : 'freshtv738)

and _menhir_run163 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 1008 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv735) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1018 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1022 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 97 "imp_parser.mly"
        ( (Peg.Name _1) )
# 1027 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)

and _menhir_run164 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v
    | STG _v ->
        _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState164 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164

and _menhir_run167 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
    | STG _v ->
        _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv701 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv699 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
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
# 1085 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv700)) : 'freshtv702)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv705 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1093 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv703 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1101 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)), _, (_3 : (
# 15 "imp_parser.mly"
       (int)
# 1108 "imp_parser.ml"
        ))), _, (_4 : 'tv_stt_code)), _, (_5 : 'tv_eop)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 229 "imp_parser.mly"
                                     (
    let c = F(_2,_3,_4) in
    match _6 with
      | None -> Some c
      | Some x -> Some (V(c,x)) )
# 1118 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv704)) : 'freshtv706)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv709 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv707 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_tail) : 'tv_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_code = 
# 207 "imp_parser.mly"
             ( _2 )
# 1134 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv708)) : 'freshtv710)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv713 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv711 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
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
# 1156 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv712)) : 'freshtv714)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv717 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv715 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
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
# 1179 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv716)) : 'freshtv718)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv721 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1187 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv719 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1195 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)), _, (_2 : (
# 15 "imp_parser.mly"
       (int)
# 1202 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)), _, (_4 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 200 "imp_parser.mly"
                                 (
    let c = F(_1,_2,_3) in
    match _5 with
      | None -> c
      | Some x -> V(c,x) )
# 1211 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv720)) : 'freshtv722)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv725 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv723 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
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
# 1233 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv724)) : 'freshtv726)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv729 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv727 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
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
# 1256 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv728)) : 'freshtv730)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv733 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv731 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
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
# 1278 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)) : 'freshtv734)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv689 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1292 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv687 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1300 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 1307 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 132 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 1314 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)) : 'freshtv690)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv693 * (
# 14 "imp_parser.mly"
       (string)
# 1322 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv691 * (
# 14 "imp_parser.mly"
       (string)
# 1330 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 1337 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 120 "imp_parser.mly"
                                (
    let a = _2 in
    Def_CoPrd (_1,a,List.map (fun (y,n) -> (y,n)) _4) )
# 1345 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv692)) : 'freshtv694)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv697 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 1353 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv695 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 1361 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 1368 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 113 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 1374 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)) : 'freshtv698)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv677 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1388 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv675 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1396 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 1403 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 136 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 1410 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv676)) : 'freshtv678)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv681 * (
# 14 "imp_parser.mly"
       (string)
# 1418 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv679 * (
# 14 "imp_parser.mly"
       (string)
# 1426 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 1433 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 123 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 1439 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv680)) : 'freshtv682)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv685 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 1447 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv683 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 1455 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 1462 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 114 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 1468 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv684)) : 'freshtv686)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv669 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | L_OPN ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | NAM _v ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
        | NOT_SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv661) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState159 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv659) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 105 "imp_parser.mly"
            ( Peg.Not )
# 1502 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv660)) : 'freshtv662)
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv665) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState159 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv663) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 104 "imp_parser.mly"
        ( Peg.And )
# 1517 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv664)) : 'freshtv666)
        | STG _v ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv667) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState159 in
            ((let _v : 'tv_grm_prd = 
# 100 "imp_parser.mly"
    ( None )
# 1529 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv668)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv670)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv673 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | L_OPN ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | NAM _v ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
        | STG _v ->
            _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv671 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 101 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1557 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv672)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171) : 'freshtv674)
    | _ ->
        _menhir_fail ()

and _menhir_run80 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | L_OPN ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | L_PRN ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | L_RCD ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | N ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | NAM _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | SGN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | SLF _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | TYP_STG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | VAL _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | Z ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80

and _menhir_run82 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | L_OPN ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | L_PRN ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | L_RCD ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | N ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | NAM _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | SGN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | SLF _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | TYP_STG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | VAL _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | Z ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState82
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82

and _menhir_run84 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | L_OPN ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | L_PRN ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | L_RCD ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | N ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | NAM _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | SGN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | SLF _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | TYP_STG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | VAL _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
    | Z ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState84
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv657 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | DTA_GRM ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | LCE ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | MDL_END ->
        _menhir_reduce71 _menhir_env (Obj.magic _menhir_stack) MenhirState222
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222) : 'freshtv658)

and _menhir_run131 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_coprd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | L_HLZ ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131

and _menhir_run126 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | L_HLZ ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126

and _menhir_reduce110 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_tail = 
# 240 "imp_parser.mly"
    ( None  )
# 1721 "imp_parser.ml"
     in
    _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v

and _menhir_run110 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | EOP ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | OUT _v ->
        _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv621 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv617 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv615 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 149 "imp_parser.mly"
                        (  )
# 1764 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv616)) : 'freshtv618)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv619 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv620)) : 'freshtv622)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv627) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv623) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | DEF | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | SGN | SLF _ | TYP_STG | VAL _ | Z ->
                _menhir_reduce130 _menhir_env (Obj.magic _menhir_stack) MenhirState95
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95) : 'freshtv624)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv625) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv626)) : 'freshtv628)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv631) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv629) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 175 "imp_parser.mly"
                            ( (_2,_4) )
# 1812 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv630)) : 'freshtv632)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv643 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv639 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv635 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 1833 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState194
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv633 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1846 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 1851 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 135 "imp_parser.mly"
                         ( [(_2,_4)] )
# 1858 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv634)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState194) : 'freshtv636)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv637 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv638)) : 'freshtv640)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv641 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv642)) : 'freshtv644)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv655 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv651 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv647 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 1897 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState199
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv645 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1910 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 1915 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 131 "imp_parser.mly"
                           ( [(_2,_4)] )
# 1922 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv646)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199) : 'freshtv648)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv649 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv650)) : 'freshtv652)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv653 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv654)) : 'freshtv656)
    | _ ->
        _menhir_fail ()

and _menhir_reduce90 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 87 "imp_parser.mly"
    ( [] )
# 1951 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv609 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1963 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv607 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1971 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 1978 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 109 "imp_parser.mly"
                                        ( [_2]@_3 )
# 1983 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv608)) : 'freshtv610)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv613 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv611 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 62 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2000 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)) : 'freshtv614)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv547 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv543 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv541 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 153 "imp_parser.mly"
                    (  )
# 2034 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv542)) : 'freshtv544)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv545 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv546)) : 'freshtv548)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv553 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv549 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 151 "imp_parser.mly"
                (  )
# 2060 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv550)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv551 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv552)) : 'freshtv554)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv559 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv555 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 158 "imp_parser.mly"
                ( )
# 2086 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv557 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv558)) : 'freshtv560)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv565 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv561 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 150 "imp_parser.mly"
                (  )
# 2114 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv562)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv563 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv564)) : 'freshtv566)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv573 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv569 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv567 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 152 "imp_parser.mly"
                    (  )
# 2148 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)) : 'freshtv570)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv571 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv572)) : 'freshtv574)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv581 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv577 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv575 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 147 "imp_parser.mly"
                    ()
# 2182 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)) : 'freshtv578)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv579 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv580)) : 'freshtv582)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv587 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv583 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typs = 
# 144 "imp_parser.mly"
             ( )
# 2211 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv585 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv586)) : 'freshtv588)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv593 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | R_RCD | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 140 "imp_parser.mly"
            ( Var (ref Types.WC) )
# 2241 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv590)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv591 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv592)) : 'freshtv594)
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv599 * (
# 14 "imp_parser.mly"
       (string)
# 2256 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv595 * (
# 14 "imp_parser.mly"
       (string)
# 2272 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2277 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body_clq = 
# 124 "imp_parser.mly"
                        ( Def_EqT (_1,_2,Var (ref Types.WC)) )
# 2283 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv596)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv597 * (
# 14 "imp_parser.mly"
       (string)
# 2293 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv598)) : 'freshtv600)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv605 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2302 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv601 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2318 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2323 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 116 "imp_parser.mly"
                        ( Def_EqT (_1,_2,Var (ref Types.WC)) )
# 2329 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv602)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv603 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2339 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv604)) : 'freshtv606)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv539) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv537) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 59 "imp_parser.mly"
            ( _1 )
# 2359 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv538)) : 'freshtv540)

and _menhir_goto_code_coprd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_coprd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv529 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv525 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState129
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv526)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv527 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv528)) : 'freshtv530)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv535 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv531 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv532)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv533 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv534)) : 'freshtv536)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code_prd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv517 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv513 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState124
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv514)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv515 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv516)) : 'freshtv518)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv523 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv519 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState137
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState137) : 'freshtv520)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv521 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv522)) : 'freshtv524)
    | _ ->
        _menhir_fail ()

and _menhir_goto_eop : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eop -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv507 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2502 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109) : 'freshtv508)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv509 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2520 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119) : 'freshtv510)
    | MenhirState104 | MenhirState110 | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv511 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState121
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce110 _menhir_env (Obj.magic _menhir_stack) MenhirState121
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv512)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv505 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_OPN ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_PRN ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_RCD ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | N ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | NAM _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | SGN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | SLF _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | TYP_STG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | VAL _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | Z ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | CLN | DEF | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv503 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 139 "imp_parser.mly"
         ( Var (ref Types.WC) )
# 2587 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74) : 'freshtv506)

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv501 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce90 _menhir_env (Obj.magic _menhir_stack) MenhirState158 : 'freshtv502)

and _menhir_goto_def_typ_body_clq : _menhir_env -> 'ttv_tail -> 'tv_def_typ_body_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv499 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2609 "imp_parser.ml"
    )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState205 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2621 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 2626 "imp_parser.ml"
        ))), (_2 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _v : 'tv_def_typ_clique = 
# 108 "imp_parser.mly"
                         ( [_2] )
# 2631 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv498)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv500)

and _menhir_run191 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | SGN | SLF _ | TYP_STG | VAL _ | Z ->
        _menhir_reduce130 _menhir_env (Obj.magic _menhir_stack) MenhirState191
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191

and _menhir_run196 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | SGN | SLF _ | TYP_STG | VAL _ | Z ->
        _menhir_reduce130 _menhir_env (Obj.magic _menhir_stack) MenhirState196
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv495) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 156 "imp_parser.mly"
      ( )
# 2679 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 2686 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv493) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 2696 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 2700 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 154 "imp_parser.mly"
        ( )
# 2705 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv494)

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv491) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 160 "imp_parser.mly"
            ( )
# 2719 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv492)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 2726 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv487 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2738 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv483 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2748 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 2753 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv481 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2760 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let ((_3 : (
# 14 "imp_parser.mly"
       (string)
# 2765 "imp_parser.ml"
            )) : (
# 14 "imp_parser.mly"
       (string)
# 2769 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 2774 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 149 "imp_parser.mly"
                        (  )
# 2780 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv482)) : 'freshtv484)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv485 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2790 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv486)) : 'freshtv488)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv489 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2801 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv490)

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv479) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 159 "imp_parser.mly"
        ( )
# 2816 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv480)

and _menhir_run71 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 2823 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 2833 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 2837 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 155 "imp_parser.mly"
        ( )
# 2842 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)

and _menhir_run72 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv475) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 157 "imp_parser.mly"
      (  )
# 2856 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv476)

and _menhir_run73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | R_RCD | SGN | SLF _ | TYP_STG | VAL _ | Z ->
        _menhir_reduce130 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73

and _menhir_run75 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | L_OPN ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | L_PRN ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | L_RCD ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | N ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | NAM _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | SGN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | SLF _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | TYP_STG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | VAL _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | Z ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75

and _menhir_run76 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | L_OPN ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | L_PRN ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | L_RCD ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | N ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | NAM _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | SGN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | SLF _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | TYP_STG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | VAL _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | Z ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76

and _menhir_run77 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | L_OPN ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | L_PRN ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | L_RCD ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | N ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | NAM _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | SGN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | SLF _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | TYP_STG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | VAL _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | Z ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv469 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2982 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv467 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2990 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2997 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 51 "imp_parser.mly"
                 ( _1::_3 )
# 3003 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv468)) : 'freshtv470)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv473 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv471 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 47 "imp_parser.mly"
             ( _2 )
# 3020 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv472)) : 'freshtv474)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv465 * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv463 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_def_typ_body) : 'tv_def_typ_body) = _v in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_typ = 
# 63 "imp_parser.mly"
                     ( Flow _2 )
# 3041 "imp_parser.ml"
     in
    _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv464)) : 'freshtv466)

and _menhir_reduce12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_coprd_list = 
# 245 "imp_parser.mly"
    ( [] )
# 3050 "imp_parser.ml"
     in
    _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_prd_list = 
# 250 "imp_parser.mly"
    ( [] )
# 3059 "imp_parser.ml"
     in
    _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run105 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 3066 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv461) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 3076 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 3080 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_eop = 
# 237 "imp_parser.mly"
        ()
# 3085 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | L_HLZ ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv459) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eop = 
# 236 "imp_parser.mly"
        ()
# 3116 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv460)

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | L_HLZ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv457 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState111 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | L_HLZ ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
            _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112) : 'freshtv458)
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState111
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv451 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv447 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv445 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 292 "imp_parser.mly"
                         ( _2 )
# 3175 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)) : 'freshtv448)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv449 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv450)) : 'freshtv452)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv455 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv453 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 296 "imp_parser.mly"
                 ( App(Atm (Name "⟦"),Rcd [|_1;_2|]) )
# 3194 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)) : 'freshtv456)
    | _ ->
        _menhir_fail ()

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv441 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "imp_parser.mly"
       (int)
# 3212 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv439 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 15 "imp_parser.mly"
       (int)
# 3220 "imp_parser.ml"
        )) : (
# 15 "imp_parser.mly"
       (int)
# 3224 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 288 "imp_parser.mly"
                ( Prj(_1,_3) )
# 3231 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv440)) : 'freshtv442)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv443 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv444)

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState27
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
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState33
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
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState29
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

and _menhir_run35 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35

and _menhir_run31 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState31
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

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv437 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3464 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv433 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3474 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv429 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3484 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 3489 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | L_HLZ ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
                _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState99
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99) : 'freshtv430)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv431 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3512 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv432)) : 'freshtv434)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv435 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3523 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv436)) : 'freshtv438)

and _menhir_reduce130 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 143 "imp_parser.mly"
    ( )
# 3533 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | L_OPN ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | L_PRN ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | L_RCD ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | N ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | NAM _v ->
        _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | SGN ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | SLF _v ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | TYP_STG ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | VAL _v ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | Z ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run156 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv427) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 84 "imp_parser.mly"
                  ( Peg.Lex )
# 3580 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv428)

and _menhir_run157 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv425) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 83 "imp_parser.mly"
          ( Peg.Synt )
# 3594 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv413 * (
# 14 "imp_parser.mly"
       (string)
# 3607 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv405 * (
# 14 "imp_parser.mly"
       (string)
# 3617 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | L_OPN ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | L_PRN ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | L_RCD ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | N ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | NAM _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState203 _v
            | SGN ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | SLF _v ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState203 _v
            | TYP_STG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | VAL _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState203 _v
            | Z ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState203
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState203) : 'freshtv406)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv407 * (
# 14 "imp_parser.mly"
       (string)
# 3653 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState190
            | PRD ->
                _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState190
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190) : 'freshtv408)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv409 * (
# 14 "imp_parser.mly"
       (string)
# 3671 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3676 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body_clq = 
# 119 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 3681 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv410)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv411 * (
# 14 "imp_parser.mly"
       (string)
# 3691 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv412)) : 'freshtv414)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3700 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv415 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3710 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState212
            | L_OPN ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState212
            | L_PRN ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState212
            | L_RCD ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState212
            | N ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState212
            | NAM _v ->
                _menhir_run71 _menhir_env (Obj.magic _menhir_stack) MenhirState212 _v
            | SGN ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState212
            | SLF _v ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState212 _v
            | TYP_STG ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState212
            | VAL _v ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState212 _v
            | Z ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState212
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState212) : 'freshtv416)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv417 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3746 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run196 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | PRD ->
                _menhir_run191 _menhir_env (Obj.magic _menhir_stack) MenhirState209
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209) : 'freshtv418)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv419 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3764 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3769 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body = 
# 112 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 3774 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv421 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3784 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv422)) : 'freshtv424)
    | _ ->
        _menhir_fail ()

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 3794 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3806 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186) : 'freshtv400)
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv401 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3822 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3827 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 50 "imp_parser.mly"
        ( [_1] )
# 3832 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv402)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3842 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv404)

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv393 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3855 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3863 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3870 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 128 "imp_parser.mly"
                  ( _1::_2 )
# 3875 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)) : 'freshtv394)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv397 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 3883 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv395 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 3891 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 3898 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 115 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3905 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)) : 'freshtv398)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv377 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv375 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 31 "imp_parser.mly"
      (Lang.Ast.line)
# 3931 "imp_parser.ml"
            ) = 
# 35 "imp_parser.mly"
                ( Line _1 )
# 3935 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)) : 'freshtv378)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv379 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv380)) : 'freshtv382)
    | MenhirState99 | MenhirState100 | MenhirState106 | MenhirState131 | MenhirState126 | MenhirState117 | MenhirState112 | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | EOP ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv383 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState104 in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 3962 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | L_HLZ ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
                _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv384)
        | OUT _v ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
        | PRD | PRD_END ->
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | COPRD | COPRD_END ->
            _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv386)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv389 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | EOP ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv387 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState116 in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 4005 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | L_HLZ ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT ->
                _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv388)
        | OUT _v ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | PRD | PRD_END ->
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | COPRD | COPRD_END ->
            _menhir_reduce12 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv390)
    | _ ->
        _menhir_fail ()

and _menhir_reduce95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 295 "imp_parser.mly"
    ( App(Atm (Name "⟦⟧"),Rcd [||]) )
# 4039 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | EQ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MNS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PLS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv323 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp = 
# 268 "imp_parser.mly"
                          ( Agl_Op _2 )
# 4073 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv326)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv329 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState28
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv327 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 281 "imp_parser.mly"
                ( App(Atm Pls,Rcd [|_1;_3|]) )
# 4100 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28) : 'freshtv330)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv333 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv331 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 282 "imp_parser.mly"
                ( App(Atm Mlt,Rcd [|_1;_3|]) )
# 4125 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv334)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv337 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | AGL | APP | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv335 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 287 "imp_parser.mly"
                ( App(_1,_3) )
# 4148 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv336)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv338)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv341 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv339 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 283 "imp_parser.mly"
                ( App(Atm Pls,Rcd [|_1;App(Atm Mns,_3)|]) )
# 4175 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv340)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv342)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv345 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | MNS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | PLS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv343 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 285 "imp_parser.mly"
               ( App(Atm Eq,Rcd [|_1;_3|]) )
# 4206 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv346)
    | MenhirState39 | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv347 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | CHO _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | EQ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | EXN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | IDX _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | INJ _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | L_LST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | L_OPN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | MNS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | PLS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | VCT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | R_LST ->
            _menhir_reduce95 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv348)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv353 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | EQ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MNS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | PLS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv351 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState41 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv349 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 291 "imp_parser.mly"
                    ( App(Atm (Name "‹"),_2) )
# 4301 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)) : 'freshtv352)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv354)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv359 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | EQ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | MNS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | PLS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv357 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState43 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv355 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 284 "imp_parser.mly"
                        ( App(Atm Mns,_3) )
# 4341 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)) : 'freshtv358)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv360)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv365 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | EQ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MNS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PLS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv363 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState45 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv361 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 286 "imp_parser.mly"
                    ( _2 )
# 4380 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)) : 'freshtv364)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv366)
    | MenhirState53 | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv369 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EQ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MNS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PLS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_RCD | SGN | SLF _ | STG _ | VCT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv367 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 264 "imp_parser.mly"
                 ( _1@[_2] )
# 4412 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv370)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv373 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | EQ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | MLT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | MNS ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PLS ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PRJ ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv371 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 260 "imp_parser.mly"
            ( _2 )
# 4445 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv374)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv309 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv307 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 55 "imp_parser.mly"
                        ( _1::_2 )
# 4468 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv308)) : 'freshtv310)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv321 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4476 "imp_parser.ml"
        ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv317 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4486 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv315 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4493 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 4498 "imp_parser.ml"
            ))), _, (_4 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 43 "imp_parser.mly"
                                   ( (_2,_4) )
# 4506 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv313) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_def_mdl) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv311 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | MDL ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState231
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231) : 'freshtv312)) : 'freshtv314)) : 'freshtv316)) : 'freshtv318)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv319 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4533 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)) : 'freshtv322)
    | _ ->
        _menhir_fail ()

and _menhir_run60 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4543 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 4560 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce130 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv302)
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 174 "imp_parser.mly"
    ( (Var (ref Types.WC),Var (ref Types.WC)) )
# 4587 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv304)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4597 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)

and _menhir_run152 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4605 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4617 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv293 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4627 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4632 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv289 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4643 "imp_parser.ml"
                ))) * (
# 14 "imp_parser.mly"
       (string)
# 4647 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState155
                | ORD_LEX_COPRD ->
                    _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState155
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv290)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv291 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4667 "imp_parser.ml"
                ))) * (
# 14 "imp_parser.mly"
       (string)
# 4671 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv292)) : 'freshtv294)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv295 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4682 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)) : 'freshtv298)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4693 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)

and _menhir_run182 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4701 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4714 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183) : 'freshtv286)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4735 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)

and _menhir_reduce16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_def_arg = 
# 46 "imp_parser.mly"
    ( [] )
# 4745 "imp_parser.ml"
     in
    _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184

and _menhir_run217 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 4765 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4779 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 4784 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 127 "imp_parser.mly"
        ( [_1] )
# 4789 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | CHO _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | EXN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | IDX _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | INJ _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | L_LST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | L_OPN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv275 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState11 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv273 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 289 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 4850 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)) : 'freshtv276)
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv278)
    | MenhirState99 | MenhirState100 | MenhirState102 | MenhirState106 | MenhirState111 | MenhirState131 | MenhirState126 | MenhirState117 | MenhirState112 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CHO _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | EXN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | IDX _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | INJ _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | L_LST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | L_OPN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | VCT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 259 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 4910 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv282)
    | _ ->
        _menhir_fail ()

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv271) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 273 "imp_parser.mly"
        ( Atm (Name "#")  )
# 4930 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 4937 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 4947 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 4951 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 279 "imp_parser.mly"
        ( Atm (Stg _1) )
# 4956 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv270)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4963 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv267) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 4973 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 4977 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 280 "imp_parser.mly"
        ( Atm Fix )
# 4982 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 278 "imp_parser.mly"
        ( App(Atm (Name "&"),Rcd [||]) )
# 4996 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5003 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv263) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5013 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5017 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 271 "imp_parser.mly"
        ( Rot )
# 5022 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv264)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5029 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5041 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv253 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5051 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5056 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv251 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5063 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let ((_3 : (
# 14 "imp_parser.mly"
       (string)
# 5068 "imp_parser.ml"
            )) : (
# 14 "imp_parser.mly"
       (string)
# 5072 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5077 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 277 "imp_parser.mly"
                ( Atm(Name (_1^"."^_3)) )
# 5083 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv252)) : 'freshtv254)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv255 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5093 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)) : 'freshtv258)
    | AGL | APP | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv259 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5102 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5107 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 276 "imp_parser.mly"
         ( Atm (Name _1) )
# 5112 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5122 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState10

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | MNS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv249 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState13 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | CHO _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | EXN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | IDX _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | INJ _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | L_LST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | L_OPN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | VCT ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14) : 'freshtv250)
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
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
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | R_OPN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState15 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 290 "imp_parser.mly"
                ( App(Atm(Name "‹›"),Rcd [||]) )
# 5264 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv246)) : 'freshtv248)
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | R_LST ->
        _menhir_reduce95 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5328 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv243) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5338 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5342 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 269 "imp_parser.mly"
        ( Atm(Z _1) )
# 5347 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv244)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5354 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv241) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5364 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5368 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 274 "imp_parser.mly"
        ( Atm(Inj _1) )
# 5373 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5380 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv239) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5390 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5394 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 272 "imp_parser.mly"
        ( Prj(Rot,_1) )
# 5399 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv240)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv237) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 270 "imp_parser.mly"
        ( Atm Exn )
# 5413 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv238)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5420 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv235) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5430 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5434 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 275 "imp_parser.mly"
        ( Atm(Cho _1)  )
# 5439 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv236)

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | VCT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_reduce71 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 54 "imp_parser.mly"
      ( [] )
# 5491 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | SLF _v ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59

and _menhir_run151 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151

and _menhir_run181 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState181 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv227 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5543 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv223 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5554 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216) : 'freshtv224)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv225 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5572 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)) : 'freshtv228)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv229 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)) : 'freshtv232)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState181 in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5590 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207) : 'freshtv234)
    | SLF _v ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState181

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5614 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5625 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5633 "imp_parser.ml"
        )) : (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5637 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv216)) : 'freshtv218)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5647 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5655 "imp_parser.ml"
        )) : (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5659 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5665 "imp_parser.ml"
        ) = 
# 40 "imp_parser.mly"
                 ( _1::_2 )
# 5669 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)) : 'freshtv222)
    | _ ->
        _menhir_fail ()

and _menhir_reduce65 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 263 "imp_parser.mly"
    ( [] )
# 5680 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState1
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
# 31 "imp_parser.mly"
      (Lang.Ast.line)
# 5730 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 31 "imp_parser.mly"
      (Lang.Ast.line)
# 5739 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv211) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 31 "imp_parser.mly"
      (Lang.Ast.line)
# 5747 "imp_parser.ml"
    )) : (
# 31 "imp_parser.mly"
      (Lang.Ast.line)
# 5751 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv212)) : 'freshtv214)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5773 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv29 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5782 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState212 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv31 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5791 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5800 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5809 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv37 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5818 "imp_parser.ml"
        )) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * (
# 14 "imp_parser.mly"
       (string)
# 5827 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 5836 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState194 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 5850 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv49 * (
# 14 "imp_parser.mly"
       (string)
# 5864 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5873 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * (
# 14 "imp_parser.mly"
       (string)
# 5887 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv56)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv61 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5905 "imp_parser.ml"
        ))) * (
# 14 "imp_parser.mly"
       (string)
# 5909 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState164 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv75 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5948 "imp_parser.ml"
        ))) * (
# 14 "imp_parser.mly"
       (string)
# 5952 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv79 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 5966 "imp_parser.ml"
        )) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv81 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState137 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv85 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv87 * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv89 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv93 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv97 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6015 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState118 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv99 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6024 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6033 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv113 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6067 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6076 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6085 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv121 * _menhir_state * 'tv_stt_code)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv125 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6109 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 6113 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv131 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv148)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6176 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv153 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6190 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv156)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv169 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv171 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv173 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv181 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv183 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv187 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv191 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv195 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv197 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv210)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 6345 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv15 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6356 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DTA ->
                _menhir_run181 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | DTA_GRM ->
                _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | LCE ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | MDL_END ->
                _menhir_reduce71 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv16)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv17 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6380 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)) : 'freshtv20)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)

and _menhir_run229 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6401 "imp_parser.ml"
    ) = 
# 39 "imp_parser.mly"
        ( [] )
# 6405 "imp_parser.ml"
     in
    _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv14)

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
      (Lang.Ast.line)
# 6434 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
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
# 31 "imp_parser.mly"
      (Lang.Ast.line)
# 6462 "imp_parser.ml"
            ) = 
# 36 "imp_parser.mly"
                ( End )
# 6466 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)) : 'freshtv6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)) : 'freshtv10)
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | AGL | CHO _ | EOF | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | ROT _ | SGN | SLF _ | STG _ | VCT ->
        _menhir_reduce65 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv12))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 30 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6488 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run229 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | MDL ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 6509 "imp_parser.ml"
