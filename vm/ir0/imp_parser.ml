
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
# 111 "imp_parser.ml"
  )
    | INJ of (
# 17 "imp_parser.mly"
       (int)
# 116 "imp_parser.ml"
  )
    | INI_IR
    | IN of (
# 17 "imp_parser.mly"
       (int)
# 122 "imp_parser.ml"
  )
    | IDX of (
# 17 "imp_parser.mly"
       (int)
# 127 "imp_parser.ml"
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
    | COPRD_END
    | COPRD
    | CNS_IR
    | CMM
    | CLN
    | CHO of (
# 17 "imp_parser.mly"
       (int)
# 152 "imp_parser.ml"
  )
    | ARR_REV_IN
    | ARR_REV
    | ARR_END
    | ARR
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
  | MenhirState278
  | MenhirState269
  | MenhirState265
  | MenhirState262
  | MenhirState261
  | MenhirState258
  | MenhirState257
  | MenhirState253
  | MenhirState250
  | MenhirState248
  | MenhirState245
  | MenhirState244
  | MenhirState239
  | MenhirState237
  | MenhirState235
  | MenhirState233
  | MenhirState231
  | MenhirState228
  | MenhirState226
  | MenhirState221
  | MenhirState220
  | MenhirState217
  | MenhirState214
  | MenhirState208
  | MenhirState207
  | MenhirState204
  | MenhirState200
  | MenhirState196
  | MenhirState190
  | MenhirState188
  | MenhirState186
  | MenhirState185
  | MenhirState184
  | MenhirState183
  | MenhirState181
  | MenhirState179
  | MenhirState177
  | MenhirState175
  | MenhirState173
  | MenhirState172
  | MenhirState171
  | MenhirState169
  | MenhirState167
  | MenhirState163
  | MenhirState160
  | MenhirState159
  | MenhirState156
  | MenhirState155
  | MenhirState154
  | MenhirState153
  | MenhirState151
  | MenhirState150
  | MenhirState147
  | MenhirState145
  | MenhirState141
  | MenhirState139
  | MenhirState136
  | MenhirState135
  | MenhirState133
  | MenhirState132
  | MenhirState129
  | MenhirState126
  | MenhirState124
  | MenhirState121
  | MenhirState120
  | MenhirState116
  | MenhirState114
  | MenhirState112
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState107
  | MenhirState106
  | MenhirState104
  | MenhirState103
  | MenhirState102
  | MenhirState101
  | MenhirState100
  | MenhirState98
  | MenhirState97
  | MenhirState87
  | MenhirState86
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

# 312 "imp_parser.ml"

let rec _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1037 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1035 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 86 "imp_parser.mly"
                    ( _1::_2 )
# 330 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1036)) : 'freshtv1038)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1047 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1045 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 347 "imp_parser.ml"
        ) = 
# 82 "imp_parser.mly"
                    ( _2 )
# 351 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1043) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 359 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1041) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 367 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1039) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 375 "imp_parser.ml"
        )) : (
# 36 "imp_parser.mly"
      (Peg.grammar)
# 379 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 79 "imp_parser.mly"
            ( Gram _1 )
# 384 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1040)) : 'freshtv1042)) : 'freshtv1044)) : 'freshtv1046)) : 'freshtv1048)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv1033 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 397 "imp_parser.ml"
    ))) * (
# 16 "imp_parser.mly"
       (string)
# 401 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState226
    | ORD_LEX_COPRD ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState226
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1031 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 415 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 419 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 424 "imp_parser.ml"
        ))), (_3 : (
# 16 "imp_parser.mly"
       (string)
# 428 "imp_parser.ml"
        ))), _, (_5 : 'tv_grm_ord)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 89 "imp_parser.mly"
                              ( (_3,[],_5) )
# 435 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1029) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1027 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState228 _v
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1025 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
            let _v : 'tv_grm_clq = 
# 85 "imp_parser.mly"
            ( [_1] )
# 456 "imp_parser.ml"
             in
            _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1026)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState228) : 'freshtv1028)) : 'freshtv1030)) : 'freshtv1032)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState226) : 'freshtv1034)

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1023 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1021 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 103 "imp_parser.mly"
                      ( _1@[_2] )
# 482 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1022)) : 'freshtv1024)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1007 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1003 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1001 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 109 "imp_parser.mly"
                         ( Peg.Option _2 )
# 508 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1002)) : 'freshtv1004)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1005 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1006)) : 'freshtv1008)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1015 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1011 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1009 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 108 "imp_parser.mly"
                         ( Peg.List _2 )
# 536 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1010)) : 'freshtv1012)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1013 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1014)) : 'freshtv1016)
    | MenhirState208 | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1019 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1017 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 107 "imp_parser.mly"
             ( Peg.Atm _1 )
# 555 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1018)) : 'freshtv1020)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv999 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_prd) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv997 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_rule = 
# 95 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 575 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv995) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule) = _v in
    ((match _menhir_s with
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv989) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv987) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let _v : 'tv_grm_ord = 
# 92 "imp_parser.mly"
             ( [(_1,None)] )
# 594 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv988)) : 'freshtv990)
    | MenhirState226 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv993 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv991 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 93 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 610 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv992)) : 'freshtv994)
    | _ ->
        _menhir_fail ()) : 'freshtv996)) : 'freshtv998)) : 'freshtv1000)

and _menhir_run209 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv985) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_ptn = 
# 106 "imp_parser.mly"
        ( Peg.Atm Peg.Any )
# 626 "imp_parser.ml"
     in
    _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv986)

and _menhir_run210 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 633 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv983) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 643 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 647 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 112 "imp_parser.mly"
        ( (Peg.Text _1) )
# 652 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv984)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv981 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce93 _menhir_env (Obj.magic _menhir_stack) MenhirState220 : 'freshtv982)

