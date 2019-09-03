
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | WC
    | VCT_INI
    | VCT
    | VAL of (
# 14 "imp_parser.mly"
       (string)
# 15 "imp_parser.ml"
  )
    | TYP_VCT
    | TYP_STG
    | TYP_SGN
    | TYP_OPN_VCT
    | TEST
    | STG of (
# 14 "imp_parser.mly"
       (string)
# 25 "imp_parser.ml"
  )
    | SRC
    | SPL
    | SLH
    | SLF of (
# 15 "imp_parser.mly"
       (int)
# 33 "imp_parser.ml"
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
# 46 "imp_parser.ml"
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
# 57 "imp_parser.ml"
  )
    | ORD_LEX_COPRD
    | ORD_COPRD
    | NOT_SPL
    | NOT
    | NAT of (
# 15 "imp_parser.mly"
       (int)
# 66 "imp_parser.ml"
  )
    | NAM of (
# 14 "imp_parser.mly"
       (string)
# 71 "imp_parser.ml"
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
# 98 "imp_parser.ml"
  )
    | INJ of (
# 15 "imp_parser.mly"
       (int)
# 103 "imp_parser.ml"
  )
    | IN of (
# 15 "imp_parser.mly"
       (int)
# 108 "imp_parser.ml"
  )
    | IDX of (
# 15 "imp_parser.mly"
       (int)
# 113 "imp_parser.ml"
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
    | DSH
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
# 139 "imp_parser.ml"
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
  | MenhirState239
  | MenhirState230
  | MenhirState225
  | MenhirState224
  | MenhirState220
  | MenhirState217
  | MenhirState215
  | MenhirState213
  | MenhirState211
  | MenhirState207
  | MenhirState204
  | MenhirState202
  | MenhirState199
  | MenhirState198
  | MenhirState193
  | MenhirState191
  | MenhirState189
  | MenhirState188
  | MenhirState185
  | MenhirState182
  | MenhirState180
  | MenhirState175
  | MenhirState174
  | MenhirState171
  | MenhirState168
  | MenhirState162
  | MenhirState161
  | MenhirState158
  | MenhirState154
  | MenhirState150
  | MenhirState147
  | MenhirState143
  | MenhirState140
  | MenhirState134
  | MenhirState132
  | MenhirState129
  | MenhirState127
  | MenhirState124
  | MenhirState122
  | MenhirState121
  | MenhirState120
  | MenhirState119
  | MenhirState117
  | MenhirState115
  | MenhirState114
  | MenhirState113
  | MenhirState112
  | MenhirState110
  | MenhirState109
  | MenhirState107
  | MenhirState105
  | MenhirState103
  | MenhirState102
  | MenhirState98
  | MenhirState87
  | MenhirState85
  | MenhirState83
  | MenhirState80
  | MenhirState79
  | MenhirState78
  | MenhirState77
  | MenhirState76
  | MenhirState66
  | MenhirState65
  | MenhirState63
  | MenhirState61
  | MenhirState60
  | MenhirState57
  | MenhirState55
  | MenhirState50
  | MenhirState49
  | MenhirState47
  | MenhirState45
  | MenhirState43
  | MenhirState41
  | MenhirState38
  | MenhirState37
  | MenhirState36
  | MenhirState35
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState29
  | MenhirState26
  | MenhirState25
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

# 270 "imp_parser.ml"

let rec _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv895 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv893 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 82 "imp_parser.mly"
                    ( _1::_2 )
# 288 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)) : 'freshtv896)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv905 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv903 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 305 "imp_parser.ml"
        ) = 
# 78 "imp_parser.mly"
                    ( _2 )
# 309 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv901) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 317 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv899) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 325 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv897) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 333 "imp_parser.ml"
        )) : (
# 33 "imp_parser.mly"
      (Peg.grammar)
# 337 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 75 "imp_parser.mly"
            ( Gram _1 )
# 342 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv898)) : 'freshtv900)) : 'freshtv902)) : 'freshtv904)) : 'freshtv906)
    | _ ->
        _menhir_fail ()

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv891) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv889) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 69 "imp_parser.mly"
            ( _1 )
# 361 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv890)) : 'freshtv892)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv883 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 373 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv881 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 381 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 388 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 180 "imp_parser.mly"
                                        ( [_3]@_4 )
# 394 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv882)) : 'freshtv884)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv887 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv885 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 176 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 411 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv886)) : 'freshtv888)
    | _ ->
        _menhir_fail ()

and _menhir_goto_h_frm_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv867 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv865 * _menhir_state * 'tv_stt_code)) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_h_frm_list = 
# 268 "imp_parser.mly"
                              ( _1::_3 )
# 431 "imp_parser.ml"
         in
        _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv866)) : 'freshtv868)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv873 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv869 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState117
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv870)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv871 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv872)) : 'freshtv874)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv879 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv875 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState147
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv876)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv877 * _menhir_state) * _menhir_state * 'tv_h_frm_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv878)) : 'freshtv880)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv863 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 498 "imp_parser.ml"
    ))) * (
# 14 "imp_parser.mly"
       (string)
# 502 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | ORD_LEX_COPRD ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState180
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv861 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 516 "imp_parser.ml"
        ))) * (
# 14 "imp_parser.mly"
       (string)
# 520 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 525 "imp_parser.ml"
        ))), (_3 : (
# 14 "imp_parser.mly"
       (string)
# 529 "imp_parser.ml"
        ))), _, (_5 : 'tv_grm_ord)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 85 "imp_parser.mly"
                              ( (_3,[],_5) )
# 536 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv859) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv857 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState182 _v
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv855 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
            let _v : 'tv_grm_clq = 
# 81 "imp_parser.mly"
            ( [_1] )
# 557 "imp_parser.ml"
             in
            _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv856)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState182) : 'freshtv858)) : 'freshtv860)) : 'freshtv862)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv864)

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv853 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv851 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 99 "imp_parser.mly"
                      ( _1@[_2] )
