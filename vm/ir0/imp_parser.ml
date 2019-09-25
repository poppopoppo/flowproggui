
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
# 64 "imp_parser.ml"
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
# 75 "imp_parser.ml"
  )
    | NAM of (
# 16 "imp_parser.mly"
       (string)
# 80 "imp_parser.ml"
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
# 106 "imp_parser.ml"
  )
    | INJ of (
# 17 "imp_parser.mly"
       (int)
# 111 "imp_parser.ml"
  )
    | INI_IR
    | IN of (
# 17 "imp_parser.mly"
       (int)
# 117 "imp_parser.ml"
  )
    | IDX of (
# 17 "imp_parser.mly"
       (int)
# 122 "imp_parser.ml"
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
# 147 "imp_parser.ml"
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
  | MenhirState277
  | MenhirState268
  | MenhirState264
  | MenhirState261
  | MenhirState260
  | MenhirState257
  | MenhirState256
  | MenhirState252
  | MenhirState249
  | MenhirState247
  | MenhirState244
  | MenhirState243
  | MenhirState238
  | MenhirState236
  | MenhirState234
  | MenhirState232
  | MenhirState230
  | MenhirState227
  | MenhirState225
  | MenhirState220
  | MenhirState219
  | MenhirState216
  | MenhirState213
  | MenhirState207
  | MenhirState206
  | MenhirState203
  | MenhirState199
  | MenhirState195
  | MenhirState189
  | MenhirState187
  | MenhirState185
  | MenhirState184
  | MenhirState183
  | MenhirState182
  | MenhirState180
  | MenhirState178
  | MenhirState176
  | MenhirState174
  | MenhirState172
  | MenhirState171
  | MenhirState170
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
  | MenhirState146
  | MenhirState144
  | MenhirState140
  | MenhirState138
  | MenhirState135
  | MenhirState134
  | MenhirState132
  | MenhirState131
  | MenhirState128
  | MenhirState125
  | MenhirState123
  | MenhirState120
  | MenhirState119
  | MenhirState115
  | MenhirState113
  | MenhirState111
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState107
  | MenhirState106
  | MenhirState105
  | MenhirState103
  | MenhirState102
  | MenhirState101
  | MenhirState100
  | MenhirState99
  | MenhirState97
  | MenhirState96
  | MenhirState86
  | MenhirState85
  | MenhirState83
  | MenhirState81
  | MenhirState80
  | MenhirState78
  | MenhirState76
  | MenhirState70
  | MenhirState68
  | MenhirState67
  | MenhirState66
  | MenhirState65
  | MenhirState63
  | MenhirState62
  | MenhirState60
  | MenhirState58
  | MenhirState56
  | MenhirState54
  | MenhirState52
  | MenhirState50
  | MenhirState47
  | MenhirState46
  | MenhirState45
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState41
  | MenhirState40
  | MenhirState39
  | MenhirState38
  | MenhirState34
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState25
  | MenhirState23
  | MenhirState22
  | MenhirState21
  | MenhirState20
  | MenhirState17
  | MenhirState16
  | MenhirState5
  | MenhirState1
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Lang
  open Types
  open Ast
  open Util

# 307 "imp_parser.ml"

let rec _menhir_goto_grm_clq : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_clq -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1035 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1033 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
        let _v : 'tv_grm_clq = 
# 85 "imp_parser.mly"
                    ( _1::_2 )
# 325 "imp_parser.ml"
         in
        _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1034)) : 'freshtv1036)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1045 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_clq) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1043 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_clq) : 'tv_grm_clq) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 35 "imp_parser.mly"
      (Peg.grammar)
# 342 "imp_parser.ml"
        ) = 
# 81 "imp_parser.mly"
                    ( _2 )
# 346 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1041) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 35 "imp_parser.mly"
      (Peg.grammar)
# 354 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1039) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 35 "imp_parser.mly"
      (Peg.grammar)
# 362 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1037) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 35 "imp_parser.mly"
      (Peg.grammar)
# 370 "imp_parser.ml"
        )) : (
# 35 "imp_parser.mly"
      (Peg.grammar)
# 374 "imp_parser.ml"
        )) = _v in
        ((let _v : 'tv_def_typ = 
# 78 "imp_parser.mly"
            ( Gram _1 )
# 379 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1038)) : 'freshtv1040)) : 'freshtv1042)) : 'freshtv1044)) : 'freshtv1046)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv1031 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 392 "imp_parser.ml"
    ))) * (
# 16 "imp_parser.mly"
       (string)
# 396 "imp_parser.ml"
    ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COPRD ->
        _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState225
    | ORD_LEX_COPRD ->
        _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState225
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1029 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 410 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 414 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 419 "imp_parser.ml"
        ))), (_3 : (
# 16 "imp_parser.mly"
       (string)
# 423 "imp_parser.ml"
        ))), _, (_5 : 'tv_grm_ord)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_grm_etr = 
# 88 "imp_parser.mly"
                              ( (_3,[],_5) )
# 430 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1027) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1025 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState227 _v
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1023 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_etr)) = _menhir_stack in
            let _v : 'tv_grm_clq = 
# 84 "imp_parser.mly"
            ( [_1] )
# 451 "imp_parser.ml"
             in
            _menhir_goto_grm_clq _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1024)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState227) : 'freshtv1026)) : 'freshtv1028)) : 'freshtv1030)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState225) : 'freshtv1032)

and _menhir_goto_grm_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1021 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_ptn) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1019 * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_grm_ptn) : 'tv_grm_ptn) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_ptns = 
# 102 "imp_parser.mly"
                      ( _1@[_2] )
# 477 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1020)) : 'freshtv1022)

and _menhir_goto_grm_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_atom -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1005 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1001 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv999 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 108 "imp_parser.mly"
                         ( Peg.Option _2 )
# 503 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1000)) : 'freshtv1002)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1003 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1004)) : 'freshtv1006)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1013 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1009 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1007 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_grm_atom)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_grm_ptn = 
# 107 "imp_parser.mly"
                         ( Peg.List _2 )
# 531 "imp_parser.ml"
             in
            _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1008)) : 'freshtv1010)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1011 * _menhir_state) * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1012)) : 'freshtv1014)
    | MenhirState207 | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1017 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1015 * _menhir_state * 'tv_grm_atom) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_atom)) = _menhir_stack in
        let _v : 'tv_grm_ptn = 
# 106 "imp_parser.mly"
             ( Peg.Atm _1 )
# 550 "imp_parser.ml"
         in
        _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1016)) : 'freshtv1018)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv997 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_prd) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv995 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_3 : 'tv_grm_prd) : 'tv_grm_prd) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ord)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
    let _v : 'tv_grm_rule = 
# 94 "imp_parser.mly"
                         ( (_1,_2,_3) )
# 570 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv993) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_grm_rule) = _v in
    ((match _menhir_s with
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv987) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv985) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let _v : 'tv_grm_ord = 
# 91 "imp_parser.mly"
             ( [(_1,None)] )
# 589 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv986)) : 'freshtv988)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv991 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_grm_rule) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv989 * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_grm_rule) : 'tv_grm_rule) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_grm_ord)) = _menhir_stack in
        let _v : 'tv_grm_ord = 
# 92 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 605 "imp_parser.ml"
         in
        _menhir_goto_grm_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv990)) : 'freshtv992)
    | _ ->
        _menhir_fail ()) : 'freshtv994)) : 'freshtv996)) : 'freshtv998)

and _menhir_run208 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv983) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_grm_ptn = 
# 105 "imp_parser.mly"
        ( Peg.Atm Peg.Any )
# 621 "imp_parser.ml"
     in
    _menhir_goto_grm_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv984)

and _menhir_run209 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 628 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv981) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 638 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 642 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 111 "imp_parser.mly"
        ( (Peg.Text _1) )
# 647 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv982)

and _menhir_goto_prd_flg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_flg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv979 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
    (_menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState219 : 'freshtv980)

and _menhir_run212 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 661 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv977) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 671 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 675 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_grm_atom = 
# 112 "imp_parser.mly"
        ( Peg.Name _1 )
# 680 "imp_parser.ml"
     in
    _menhir_goto_grm_atom _menhir_env _menhir_stack _menhir_s _v) : 'freshtv978)

and _menhir_run213 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
    | STG _v ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213