and _menhir_run213 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 666 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv979) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 676 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 680 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 113 "imp_parser.mly"
        ( Peg.Name _1 )
# 685 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv980)

and _menhir_run214 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
    | STG _v ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState214 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState214

and _menhir_run217 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
    | STG _v ->
        _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState217 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217

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
# 73 "imp_parser.mly"
            ( _1 )
# 732 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv976)) : 'freshtv978)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv969 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 744 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv967 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 752 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 759 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 184 "imp_parser.mly"
                                           ( [_3]@_4 )
# 765 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv968)) : 'freshtv970)
    | MenhirState82 ->
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
# 179 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 782 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv972)) : 'freshtv974)
    | _ ->
        _menhir_fail ()

and _menhir_goto_coprd_ir : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ir -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv957 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv955 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_ir_lines)), _, (_4 : 'tv_coprd_ir)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_coprd_ir = 
# 257 "imp_parser.mly"
                                    ( [|(_2,_3)|] |+| _4 )
# 802 "imp_parser.ml"
         in
        _menhir_goto_coprd_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv956)) : 'freshtv958)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv965 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv961 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv959 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_coprd_ir)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_lines = 
# 201 "imp_parser.mly"
                               (
     Agl(_2,_3) )
# 824 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv960)) : 'freshtv962)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv963 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv964)) : 'freshtv966)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv949 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv947 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_regs) : 'tv_regs) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 261 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 854 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv948)) : 'freshtv950)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv953 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 862 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv951 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 870 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_regs) : 'tv_regs) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 877 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 206 "imp_parser.mly"
                                 ( IR_Id(_2,[|_4|] |+| _5)  )
# 883 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv952)) : 'freshtv954)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState253 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv941 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 897 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv939 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 905 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 912 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 140 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 919 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv940)) : 'freshtv942)
    | MenhirState244 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv945 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 927 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv943 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 935 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 942 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 129 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 948 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv944)) : 'freshtv946)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv933 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 962 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv931 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 970 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 977 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 144 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 984 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv932)) : 'freshtv934)
    | MenhirState244 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv937 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 992 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv935 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1000 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 1007 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 130 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 1013 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv936)) : 'freshtv938)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv925 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState208
        | L_OPN ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState208
        | NAM _v ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
        | NOT_SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv917) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState208 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv915) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 121 "imp_parser.mly"
            ( Peg.Not )
# 1047 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv916)) : 'freshtv918)
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv921) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState208 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv919) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 120 "imp_parser.mly"
        ( Peg.And )
# 1062 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv920)) : 'freshtv922)
        | STG _v ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState208 _v
        | WC ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState208
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv923) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState208 in
            ((let _v : 'tv_grm_prd = 
# 116 "imp_parser.mly"
    ( None )
# 1076 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv924)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState208) : 'freshtv926)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv929 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run217 _menhir_env (Obj.magic _menhir_stack) MenhirState221
        | L_OPN ->
            _menhir_run214 _menhir_env (Obj.magic _menhir_stack) MenhirState221
        | NAM _v ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState221 _v
        | STG _v ->
            _menhir_run210 _menhir_env (Obj.magic _menhir_stack) MenhirState221 _v
        | WC ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState221
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv927 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 117 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1106 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv928)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState221) : 'freshtv930)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv913 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState269
    | DTA_GRM ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState269
    | LCE ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState269
    | MDL_END ->
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState269
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState269) : 'freshtv914)

and _menhir_run106 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 1140 "imp_parser.ml"
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
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | ROT _v ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | SGN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | TYP_STG ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | VAL _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | Z ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106

and _menhir_run108 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 1177 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | NAM _v ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | ROT _v ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | SGN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | TYP_STG ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | VAL _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
    | Z ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState108
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108

and _menhir_run110 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 1214 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | NAM _v ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | ROT _v ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | SGN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | TYP_STG ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | VAL _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
    | Z ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState110
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110

and _menhir_goto_typ_top_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv903 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1257 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 1261 "imp_parser.ml"
        )) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv901 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1267 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 1271 "imp_parser.ml"
        )) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 1276 "imp_parser.ml"
        ))), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 1280 "imp_parser.ml"
        ))), _, (_4 : 'tv_typ_top_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_typ_top_lb = 
# 152 "imp_parser.mly"
                            ( Cns_Lb(_1,_3,_4) )
# 1286 "imp_parser.ml"
         in
        _menhir_goto_typ_top_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv902)) : 'freshtv904)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv911 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv907 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv905 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_typ_top_lb)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 1308 "imp_parser.ml"
            ) = 
# 160 "imp_parser.mly"
                              ( Rcd_Lb _3 )
# 1312 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv906)) : 'freshtv908)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv909 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv910)) : 'freshtv912)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv875 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState188
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv873 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_coprd_ir = 
# 256 "imp_parser.mly"
                           ( [|(_2,_3)|] )
# 1345 "imp_parser.ml"
             in
            _menhir_goto_coprd_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv874)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState188) : 'freshtv876)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv879 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv877 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 200 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 1361 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv878)) : 'freshtv880)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv899 * 'tv_ir_etr) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv897 * 'tv_ir_etr) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : 'tv_ir_etr)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_code = 
# 190 "imp_parser.mly"
                    ( (_1,ref _2) )
# 1373 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv895) = _menhir_stack in
        let (_v : 'tv_ir_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv893 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1382 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        let (_v : 'tv_ir_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv891 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1389 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        let ((_3 : 'tv_ir_code) : 'tv_ir_code) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 1395 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 187 "imp_parser.mly"
                        ( (_1,fst _2,snd _2,_3) )
# 1400 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv889) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body_ir) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState84 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv883 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1413 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv881 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1425 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 1430 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 183 "imp_parser.mly"
                            ( [_3] )
# 1436 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv882)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196) : 'freshtv884)
        | MenhirState82 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv887 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv885 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body_ir)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 180 "imp_parser.mly"
                         ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d) )