# 583 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv852)) : 'freshtv854)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv837 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv833 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv831 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 105 "imp_parser.mly"
                         ( Peg.Option _2 )
# 609 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv832)) : 'freshtv834)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv835 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv836)) : 'freshtv838)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv845 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv841 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv839 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 104 "imp_parser.mly"
                         ( Peg.List _2 )
# 637 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv840)) : 'freshtv842)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv843 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv844)) : 'freshtv846)
    | MenhirState162 | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv849 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv847 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 103 "imp_parser.mly"
             ( Peg.Atm _1 )
# 656 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv848)) : 'freshtv850)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stt_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stt_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState115 | MenhirState105 | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv803 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv797 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | L_HLZ ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
                _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105) : 'freshtv798)
        | R_HLZ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv799 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_stt_code)) = _menhir_stack in
            let _v : 'tv_h_frm_list = 
# 267 "imp_parser.mly"
             ( [_1] )
# 695 "imp_parser.ml"
             in
            _menhir_goto_h_frm_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv800)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv801 * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv802)) : 'freshtv804)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv805 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 710 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | OUT _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv806)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv807 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 728 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOP ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState121
        | OUT _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv808)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv811 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv809 * _menhir_state * 'tv_code_prd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_prd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_prd_list = 
# 263 "imp_parser.mly"
                                ( _1@[_3] )
# 751 "imp_parser.ml"
         in
        _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)) : 'freshtv812)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv815 * _menhir_state * 'tv_code_coprd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv813 * _menhir_state * 'tv_code_coprd_list)) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_code_coprd_list)), _, (_3 : 'tv_stt_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_code_coprd_list = 
# 258 "imp_parser.mly"
                                    ( _1@[_3] )
# 764 "imp_parser.ml"
         in
        _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)) : 'freshtv816)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv829 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 772 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 776 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv827 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 782 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 786 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 791 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)), (_4 : (
# 15 "imp_parser.mly"
       (int)
# 795 "imp_parser.ml"
        ))), _, (_5 : 'tv_stt_code)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_glb_etr_body = 
# 183 "imp_parser.mly"
                                ( (_1,fst _2,snd _2,_5) )
# 801 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv825) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState63 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv819 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 814 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv817 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 826 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 831 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 179 "imp_parser.mly"
                         ( [_3] )
# 837 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv820)
        | MenhirState61 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv823 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv821 * _menhir_state) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 175 "imp_parser.mly"
                     ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d)  )
# 854 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)) : 'freshtv824)
        | _ ->
            _menhir_fail ()) : 'freshtv826)) : 'freshtv828)) : 'freshtv830)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv787 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_code) : 'tv_code) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 220 "imp_parser.mly"
                     (
    ( match _3 with
      | None -> Some (Ast.E _2)
      | Some x -> Some (Ast.V(Ast.E _2,x)) ) )
# 882 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv786)) : 'freshtv788)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv791 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv789 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 253 "imp_parser.mly"
             ( _2 )
# 899 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v) : 'freshtv790)) : 'freshtv792)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv795 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv793 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_code) : 'tv_code) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 190 "imp_parser.mly"
                 (
      match _2 with
      | None -> E _1
      | Some x -> V(E _1,x) )
# 918 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv794)) : 'freshtv796)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv783 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_prd) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv781 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_rule = 
# 91 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 938 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv779) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule) = _v in
    ((match _menhir_s with
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv773) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv771) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let _v : 'tv_grm_ord = 
# 88 "imp_parser.mly"
             ( [(_1,None)] )
# 957 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv772)) : 'freshtv774)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv777 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv775 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 89 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 973 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv776)) : 'freshtv778)
    | _ ->
        _menhir_fail ()) : 'freshtv780)) : 'freshtv782)) : 'freshtv784)

and _menhir_run163 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv769) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_ptn = 
# 102 "imp_parser.mly"
        ( Peg.Atm Any )
# 989 "imp_parser.ml"
     in
    _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv770)

and _menhir_run164 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 996 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv767) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1006 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1010 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 108 "imp_parser.mly"
        ( (Peg.Text _1) )
# 1015 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv768)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv765 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce95 _menhir_env (Obj.magic _menhir_stack) MenhirState174 : 'freshtv766)

and _menhir_run167 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 1029 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv763) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 1039 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 1043 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 109 "imp_parser.mly"
        ( (Peg.Name _1) )
# 1048 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv764)

and _menhir_run168 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _v
    | STG _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168

and _menhir_run171 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | STG _v ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv729 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv727 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_h_frm_list)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 224 "imp_parser.mly"
                                    (
    ( match _5 with
      | None -> Some (H _3)
      | Some x -> Some (V(H _3,x))
      )
  )
# 1106 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv728)) : 'freshtv730)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv733 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1114 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv731 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1122 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_6 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)), _, (_3 : (
# 15 "imp_parser.mly"
       (int)
# 1129 "imp_parser.ml"
        ))), _, (_4 : 'tv_stt_code)), _, (_5 : 'tv_eop)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_code = 
# 241 "imp_parser.mly"
                                     (
    let c = F(_2,_3,_4) in
    match _6 with
      | None -> Some c
      | Some x -> Some (V(c,x)) )
# 1139 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)) : 'freshtv734)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv737 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv735 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_tail) : 'tv_tail) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_code = 
# 219 "imp_parser.mly"
             ( _2 )