and _menhir_run216 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
    | STG _v ->
        _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216

and _menhir_goto_glb_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv975) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_glb_etr) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv973) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_glb_etr) : 'tv_glb_etr) = _v in
    ((let _v : 'tv_mdl_etr = 
# 72 "imp_parser.mly"
            ( _1 )
# 727 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv974)) : 'freshtv976)

and _menhir_goto_glb_etr_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_glb_etr_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv967 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 739 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv965 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 747 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 754 "imp_parser.ml"
        ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_glb_etr_clique = 
# 183 "imp_parser.mly"
                                           ( [_3]@_4 )
# 760 "imp_parser.ml"
         in
        _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv966)) : 'freshtv968)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv971 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv969 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_glb_etr_clique) : 'tv_glb_etr_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 178 "imp_parser.mly"
                       ( Ast.Etr_Clq  _2 )
# 777 "imp_parser.ml"
         in
        _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv970)) : 'freshtv972)
    | _ ->
        _menhir_fail ()

and _menhir_goto_coprd_ir : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_coprd_ir -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv955 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv953 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_ir_lines)), _, (_4 : 'tv_coprd_ir)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_coprd_ir = 
# 256 "imp_parser.mly"
                                    ( [|(_2,_3)|] |+| _4 )
# 797 "imp_parser.ml"
         in
        _menhir_goto_coprd_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv954)) : 'freshtv956)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv963 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv959 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv957 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_coprd_ir)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_lines = 
# 200 "imp_parser.mly"
                               (
     Agl(_2,_3) )
# 819 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv958)) : 'freshtv960)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv961 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_coprd_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv962)) : 'freshtv964)
    | _ ->
        _menhir_fail ()

and _menhir_goto_regs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_regs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv947 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv945 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_regs) : 'tv_regs) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_regs = 
# 260 "imp_parser.mly"
                     ( [|_2|] |+| _3 )
# 849 "imp_parser.ml"
         in
        _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv946)) : 'freshtv948)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv951 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 857 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_regs) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv949 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 865 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_regs) : 'tv_regs) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 872 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 205 "imp_parser.mly"
                                 ( IR_Id(_2,[|_4|] |+| _5)  )
# 878 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv950)) : 'freshtv952)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv939 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 892 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv937 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 900 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 907 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 139 "imp_parser.mly"
                                     ( (_2,_4)::_5 )
# 914 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv938)) : 'freshtv940)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv943 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 922 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv941 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 930 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 937 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 128 "imp_parser.mly"
                                ( Def_CoPrd (_1,_2,_4) )
# 943 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv942)) : 'freshtv944)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv931 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 957 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv929 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 965 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 972 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 143 "imp_parser.mly"
                                 ( (_2,_4)::_5 )
# 979 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv930)) : 'freshtv932)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv935 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 987 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv933 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 995 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 1002 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_def_typ_body = 
# 129 "imp_parser.mly"
                             ( Def_Prd (_1,_2,_4) )
# 1008 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv934)) : 'freshtv936)
    | _ ->
        _menhir_fail ()

and _menhir_goto_grm_ptns : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_grm_ptns -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv923 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | L_OPN ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | NAM _v ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
        | NOT_SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv915) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState207 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv913) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 120 "imp_parser.mly"
            ( Peg.Not )
# 1042 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv914)) : 'freshtv916)
        | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv919) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState207 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv917) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_prd_flg = 
# 119 "imp_parser.mly"
        ( Peg.And )
# 1057 "imp_parser.ml"
             in
            _menhir_goto_prd_flg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv918)) : 'freshtv920)
        | STG _v ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState207 _v
        | WC ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState207
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv921) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState207 in
            ((let _v : 'tv_grm_prd = 
# 115 "imp_parser.mly"
    ( None )
# 1071 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv922)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState207) : 'freshtv924)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv927 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run216 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | L_OPN ->
            _menhir_run213 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | NAM _v ->
            _menhir_run212 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
        | STG _v ->
            _menhir_run209 _menhir_env (Obj.magic _menhir_stack) MenhirState220 _v
        | WC ->
            _menhir_run208 _menhir_env (Obj.magic _menhir_stack) MenhirState220
        | COPRD | DTA | DTA_GRM | LCE | MDL_END | ORD_LEX_COPRD | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv925 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_prd_flg)), _, (_2 : 'tv_grm_ptns)) = _menhir_stack in
            let _v : 'tv_grm_prd = 
# 116 "imp_parser.mly"
                     ( Some (_1,_2) )
# 1101 "imp_parser.ml"
             in
            _menhir_goto_grm_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv926)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState220) : 'freshtv928)
    | _ ->
        _menhir_fail ()

and _menhir_goto_mdl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_mdl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv911 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DTA ->
        _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState268
    | DTA_GRM ->
        _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState268
    | LCE ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState268
    | MDL_END ->
        _menhir_reduce72 _menhir_env (Obj.magic _menhir_stack) MenhirState268
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState268) : 'freshtv912)

and _menhir_run105 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 1135 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | L_OPN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | L_PRN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | L_RCD ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | N ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | NAM _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | ROT _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | SGN ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | TYP_STG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | VAL _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | Z ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_run107 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 1172 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | L_OPN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | L_PRN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | L_RCD ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | N ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | NAM _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
    | ROT _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
    | SGN ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | TYP_STG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | VAL _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState107 _v
    | Z ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState107
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107

and _menhir_run109 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 1209 "imp_parser.ml"
) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | L_OPN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | L_PRN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | L_RCD ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | N ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | NAM _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | ROT _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | SGN ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | TYP_STG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | VAL _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
    | Z ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState109
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109

and _menhir_goto_typ_top_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv901 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1252 "imp_parser.ml"
        ))) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 1256 "imp_parser.ml"
        )) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv899 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1262 "imp_parser.ml"
        ))) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 1266 "imp_parser.ml"
        )) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 1271 "imp_parser.ml"
        ))), _, (_3 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 1275 "imp_parser.ml"
        ))), _, (_4 : 'tv_typ_top_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_typ_top_lb = 
# 151 "imp_parser.mly"
                            ( Cns_Lb(_1,_3,_4) )
# 1281 "imp_parser.ml"
         in
        _menhir_goto_typ_top_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv900)) : 'freshtv902)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv909 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv905 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv903 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_typ_top_lb)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 1303 "imp_parser.ml"
            ) = 
# 159 "imp_parser.mly"
                              ( Rcd_Lb _3 )
# 1307 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv904)) : 'freshtv906)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv907 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_typ_top_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv908)) : 'freshtv910)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_lines : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_lines -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv873 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState187
        | COPRD_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv871 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)), _, (_3 : 'tv_ir_lines)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_coprd_ir = 
# 255 "imp_parser.mly"
                           ( [|(_2,_3)|] )
# 1340 "imp_parser.ml"
             in
            _menhir_goto_coprd_ir _menhir_env _menhir_stack _menhir_s _v) : 'freshtv872)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState187) : 'freshtv874)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv877 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv875 * _menhir_state * 'tv_ir_line) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_ir_line)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_lines = 
# 199 "imp_parser.mly"
                     ( Seq(_1,_2) )
# 1356 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv876)) : 'freshtv878)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv897 * 'tv_ir_etr) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv895 * 'tv_ir_etr) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : 'tv_ir_etr)), _, (_2 : 'tv_ir_lines)) = _menhir_stack in
        let _v : 'tv_ir_code = 
# 189 "imp_parser.mly"
                    ( (_1,ref _2) )
# 1368 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv893) = _menhir_stack in
        let (_v : 'tv_ir_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv891 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1377 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        let (_v : 'tv_ir_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv889 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 1384 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        let ((_3 : 'tv_ir_code) : 'tv_ir_code) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 1390 "imp_parser.ml"
        ))), (_2 : 'tv_typ_def)) = _menhir_stack in
        let _v : 'tv_glb_etr_body_ir = 
# 186 "imp_parser.mly"
                        ( (_1,fst _2,snd _2,_3) )
# 1395 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv887) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr_body_ir) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState83 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv881 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1408 "imp_parser.ml"
            ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | SLF _v ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState195 _v
            | DTA | DTA_GRM | LCE | MDL_END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv879 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1420 "imp_parser.ml"
                ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 1425 "imp_parser.ml"
                ))), _, (_3 : 'tv_glb_etr_body_ir)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_glb_etr_clique = 
# 182 "imp_parser.mly"
                            ( [_3] )
# 1431 "imp_parser.ml"
                 in
                _menhir_goto_glb_etr_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv880)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState195) : 'freshtv882)
        | MenhirState81 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv885 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv883 * _menhir_state) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_glb_etr_body_ir)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 179 "imp_parser.mly"
                         ( let (a,b,c,d) = _2 in Ast.Etr(a,b,c,d) )