# 1453 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv886)) : 'freshtv888)
        | _ ->
            _menhir_fail ()) : 'freshtv890)) : 'freshtv892)) : 'freshtv894)) : 'freshtv896)) : 'freshtv898)) : 'freshtv900)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv871 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | APP ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | ARR ->
        _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | EOP ->
        _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | NAM _v ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
    | OUT_IR ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState190
    | ROT _v ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState190 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState190) : 'freshtv872)

and _menhir_reduce130 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 260 "imp_parser.mly"
    ( [||] )
# 1493 "imp_parser.ml"
     in
    _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run155 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState155
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState155
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155

and _menhir_run151 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 1517 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState151
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState151 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState151
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151

and _menhir_run159 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState159
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159

and _menhir_run163 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 1553 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState163
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState163 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState163
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState163

and _menhir_run169 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState169
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState169 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState169
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169

and _menhir_run171 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | CHO _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | EXN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | IDX _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | INJ _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | L_LST ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | L_OPN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | L_RCD ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | NAM _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | R2 _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState171 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState171
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171

and _menhir_run177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177

and _menhir_run183 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState183 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState183
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183

and _menhir_run140 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv869) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_op = 
# 243 "imp_parser.mly"
          ( None )
# 1677 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)

and _menhir_run141 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState141 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState141
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv833 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv829 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv827 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 1718 "imp_parser.ml"
            ) = 
# 159 "imp_parser.mly"
                        ( _2 )
# 1722 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv828)) : 'freshtv830)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv831 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv832)) : 'freshtv834)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv839) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv835) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | IN _ | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | TYP_STG | VAL _ | Z ->
                _menhir_reduce155 _menhir_env (Obj.magic _menhir_stack) MenhirState126
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126) : 'freshtv836)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv837) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv838)) : 'freshtv840)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv843) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv841) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 266 "imp_parser.mly"
                            ( (_2,_4) )
# 1770 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv842)) : 'freshtv844)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv855 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv851 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv847 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "imp_parser.mly"
       (string)
# 1791 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run245 _menhir_env (Obj.magic _menhir_stack) MenhirState248
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv845 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 1804 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 1809 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 143 "imp_parser.mly"
                         ( [(_2,_4)] )
# 1816 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv846)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState248) : 'freshtv848)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv849 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv850)) : 'freshtv852)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv853 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv854)) : 'freshtv856)
    | MenhirState250 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv867 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv863 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv859 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "imp_parser.mly"
       (string)
# 1855 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState253
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv857 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 1868 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 1873 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 139 "imp_parser.mly"
                           ( [(_2,_4)] )
# 1880 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv858)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState253) : 'freshtv860)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv861 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv862)) : 'freshtv864)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv865 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv866)) : 'freshtv868)
    | _ ->
        _menhir_fail ()

and _menhir_reduce93 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 102 "imp_parser.mly"
    ( [] )
# 1909 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv825) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv823) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 74 "imp_parser.mly"
            ( _1 )
# 1926 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv824)) : 'freshtv826)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv817 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1938 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv815 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1946 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 1953 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 125 "imp_parser.mly"
                                        ( [_3]@_4 )
# 1959 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv816)) : 'freshtv818)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv821 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv819 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 77 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 1976 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv820)) : 'freshtv822)
    | _ ->
        _menhir_fail ()

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv813 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1989 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv807 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv805 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 176 "imp_parser.mly"
                ( _1+1 )
# 2005 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv806)) : 'freshtv808)
    | APP | CLN | DTA | DTA_GRM | IN _ | IO | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv809 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2013 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 2018 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2023 "imp_parser.ml"
        ) = 
# 169 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 2027 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv811 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2037 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv812)) : 'freshtv814)

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2045 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv765 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2055 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | PRJ ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv763 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2071 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState104 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv761 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2079 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2085 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2092 "imp_parser.ml"
            ) = 
# 164 "imp_parser.mly"
                    ( lst _2 )
# 2096 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)) : 'freshtv764)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv766)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv769 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2108 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2112 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | APP | CLN | DTA | DTA_GRM | IN _ | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv767 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2124 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2128 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2133 "imp_parser.ml"
            ))), _), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2137 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2143 "imp_parser.ml"
            ) = 
# 162 "imp_parser.mly"
                ( App(App(Prm Vct,_1),_3) )
# 2147 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv768)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107) : 'freshtv770)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv773 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2159 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2163 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState109
        | APP | CLN | DTA | DTA_GRM | IN _ | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv771 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2175 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2179 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2184 "imp_parser.ml"
            ))), _), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2188 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2194 "imp_parser.ml"
            ) = 
# 170 "imp_parser.mly"
                ( Imp(_1,_3) )
# 2198 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv772)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109) : 'freshtv774)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv777 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2210 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2214 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | PRJ ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | APP | CLN | DTA | DTA_GRM | IN _ | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv775 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2228 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2232 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2237 "imp_parser.ml"
            ))), _), _, (_3 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2241 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2247 "imp_parser.ml"
            ) = 
# 161 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 2251 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv776)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv778)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2263 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | PRJ ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv781 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2279 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState112 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv779 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2287 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2293 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2300 "imp_parser.ml"
            ) = 
# 163 "imp_parser.mly"
                    ( opn _2 )
# 2304 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)) : 'freshtv782)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112) : 'freshtv784)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv789 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2316 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | PRJ ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv787 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2332 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState114 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2340 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2346 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2353 "imp_parser.ml"
            ) = 
# 158 "imp_parser.mly"
                    ( _2 )