# 1155 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)) : 'freshtv738)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv741 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv739 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)), _, (_3 : 'tv_code_prd_list)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 236 "imp_parser.mly"
                                           (
    let c = P(_2,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (V(c,x))  )
# 1177 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv740)) : 'freshtv742)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv745 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv743 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_top)), _, (_3 : 'tv_code_coprd_list)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_code = 
# 230 "imp_parser.mly"
                                               (
    let (i,a) = Ast.tk_agl _2 in
    let c = A(a,i,_3) in
    match _5 with
    | None -> Some c
    | Some x -> Some (V(c,x)) )
# 1200 "imp_parser.ml"
         in
        _menhir_goto_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv744)) : 'freshtv746)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv749 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1208 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv747 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1216 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((((_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)), _, (_2 : (
# 15 "imp_parser.mly"
       (int)
# 1223 "imp_parser.ml"
        ))), _, (_3 : 'tv_stt_code)), _, (_4 : 'tv_eop)) = _menhir_stack in
        let _v : 'tv_stt_code = 
# 212 "imp_parser.mly"
                                 (
    let c = F(_1,_2,_3) in
    match _5 with
      | None -> c
      | Some x -> V(c,x) )
# 1232 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv748)) : 'freshtv750)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv753 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv751 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)), _, (_2 : 'tv_code_prd_list)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 206 "imp_parser.mly"
                                       (
    let c = P(_1,_2) in
    match _4 with
    | None -> c
    | Some x -> V(c,x)
  )
# 1254 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv752)) : 'freshtv754)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv757 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv755 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)), _, (_2 : 'tv_code_coprd_list)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_stt_code = 
# 199 "imp_parser.mly"
                                           (
    let (i,a) = Ast.tk_agl _1 in
    let c = A(a,i,_2) in
    match _4 with
    | None -> c
    | Some x -> V(c,x)
   )
# 1277 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv756)) : 'freshtv758)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv761 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_tail) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv759 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_tail) : 'tv_tail) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_h_frm_list)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stt_code = 
# 194 "imp_parser.mly"
                                (
    match _4 with
    | None -> H _2
    | Some x -> V(H _2,x)
  )
# 1299 "imp_parser.ml"
         in
        _menhir_goto_stt_code _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)) : 'freshtv762)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv717 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1313 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv715 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1321 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 1328 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 144 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 1335 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv716)) : 'freshtv718)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv721 * (
# 14 "imp_parser.mly"
       (string)
# 1343 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv719 * (
# 14 "imp_parser.mly"
       (string)
# 1351 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 1358 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 132 "imp_parser.mly"
                                (
    let a = _2 in
    Def_CoPrd (_1,a,List.map (fun (y,n) -> (y,n)) _4) )
# 1366 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv720)) : 'freshtv722)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv725 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 1374 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv723 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 1382 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 1389 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 125 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 1395 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv724)) : 'freshtv726)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv705 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1409 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv703 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1417 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 1424 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 148 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 1431 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv704)) : 'freshtv706)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv709 * (
# 14 "imp_parser.mly"
       (string)
# 1439 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv707 * (
# 14 "imp_parser.mly"
       (string)
# 1447 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 1454 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body_clq = 
# 135 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 1460 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv708)) : 'freshtv710)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv713 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 1468 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv711 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 1476 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 1483 "imp_parser.ml"
        ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 126 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 1489 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv712)) : 'freshtv714)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv697 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | L_OPN ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | NAM _v ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _v
        | NOT_SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv689) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState162 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv687) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 117 "imp_parser.mly"
            ( Peg.Not )
# 1523 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv688)) : 'freshtv690)
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv693) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState162 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv691) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 116 "imp_parser.mly"
        ( Peg.And )
# 1538 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv692)) : 'freshtv694)
        | STG _v ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _v
        | WC ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv695) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState162 in
            ((let _v : 'tv_grm_prd = 
# 112 "imp_parser.mly"
    ( None )
# 1552 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162) : 'freshtv698)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv701 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState175
        | L_OPN ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState175
        | NAM _v ->
            _menhir_run167 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
        | STG _v ->
            _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
        | WC ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState175
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv699 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 113 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1582 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv700)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175) : 'freshtv702)
    | _ ->
        _menhir_fail ()

and _menhir_run83 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | L_OPN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | L_PRN ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | L_RCD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | N ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | NAM _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | SGN ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | SLF _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | TYP_STG ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | VAL _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | Z ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83

and _menhir_run85 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | L_OPN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | L_PRN ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | L_RCD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | N ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | NAM _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | SGN ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | SLF _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | TYP_STG ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | VAL _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | Z ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run87 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | L_OPN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | L_PRN ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | L_RCD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | N ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | NAM _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | SGN ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | SLF _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | TYP_STG ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | VAL _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | Z ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv685 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | DTA_GRM ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | LCE ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | MDL_END ->
        _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230) : 'freshtv686)

and _menhir_run134 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_coprd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | L_HLZ ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
        _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState134
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134

and _menhir_run129 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | L_HLZ ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
        _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState129
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129

and _menhir_reduce115 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_tail = 
# 252 "imp_parser.mly"
    ( None  )
# 1746 "imp_parser.ml"
     in
    _menhir_goto_tail _menhir_env _menhir_stack _menhir_s _v

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | EOP ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState113
    | OUT _v ->
        _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv645 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv643 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 161 "imp_parser.mly"
                        (  )