# 1448 "imp_parser.ml"
             in
            _menhir_goto_glb_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv884)) : 'freshtv886)
        | _ ->
            _menhir_fail ()) : 'freshtv888)) : 'freshtv890)) : 'freshtv892)) : 'freshtv894)) : 'freshtv896)) : 'freshtv898)
    | _ ->
        _menhir_fail ()

and _menhir_goto_ir_line : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ir_line -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv869 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | APP ->
        _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | ARR ->
        _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | EOP ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | NAM _v ->
        _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState189 _v
    | OUT_IR ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState189
    | ROT _v ->
        _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState189 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState189) : 'freshtv870)

and _menhir_reduce129 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_regs = 
# 259 "imp_parser.mly"
    ( [||] )
# 1488 "imp_parser.ml"
     in
    _menhir_goto_regs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState154
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154

and _menhir_run150 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 1512 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState150
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState150
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
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState158 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState158
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState158

and _menhir_run162 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 1548 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState162
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState162 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState162
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
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168

and _menhir_run170 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170

and _menhir_run176 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState176 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState176
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176

and _menhir_run182 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState182 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState182
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState182

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv867) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg_ptn_op = 
# 242 "imp_parser.mly"
          ( None )
# 1670 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv868)

and _menhir_run140 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState140
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv831 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv827 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv825 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 1711 "imp_parser.ml"
            ) = 
# 158 "imp_parser.mly"
                        ( _2 )
# 1715 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)) : 'freshtv828)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv829 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv830)) : 'freshtv832)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv837) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv833) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | IN _ | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | TYP_STG | VAL _ | Z ->
                _menhir_reduce154 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv834)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv835) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv836)) : 'freshtv838)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv841) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv839) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 265 "imp_parser.mly"
                            ( (_2,_4) )
# 1763 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv840)) : 'freshtv842)
    | MenhirState244 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv853 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv849 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv845 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "imp_parser.mly"
       (string)
# 1784 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | PRD ->
                    _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState247
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv843 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 1797 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 1802 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_prd = 
# 142 "imp_parser.mly"
                         ( [(_2,_4)] )
# 1809 "imp_parser.ml"
                     in
                    _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv844)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState247) : 'freshtv846)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv847 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv848)) : 'freshtv850)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv851 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv852)) : 'freshtv854)
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv865 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv861 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv857 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                let (_v : (
# 16 "imp_parser.mly"
       (string)
# 1848 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState252
                | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv855 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 1861 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), (_4 : (
# 16 "imp_parser.mly"
       (string)
# 1866 "imp_parser.ml"
                    ))) = _menhir_stack in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_def_coprd = 
# 138 "imp_parser.mly"
                           ( [(_2,_4)] )
# 1873 "imp_parser.ml"
                     in
                    _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv856)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState252) : 'freshtv858)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv859 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv860)) : 'freshtv862)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv863 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv864)) : 'freshtv866)
    | _ ->
        _menhir_fail ()

and _menhir_reduce92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_grm_ptns = 
# 101 "imp_parser.mly"
    ( [] )
# 1902 "imp_parser.ml"
     in
    _menhir_goto_grm_ptns _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_def_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv823) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_def_typ) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv821) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_def_typ) : 'tv_def_typ) = _v in
    ((let _v : 'tv_mdl_etr = 
# 73 "imp_parser.mly"
            ( _1 )
# 1919 "imp_parser.ml"
     in
    _menhir_goto_mdl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)) : 'freshtv824)

and _menhir_goto_def_typ_clique : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_clique -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv815 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1931 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv813 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1939 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 1946 "imp_parser.ml"
        ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_def_typ_clique = 
# 124 "imp_parser.mly"
                                        ( [_3]@_4 )
# 1952 "imp_parser.ml"
         in
        _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)) : 'freshtv816)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv819 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_typ_clique) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv817 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_def_typ_clique) : 'tv_def_typ_clique) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 76 "imp_parser.mly"
                       ( Flow_Clq _2 )
# 1969 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)) : 'freshtv820)
    | _ ->
        _menhir_fail ()

and _menhir_goto_rot_dsh : _menhir_env -> 'ttv_tail -> 'tv_rot_dsh -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv811 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 1982 "imp_parser.ml"
    )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv805 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv803 * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, (_1 : 'tv_rot_dsh)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rot_dsh = 
# 175 "imp_parser.mly"
                ( _1+1 )
# 1998 "imp_parser.ml"
         in
        _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv804)) : 'freshtv806)
    | APP | CLN | DTA | DTA_GRM | IN _ | IO | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv807 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2006 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 2011 "imp_parser.ml"
        ))), (_2 : 'tv_rot_dsh)) = _menhir_stack in
        let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2016 "imp_parser.ml"
        ) = 
# 168 "imp_parser.mly"
                ( Var (newvar_q (-(_2+2))) )
# 2020 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv809 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2030 "imp_parser.ml"
        )) * 'tv_rot_dsh) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv810)) : 'freshtv812)

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2038 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv763 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2048 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | PRJ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv761 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2064 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState103 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv759 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2072 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2078 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2085 "imp_parser.ml"
            ) = 
# 163 "imp_parser.mly"
                    ( lst _2 )
# 2089 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)) : 'freshtv762)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv764)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv767 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2101 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2105 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | APP | CLN | DTA | DTA_GRM | IN _ | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv765 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2117 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2121 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2126 "imp_parser.ml"
            ))), _), _, (_3 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2130 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2136 "imp_parser.ml"
            ) = 
# 161 "imp_parser.mly"
                ( App(App(Prm Vct,_1),_3) )
# 2140 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv766)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv768)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv771 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2152 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2156 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | APP | CLN | DTA | DTA_GRM | IN _ | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | PRJ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv769 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2168 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2172 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2177 "imp_parser.ml"
            ))), _), _, (_3 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2181 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2187 "imp_parser.ml"
            ) = 
# 169 "imp_parser.mly"
                ( Imp(_1,_3) )
# 2191 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv770)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv772)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv775 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2203 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2207 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | PRJ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | APP | CLN | DTA | DTA_GRM | IN _ | LCE | L_LST | L_OPN | L_PRN | L_RCD | MDL_END | N | NAM _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv773 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2221 "imp_parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2225 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2230 "imp_parser.ml"
            ))), _), _, (_3 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2234 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2240 "imp_parser.ml"
            ) = 
# 160 "imp_parser.mly"
                ( Types.App(_1,_3) )
# 2244 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv774)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv776)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv781 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2256 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | PRJ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv779 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2272 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState111 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv777 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2280 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2286 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2293 "imp_parser.ml"
            ) = 
# 162 "imp_parser.mly"
                    ( opn _2 )
# 2297 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv778)) : 'freshtv780)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv782)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv787 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2309 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | PRJ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv785 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2325 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState113 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv783 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2333 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2339 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2346 "imp_parser.ml"
            ) = 
# 157 "imp_parser.mly"
                    ( _2 )
# 2350 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv784)) : 'freshtv786)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv788)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv789 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2362 "imp_parser.ml"
        ))) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2366 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | NAM _v ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | PRJ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | R_RCD ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv790)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv793 * _menhir_state * 'tv_typs) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2390 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | PRJ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | CLN | IN _ | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | R_RCD | SGN | SRC | TYP_STG | VAL _ | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv791 * _menhir_state * 'tv_typs) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2406 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2411 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_typs = 
# 154 "imp_parser.mly"
             ( _1@[_2] )
# 2416 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120) : 'freshtv794)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv797 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2428 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | PRJ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | CLN | IN _ | R_RCD | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv795 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2444 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2449 "imp_parser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 147 "imp_parser.mly"
            ( _2 )