# 2357 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv786)) : 'freshtv788)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv790)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv791 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2369 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2373 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | NAM _v ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
        | PRJ ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | R_RCD ->
            _menhir_reduce153 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv792)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv795 * _menhir_state * 'tv_typs) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2397 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState121
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState121
        | PRJ ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState121
        | CLN | IN _ | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | R_RCD | SGN | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv793 * _menhir_state * 'tv_typs) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2413 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2418 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 155 "imp_parser.mly"
             ( _1@[_2] )
# 2423 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv794)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv796)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv799 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2435 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | PRJ ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | CLN | IN _ | R_RCD | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv797 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2451 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2456 "imp_parser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 148 "imp_parser.mly"
            ( _2 )
# 2462 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv800)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv803 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2474 "imp_parser.ml"
        )) * 'tv_def_arg)) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2478 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run110 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | IO ->
            _menhir_run108 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | PRJ ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState258
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv801 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2494 "imp_parser.ml"
            )) * 'tv_def_arg)) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2498 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2503 "imp_parser.ml"
            ))), (_2 : 'tv_def_arg)), _, (_4 : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 2507 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 132 "imp_parser.mly"
                        ( Def_EqT (_1,_2,_4) )
# 2513 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv802)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState258) : 'freshtv804)
    | _ ->
        _menhir_fail ()

and _menhir_reduce153 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typ_top_lb = 
# 151 "imp_parser.mly"
    ( U_Lb )
# 2528 "imp_parser.ml"
     in
    _menhir_goto_typ_top_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run99 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 2535 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv757 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2547 "imp_parser.ml"
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
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | ROT _v ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | SGN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TYP_STG ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | VAL _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | Z ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv758)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv759 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2585 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv760)

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv751 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv749 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_reg_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_reg_ptn = 
# 236 "imp_parser.mly"
                                       (
    match _4 with
    | None -> Rcd_Ptn.R_Lb _3
    | Some r -> Rcd_Ptn.Ro_Lb (_3,r) )
# 2628 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv750)) : 'freshtv752)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv755 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv753 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_reg_ptn = 
# 232 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some r -> Rcd_Ptn.Ro (_2,r) )
# 2648 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv754)) : 'freshtv756)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv669 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2663 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState136 _v
        | OP | R_RCD ->
            _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv670)
    | MenhirState147 | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv671 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | NAM _v ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
        | WC ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | OP | R_RCD ->
            _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv672)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv679 * (
# 17 "imp_parser.mly"
       (int)
# 2699 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv677 * (
# 17 "imp_parser.mly"
       (int)
# 2705 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 2710 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _v : 'tv_ir_etr = 
# 193 "imp_parser.mly"
               ( _2 )
# 2715 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv675) = _menhir_stack in
        let (_v : 'tv_ir_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv673 * 'tv_ir_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | APP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | ARR ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | EOP ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | NAM _v ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
        | OUT_IR ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState150
        | ROT _v ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv674)) : 'freshtv676)) : 'freshtv678)) : 'freshtv680)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv685 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2749 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv681 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2759 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | NAM _v ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState153 _v
            | WC ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState153
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv682)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv683 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2781 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv684)) : 'freshtv686)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv687 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2790 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | AGL | APP | ARR | EOP | NAM _ | OUT_IR | ROT _ ->
            _menhir_reduce130 _menhir_env (Obj.magic _menhir_stack) MenhirState154
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154) : 'freshtv688)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv689 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | AGL | APP | ARR | EOP | NAM _ | OUT_IR | ROT _ ->
            _menhir_reduce130 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156) : 'freshtv690)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv697 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv693 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv691 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 211 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2836 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv692)) : 'freshtv694)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv695 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv696)) : 'freshtv698)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv711 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2851 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv699 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2861 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | NAM _v ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
            | WC ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167) : 'freshtv700)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv703 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2881 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv701 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2888 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2893 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 203 "imp_parser.mly"
                       ( IL_Glb_Call((Tkn.Etr_N _1),_2) )
# 2899 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv702)) : 'freshtv704)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv707 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2907 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv705 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2914 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2919 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 213 "imp_parser.mly"
                        ( IR_Glb_Out(_1,_2) )
# 2925 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv706)) : 'freshtv708)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv709 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2935 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv710)) : 'freshtv712)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv715 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2944 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv713 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2950 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2955 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 208 "imp_parser.mly"
                            ( IR_Glb_Call(Tkn.Etr_N _1,_2,_4) )
# 2961 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv714)) : 'freshtv716)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv725 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv723 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 196 "imp_parser.mly"
                ( Ret _2 )
# 2974 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv721) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ret) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv719) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ret) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv717) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
        ((let _v : 'tv_ir_lines = 
# 199 "imp_parser.mly"
            ( _1 )
# 2991 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv718)) : 'freshtv720)) : 'freshtv722)) : 'freshtv724)) : 'freshtv726)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv731 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv727 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState175
            | NAM _v ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState175 _v
            | WC ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState175
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState175) : 'freshtv728)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv729 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv730)) : 'freshtv732)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv735 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv733 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 207 "imp_parser.mly"
                                        ( IR_Exp(_2,_4,_6) )
# 3035 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv734)) : 'freshtv736)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv741 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv737 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | NAM _v ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
            | WC ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState181) : 'freshtv738)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv739 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv740)) : 'freshtv742)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv745 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv743 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 209 "imp_parser.mly"
                                    (
     IR_Call((_2,_4),_6) )