# 1789 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv644)) : 'freshtv646)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv647 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv648)) : 'freshtv650)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv655) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv651) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | DEF | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | SGN | SLF _ | TYP_STG | VAL _ | Z ->
                _menhir_reduce135 _menhir_env (Obj.magic _menhir_stack) MenhirState98
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv652)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv653) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv654)) : 'freshtv656)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv659) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv657) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 187 "imp_parser.mly"
                            ( (_2,_4) )
# 1837 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv658)) : 'freshtv660)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv671 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv667 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv663 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 1858 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState202
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv661 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1871 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 1876 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 147 "imp_parser.mly"
                         ( [(_2,_4)] )
# 1883 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv662)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState202) : 'freshtv664)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv665 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv666)) : 'freshtv668)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv669 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv670)) : 'freshtv672)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv683 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv679 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv675 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (string)
# 1922 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState207
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv673 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 1935 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 14 "imp_parser.mly"
       (string)
# 1940 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 143 "imp_parser.mly"
                           ( [(_2,_4)] )
# 1947 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv674)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207) : 'freshtv676)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv677 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv678)) : 'freshtv680)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv681 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv682)) : 'freshtv684)
    | _ ->
        _menhir_fail ()

and _menhir_reduce95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 98 "imp_parser.mly"
    ( [] )
# 1976 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv637 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1988 "imp_parser.ml"
        ))) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv635 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 1996 "imp_parser.ml"
        ))) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 2003 "imp_parser.ml"
        ))), (_3 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 121 "imp_parser.mly"
                                            ( [_3]@_4 )
# 2009 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv636)) : 'freshtv638)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv641 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv639 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 73 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 2026 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv640)) : 'freshtv642)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv575 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv571 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv569 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 165 "imp_parser.mly"
                    (  )
# 2060 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv573 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv574)) : 'freshtv576)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv581 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv577 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 163 "imp_parser.mly"
                (  )
# 2086 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv579 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv580)) : 'freshtv582)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv587 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv583 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 170 "imp_parser.mly"
                ( )
# 2112 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv585 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv586)) : 'freshtv588)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv593 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | DTA | DTA_GRM | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv589 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 162 "imp_parser.mly"
                (  )
# 2140 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv590)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv591 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv592)) : 'freshtv594)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv601 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv595 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 164 "imp_parser.mly"
                    (  )
# 2174 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv596)) : 'freshtv598)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv599 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv600)) : 'freshtv602)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv609 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv605 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv603 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 159 "imp_parser.mly"
                    ()
# 2208 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)) : 'freshtv606)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv607 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv608)) : 'freshtv610)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv615 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv611 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typs = 
# 156 "imp_parser.mly"
             ( )
# 2237 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv613 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv614)) : 'freshtv616)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv621 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | R_RCD | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv617 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 152 "imp_parser.mly"
            ( Var (ref Types.WC) )
# 2267 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv618)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv619 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv620)) : 'freshtv622)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv627 * (
# 14 "imp_parser.mly"
       (string)
# 2282 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv623 * (
# 14 "imp_parser.mly"
       (string)
# 2298 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2303 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body_clq = 
# 136 "imp_parser.mly"
                        ( Def_EqT (_1,_2,Var (ref Types.WC)) )
# 2309 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv624)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv625 * (
# 14 "imp_parser.mly"
       (string)
# 2319 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv626)) : 'freshtv628)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv633 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2328 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack)
        | PRJ ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv629 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2344 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 2349 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 128 "imp_parser.mly"
                        ( Def_EqT (_1,_2,Var (ref Types.WC)) )
# 2355 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv631 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 2365 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv632)) : 'freshtv634)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv567) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 70 "imp_parser.mly"
            ( _1 )
# 2385 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)) : 'freshtv568)

and _menhir_goto_code_coprd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_coprd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv557 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv553 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState132
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState132
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132) : 'freshtv554)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv555 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv556)) : 'freshtv558)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv563 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack)
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv559 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState143
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState143
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143) : 'freshtv560)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv561 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv562)) : 'freshtv564)
    | _ ->
        _menhir_fail ()

and _menhir_goto_code_prd_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_code_prd_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv545 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv541 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState127
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127) : 'freshtv542)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv543 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv544)) : 'freshtv546)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv551 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack)
        | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv547 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SEQ ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
                _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv548)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv549 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv550)) : 'freshtv552)
    | _ ->
        _menhir_fail ()

and _menhir_goto_eop : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_eop -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv535 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2528 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112) : 'freshtv536)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv537 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2546 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv538)
    | MenhirState107 | MenhirState113 | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv539 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SEQ ->
            _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | COPRD | COPRD_END | DTA | DTA_GRM | EOP | LCE | MDL_END | M_HLZ | OUT _ | PRD | PRD_END | R_HLZ | SLF _ ->
            _menhir_reduce115 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv540)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | L_OPN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | L_PRN ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | L_RCD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | N ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | NAM _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | SGN ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | SLF _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | TYP_STG ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | VAL _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState77 _v
    | Z ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState77
    | CLN | DEF | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 151 "imp_parser.mly"
         ( Var (ref Types.WC) )
# 2613 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv532)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv534)

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv529 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce95 _menhir_env (Obj.magic _menhir_stack) MenhirState161 : 'freshtv530)

and _menhir_goto_def_typ_body_clq : _menhir_env -> 'ttv_tail -> 'tv_def_typ_body_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv527 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2635 "imp_parser.ml"
    ))) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv525 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2647 "imp_parser.ml"
        ))) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 2652 "imp_parser.ml"
        ))), (_3 : 'tv_def_typ_body_clq)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 120 "imp_parser.mly"
                             ( [_3] )
# 2658 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv526)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213) : 'freshtv528)

and _menhir_run199 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState199
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | SGN | SLF _ | TYP_STG | VAL _ | Z ->
        _menhir_reduce135 _menhir_env (Obj.magic _menhir_stack) MenhirState199
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199

and _menhir_run204 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState204
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | SGN | SLF _ | TYP_STG | VAL _ | Z ->
        _menhir_reduce135 _menhir_env (Obj.magic _menhir_stack) MenhirState204
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv523) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 168 "imp_parser.mly"
      ( )