# 2455 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv796)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv798)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv801 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2467 "imp_parser.ml"
        )) * 'tv_def_arg)) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2471 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run109 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | IO ->
            _menhir_run107 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | PRJ ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState257
        | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv799 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2487 "imp_parser.ml"
            )) * 'tv_def_arg)) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2491 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2496 "imp_parser.ml"
            ))), (_2 : 'tv_def_arg)), _, (_4 : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 2500 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_def_typ_body = 
# 131 "imp_parser.mly"
                        ( Def_EqT (_1,_2,_4) )
# 2506 "imp_parser.ml"
             in
            _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv800)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257) : 'freshtv802)
    | _ ->
        _menhir_fail ()

and _menhir_reduce152 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typ_top_lb = 
# 150 "imp_parser.mly"
    ( U_Lb )
# 2521 "imp_parser.ml"
     in
    _menhir_goto_typ_top_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run98 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 2528 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv755 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2540 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | L_OPN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | L_PRN ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | L_RCD ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | N ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | NAM _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | ROT _v ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | SGN ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | TYP_STG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | VAL _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState99 _v
        | Z ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState99
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState99) : 'freshtv756)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv757 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2578 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv758)

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState184 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState184
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState184

and _menhir_goto_reg_ptn_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv749 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv747 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
        ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_reg_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_reg_ptn = 
# 235 "imp_parser.mly"
                                       (
    match _4 with
    | None -> Rcd_Ptn.R_Lb _3
    | Some r -> Rcd_Ptn.Ro_Lb (_3,r) )
# 2621 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv748)) : 'freshtv750)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv753 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_reg_ptn_op) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv751 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_reg_ptn_op) : 'tv_reg_ptn_op) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_reg_ptn = 
# 231 "imp_parser.mly"
                                 (
    match _3 with
    | None ->  Rcd_Ptn.R _2
    | Some r -> Rcd_Ptn.Ro (_2,r) )
# 2641 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv752)) : 'freshtv754)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv667 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2656 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
        | OP | R_RCD ->
            _menhir_reduce125 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv668)
    | MenhirState146 | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv669 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | NAM _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
        | WC ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | OP | R_RCD ->
            _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState146
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv670)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv677 * (
# 17 "imp_parser.mly"
       (int)
# 2692 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv675 * (
# 17 "imp_parser.mly"
       (int)
# 2698 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 2703 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _v : 'tv_ir_etr = 
# 192 "imp_parser.mly"
               ( _2 )
# 2708 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv673) = _menhir_stack in
        let (_v : 'tv_ir_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv671 * 'tv_ir_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | APP ->
            _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | ARR ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | EOP ->
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149) : 'freshtv672)) : 'freshtv674)) : 'freshtv676)) : 'freshtv678)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv683 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2742 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv679 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2752 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState152
            | NAM _v ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState152 _v
            | WC ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState152
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState152) : 'freshtv680)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv681 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2774 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv682)) : 'freshtv684)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv685 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 2783 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState153
        | AGL | APP | ARR | EOP | NAM _ | OUT_IR | ROT _ ->
            _menhir_reduce129 _menhir_env (Obj.magic _menhir_stack) MenhirState153
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153) : 'freshtv686)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv687 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | AGL | APP | ARR | EOP | NAM _ | OUT_IR | ROT _ ->
            _menhir_reduce129 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv688)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv695 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv691 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv689 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_3 : 'tv_reg_ptn)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_ir_line = 
# 210 "imp_parser.mly"
                               (
    IR_Out(_2,_3) )
# 2829 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv690)) : 'freshtv692)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv693 * _menhir_state) * _menhir_state * 'tv_reg) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv694)) : 'freshtv696)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv709 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2844 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv697 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2854 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | NAM _v ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState166 _v
            | WC ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState166
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166) : 'freshtv698)
        | SRC_IL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv701 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2874 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv699 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2881 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2886 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_lines = 
# 202 "imp_parser.mly"
                       ( IL_Glb_Call((Tkn.Etr_N _1),_2) )
# 2892 "imp_parser.ml"
             in
            _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv700)) : 'freshtv702)
        | SRC_OUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv705 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2900 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv703 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2907 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2912 "imp_parser.ml"
            ))), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_ir_line = 
# 212 "imp_parser.mly"
                        ( IR_Glb_Out(_1,_2) )
# 2918 "imp_parser.ml"
             in
            _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv704)) : 'freshtv706)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv707 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2928 "imp_parser.ml"
            )) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv708)) : 'freshtv710)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv713 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2937 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv711 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 2943 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 2948 "imp_parser.ml"
        ))), _, (_2 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_ir_line = 
# 207 "imp_parser.mly"
                            ( IR_Glb_Call(Tkn.Etr_N _1,_2,_4) )
# 2954 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv712)) : 'freshtv714)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv723 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv721 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg_ptn)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_ir_ret = 
# 195 "imp_parser.mly"
                ( Ret _2 )
# 2967 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv719) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ret) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv717) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_ir_ret) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv715) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_ir_ret) : 'tv_ir_ret) = _v in
        ((let _v : 'tv_ir_lines = 
# 198 "imp_parser.mly"
            ( _1 )
# 2984 "imp_parser.ml"
         in
        _menhir_goto_ir_lines _menhir_env _menhir_stack _menhir_s _v) : 'freshtv716)) : 'freshtv718)) : 'freshtv720)) : 'freshtv722)) : 'freshtv724)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv729 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv725 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | NAM _v ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
            | WC ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174) : 'freshtv726)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv727 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv728)) : 'freshtv730)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv733 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv731 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 206 "imp_parser.mly"
                                        ( IR_Exp(_2,_4,_6) )
# 3028 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv732)) : 'freshtv734)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv739 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv735 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState180
            | NAM _v ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState180 _v
            | WC ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState180
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState180) : 'freshtv736)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv737 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv738)) : 'freshtv740)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv743 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv741 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)), _, (_4 : 'tv_reg_ptn)), _, (_6 : 'tv_reg_ptn)) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_ir_line = 
# 208 "imp_parser.mly"
                                    (
     IR_Call((_2,_4),_6) )
# 3073 "imp_parser.ml"
         in
        _menhir_goto_ir_line _menhir_env _menhir_stack _menhir_s _v) : 'freshtv742)) : 'freshtv744)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv745 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | APP ->
            _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | ARR ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | EOP ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | NAM _v ->
            _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | OUT_IR ->
            _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState185
        | ROT _v ->
            _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185) : 'freshtv746)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv661 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | R_RCD ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv662)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv665 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv663 * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_reg_ptn)), _, (_2 : 'tv_reg_ptn_lst)) = _menhir_stack in
        let _v : 'tv_reg_ptn_lst = 
# 245 "imp_parser.mly"
                        ( [|_1|] |+| _2 )
# 3130 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv664)) : 'freshtv666)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg_ptn_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg_ptn_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv657 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3145 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv655 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3151 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3156 "imp_parser.ml"
        ))), _, (_3 : 'tv_reg_ptn)), _, (_4 : 'tv_reg_ptn_lst_lb)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_reg_ptn_lst_lb = 
# 249 "imp_parser.mly"
                                   ( [|(_1,_3)|] |+| _4 )
# 3162 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv656)) : 'freshtv658)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv659 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | OP ->
            _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | R_RCD ->
            _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState138
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv660)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv653 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | L_OPN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | L_PRN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | L_RCD ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | N ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | NAM _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | ROT _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | SGN ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | TYP_STG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | VAL _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState119 _v
    | Z ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | CLN | IN _ | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv651 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 146 "imp_parser.mly"
         ( Rcd(rcd_cl _1) )
# 3219 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv652)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119) : 'freshtv654)

and _menhir_goto_ord : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_ord -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv649 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
    (_menhir_reduce92 _menhir_env (Obj.magic _menhir_stack) MenhirState206 : 'freshtv650)

and _menhir_goto_def_typ_body : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_typ_body -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv643 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 3243 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLF _v ->
            _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState264 _v
        | DTA | DTA_GRM | LCE | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv641 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 3255 "imp_parser.ml"
            ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 17 "imp_parser.mly"
       (int)
# 3260 "imp_parser.ml"
            ))), _, (_3 : 'tv_def_typ_body)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_def_typ_clique = 
# 123 "imp_parser.mly"
                         ( [_3] )
# 3266 "imp_parser.ml"
             in
            _menhir_goto_def_typ_clique _menhir_env _menhir_stack _menhir_s _v) : 'freshtv642)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState264) : 'freshtv644)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv647 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv645 * _menhir_state) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_def_typ_body)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_def_typ = 