# 3080 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv744)) : 'freshtv746)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv747 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | APP ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | ARR ->
            _menhir_run171 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | EOP ->
            _menhir_run169 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | NAM _v ->
            _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
        | OUT_IR ->
            _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState186
        | ROT _v ->
            _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState186 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState186) : 'freshtv748)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv663 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | R_RCD ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145) : 'freshtv664)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv667 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv665 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 246 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 3137 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv666)) : 'freshtv668)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv659 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3152 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv657 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3158 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3163 "imp_parser.ml"
        ))), _, (_3 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_reg_ptn_lst_lb = 
# 250 "imp_parser.mly"
                                   ( [|(_1,_3)|] |+| _4 )
# 3169 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv658)) : 'freshtv660)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv661 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | R_RCD ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139) : 'freshtv662)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv655 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | NAM _v ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | ROT _v ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | SGN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | TYP_STG ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | VAL _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | Z ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | CLN | IN _ | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv653 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 147 "imp_parser.mly"
         ( Rcd(rcd_cl _1) )
# 3226 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv654)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120) : 'freshtv656)

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv651 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce93 _menhir_env (Obj.magic _menhir_stack) MenhirState207 : 'freshtv652)

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv645 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 3250 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState265 _v
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv643 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 3262 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 3267 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 124 "imp_parser.mly"
                         ( [_3] )
# 3273 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv644)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState265) : 'freshtv646)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv649 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv647 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 78 "imp_parser.mly"
                     ( Flow _2 )
# 3290 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv648)) : 'freshtv650)
    | _ ->
        _menhir_fail ()

and _menhir_run245 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState245
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce155 _menhir_env (Obj.magic _menhir_stack) MenhirState245
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState245

and _menhir_run250 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState250
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce155 _menhir_env (Obj.magic _menhir_stack) MenhirState250
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState250

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv641) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3336 "imp_parser.ml"
    ) = 
# 167 "imp_parser.mly"
      ( zn (Prm Z_u) )
# 3340 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv642)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 3347 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv639) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 3357 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 3361 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3366 "imp_parser.ml"
    ) = 
# 165 "imp_parser.mly"
        ( Var (newvar ()) )
# 3370 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv640)

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv637) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3384 "imp_parser.ml"
    ) = 
# 172 "imp_parser.mly"
            ( Prm Stg )
# 3388 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv635) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3402 "imp_parser.ml"
    ) = 
# 171 "imp_parser.mly"
        ( Prm Sgn )
# 3406 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv636)

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 3413 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv633) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 175 "imp_parser.mly"
    ( 0 )
# 3423 "imp_parser.ml"
     in
    _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv634)

and _menhir_run95 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 3430 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv631) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 3440 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 3444 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3449 "imp_parser.ml"
    ) = 
# 166 "imp_parser.mly"
        ( Prm (Name _1) )
# 3453 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv632)

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv629) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 3467 "imp_parser.ml"
    ) = 
# 168 "imp_parser.mly"
      ( Prm N )
# 3471 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)

and _menhir_run97 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv627 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState97 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run99 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
        | R_RCD ->
            _menhir_reduce153 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv628)
    | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce155 _menhir_env (Obj.magic _menhir_stack) MenhirState97
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97

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
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | ROT _v ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | SGN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | TYP_STG ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | VAL _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | Z ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState101
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
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | ROT _v ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | SGN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | TYP_STG ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | VAL _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | Z ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState102
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
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | ROT _v ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | SGN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | TYP_STG ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | VAL _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
    | Z ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState103
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv621 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3613 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3621 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3628 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 66 "imp_parser.mly"
                 ( _1::_3 )
# 3634 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)) : 'freshtv622)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv625) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv623) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 57 "imp_parser.mly"
             ( _2 )
# 3650 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv624)) : 'freshtv626)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv613 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv611 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 62 "imp_parser.mly"
                 ( 1+_2 )
# 3673 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv612)) : 'freshtv614)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv617) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv615) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 58 "imp_parser.mly"
                 ( BatList.init _2 (fun n -> "$"^(String.make n '\'')) )
# 3689 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv616)) : 'freshtv618)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv605 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3703 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv603 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3711 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3718 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 136 "imp_parser.mly"
                  ( _1::_2 )
# 3723 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv604)) : 'freshtv606)
    | MenhirState261 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv609 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 3731 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv607 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 3739 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 3746 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 131 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3753 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv608)) : 'freshtv610)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState185 | MenhirState179 | MenhirState181 | MenhirState173 | MenhirState175 | MenhirState169 | MenhirState163 | MenhirState167 | MenhirState160 | MenhirState151 | MenhirState153 | MenhirState155 | MenhirState129 | MenhirState132 | MenhirState147 | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv583 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv581 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 231 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 3772 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv582)) : 'freshtv584)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv591 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv585 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 242 "imp_parser.mly"
                  ( Some _2 )
# 3793 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)) : 'freshtv588)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv590)) : 'freshtv592)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv593 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | NAM _v ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState160 _v
        | WC ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160) : 'freshtv594)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv599 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv595 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState179
            | NAM _v ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _v
            | WC ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState179
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179) : 'freshtv596)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv598)) : 'freshtv600)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv601 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState184
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184) : 'freshtv602)
    | _ ->
        _menhir_fail ()

and _menhir_reduce124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 245 "imp_parser.mly"
    ( [||] )
# 3868 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce126 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_lb = 
# 249 "imp_parser.mly"
    ( [||] )
# 3877 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run134 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 3884 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv577 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3896 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | NAM _v ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
        | WC ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv578)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv579 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3918 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv580)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv575 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3930 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IN _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv571) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (int)
# 3941 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | NAM _v ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState129 _v
        | WC ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129) : 'freshtv572)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv573 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3964 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv574)) : 'freshtv576)

and _menhir_reduce155 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 154 "imp_parser.mly"
    ( [] )
# 3974 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | L_OPN ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | L_PRN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | L_RCD ->
        _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | N ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | NAM _v ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | ROT _v ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | SGN ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | TYP_STG ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | VAL _v ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
    | Z ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState87
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87