# 2706 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv524)

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 2713 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv521) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 2723 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 2727 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 166 "imp_parser.mly"
        ( )
# 2732 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv522)

and _menhir_run69 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv519) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 172 "imp_parser.mly"
            ( )
# 2746 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 2753 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2765 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv511 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2775 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 2780 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv509 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2787 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let ((_3 : (
# 14 "imp_parser.mly"
       (string)
# 2792 "imp_parser.ml"
            )) : (
# 14 "imp_parser.mly"
       (string)
# 2796 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 15 "imp_parser.mly"
       (int)
# 2801 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 161 "imp_parser.mly"
                        (  )
# 2807 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv510)) : 'freshtv512)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv513 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2817 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv514)) : 'freshtv516)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv517 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 2828 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv518)

and _menhir_run73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv507) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 171 "imp_parser.mly"
        ( )
# 2843 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv508)

and _menhir_run74 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 2850 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv505) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 2860 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 2864 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_typ = 
# 167 "imp_parser.mly"
        ( )
# 2869 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)

and _menhir_run75 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv503) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 169 "imp_parser.mly"
      (  )
# 2883 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)

and _menhir_run76 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | R_RCD | SGN | SLF _ | TYP_STG | VAL _ | Z ->
        _menhir_reduce135 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76

and _menhir_run78 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | L_OPN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | L_PRN ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | L_RCD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | N ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | NAM _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | SGN ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | SLF _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | TYP_STG ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | VAL _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
    | Z ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | L_OPN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | L_PRN ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | L_RCD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | N ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | NAM _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | SGN ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | SLF _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | TYP_STG ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | VAL _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState79 _v
    | Z ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79

and _menhir_run80 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | L_OPN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | L_PRN ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | L_RCD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | N ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | NAM _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | SGN ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | SLF _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | TYP_STG ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | VAL _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
    | Z ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState80
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3009 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv495 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3017 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3024 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 62 "imp_parser.mly"
                 ( _1::_3 )
# 3030 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)) : 'freshtv498)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv501 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv499 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 53 "imp_parser.mly"
             ( _2 )
# 3047 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv489 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv487 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 58 "imp_parser.mly"
                 ( 1+_2 )
# 3070 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)) : 'freshtv490)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv493 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv491 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_arg = 
# 54 "imp_parser.mly"
                 ( BatList.init _2 (fun n -> "$"^(String.make n '\'')) )
# 3087 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv492)) : 'freshtv494)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv485 * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ_body) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv483 * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_def_typ_body) : 'tv_def_typ_body) = _v in
    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_def_typ = 
# 74 "imp_parser.mly"
                     ( Flow _2 )
# 3108 "imp_parser.ml"
     in
    _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv484)) : 'freshtv486)

and _menhir_reduce14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_coprd_list = 
# 257 "imp_parser.mly"
    ( [] )
# 3117 "imp_parser.ml"
     in
    _menhir_goto_code_coprd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_code_prd_list = 
# 262 "imp_parser.mly"
    ( [] )
# 3126 "imp_parser.ml"
     in
    _menhir_goto_code_prd_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_run108 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 3133 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv481) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 3143 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 3147 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_eop = 
# 249 "imp_parser.mly"
        ()
# 3152 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv482)

and _menhir_run103 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | L_HLZ ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
        _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv479) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_eop = 
# 248 "imp_parser.mly"
        ()
# 3183 "imp_parser.ml"
     in
    _menhir_goto_eop _menhir_env _menhir_stack _menhir_s _v) : 'freshtv480)

and _menhir_run114 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | L_HLZ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState114 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | L_HLZ ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
            _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv478)
    | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
        _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv471 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv467 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv465 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 305 "imp_parser.mly"
                         ( _2 )
# 3242 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv466)) : 'freshtv468)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)) : 'freshtv472)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv475 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv473 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 309 "imp_parser.mly"
                 ( App(Atm (Name "⟦"),Rcd [|_1;_2|]) )
# 3261 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv474)) : 'freshtv476)
    | _ ->
        _menhir_fail ()

and _menhir_run25 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState25
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
    | VCT_INI ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv461 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "imp_parser.mly"
       (int)
# 3322 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv459 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 15 "imp_parser.mly"
       (int)
# 3330 "imp_parser.ml"
        )) : (
# 15 "imp_parser.mly"
       (int)
# 3334 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 301 "imp_parser.mly"
                ( Prj(_1,_3) )
# 3341 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv460)) : 'freshtv462)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv463 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)

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
    | VCT_INI ->
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
    | VCT_INI ->
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
    | VCT_INI ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run37 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | CHO _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | EXN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | IDX _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | INJ _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | INT _v ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | L_LST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | L_OPN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | L_RCD ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | ROT _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | VCT_INI ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37

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
    | VCT_INI ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv457 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3574 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv453 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3584 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv449 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3594 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 3599 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | L_HLZ ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
                _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState102
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102) : 'freshtv450)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv451 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3622 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv452)) : 'freshtv454)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv455 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3633 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv456)) : 'freshtv458)

and _menhir_reduce135 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 155 "imp_parser.mly"
    ( )