# 77 "imp_parser.mly"
                     ( Flow _2 )
# 3283 "imp_parser.ml"
         in
        _menhir_goto_def_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv646)) : 'freshtv648)
    | _ ->
        _menhir_fail ()

and _menhir_run244 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState244
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce154 _menhir_env (Obj.magic _menhir_stack) MenhirState244
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState244

and _menhir_run249 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState249
    | CLN | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce154 _menhir_env (Obj.magic _menhir_stack) MenhirState249
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState249

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv639) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 3329 "imp_parser.ml"
    ) = 
# 166 "imp_parser.mly"
      ( zn (Prm Z_u) )
# 3333 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv640)

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 3340 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv637) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 3350 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 3354 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 3359 "imp_parser.ml"
    ) = 
# 164 "imp_parser.mly"
        ( Var (newvar ()) )
# 3363 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv638)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv635) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 3377 "imp_parser.ml"
    ) = 
# 171 "imp_parser.mly"
            ( Prm Stg )
# 3381 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv636)

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv633) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 3395 "imp_parser.ml"
    ) = 
# 170 "imp_parser.mly"
        ( Prm Sgn )
# 3399 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv634)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 3406 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv631) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rot_dsh = 
# 174 "imp_parser.mly"
    ( 0 )
# 3416 "imp_parser.ml"
     in
    _menhir_goto_rot_dsh _menhir_env _menhir_stack _v) : 'freshtv632)

and _menhir_run94 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 3423 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv629) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 3433 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 3437 "imp_parser.ml"
    )) = _v in
    ((let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 3442 "imp_parser.ml"
    ) = 
# 165 "imp_parser.mly"
        ( Prm (Name _1) )
# 3446 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)

and _menhir_run95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv627) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 3460 "imp_parser.ml"
    ) = 
# 167 "imp_parser.mly"
      ( Prm N )
# 3464 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv628)

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv625 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState96 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
        | R_RCD ->
            _menhir_reduce152 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97) : 'freshtv626)
    | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | R_RCD | SGN | TYP_STG | VAL _ | Z ->
        _menhir_reduce154 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | L_OPN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | L_PRN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | L_RCD ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | N ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | NAM _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | ROT _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | SGN ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | TYP_STG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | VAL _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
    | Z ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState100
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100

and _menhir_run101 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | L_OPN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | L_PRN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | L_RCD ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | N ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | NAM _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | ROT _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | SGN ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | TYP_STG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState101
    | VAL _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
    | Z ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState101
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
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | L_OPN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | L_PRN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | L_RCD ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | N ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | NAM _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | ROT _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | SGN ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | TYP_STG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | VAL _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | Z ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv619 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3606 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3614 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_args) : 'tv_args) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3621 "imp_parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_args = 
# 65 "imp_parser.mly"
                 ( _1::_3 )
# 3627 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv618)) : 'freshtv620)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv623) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv621) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args) : 'tv_args) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 56 "imp_parser.mly"
             ( _2 )
# 3643 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv622)) : 'freshtv624)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args_rot : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_args_rot -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv611 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv609 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 61 "imp_parser.mly"
                 ( 1+_2 )
# 3666 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv610)) : 'freshtv612)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv615) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_args_rot) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv613) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_args_rot) : 'tv_args_rot) = _v in
        ((let _1 = () in
        let _v : 'tv_def_arg = 
# 57 "imp_parser.mly"
                 ( BatList.init _2 (fun n -> "$"^(String.make n '\'')) )
# 3682 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv614)) : 'freshtv616)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState261 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv603 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3696 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv601 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3704 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 3711 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 135 "imp_parser.mly"
                  ( _1::_2 )
# 3716 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv602)) : 'freshtv604)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv607 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 3724 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_name_list) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv605 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 3732 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_name_list) : 'tv_name_list) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 3739 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_typ_body = 
# 130 "imp_parser.mly"
                          ( Def_Fnt (_2,_4) )
# 3746 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv606)) : 'freshtv608)
    | _ ->
        _menhir_fail ()

and _menhir_goto_reg : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_reg -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState184 | MenhirState178 | MenhirState180 | MenhirState172 | MenhirState174 | MenhirState168 | MenhirState162 | MenhirState166 | MenhirState159 | MenhirState150 | MenhirState152 | MenhirState154 | MenhirState128 | MenhirState131 | MenhirState146 | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv581 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv579 * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_reg)) = _menhir_stack in
        let _v : 'tv_reg_ptn = 
# 230 "imp_parser.mly"
        ( Rcd_Ptn.A _1 )
# 3765 "imp_parser.ml"
         in
        _menhir_goto_reg_ptn _menhir_env _menhir_stack _menhir_s _v) : 'freshtv580)) : 'freshtv582)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv585 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv583 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_reg)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_reg_ptn_op = 
# 241 "imp_parser.mly"
                  ( Some _2 )
# 3786 "imp_parser.ml"
             in
            _menhir_goto_reg_ptn_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv584)) : 'freshtv586)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv588)) : 'freshtv590)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv591 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | NAM _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState159 _v
        | WC ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159) : 'freshtv592)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv597 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CMM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv593 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | NAM _v ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
            | WC ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState178
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178) : 'freshtv594)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv595 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv596)) : 'freshtv598)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv599 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183) : 'freshtv600)
    | _ ->
        _menhir_fail ()

and _menhir_reduce123 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst = 
# 244 "imp_parser.mly"
    ( [||] )
# 3861 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce125 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_reg_ptn_lst_lb = 
# 248 "imp_parser.mly"
    ( [||] )
# 3870 "imp_parser.ml"
     in
    _menhir_goto_reg_ptn_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 3877 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv575 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3889 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | NAM _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState134 _v
        | WC ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134) : 'freshtv576)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv577 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3911 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv578)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv573 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3923 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IN _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (int)
# 3934 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | NAM _v ->
            _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState128 _v
        | WC ->
            _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv570)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv571 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 3957 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv572)) : 'freshtv574)

and _menhir_reduce154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 153 "imp_parser.mly"
    ( [] )
# 3967 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_LST ->
        _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | L_OPN ->
        _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | L_PRN ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | L_RCD ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | N ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | NAM _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | ROT _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | SGN ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | TYP_STG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | VAL _v ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | Z ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86

and _menhir_run204 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv567) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 98 "imp_parser.mly"
                  ( Peg.Lex )
# 4014 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)

and _menhir_run205 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_ord = 
# 97 "imp_parser.mly"
          ( Peg.Synt )
# 4028 "imp_parser.ml"
     in
    _menhir_goto_ord _menhir_env _menhir_stack _menhir_s _v) : 'freshtv566)

and _menhir_goto_def_arg : _menhir_env -> 'ttv_tail -> 'tv_def_arg -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv563 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4039 "imp_parser.ml"
    )) * 'tv_def_arg) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv555 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4049 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_LST ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | L_OPN ->
            _menhir_run101 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | L_PRN ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | L_RCD ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | N ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | NAM _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState256 _v
        | ROT _v ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState256 _v
        | SGN ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | TYP_STG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | VAL _v ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState256 _v
        | Z ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState256
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState256) : 'freshtv556)
    | ISO ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv557 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4085 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COPRD ->
            _menhir_run249 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | PRD ->
            _menhir_run244 _menhir_env (Obj.magic _menhir_stack) MenhirState243
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState243) : 'freshtv558)
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv559 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4103 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 4108 "imp_parser.ml"
        ))), (_2 : 'tv_def_arg)) = _menhir_stack in
        let _v : 'tv_def_typ_body = 
# 127 "imp_parser.mly"
                 ( Def_Abs (_1,_2) )
# 4113 "imp_parser.ml"
         in
        _menhir_goto_def_typ_body _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv561 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4123 "imp_parser.ml"
        )) * 'tv_def_arg) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv562)) : 'freshtv564)

and _menhir_run235 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4131 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CMM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4143 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | VAL _v ->
            _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState236) : 'freshtv550)
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv551 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4159 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 4164 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_args = 
# 64 "imp_parser.mly"
        ( [_1] )
# 4169 "imp_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _menhir_s _v) : 'freshtv552)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv553 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4179 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv554)