and _menhir_run205 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 99 "imp_parser.mly"
                  ( Peg.Lex )
# 4021 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)

and _menhir_run206 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv567) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 98 "imp_parser.mly"
          ( Peg.Synt )
# 4035 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv565 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4046 "imp_parser.ml"
    )) * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv557 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4056 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run103 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | L_OPN ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | L_PRN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | L_RCD ->
            _menhir_run97 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | N ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | NAM _v ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
        | ROT _v ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
        | SGN ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | TYP_STG ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | VAL _v ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
        | Z ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257) : 'freshtv558)
    | ISO ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv559 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4092 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState244
        | PRD ->
            _menhir_run245 _menhir_env (Obj.magic _menhir_stack) MenhirState244
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState244) : 'freshtv560)
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv561 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4110 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 4115 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 128 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 4120 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv562)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv563 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4130 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv564)) : 'freshtv566)

and _menhir_run236 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4138 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv551 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4150 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState237 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState237) : 'freshtv552)
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv553 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4166 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 4171 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 65 "imp_parser.mly"
        ( [_1] )
# 4176 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv554)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv555 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4186 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv556)

and _menhir_run239 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState239
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 61 "imp_parser.mly"
        ( 1 )
# 4207 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv550)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState239

and _menhir_run262 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4218 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState262 _v
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv547 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4232 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 4237 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 135 "imp_parser.mly"
        ( [_1] )
# 4242 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState262

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv541 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv537 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv535 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 315 "imp_parser.mly"
                         ( _2 )
# 4272 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv536)) : 'freshtv538)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv539 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv540)) : 'freshtv542)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv545 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 319 "imp_parser.mly"
                 ( App(Atm (Name "⟦"),Rcd [|_1;_2|]) )
# 4291 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv544)) : 'freshtv546)
    | _ ->
        _menhir_fail ()

and _menhir_run130 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv533) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg = 
# 226 "imp_parser.mly"
       ( let v = newvar () in rm := ("_",v)::!rm; v)
# 4307 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4314 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv531) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 4324 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 4328 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg = 
# 227 "imp_parser.mly"
        (
     let v = newvar () in rm := (_1,v)::!rm; v )
# 4334 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv532)

and _menhir_run132 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv529 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState132 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
        | OP | R_RCD ->
            _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState133
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133) : 'freshtv530)
    | L_RCD ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | NAM _v ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
    | WC ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | OP | R_RCD ->
        _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState132
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132

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
        let (_menhir_stack : ('freshtv521 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (int)
# 4434 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv519 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 17 "imp_parser.mly"
       (int)
# 4442 "imp_parser.ml"
        )) : (
# 17 "imp_parser.mly"
       (int)
# 4446 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 307 "imp_parser.mly"
                ( Prj(_1,Rcd_Ptn.Idx(_3,Rcd_Ptn.End)) )
# 4453 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)) : 'freshtv522)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv525 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 4462 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv523 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 16 "imp_parser.mly"
       (string)
# 4470 "imp_parser.ml"
        )) : (
# 16 "imp_parser.mly"
       (string)
# 4474 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 308 "imp_parser.mly"
                ( Prj(_1,Rcd_Ptn.Lb(_3,Rcd_Ptn.End)) )
# 4481 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv524)) : 'freshtv526)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv527 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv528)

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
    let (_menhir_stack : 'freshtv517 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv513 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv511 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 4755 "imp_parser.ml"
        ) = 
# 41 "imp_parser.mly"
  (
    ( try
      let (i,a) = Ast.tk_agl _1 in
      Line_Agl (i,a)
      with _ -> Line _1 ) )
# 4763 "imp_parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv512)) : 'freshtv514)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv516)) : 'freshtv518)

and _menhir_run3 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp_lst_lb -> (
# 16 "imp_parser.mly"
       (string)
# 4777 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 4789 "imp_parser.ml"
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv504)
    | RM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv507 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 4841 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv505 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 4848 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst_lb)), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 4853 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_exp_lst_lb = 
# 281 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 4859 "imp_parser.ml"
         in
        _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)) : 'freshtv508)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv509 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 4869 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv510)

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState269 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv489 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv487 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 70 "imp_parser.mly"
                        ( _1::_2 )
# 4887 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)) : 'freshtv490)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv501 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4895 "imp_parser.ml"
        )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv497 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4905 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv495 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4912 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 4917 "imp_parser.ml"
            ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 53 "imp_parser.mly"
                               ( (_2,_3) )
# 4924 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv493) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_def_mdl) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv491 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | MDL ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState278) : 'freshtv492)) : 'freshtv494)) : 'freshtv496)) : 'freshtv498)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv499 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4951 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv500)) : 'freshtv502)
    | _ ->
        _menhir_fail ()

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 4961 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv483 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 4973 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState84 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv484)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv485 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 4991 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv486)

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4999 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce155 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86) : 'freshtv478)
    | IN _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv479) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 265 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 5026 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv480)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv481 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5036 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv482)

and _menhir_run201 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 5044 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv473 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5056 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5066 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "imp_parser.mly"
       (string)
# 5071 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv465 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5082 "imp_parser.ml"
                ))) * (
# 16 "imp_parser.mly"
       (string)
# 5086 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run206 _menhir_env (Obj.magic _menhir_stack) MenhirState204
                | ORD_LEX_COPRD ->
                    _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState204
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState204) : 'freshtv466)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv467 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5106 "imp_parser.ml"
                ))) * (
# 16 "imp_parser.mly"
       (string)
# 5110 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv468)) : 'freshtv470)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv471 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5121 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv472)) : 'freshtv474)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv475 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5132 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv476)

and _menhir_run232 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 5140 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5152 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run259 _menhir_env (Obj.magic _menhir_stack) MenhirState233
        | NAM _v ->
            _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState233 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState233) : 'freshtv462)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv463 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5172 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)