# 3643 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | L_OPN ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | L_PRN ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | L_RCD ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | N ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | NAM _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
    | SGN ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | SLF _v ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
    | TYP_STG ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | VAL _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
    | Z ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66

and _menhir_run159 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv447) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 95 "imp_parser.mly"
                  ( Peg.Lex )
# 3690 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv448)

and _menhir_run160 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv445) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 94 "imp_parser.mly"
          ( Peg.Synt )
# 3704 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv433 * (
# 14 "imp_parser.mly"
       (string)
# 3717 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv425 * (
# 14 "imp_parser.mly"
       (string)
# 3727 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | L_OPN ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | L_PRN ->
                _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | L_RCD ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | N ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | NAM _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | SGN ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | SLF _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | TYP_STG ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | VAL _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState211 _v
            | Z ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState211
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211) : 'freshtv426)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv427 * (
# 14 "imp_parser.mly"
       (string)
# 3763 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState198
            | PRD ->
                _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState198
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState198) : 'freshtv428)
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv429 * (
# 14 "imp_parser.mly"
       (string)
# 3781 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3786 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body_clq = 
# 131 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 3791 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body_clq _menhir_env _menhir_stack _v) : 'freshtv430)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv431 * (
# 14 "imp_parser.mly"
       (string)
# 3801 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv432)) : 'freshtv434)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv443 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3810 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv435 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3820 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_LST ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | L_OPN ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | L_PRN ->
                _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | L_RCD ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | N ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | NAM _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
            | SGN ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | SLF _v ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
            | TYP_STG ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | VAL _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
            | Z ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState220
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv436)
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3856 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COPRD ->
                _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | PRD ->
                _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState217
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217) : 'freshtv438)
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv439 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3874 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3879 "imp_parser.ml"
            ))), _, (_2 : 'tv_def_arg)) = _menhir_stack in
            let _v : 'tv_def_typ_body = 
# 124 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 3884 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv440)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv441 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3894 "imp_parser.ml"
            )) * _menhir_state * 'tv_def_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv442)) : 'freshtv444)
    | _ ->
        _menhir_fail ()

and _menhir_run190 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 3904 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv419 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3916 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState191 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState191) : 'freshtv420)
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv421 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3932 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 3937 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 61 "imp_parser.mly"
        ( [_1] )
# 3942 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv422)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv423 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3952 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv424)

and _menhir_run193 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState193
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv417 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 57 "imp_parser.mly"
        ( 1 )
# 3973 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState193

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv411 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3989 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv409 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 3997 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 4004 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 140 "imp_parser.mly"
                  ( _1::_2 )
# 4009 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv410)) : 'freshtv412)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv415 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4017 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv413 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4025 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 4032 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 127 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 4039 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv399 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv395 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv393 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 4065 "imp_parser.ml"
            ) = 
# 37 "imp_parser.mly"
  (
    ( try
      let (i,a) = Ast.tk_agl _1 in
      Line_Agl (i,a)
      with _ -> Line _1 ) )
# 4073 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)) : 'freshtv396)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv397 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv398)) : 'freshtv400)
    | MenhirState102 | MenhirState103 | MenhirState109 | MenhirState134 | MenhirState129 | MenhirState120 | MenhirState115 | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv403 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | EOP ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv401 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState107 in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 4100 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | L_HLZ ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
                _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109) : 'freshtv402)
        | OUT _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
        | PRD | PRD_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | COPRD | COPRD_END ->
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107) : 'freshtv404)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv407 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | EOP ->
            _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | IN _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv405 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState119 in
            let (_v : (
# 15 "imp_parser.mly"
       (int)
# 4143 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState120
            | L_HLZ ->
                _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState120
            | AGL | ARR | CHO _ | COPRD | COPRD_END | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
                _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState120
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120) : 'freshtv406)
        | OUT _v ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
        | PRD | PRD_END ->
            _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | COPRD | COPRD_END ->
            _menhir_reduce14 _menhir_env (Obj.magic _menhir_stack) MenhirState119
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119) : 'freshtv408)
    | _ ->
        _menhir_fail ()

and _menhir_reduce100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 308 "imp_parser.mly"
    ( App(Atm (Name "⟦⟧"),Rcd [||]) )
# 4177 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | EQ ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | VCT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv337 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp = 
# 280 "imp_parser.mly"
                          ( Agl_Op _2 )
# 4213 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv340)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv343 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv341 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 286 "imp_parser.mly"
                ( App(Atm (Name "⊵"),Rcd [|_1;_3|]) )
# 4244 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv344)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv347 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv345 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 294 "imp_parser.mly"
                ( App(Atm Pls,Rcd [|_1;_3|]) )
# 4271 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv348)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv351 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv349 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 295 "imp_parser.mly"
                ( App(Atm Mlt,Rcd [|_1;_3|]) )
# 4296 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv352)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv355 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | AGL | APP | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv353 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 300 "imp_parser.mly"
                ( App(_1,_3) )
# 4319 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv356)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv359 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv357 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 296 "imp_parser.mly"
                ( App(Atm Pls,Rcd [|_1;App(Atm Mns,_3)|]) )
# 4346 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv360)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv363 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | VCT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv361 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 298 "imp_parser.mly"
               ( App(Atm Eq,Rcd [|_1;_3|]) )
# 4379 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv364)
    | MenhirState41 | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | CHO _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | EQ ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | EXN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | IDX _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | INJ _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | L_LST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | L_OPN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | VCT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | VCT_INI ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | R_LST ->
            _menhir_reduce100 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv366)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv371 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | EQ ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv369 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState43 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv367 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 304 "imp_parser.mly"
                    ( App(Atm (Name "‹"),_2) )