and _menhir_run238 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DSH ->
        _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState238
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv547 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_args_rot = 
# 60 "imp_parser.mly"
        ( 1 )
# 4200 "imp_parser.ml"
         in
        _menhir_goto_args_rot _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState238

and _menhir_run261 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4211 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState261 _v
    | DTA | DTA_GRM | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv545 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 4225 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 4230 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_name_list = 
# 134 "imp_parser.mly"
        ( [_1] )
# 4235 "imp_parser.ml"
         in
        _menhir_goto_name_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv546)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState261

and _menhir_goto_lst_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lst_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv539 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv535 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv533 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_lst_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 313 "imp_parser.mly"
                         ( _2 )
# 4265 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)) : 'freshtv536)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv537 * _menhir_state) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)) : 'freshtv540)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv543 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv541 * _menhir_state * 'tv_exp) * _menhir_state * 'tv_lst_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_2 : 'tv_lst_list)) = _menhir_stack in
        let _v : 'tv_lst_list = 
# 317 "imp_parser.mly"
                 ( App(Atm (Name "⟦"),Rcd [|_1;_2|]) )
# 4284 "imp_parser.ml"
         in
        _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv542)) : 'freshtv544)
    | _ ->
        _menhir_fail ()

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv531) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_reg = 
# 225 "imp_parser.mly"
       ( let v = newvar () in rm := ("_",v)::!rm; v)
# 4300 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv532)

and _menhir_run130 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4307 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv529) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 4317 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 4321 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_reg = 
# 226 "imp_parser.mly"
        (
     let v = newvar () in rm := (_1,v)::!rm; v )
# 4327 "imp_parser.ml"
     in
    _menhir_goto_reg _menhir_env _menhir_stack _menhir_s _v) : 'freshtv530)

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv527 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState131 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState132 _v
        | OP | R_RCD ->
            _menhir_reduce125 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132) : 'freshtv528)
    | L_RCD ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | NAM _v ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState131 _v
    | WC ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | OP | R_RCD ->
        _menhir_reduce123 _menhir_env (Obj.magic _menhir_stack) MenhirState131
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131

and _menhir_run33 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run35 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv519 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 17 "imp_parser.mly"
       (int)
# 4425 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv517 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 17 "imp_parser.mly"
       (int)
# 4433 "imp_parser.ml"
        )) : (
# 17 "imp_parser.mly"
       (int)
# 4437 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 305 "imp_parser.mly"
                ( Prj(_1,Rcd_Ptn.Idx(_3,Rcd_Ptn.End)) )
# 4444 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)) : 'freshtv520)
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv523 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 4453 "imp_parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv521 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        let ((_3 : (
# 16 "imp_parser.mly"
       (string)
# 4461 "imp_parser.ml"
        )) : (
# 16 "imp_parser.mly"
       (string)
# 4465 "imp_parser.ml"
        )) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 306 "imp_parser.mly"
                ( Prj(_1,Rcd_Ptn.Lb(_3,Rcd_Ptn.End)) )
# 4472 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv522)) : 'freshtv524)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv525 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv526)

and _menhir_run38 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run40 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_run46 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv515 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv511 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv509 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_top)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 34 "imp_parser.mly"
      (Lang.Ast.line)
# 4736 "imp_parser.ml"
        ) = 
# 40 "imp_parser.mly"
  (
    ( try
      let (i,a) = Ast.tk_agl _1 in
      Line_Agl (i,a)
      with _ -> Line _1 ) )
# 4744 "imp_parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv510)) : 'freshtv512)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv513 * _menhir_state * 'tv_exp_top) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv514)) : 'freshtv516)

and _menhir_run3 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp_lst_lb -> (
# 16 "imp_parser.mly"
       (string)
# 4758 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv501 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 4770 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | CHO _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | EXN ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | IDX _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | INJ _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
        | L_LST ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_OPN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_PRN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | L_RCD ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | NAM _v ->
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv502)
    | RM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv505 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 4820 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 4827 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst_lb)), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 4832 "imp_parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_exp_lst_lb = 
# 280 "imp_parser.mly"
                      ( _1@[(_2,None)] )
# 4838 "imp_parser.ml"
         in
        _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)) : 'freshtv506)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv507 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 4848 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv508)

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv487 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv485 * _menhir_state * 'tv_mdl_etr) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_mdl_etr)), _, (_2 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _v : 'tv_gl_etr_lst = 
# 69 "imp_parser.mly"
                        ( _1::_2 )
# 4866 "imp_parser.ml"
         in
        _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv486)) : 'freshtv488)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv499 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4874 "imp_parser.ml"
        )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MDL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv495 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4884 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv493 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4891 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 4896 "imp_parser.ml"
            ))), _, (_3 : 'tv_gl_etr_lst)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_def_mdl = 
# 52 "imp_parser.mly"
                               ( (_2,_3) )
# 4903 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv491) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_def_mdl) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv489 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                _menhir_run275 _menhir_env (Obj.magic _menhir_stack) MenhirState277
            | MDL ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState277
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState277) : 'freshtv490)) : 'freshtv492)) : 'freshtv494)) : 'freshtv496)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv497 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 4930 "imp_parser.ml"
            )) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv498)) : 'freshtv500)
    | _ ->
        _menhir_fail ()

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 4940 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv481 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 4952 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv482)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv483 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 4970 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv484)

and _menhir_run84 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 4978 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv475) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | L_LST | L_OPN | L_PRN | L_RCD | N | NAM _ | ROT _ | SGN | SRC | TYP_STG | VAL _ | Z ->
            _menhir_reduce154 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv476)
    | IN _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 264 "imp_parser.mly"
    ( (Var (newvar()),Var (newvar())) )
# 5005 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv478)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv479 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5015 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv480)

and _menhir_run200 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 5023 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv471 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5035 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv467 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5045 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "imp_parser.mly"
       (string)
# 5050 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ISO ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv463 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5061 "imp_parser.ml"
                ))) * (
# 16 "imp_parser.mly"
       (string)
# 5065 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | COPRD ->
                    _menhir_run205 _menhir_env (Obj.magic _menhir_stack) MenhirState203
                | ORD_LEX_COPRD ->
                    _menhir_run204 _menhir_env (Obj.magic _menhir_stack) MenhirState203
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState203) : 'freshtv464)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv465 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5085 "imp_parser.ml"
                ))) * (
# 16 "imp_parser.mly"
       (string)
# 5089 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv466)) : 'freshtv468)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv469 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5100 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv470)) : 'freshtv472)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv473 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5111 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv474)

and _menhir_run231 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 5119 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv459 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5131 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FNT ->
            _menhir_run258 _menhir_env (Obj.magic _menhir_stack) MenhirState232
        | NAM _v ->
            _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState232 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232) : 'freshtv460)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 5151 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv462)

and _menhir_run233 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 5159 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv453) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DSH ->
            _menhir_run238 _menhir_env (Obj.magic _menhir_stack) MenhirState234
        | VAL _v ->
            _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState234 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState234) : 'freshtv454)
    | DTA | DTA_GRM | EQ | ISO | LCE | MDL_END | SLF _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv455) = Obj.magic _menhir_stack in
        ((let _v : 'tv_def_arg = 
# 55 "imp_parser.mly"
    ( [] )
# 5186 "imp_parser.ml"
         in
        _menhir_goto_def_arg _menhir_env _menhir_stack _v) : 'freshtv456)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv457 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 5196 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv458)

and _menhir_run258 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv449 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 16 "imp_parser.mly"
       (string)
# 5213 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ISO ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv445 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 5224 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run261 _menhir_env (Obj.magic _menhir_stack) MenhirState260 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState260) : 'freshtv446)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv447 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 5242 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv448)) : 'freshtv450)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv452)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv439 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | CHO _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | EXN ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | IDX _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | INJ _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | L_LST ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | L_OPN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | L_PRN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | L_RCD ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | NAM _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv433 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState60 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | CHO _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | EXN ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | IDX _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | INJ _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | L_LST ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | L_OPN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | L_PRN ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | L_RCD ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | NAM _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | R64 _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | ROT _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | SGN ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | SLF _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | STG _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | VAL _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | VCT_INI ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv434)
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState60 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv435 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 307 "imp_parser.mly"
                        ( Rcd (Array.of_list _2) )
# 5357 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv436)) : 'freshtv438)
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv440)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv443 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | CHO _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | EXN ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | IDX _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | INJ _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | L_LST ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | L_OPN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | L_PRN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | L_RCD ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | NAM _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv441 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_exp_top = 
# 268 "imp_parser.mly"
            ( Rcd (Array.of_list _1) )