and _menhir_run234 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 5180 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv455) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState235
        | VAL _v ->
            _menhir_run236 _menhir_env (Obj.magic _menhir_stack) MenhirState235 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState235) : 'freshtv456)
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv457) = Obj.magic _menhir_stack in
        ((let _v : 'tv_def_arg = 
# 56 "imp_parser.mly"
    ( [] )
# 5207 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv458)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv459 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5217 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv460)

and _menhir_run259 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 5234 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv447 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 5245 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run262 _menhir_env (Obj.magic _menhir_stack) MenhirState261 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState261) : 'freshtv448)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv449 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 5263 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv450)) : 'freshtv452)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv453 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)

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
        let (_menhir_stack : ('freshtv441 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv435 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv436)
        | R2 _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv439 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState61 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 309 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 5382 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)) : 'freshtv440)
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61) : 'freshtv442)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv445 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : 'freshtv443 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 269 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 5450 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv444)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv446)
    | _ ->
        _menhir_fail ()

and _menhir_reduce109 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 318 "imp_parser.mly"
    ( App(Atm (Name "⟦⟧"),Rcd [||]) )
# 5465 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv361 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv359 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp = 
# 283 "imp_parser.mly"
                          ( Agl_Op _2 )
# 5501 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv362)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv365 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : (('freshtv363 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 290 "imp_parser.mly"
                ( App(Atm (Name "⊵"),Rcd [|_1;_3|]) )
# 5532 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv366)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv369 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : (('freshtv367 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 298 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Pls),Rcd [|_1;_3|]) )
# 5559 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv370)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv373 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv371 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 299 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Mlt),Rcd [|_1;_3|]) )
# 5584 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv374)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv377 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | AGL | APP | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv375 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 306 "imp_parser.mly"
                ( App(_1,_3) )
# 5607 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv378)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv381 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : (('freshtv379 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 300 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Pls),Rcd [|_1;App(Atm(Fnc Tkn.Mns),_3)|]) )
# 5634 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46) : 'freshtv382)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv385 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : (('freshtv383 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 302 "imp_parser.mly"
               ( App(Atm(Fnc Tkn.Eq),Rcd [|_1;_3|]) )
# 5667 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv386)
    | MenhirState51 | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            _menhir_reduce109 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv388)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv393 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv391 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState53 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv389 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 314 "imp_parser.mly"
                    ( App(Atm (Name "‹"),_2) )
# 5770 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)) : 'freshtv392)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv394)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv399 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : (('freshtv397 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState55 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv395 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 301 "imp_parser.mly"
                        ( App(Atm(Fnc Tkn.Mns),_3) )
# 5812 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)) : 'freshtv398)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv400)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv405 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState57 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv401 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 303 "imp_parser.mly"
                    ( _2 )
# 5853 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv402)) : 'freshtv404)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv406)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv411 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : (((('freshtv409 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState59 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv407 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp_lst_lb)), _, (_5 : 'tv_exp)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 312 "imp_parser.mly"
                                     ( Rcd_Lb (Some _5,Array.of_list _3) )
# 5896 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv408)) : 'freshtv410)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59) : 'freshtv412)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv417 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ((('freshtv415 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState64 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv413 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)), _), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 310 "imp_parser.mly"
                               ( Rcd (Array.of_list _2) )
# 5938 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv418)
    | MenhirState77 | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv421 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv419 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 276 "imp_parser.mly"
                 ( _1@[_2] )
# 5974 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv422)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv425 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 5986 "imp_parser.ml"
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
            let (_menhir_stack : ((('freshtv423 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 6010 "imp_parser.ml"
            ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst_lb)), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 6015 "imp_parser.ml"
            ))), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_exp_lst_lb = 
# 280 "imp_parser.mly"
                           ( _1@[(_2,Some _4)] )
# 6021 "imp_parser.ml"
             in
            _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv424)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv426)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv429 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
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
            let (_menhir_stack : ('freshtv427 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 272 "imp_parser.mly"
            ( _2 )
# 6056 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv428)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv430)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv433 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | EQ ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv431 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState172 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState173
            | NAM _v ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState173 _v
            | WC ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState173
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState173) : 'freshtv432)
        | MLT ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | MNS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | PLS ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | PRJ ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | VCT ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState172
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv434)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv341 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv337 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 270 "imp_parser.mly"
                  ( Rcd_Lb(None,Array.of_list _2) )
# 6128 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv339 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)) : 'freshtv342)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv351 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv343 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
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
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv344)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv347 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv345 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 311 "imp_parser.mly"
                              ( Rcd_Lb (None,Array.of_list _3) )
# 6207 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)) : 'freshtv348)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv349 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv350)) : 'freshtv352)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv357 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv353 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 271 "imp_parser.mly"
                      ( Rcd_Lb(Some Rot,Array.of_list _3) )
# 6234 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv355 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv356)) : 'freshtv358)
    | _ ->
        _menhir_fail ()

and _menhir_reduce73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 69 "imp_parser.mly"
      ( [] )
# 6252 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | SLF _v ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82

and _menhir_run200 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run201 _menhir_env (Obj.magic _menhir_stack) MenhirState200 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState200

and _menhir_run231 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run259 _menhir_env (Obj.magic _menhir_stack) MenhirState231
    | NAM _v ->
        _menhir_run234 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
    | SLF _v ->
        _menhir_run232 _menhir_env (Obj.magic _menhir_stack) MenhirState231 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6304 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6315 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6323 "imp_parser.ml"
        )) : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6327 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv330)) : 'freshtv332)
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6337 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6345 "imp_parser.ml"
        )) : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6349 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6355 "imp_parser.ml"
        ) = 