# 4476 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)) : 'freshtv370)
        | VCT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv372)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv377 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | EQ ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv375 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState45 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv373 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 297 "imp_parser.mly"
                        ( App(Atm Mns,_3) )
# 4518 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)) : 'freshtv376)
        | VCT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv378)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv383 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EQ ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv381 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState47 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv379 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 299 "imp_parser.mly"
                    ( _2 )
# 4559 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)) : 'freshtv382)
        | VCT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv384)
    | MenhirState55 | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv387 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | EQ ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | VCT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | AGL | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OUT _ | PRD | PRD_END | ROT _ | R_RCD | SGN | SLF _ | STG _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv385 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 276 "imp_parser.mly"
                 ( _1@[_2] )
# 4595 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv388)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv391 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | EQ ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | MLT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | MNS ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PLS ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PRJ ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | VCT ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv389 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 272 "imp_parser.mly"
            ( _2 )
# 4630 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50) : 'freshtv392)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv321 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 66 "imp_parser.mly"
                        ( _1::_2 )
# 4653 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)) : 'freshtv324)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv335 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4661 "imp_parser.ml"
        ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv331 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4671 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv329 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4678 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 14 "imp_parser.mly"
       (string)
# 4683 "imp_parser.ml"
            ))), _, (_4 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 49 "imp_parser.mly"
                                   ( (_2,_4) )
# 4691 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv327) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_def_mdl) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv325 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState239
            | MDL ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState239
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState239) : 'freshtv326)) : 'freshtv328)) : 'freshtv330)) : 'freshtv332)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv333 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 4718 "imp_parser.ml"
            ))) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)
    | _ ->
        _menhir_fail ()

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4728 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4740 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv318)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv319 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4758 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv320)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 4766 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce135 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv312)
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv313) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 186 "imp_parser.mly"
    ( (Var (ref Types.WC),Var (ref Types.WC)) )
# 4793 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv314)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 4803 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv316)

and _menhir_run155 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4811 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4823 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv303 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4833 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4838 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv299 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4849 "imp_parser.ml"
                ))) * (
# 14 "imp_parser.mly"
       (string)
# 4853 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState158
                | ORD_LEX_COPRD ->
                    _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState158
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158) : 'freshtv300)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv301 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4873 "imp_parser.ml"
                ))) * (
# 14 "imp_parser.mly"
       (string)
# 4877 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)) : 'freshtv304)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv305 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4888 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)) : 'freshtv308)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4899 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)

and _menhir_run186 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 4907 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4919 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 4930 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
                _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState188
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188) : 'freshtv292)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv293 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4951 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)) : 'freshtv296)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 4962 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)

and _menhir_reduce18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_def_arg = 
# 52 "imp_parser.mly"
    ( [] )
# 4972 "imp_parser.ml"
     in
    _menhir_goto_def_arg _menhir_env _menhir_stack _menhir_s _v

and _menhir_run189 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run193 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | VAL _v ->
        _menhir_run190 _menhir_env (Obj.magic _menhir_stack) MenhirState189 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState189

and _menhir_run225 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 4994 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState225 _v
    | DTA | DTA_GRM | LCE | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5008 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5013 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 139 "imp_parser.mly"
        ( [_1] )
# 5018 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv290)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState225

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
        let (_menhir_stack : ('freshtv283 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv281 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState11 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv279 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 302 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 5079 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)) : 'freshtv282)
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | VCT_INI ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv284)
    | MenhirState102 | MenhirState103 | MenhirState105 | MenhirState109 | MenhirState114 | MenhirState134 | MenhirState129 | MenhirState120 | MenhirState115 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | CHO _v ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | EXN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | IDX _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | INJ _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | INT _v ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | L_LST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | L_OPN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | L_PRN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | L_RCD ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | ROT _v ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | SGN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | SLF _v ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | STG _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | VCT_INI ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | ARR | COPRD | COPRD_END | EOF | EOP | IN _ | OUT _ | PRD | PRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv285 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 271 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 5139 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv288)
    | _ ->
        _menhir_fail ()

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 285 "imp_parser.mly"
            ( App(Atm (Name "#"),Rcd [||])  )
# 5159 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv278)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5166 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv275) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (string)
# 5176 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (string)
# 5180 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 292 "imp_parser.mly"
        ( Atm (Stg _1) )
# 5185 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv276)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5192 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv273) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5202 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5206 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 293 "imp_parser.mly"
        ( Atm Fix )
# 5211 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv271) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 291 "imp_parser.mly"
        ( App(Atm (Name "&"),Rcd [||]) )
# 5225 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5232 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5242 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5246 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 283 "imp_parser.mly"
        ( Rot )
# 5251 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv270)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (string)
# 5258 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv263 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5270 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv259 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5280 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5285 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv257 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5292 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let ((_3 : (
# 14 "imp_parser.mly"
       (string)