# 5423 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv444)
    | _ ->
        _menhir_fail ()

and _menhir_reduce108 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lst_list = 
# 316 "imp_parser.mly"
    ( App(Atm (Name "⟦⟧"),Rcd [||]) )
# 5438 "imp_parser.ml"
     in
    _menhir_goto_lst_list _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv359 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | AGL | CHO _ | EOF | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv357 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp = 
# 282 "imp_parser.mly"
                          ( Agl_Op _2 )
# 5474 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv360)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv363 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv361 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 289 "imp_parser.mly"
                ( App(Atm (Name "⊵"),Rcd [|_1;_3|]) )
# 5505 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv364)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv367 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OP | PLS | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv365 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 297 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Pls),Rcd [|_1;_3|]) )
# 5532 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv368)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv371 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv369 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 298 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Mlt),Rcd [|_1;_3|]) )
# 5557 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv372)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv375 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | AGL | APP | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv373 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 304 "imp_parser.mly"
                ( App(_1,_3) )
# 5580 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv376)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv379 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MNS | NAM _ | OP | PLS | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv377 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 299 "imp_parser.mly"
                ( App(Atm(Fnc Tkn.Pls),Rcd [|_1;App(Atm(Fnc Tkn.Mns),_3)|]) )
# 5607 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv378)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv380)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv383 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | AGL | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv381 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 301 "imp_parser.mly"
               ( App(Atm(Fnc Tkn.Eq),Rcd [|_1;_3|]) )
# 5640 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv382)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47) : 'freshtv384)
    | MenhirState50 | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | CHO _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | EXN ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | IDX _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | INJ _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | L_LST ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | L_OPN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | L_PRN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | L_RCD ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | NAM _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | R_LST ->
            _menhir_reduce108 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50) : 'freshtv386)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv391 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | R_OPN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv389 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState52 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv387 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 312 "imp_parser.mly"
                    ( App(Atm (Name "‹"),_2) )
# 5741 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)) : 'freshtv390)
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv392)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv397 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv395 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState54 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv393 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 300 "imp_parser.mly"
                        ( App(Atm(Fnc Tkn.Mns),_3) )
# 5783 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)) : 'freshtv396)
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54) : 'freshtv398)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv401 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState56 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv399 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 302 "imp_parser.mly"
                    ( _2 )
# 5824 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv400)) : 'freshtv402)
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv404)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv409 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv407 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState58 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv405 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp_lst_lb)), _, (_5 : 'tv_exp)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 310 "imp_parser.mly"
                                     ( Rcd_Lb (Some _5,Array.of_list _3) )
# 5867 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv406)) : 'freshtv408)
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv410)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv415 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv413 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState63 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv411 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)), _), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 308 "imp_parser.mly"
                               ( Rcd (Array.of_list _2) )
# 5909 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv412)) : 'freshtv414)
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63) : 'freshtv416)
    | MenhirState76 | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv419 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | AGL | CHO _ | EOF | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R64 _ | ROT _ | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv417 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 275 "imp_parser.mly"
                 ( _1@[_2] )
# 5945 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv420)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv423 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 5957 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | EOF | NAM _ | OP | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv421 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 5981 "imp_parser.ml"
            ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst_lb)), (_2 : (
# 16 "imp_parser.mly"
       (string)
# 5986 "imp_parser.ml"
            ))), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _v : 'tv_exp_lst_lb = 
# 279 "imp_parser.mly"
                           ( _1@[(_2,Some _4)] )
# 5992 "imp_parser.ml"
             in
            _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v) : 'freshtv422)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv424)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv427 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv425 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 271 "imp_parser.mly"
            ( _2 )
# 6027 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv428)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv431 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | EQ ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | INI_IR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv429 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState171 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | NAM _v ->
                _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState172 _v
            | WC ->
                _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState172
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState172) : 'freshtv430)
        | MLT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | MNS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | PLS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | PRJ ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | VCT ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState171
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState171) : 'freshtv432)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_lst_lb : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst_lb -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv335 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 269 "imp_parser.mly"
                  ( Rcd_Lb(None,Array.of_list _2) )
# 6099 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv336)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv337 * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv338)) : 'freshtv340)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv349 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | OP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv341 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | CHO _v ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | EXN ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | IDX _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | INJ _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | L_LST ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | L_OPN ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | L_PRN ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | L_RCD ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | NAM _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | R64 _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | ROT _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | SGN ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | SLF _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | STG _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | VAL _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
            | VCT_INI ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState20
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv342)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv345 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv343 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 309 "imp_parser.mly"
                              ( Rcd_Lb (None,Array.of_list _3) )
# 6176 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)) : 'freshtv346)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv347 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)) : 'freshtv350)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv355 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) _v
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv351 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_3 : 'tv_exp_lst_lb)) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_exp_top = 
# 270 "imp_parser.mly"
                      ( Rcd_Lb(Some Rot,Array.of_list _3) )
# 6203 "imp_parser.ml"
             in
            _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv353 * _menhir_state)) * _menhir_state * 'tv_exp_lst_lb) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv354)) : 'freshtv356)
    | _ ->
        _menhir_fail ()

and _menhir_reduce72 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_etr_lst = 
# 68 "imp_parser.mly"
      ( [] )
# 6221 "imp_parser.ml"
     in
    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | SLF _v ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81

and _menhir_run199 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | SLF _v ->
        _menhir_run200 _menhir_env (Obj.magic _menhir_stack) MenhirState199 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState199

and _menhir_run230 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FNT ->
        _menhir_run258 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | NAM _v ->
        _menhir_run233 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
    | SLF _v ->
        _menhir_run231 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230

and _menhir_goto_file : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6273 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6284 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6292 "imp_parser.ml"
        )) : (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6296 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv328)) : 'freshtv330)
    | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv333 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6306 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6314 "imp_parser.ml"
        )) : (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6318 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_mdl)) = _menhir_stack in
        let _v : (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 6324 "imp_parser.ml"
        ) = 
# 49 "imp_parser.mly"
                 ( _1::_2 )
# 6328 "imp_parser.ml"
         in
        _menhir_goto_file _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)) : 'freshtv334)
    | _ ->
        _menhir_fail ()

and _menhir_reduce61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 274 "imp_parser.mly"
    ( [] )
# 6339 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 288 "imp_parser.mly"
            ( App(Atm (Name "#"),Rcd [||])  )
# 6353 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv326)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6360 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 6370 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 6374 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 287 "imp_parser.mly"
        ( Prj(Rot,Rcd_Ptn.Lb(_1,Rcd_Ptn.End)) )
# 6379 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6386 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 16 "imp_parser.mly"
       (string)
# 6396 "imp_parser.ml"
    )) : (
# 16 "imp_parser.mly"
       (string)
# 6400 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 295 "imp_parser.mly"
        ( Atm (Stg _1) )
# 6405 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6412 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv319) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6422 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6426 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 296 "imp_parser.mly"
        ( Atm(Fnc Tkn.Fix) )
# 6431 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv317) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 294 "imp_parser.mly"
        ( App(Atm (Name "&"),Rcd [||]) )
# 6445 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6452 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv315) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6462 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6466 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 285 "imp_parser.mly"
        ( Rot )
# 6471 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv316)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 18 "imp_parser.mly"
       (int64)
# 6478 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv313) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 18 "imp_parser.mly"
       (int64)
# 6488 "imp_parser.ml"
    )) : (
# 18 "imp_parser.mly"
       (int64)
# 6492 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 303 "imp_parser.mly"
        ( Atm(R64 _1) )
# 6497 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 16 "imp_parser.mly"
       (string)
# 6504 "imp_parser.ml"
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
# 6516 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv303 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6526 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_v : (
# 16 "imp_parser.mly"
       (string)
# 6531 "imp_parser.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv301 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6538 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            let ((_3 : (
# 16 "imp_parser.mly"
       (string)
# 6543 "imp_parser.ml"
            )) : (
# 16 "imp_parser.mly"
       (string)
# 6547 "imp_parser.ml"
            )) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 6552 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 293 "imp_parser.mly"
                ( Atm(Name (_1^"."^_3)) )