# 50 "imp_parser.mly"
                 ( _1::_2 )
# 6359 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv334)) : 'freshtv336)
    | _ ->
        _menhir_fail ()

and _menhir_reduce62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 275 "imp_parser.mly"
    ( [] )
# 6370 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 289 "imp_parser.mly"
            ( App(Atm (Name "#"),Rcd [||])  )
# 6384 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6391 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 6401 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 6405 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 288 "imp_parser.mly"
        ( Prj(Rot,Rcd_Ptn.Lb(_1,Rcd_Ptn.End)) )
# 6410 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv326)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6417 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 6427 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 6431 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 296 "imp_parser.mly"
        ( Atm (Stg _1) )
# 6436 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6443 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6453 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6457 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 297 "imp_parser.mly"
        ( Atm(Fnc Tkn.Fix) )
# 6462 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv319) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 295 "imp_parser.mly"
        ( App(Atm (Name "&"),Rcd [||]) )
# 6476 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6483 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv317) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6493 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6497 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 286 "imp_parser.mly"
        ( Rot )
# 6502 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int64)
# 6509 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv315) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (int64)
# 6519 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (int64)
# 6523 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 304 "imp_parser.mly"
        ( Atm(R64 _1) )
# 6528 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv316)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 19 "imp_parser.mly"
       (bool)
# 6535 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv313) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 19 "imp_parser.mly"
       (bool)
# 6545 "imp_parser.ml"
    )) : (
# 19 "imp_parser.mly"
       (bool)
# 6549 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 305 "imp_parser.mly"
       ( Atm(R2 _1) )
# 6554 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6561 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6573 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv303 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6583 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "imp_parser.mly"
       (string)
# 6588 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv301 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6595 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let ((_3 : (
# 16 "imp_parser.mly"
       (string)
# 6600 "imp_parser.ml"
            )) : (
# 16 "imp_parser.mly"
       (string)
# 6604 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 6609 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 294 "imp_parser.mly"
                ( Atm(Name (_1^"."^_3)) )
# 6615 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv302)) : 'freshtv304)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv305 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6625 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)) : 'freshtv308)
    | AGL | APP | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | PRJ | R2 _ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6634 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 6639 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 293 "imp_parser.mly"
         ( Atm (Name _1) )
# 6644 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6654 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState17 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState18) : 'freshtv300)
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
        let (_menhir_stack : 'freshtv297 * _menhir_state) = Obj.magic _menhir_stack in
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv298)
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
        let (_menhir_stack : 'freshtv295 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState24 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 313 "imp_parser.mly"
                ( App(Atm(Name "‹›"),Rcd [||]) )
# 6826 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv294)) : 'freshtv296)
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
        _menhir_reduce109 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6898 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6908 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6912 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 284 "imp_parser.mly"
        ( Atm(Z _1) )
# 6917 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv292)

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6924 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv289) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6934 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6938 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 291 "imp_parser.mly"
        ( Atm(Fnc(Tkn.Inj _1)) )
# 6943 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv290)

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6950 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv287) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6960 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6964 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 287 "imp_parser.mly"
        ( Prj(Rot,Rcd_Ptn.Idx(_1,Rcd_Ptn.End)) )
# 6969 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv288)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv285) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 285 "imp_parser.mly"
        ( Atm (Fnc Tkn.Exn_Ini) )
# 6983 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6990 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 7000 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 7004 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 292 "imp_parser.mly"
        ( Atm(Fnc(Tkn.Cho _1))  )
# 7009 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)

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
# 279 "imp_parser.mly"
    ( [] )
# 7067 "imp_parser.ml"
     in
    _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 7074 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 7083 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 7091 "imp_parser.ml"
    )) : (
# 35 "imp_parser.mly"
      (Lang.Ast.line)
# 7095 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv280)) : 'freshtv282)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState269 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState265 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7117 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState262 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7126 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState261 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 7135 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv39 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7144 "imp_parser.ml"
        )) * 'tv_def_arg)) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7148 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7157 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState253 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 7166 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState250 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv47 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 7180 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState244 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7194 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7208 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState235 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7221 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState228 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState226 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv65 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7240 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 7244 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState221 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState214 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState208 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState204 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7283 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 7287 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState200 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7301 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState190 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState188 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv87 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState186 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv97 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState175 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv103 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState173 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv105 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv113 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7380 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState163 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7389 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState160 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv121 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv125 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7418 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7427 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7436 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * 'tv_ir_etr) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv132)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState145 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState139 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv139 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv141 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7469 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7478 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv145 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState129 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149 * (
# 17 "imp_parser.mly"
       (int)
# 7497 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv150)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv151) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7510 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155 * _menhir_state * 'tv_typs) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7519 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7533 "imp_parser.ml"
        ))) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7537 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7546 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7555 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7564 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7568 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7577 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7586 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7590 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7599 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7608 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7612 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7621 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * (
# 37 "imp_parser.mly"
      (Lang.Types.t)
# 7630 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv179 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv181 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7654 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv194)
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7682 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv197 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 7696 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv202)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv211 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 7729 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv215 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv217 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv221 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv225 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv231 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv233 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv235 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv237 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv239 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv241 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv243 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv247 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv249 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv251 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv259 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv267 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv273 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 7888 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv278)

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
# 7914 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | DTA_GRM ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState81
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

and _menhir_run276 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 34 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7949 "imp_parser.ml"
    ) = 
# 49 "imp_parser.mly"
        ( [] )
# 7953 "imp_parser.ml"
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
# 7982 "imp_parser.ml"
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
# 8010 "imp_parser.ml"
            ) = 
# 46 "imp_parser.mly"
                ( End )
# 8014 "imp_parser.ml"
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
# 8111 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run276 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | MDL ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState79
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 8132 "imp_parser.ml"