# 5297 "imp_parser.ml"
            )) : (
# 14 "imp_parser.mly"
       (string)
# 5301 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5306 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 290 "imp_parser.mly"
                ( Atm(Name (_1^"."^_3)) )
# 5312 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv258)) : 'freshtv260)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv261 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5322 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)) : 'freshtv264)
    | AGL | APP | ARR | CHO _ | COPRD | COPRD_END | EOF | EOP | EQ | EXN | IDX _ | IN _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OUT _ | PLS | PRD | PRD_END | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VCT | VCT_INI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5331 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 14 "imp_parser.mly"
       (string)
# 5336 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 289 "imp_parser.mly"
         ( Atm (Name _1) )
# 5341 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 5351 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState10

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
        let (_menhir_stack : 'freshtv255 * _menhir_state) = Obj.magic _menhir_stack in
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
        | VCT_INI ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14) : 'freshtv256)
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
    | VCT_INI ->
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
        let (_menhir_stack : 'freshtv253 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState15 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 303 "imp_parser.mly"
                ( App(Atm(Name "‹›"),Rcd [||]) )
# 5493 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv252)) : 'freshtv254)
    | SGN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | SLF _v ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | STG _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | VCT_INI ->
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
    | VCT_INI ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | R_LST ->
        _menhir_reduce100 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5557 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv249) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5567 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5571 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 281 "imp_parser.mly"
        ( Atm(Z _1) )
# 5576 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv250)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5583 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv247) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5593 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5597 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 287 "imp_parser.mly"
        ( Atm(Inj _1) )
# 5602 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv248)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5609 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv245) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5619 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5623 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 284 "imp_parser.mly"
        ( Prj(Rot,_1) )
# 5628 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv246)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv243) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 282 "imp_parser.mly"
        ( Atm Exn )
# 5642 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv244)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 15 "imp_parser.mly"
       (int)
# 5649 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv241) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 15 "imp_parser.mly"
       (int)
# 5659 "imp_parser.ml"
    )) : (
# 15 "imp_parser.mly"
       (int)
# 5663 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 288 "imp_parser.mly"
        ( Atm(Cho _1)  )
# 5668 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)

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
    | VCT_INI ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_reduce75 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 65 "imp_parser.mly"
      ( [] )
# 5720 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | SLF _v ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61

and _menhir_run154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv237) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState185 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv233 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5772 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv229 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5783 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    _menhir_run225 _menhir_env (Obj.magic _menhir_stack) MenhirState224 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState224) : 'freshtv230)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv231 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 5801 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)) : 'freshtv234)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv235 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)) : 'freshtv238)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState185 in
        let (_v : (
# 14 "imp_parser.mly"
       (string)
# 5819 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run189 _menhir_env (Obj.magic _menhir_stack) MenhirState215
        | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState215
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState215) : 'freshtv240)
    | SLF _v ->
        _menhir_run186 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5843 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5854 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5862 "imp_parser.ml"
        )) : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5866 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv222)) : 'freshtv224)
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv227 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5876 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5884 "imp_parser.ml"
        )) : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5888 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 5894 "imp_parser.ml"
        ) = 
# 46 "imp_parser.mly"
                 ( _1::_2 )
# 5898 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv226)) : 'freshtv228)
    | _ ->
        _menhir_fail ()

and _menhir_reduce69 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 275 "imp_parser.mly"
    ( [] )
# 5909 "imp_parser.ml"
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
    | VCT_INI ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 5959 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 5968 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv217) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 5976 "imp_parser.ml"
    )) : (
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 5980 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv218)) : 'freshtv220)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6002 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState224 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv29 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6011 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv31 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6020 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6029 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6038 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6047 "imp_parser.ml"
        ))) * 'tv_def_typ_body_clq) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * (
# 14 "imp_parser.mly"
       (string)
# 6056 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 6065 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState202 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv45 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 14 "imp_parser.mly"
       (string)
# 6079 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState198 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv49 * (
# 14 "imp_parser.mly"
       (string)
# 6093 "imp_parser.ml"
        )) * _menhir_state * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState193 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState191 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6107 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * (
# 14 "imp_parser.mly"
       (string)
# 6121 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv63 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6139 "imp_parser.ml"
        ))) * (
# 14 "imp_parser.mly"
       (string)
# 6143 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv73 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState161 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv77 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6182 "imp_parser.ml"
        ))) * (
# 14 "imp_parser.mly"
       (string)
# 6186 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv81 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6200 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv85 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv87 * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv91 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_coprd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv95 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * 'tv_code_prd_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv99 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6249 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv101 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6258 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv103 * _menhir_state) * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6267 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state) * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv107 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_h_frm_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv115 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6301 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) * _menhir_state * 'tv_eop) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6310 "imp_parser.ml"
        )) * _menhir_state * 'tv_stt_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv119 * _menhir_state * 'tv_exp_top) * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6319 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state * 'tv_stt_code)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv127 * _menhir_state * (
# 14 "imp_parser.mly"
       (string)
# 6343 "imp_parser.ml"
        )) * 'tv_typ_def)) * (
# 15 "imp_parser.mly"
       (int)
# 6347 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv129) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv131 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv150)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * _menhir_state * (
# 15 "imp_parser.mly"
       (int)
# 6410 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6424 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv158)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv165 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv167 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv169 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv177 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv179 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv183 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv189 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv191 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv193 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv197 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv199 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv211 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv216)

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
# 6589 "imp_parser.ml"
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
# 6600 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DTA ->
                _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | DTA_GRM ->
                _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | LCE ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | MDL_END ->
                _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) MenhirState60
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv16)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv17 * _menhir_state) * (
# 14 "imp_parser.mly"
       (string)
# 6624 "imp_parser.ml"
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

and _menhir_run237 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6645 "imp_parser.ml"
    ) = 
# 45 "imp_parser.mly"
        ( [] )
# 6649 "imp_parser.ml"
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
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 6678 "imp_parser.ml"
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
# 32 "imp_parser.mly"
      (Lang.Ast.line)
# 6706 "imp_parser.ml"
            ) = 
# 42 "imp_parser.mly"
                ( End )
# 6710 "imp_parser.ml"
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
    | AGL | CHO _ | EOF | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | ROT _ | SGN | SLF _ | STG _ | VCT_INI ->
        _menhir_reduce69 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv12))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 31 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6732 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run237 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | MDL ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 6753 "imp_parser.ml"