# 6558 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv302)) : 'freshtv304)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv305 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6568 "imp_parser.ml"
            ))) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)) : 'freshtv308)
    | AGL | APP | CHO _ | EOF | EQ | EXN | IDX _ | INI_IR | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | MLT | MNS | NAM _ | OP | PLS | PRJ | R64 _ | ROT _ | R_LST | R_OPN | R_PRN | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT | VCT_INI ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6577 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 16 "imp_parser.mly"
       (string)
# 6582 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_exp = 
# 292 "imp_parser.mly"
         ( Atm (Name _1) )
# 6587 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 6597 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv312)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState16 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce63 _menhir_env (Obj.magic _menhir_stack) MenhirState17) : 'freshtv300)
    | AGL | CHO _ | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | OP | R64 _ | ROT _ | R_RCD | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
        _menhir_reduce61 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | MNS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv297 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState21 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | CHO _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | EXN ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | IDX _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | INJ _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
        | L_LST ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | L_OPN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | L_PRN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | L_RCD ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | NAM _v ->
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22) : 'freshtv298)
    | NAM _v ->
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | R_OPN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState23 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_exp = 
# 311 "imp_parser.mly"
                ( App(Atm(Name "‹›"),Rcd [||]) )
# 6763 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv294)) : 'freshtv296)
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | R_LST ->
        _menhir_reduce108 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6833 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6843 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6847 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 283 "imp_parser.mly"
        ( Atm(Z _1) )
# 6852 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv292)

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6859 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv289) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6869 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6873 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 290 "imp_parser.mly"
        ( Atm(Fnc(Tkn.Inj _1)) )
# 6878 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv290)

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6885 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv287) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6895 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6899 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 286 "imp_parser.mly"
        ( Prj(Rot,Rcd_Ptn.Idx(_1,Rcd_Ptn.End)) )
# 6904 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv288)

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv285) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_exp = 
# 284 "imp_parser.mly"
        ( Atm (Fnc Tkn.Exn_Ini) )
# 6918 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "imp_parser.mly"
       (int)
# 6925 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "imp_parser.mly"
       (int)
# 6935 "imp_parser.ml"
    )) : (
# 17 "imp_parser.mly"
       (int)
# 6939 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 291 "imp_parser.mly"
        ( Atm(Fnc(Tkn.Cho _1))  )
# 6944 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | CHO _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | EXN ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | IDX _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INJ _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | L_LST ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_OPN ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_PRN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_RCD ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | NAM _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | R64 _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | ROT _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | SGN ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | SLF _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | STG _v ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | VAL _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | VCT_INI ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_reduce63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst_lb = 
# 278 "imp_parser.mly"
    ( [] )
# 7000 "imp_parser.ml"
     in
    _menhir_goto_exp_lst_lb _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 34 "imp_parser.mly"
      (Lang.Ast.line)
# 7007 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 34 "imp_parser.mly"
      (Lang.Ast.line)
# 7016 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 34 "imp_parser.mly"
      (Lang.Ast.line)
# 7024 "imp_parser.ml"
    )) : (
# 34 "imp_parser.mly"
      (Lang.Ast.line)
# 7028 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv280)) : 'freshtv282)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState277 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state * 'tv_def_mdl) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState268 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_mdl_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState264 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7050 "imp_parser.ml"
        ))) * _menhir_state * 'tv_def_typ_body) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState261 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7059 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState260 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 7068 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv39 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7077 "imp_parser.ml"
        )) * 'tv_def_arg)) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7081 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState256 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7090 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 7099 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState247 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv47 * _menhir_state) * _menhir_state * 'tv_typ_top)) * (
# 16 "imp_parser.mly"
       (string)
# 7113 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState244 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState243 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv51 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7127 "imp_parser.ml"
        )) * 'tv_def_arg)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7141 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState234 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7154 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState227 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_grm_etr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState225 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv65 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7173 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 7177 "imp_parser.ml"
        ))) * _menhir_state * 'tv_grm_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState220 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * 'tv_prd_flg) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * 'tv_prd_flg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState207 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * _menhir_state * 'tv_ord) * _menhir_state * 'tv_grm_ptns) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState206 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * 'tv_ord) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState203 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7216 "imp_parser.ml"
        ))) * (
# 16 "imp_parser.mly"
       (string)
# 7220 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState199 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState195 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7234 "imp_parser.ml"
        ))) * _menhir_state * 'tv_glb_etr_body_ir) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState189 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state * 'tv_ir_line) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState187 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv87 * _menhir_state) * _menhir_state * 'tv_reg_ptn) * _menhir_state * 'tv_ir_lines) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState184 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState182 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState180 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv97 * _menhir_state) * _menhir_state * 'tv_reg)) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv99 * _menhir_state) * _menhir_state * 'tv_reg)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv103 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState172 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv105 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState171 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState166 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv113 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7313 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState162 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7322 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState159 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state) * _menhir_state * 'tv_reg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState158 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv121 * _menhir_state) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState154 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv125 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7351 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState152 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7360 "imp_parser.ml"
        )) * _menhir_state * 'tv_reg_ptn)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7369 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState149 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * 'tv_ir_etr) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv132)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv139 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_reg_ptn_lst_lb) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv141 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7402 "imp_parser.ml"
        ))) * _menhir_state * 'tv_reg_ptn) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState134 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7411 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState132 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv145 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState131 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149 * (
# 17 "imp_parser.mly"
       (int)
# 7430 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv150)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv151) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7443 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155 * _menhir_state * 'tv_typs) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7452 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7466 "imp_parser.ml"
        ))) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7470 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7479 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7488 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7497 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7501 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState109 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7510 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7519 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7523 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7532 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv173 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7541 "imp_parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7545 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv175 * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7554 "imp_parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * (
# 36 "imp_parser.mly"
      (Lang.Types.t)
# 7563 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState102 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv179 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv181 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState99 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * _menhir_state * (
# 16 "imp_parser.mly"
       (string)
# 7587 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState97 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv194)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state * (
# 17 "imp_parser.mly"
       (int)
# 7615 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv197 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state) * (
# 16 "imp_parser.mly"
       (string)
# 7629 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState78 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv202)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv211 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 7662 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv213 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv215 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv217 * _menhir_state) * _menhir_state * 'tv_exp_lst) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv221 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState54 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv225 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState50 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv231 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv233 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv235 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv237 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv239 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv241 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv243 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv247 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv249 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv251 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv259 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv267 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_exp_lst_lb)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv272)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv273 * _menhir_state * 'tv_exp_lst_lb) * (
# 16 "imp_parser.mly"
       (string)
# 7821 "imp_parser.ml"
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

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
# 7847 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | DTA_GRM ->
            _menhir_run199 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | LCE ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | MDL_END ->
            _menhir_reduce72 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv26)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv27 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)

and _menhir_run275 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 7882 "imp_parser.ml"
    ) = 
# 48 "imp_parser.mly"
        ( [] )
# 7886 "imp_parser.ml"
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
# 34 "imp_parser.mly"
      (Lang.Ast.line)
# 7915 "imp_parser.ml"
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
# 34 "imp_parser.mly"
      (Lang.Ast.line)
# 7943 "imp_parser.ml"
            ) = 
# 45 "imp_parser.mly"
                ( End )
# 7947 "imp_parser.ml"
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
            _menhir_reduce63 _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv12)
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
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | CHO _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | EXN ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | IDX _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | INJ _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | L_LST ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | L_OPN ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | L_PRN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | L_RCD ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | NAM _v ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | R64 _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | ROT _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | SGN ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | SLF _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | STG _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | VAL _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | VCT_INI ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv18)
    | LB ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce63 _menhir_env (Obj.magic _menhir_stack) MenhirState1) : 'freshtv20)
    | AGL | CHO _ | EOF | EXN | IDX _ | INJ _ | INT _ | L_LST | L_OPN | L_PRN | L_RCD | NAM _ | R64 _ | ROT _ | SGN | SLF _ | STG _ | VAL _ | VCT_INI ->
        _menhir_reduce61 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv22))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 33 "imp_parser.mly"
      (Lang.Ast.mdl list)
# 8042 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        _menhir_run275 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | MDL ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78) : 'freshtv2))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 8063 "imp_parser.ml"
