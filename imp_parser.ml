
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | VAL of (
# 13 "imp_parser.mly"
       (string)
# 12 "imp_parser.ml"
  )
    | TEST
    | STT_CLN
    | SRC
    | SPL
    | SLH
    | R_RCD
    | R_PRN
    | R_BLK
    | R_APP
    | ROT of (
# 14 "imp_parser.mly"
       (int)
# 26 "imp_parser.ml"
  )
    | PRJ
    | PRD_STT
    | PRD
    | PLS
    | NAM of (
# 13 "imp_parser.mly"
       (string)
# 35 "imp_parser.ml"
  )
    | N
    | M_CNN
    | MLT
    | MDL_END
    | MDL
    | MCR of (
# 13 "imp_parser.mly"
       (string)
# 45 "imp_parser.ml"
  )
    | L_RCD
    | L_PRN
    | L_BLK
    | LCE
    | IO
    | INT of (
# 14 "imp_parser.mly"
       (int)
# 55 "imp_parser.ml"
  )
    | GL_NAM of (
# 13 "imp_parser.mly"
       (string)
# 60 "imp_parser.ml"
  )
    | FOR_ALL
    | EXP
    | EQV
    | EOF
    | END_PRD
    | END_GL_ETR_LST
    | END_FLW_LST
    | END_CO_PRD
    | D_EXP
    | DTA
    | DOT
    | DEF
    | CO_PRD_STT
    | CO_PRD
    | CNN
    | CMT
    | CLS_NAM
    | CLS
    | CLN
    | ARR_STT
    | ARR_END
    | ARR
    | APP
    | AGL_END
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
  | MenhirState183
  | MenhirState176
  | MenhirState174
  | MenhirState156
  | MenhirState155
  | MenhirState153
  | MenhirState151
  | MenhirState150
  | MenhirState148
  | MenhirState147
  | MenhirState140
  | MenhirState138
  | MenhirState130
  | MenhirState128
  | MenhirState125
  | MenhirState123
  | MenhirState120
  | MenhirState116
  | MenhirState110
  | MenhirState107
  | MenhirState106
  | MenhirState104
  | MenhirState101
  | MenhirState100
  | MenhirState96
  | MenhirState95
  | MenhirState93
  | MenhirState92
  | MenhirState91
  | MenhirState90
  | MenhirState88
  | MenhirState85
  | MenhirState79
  | MenhirState77
  | MenhirState76
  | MenhirState75
  | MenhirState74
  | MenhirState73
  | MenhirState72
  | MenhirState69
  | MenhirState68
  | MenhirState67
  | MenhirState66
  | MenhirState60
  | MenhirState57
  | MenhirState55
  | MenhirState52
  | MenhirState51
  | MenhirState49
  | MenhirState47
  | MenhirState46
  | MenhirState45
  | MenhirState41
  | MenhirState40
  | MenhirState39
  | MenhirState38
  | MenhirState37
  | MenhirState34
  | MenhirState33
  | MenhirState30
  | MenhirState18
  | MenhirState15
  | MenhirState13
  | MenhirState10
  | MenhirState9
  | MenhirState6
  | MenhirState4
  | MenhirState3
  | MenhirState0

# 1 "imp_parser.mly"
  
  open Imp

# 178 "imp_parser.ml"

let rec _menhir_goto_coprd_tail : _menhir_env -> 'ttv_tail -> 'tv_coprd_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv733) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv727 * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | CNN ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | AGL | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
            _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107) : 'freshtv728)
    | END_CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv729) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | CNN ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | AGL | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
            _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv730)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv731) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv732)) : 'freshtv734)

and _menhir_goto_tail_code : _menhir_env -> 'ttv_tail -> 'tv_tail_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv725 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail_code) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv723 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail_code) : 'tv_tail_code) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
    let _v : 'tv_vh_frm_code = 
# 175 "imp_parser.mly"
    (
      match _2 with
      | `None -> _1
      | `Some t -> Imp.Seq (_1,t)
      | `CoPrd c -> Code_CoPrd { pre=_1; post=c }
    )
# 245 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv721) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_code) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv669) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv667) = Obj.magic _menhir_stack in
        ((let _v : 'tv_coprd_tail = 
# 193 "imp_parser.mly"
    ( [] )
# 261 "imp_parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv668)) : 'freshtv670)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv679) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv677) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _, (_2 : 'tv_vh_frm_code)), (_3 : 'tv_coprd_tail)), _, (_5 : 'tv_vh_frm_code)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_coprd = 
# 189 "imp_parser.mly"
    (  `CoPrd ([_2]@_3@[_5]) )
# 275 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv675) = _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv673) = Obj.magic _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv671) = Obj.magic _menhir_stack in
        let ((_1 : 'tv_coprd) : 'tv_coprd) = _v in
        ((let _v : 'tv_tail_code = 
# 185 "imp_parser.mly"
          ( _1 )
# 289 "imp_parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv672)) : 'freshtv674)) : 'freshtv676)) : 'freshtv678)) : 'freshtv680)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv683 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv681 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : 'tv_coprd_tail)), _, (_3 : 'tv_vh_frm_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_coprd_tail = 
# 194 "imp_parser.mly"
                                  ( _1@[_3] )
# 302 "imp_parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv682)) : 'freshtv684)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv687) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv685) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm_code)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail_code = 
# 184 "imp_parser.mly"
                    ( `Some _2 )
# 315 "imp_parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv686)) : 'freshtv688)
    | MenhirState33 | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv719 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv717 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_code)) = _menhir_stack in
        let _v : 'tv_lc_code = 
# 133 "imp_parser.mly"
                ( _1 )
# 327 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv715) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((match _menhir_s with
        | MenhirState45 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv691 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_code) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv689 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_lc_code) : 'tv_lc_code) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp = 
# 253 "imp_parser.mly"
                    ( Imp.Opr_IO _2 )
# 348 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv690)) : 'freshtv692)
        | MenhirState33 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv713 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 356 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_code) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv711 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 364 "imp_parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_5 : 'tv_lc_code) : 'tv_lc_code) = _v in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 13 "imp_parser.mly"
       (string)
# 371 "imp_parser.ml"
            ))), (_3 : 'tv_typ_def)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 127 "imp_parser.mly"
                                (
    let (src,dst) = _3 in
    Imp.Etr (ref { gl_name=_2; src=src; dst=dst; code=_5 })
    )
# 381 "imp_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv709) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_glb_etr) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            match _menhir_s with
            | MenhirState0 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv699 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | EOF ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv695 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv693 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_etr)) = _menhir_stack in
                    let _2 = () in
                    let _v : (
# 29 "imp_parser.mly"
      (Imp.buffer)
# 405 "imp_parser.ml"
                    ) = 
# 35 "imp_parser.mly"
                ( Imp.Glb_Etr _1 )
# 409 "imp_parser.ml"
                     in
                    _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv694)) : 'freshtv696)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv697 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv698)) : 'freshtv700)
            | MenhirState176 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv707 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | END_GL_ETR_LST ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv703 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv701 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_etr)) = _menhir_stack in
                    let _2 = () in
                    let _v : 'tv_gl_etr_lst = 
# 55 "imp_parser.mly"
                            ()
# 436 "imp_parser.ml"
                     in
                    _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv702)) : 'freshtv704)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv705 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv706)) : 'freshtv708)
            | _ ->
                _menhir_fail ()) : 'freshtv710)) : 'freshtv712)) : 'freshtv714)
        | _ ->
            _menhir_fail ()) : 'freshtv716)) : 'freshtv718)) : 'freshtv720)
    | _ ->
        _menhir_fail ()) : 'freshtv722)) : 'freshtv724)) : 'freshtv726)

and _menhir_run120 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | ARR_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | GL_NAM _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | INT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | L_PRN ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | L_RCD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState120
    | MCR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | ROT _v ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState120 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120

and _menhir_goto_vh_frm_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState33 | MenhirState110 | MenhirState107 | MenhirState88 | MenhirState85 | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv657 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv647) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | CNN ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | AGL | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
                _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv648)
        | ARR_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv651) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv649) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_tail_code = 
# 183 "imp_parser.mly"
            ( `None )
# 515 "imp_parser.ml"
             in
            _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv650)) : 'freshtv652)
        | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv653) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | CNN ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | AGL | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
                _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv654)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv655 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv656)) : 'freshtv658)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv665 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv661 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv659 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 29 "imp_parser.mly"
      (Imp.buffer)
# 557 "imp_parser.ml"
            ) = 
# 34 "imp_parser.mly"
                   ( Imp.Evo _1 )
# 561 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv660)) : 'freshtv662)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv663 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv664)) : 'freshtv666)
    | _ ->
        _menhir_fail ()

and _menhir_goto_vh_frm_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv639 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv635 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv633 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_h_frm = 
# 232 "imp_parser.mly"
                                ( Imp.Canon _3 )
# 599 "imp_parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv634)) : 'freshtv636)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv637 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv638)) : 'freshtv640)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv645 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run120 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv641 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_vh_frm_top = 
# 197 "imp_parser.mly"
                    ( Imp.Canon _2 )
# 625 "imp_parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv642)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv643 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv644)) : 'freshtv646)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv631 * _menhir_state * 'tv_plc_ept) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exp_top) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv629 * _menhir_state * 'tv_plc_ept) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_exp_top) : 'tv_exp_top) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_plc_ept)) = _menhir_stack in
    let _v : 'tv_vh_frm_top = 
# 198 "imp_parser.mly"
                    ( Imp.Opr { src=Plc_Top; dst=_1; opr=_2 } )
# 652 "imp_parser.ml"
     in
    _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv630)) : 'freshtv632)

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv627 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv625 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail) : 'tv_tail) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_h_frm)) = _menhir_stack in
    let _v : 'tv_vh_frm = 
# 223 "imp_parser.mly"
    (
      match _2 with
      | `None -> _1
      | `Some t -> Imp.Seq (_1,t)
      | `CoPrd c -> Code_CoPrd { pre=_1; post=c }
    )
# 673 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv623) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv599 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv597 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_lst)), _, (_3 : 'tv_vh_frm)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_vh_frm_lst = 
# 219 "imp_parser.mly"
                            ( _1@[_3] )
# 691 "imp_parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv598)) : 'freshtv600)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv605) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv601) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | ARR_STT ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | GL_NAM _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | INT _v ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | L_PRN ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | L_RCD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | MCR _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | ROT _v ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125) : 'freshtv602)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv603) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv604)) : 'freshtv606)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv613) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END_CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv609) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv607) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _, (_2 : 'tv_vh_frm)), _, (_4 : 'tv_vh_frm)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_tail = 
# 237 "imp_parser.mly"
                                                ( `CoPrd [_2;_4] )
# 752 "imp_parser.ml"
             in
            _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv608)) : 'freshtv610)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv611) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv612)) : 'freshtv614)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv617) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv615) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 236 "imp_parser.mly"
               ( `Some _2 )
# 772 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv616)) : 'freshtv618)
    | MenhirState34 | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv621 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv619 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm)) = _menhir_stack in
        let _v : 'tv_vh_frm_lst = 
# 218 "imp_parser.mly"
            ( [_1] )
# 784 "imp_parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv620)) : 'freshtv622)
    | _ ->
        _menhir_fail ()) : 'freshtv624)) : 'freshtv626)) : 'freshtv628)

and _menhir_goto_macro : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_macro -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv587 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv585 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_macro) : 'tv_macro) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_exp_top = 
# 202 "imp_parser.mly"
                  ( _2 )
# 807 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv586)) : 'freshtv588)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv591 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv589 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_macro) : 'tv_macro) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_exp_top = 
# 203 "imp_parser.mly"
                    ( Imp.App (_2,Imp.Root 0) )
# 824 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv590)) : 'freshtv592)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv595 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv593 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_macro) : 'tv_macro) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
        let _v : 'tv_exp_top = 
# 201 "imp_parser.mly"
                  ( Imp.Opr_Rcd _1 )
# 840 "imp_parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv594)) : 'freshtv596)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_plc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_plc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv581 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv577 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv575 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_plc)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 29 "imp_parser.mly"
      (Imp.buffer)
# 866 "imp_parser.ml"
            ) = 
# 40 "imp_parser.mly"
                ( _1 )
# 870 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv576)) : 'freshtv578)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv579 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv580)) : 'freshtv582)
    | MenhirState183 | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv583 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DTA ->
            _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | END_FLW_LST ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState183
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState183) : 'freshtv584)
    | _ ->
        _menhir_fail ()

and _menhir_run57 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 900 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | L_RCD ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | N ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | TEST ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | Z ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run60 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 926 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | L_RCD ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | N ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
    | TEST ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | Z ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState60
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | L_RCD ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | N ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | TEST ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run18 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | L_RCD ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | N ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | TEST ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_goto_h_frm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv573 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv563) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | ARR_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | GL_NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
        | INT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
        | L_PRN ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | L_RCD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState130
        | MCR _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
        | ROT _v ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130) : 'freshtv564)
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv567) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
        ((let _1 = () in
        let _v : 'tv_tail = 
# 235 "imp_parser.mly"
            ( `None )
# 1037 "imp_parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv566)) : 'freshtv568)
    | CO_PRD_STT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | ARR_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | GL_NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | INT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | L_PRN ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | L_RCD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState123
        | MCR _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | ROT _v ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv570)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv571 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv572)) : 'freshtv574)

and _menhir_goto_macros : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_macros -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv557 * _menhir_state * (
# 13 "imp_parser.mly"
       (string)
# 1082 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macros) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv555 * _menhir_state * (
# 13 "imp_parser.mly"
       (string)
# 1090 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_macros) : 'tv_macros) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 13 "imp_parser.mly"
       (string)
# 1097 "imp_parser.ml"
        ))), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_macros = 
# 211 "imp_parser.mly"
                       ( )
# 1103 "imp_parser.ml"
         in
        _menhir_goto_macros _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)) : 'freshtv558)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv561 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macros) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv559 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_macros) : 'tv_macros) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_macro = 
# 207 "imp_parser.mly"
                ( )
# 1120 "imp_parser.ml"
         in
        _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)) : 'freshtv562)
    | _ ->
        _menhir_fail ()

and _menhir_run94 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "imp_parser.mly"
       (string)
# 1129 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv551 * _menhir_state * (
# 13 "imp_parser.mly"
       (string)
# 1141 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | ARR_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | GL_NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
        | INT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
        | L_PRN ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | L_RCD ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState95
        | MCR _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
        | ROT _v ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState95 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState95) : 'freshtv552)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv553 * _menhir_state * (
# 13 "imp_parser.mly"
       (string)
# 1173 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv554)

and _menhir_reduce47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_macro = 
# 206 "imp_parser.mly"
    ( )
# 1183 "imp_parser.ml"
     in
    _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v

and _menhir_run93 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | MCR _v ->
        _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93

and _menhir_run69 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | ARR_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | GL_NAM _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | INT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | L_PRN ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | L_RCD ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | MCR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | ROT _v ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69

and _menhir_run72 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | ARR_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | GL_NAM _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | INT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | L_PRN ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | L_RCD ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState72
    | MCR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | ROT _v ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72

and _menhir_run74 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | ARR_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | GL_NAM _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | INT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | L_PRN ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | L_RCD ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState74
    | MCR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | ROT _v ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState74 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74

and _menhir_run76 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | ARR_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | GL_NAM _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | INT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | L_PRN ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | L_RCD ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState76
    | MCR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | ROT _v ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState37 | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv547 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | ARR_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | GL_NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | INT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | L_PRN ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | L_RCD ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MCR _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | ROT _v ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv545 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState41 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv543 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 252 "imp_parser.mly"
                        ( Imp.Opr_Rcd _2 )
# 1348 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv544)) : 'freshtv546)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv548)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv549 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | ARR_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | GL_NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
        | INT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
        | L_PRN ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | L_RCD ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | MCR _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
        | ROT _v ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
        | SPL ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv550)
    | _ ->
        _menhir_fail ()

and _menhir_goto_plc_top : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1391 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv533 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1401 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv529 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1411 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv527 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1418 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1423 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1430 "imp_parser.ml"
            ) = 
# 97 "imp_parser.mly"
                        ( _2 )
# 1434 "imp_parser.ml"
             in
            _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv528)) : 'freshtv530)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv531 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1444 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv532)) : 'freshtv534)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv541 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1453 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv537 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1463 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv535 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1470 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1475 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_plc_ept = 
# 215 "imp_parser.mly"
                    ( _2 )
# 1482 "imp_parser.ml"
             in
            _menhir_goto_plc_ept _menhir_env _menhir_stack _menhir_s _v) : 'freshtv536)) : 'freshtv538)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv539 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1492 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv540)) : 'freshtv542)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv483 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv479 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv477 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 116 "imp_parser.mly"
                        ( _2 )
# 1521 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv478)) : 'freshtv480)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv481 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv482)) : 'freshtv484)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv489) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv485) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | DEF | FOR_ALL | L_RCD | N | NAM _ | TEST | Z ->
                _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack) MenhirState30
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv486)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv487) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv488)) : 'freshtv490)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv493) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv491) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_typ_top)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 137 "imp_parser.mly"
                            ( (_2,_4) )
# 1569 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv492)) : 'freshtv494)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv499 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 1577 "imp_parser.ml"
        ))) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv495 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 1587 "imp_parser.ml"
            ))) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | EOF | FOR_ALL | L_RCD | N | NAM _ | TEST | Z ->
                _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack) MenhirState140
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv496)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv497 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 1607 "imp_parser.ml"
            ))) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv498)) : 'freshtv500)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv513 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 1616 "imp_parser.ml"
        ))) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv511 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 1622 "imp_parser.ml"
        ))) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (_3 : (
# 13 "imp_parser.mly"
       (string)
# 1627 "imp_parser.ml"
        ))), _, (_5 : 'tv_typ_top)), _, (_7 : 'tv_typ_top)) = _menhir_stack in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_glb_mode = 
# 123 "imp_parser.mly"
                                        ( (_3,_5,_7) )
# 1636 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv509) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_mode) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv507 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv503 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv501 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_mode)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 29 "imp_parser.mly"
      (Imp.buffer)
# 1658 "imp_parser.ml"
            ) = 
# 36 "imp_parser.mly"
                 (
      let (n,s,d) = _1 in
      (Imp.Glb_mode_Stt { name=n; src=s; dst=d })
         )
# 1665 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv502)) : 'freshtv504)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv505 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv506)) : 'freshtv508)) : 'freshtv510)) : 'freshtv512)) : 'freshtv514)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv519 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv515 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState150 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState150) : 'freshtv516)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv517 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv518)) : 'freshtv520)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv525 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv521 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState155 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155) : 'freshtv522)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv523 * _menhir_state) * _menhir_state * 'tv_typ_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv524)) : 'freshtv526)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv471 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv469 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 75 "imp_parser.mly"
                                       ( (_4,_2)::_5 )
# 1746 "imp_parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv470)) : 'freshtv472)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv475 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv473 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_def_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_plc = 
# 58 "imp_parser.mly"
                                (
      Imp.Glb_Etr
      (Def_CoPrd (ref
        { coprd_name=(snd _2); coprd_cns=_4 }))
      )
# 1768 "imp_parser.ml"
         in
        _menhir_goto_def_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv474)) : 'freshtv476)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv463 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv461 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 79 "imp_parser.mly"
                                  ( (_4,_2)::_5 )
# 1792 "imp_parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)) : 'freshtv464)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv467 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv465 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_def_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_plc = 
# 63 "imp_parser.mly"
                              (
      Imp.Glb_Etr
        (Def_Prd (ref
        { prd_name=(snd _2); prd_cns=_4 }))
      )
# 1814 "imp_parser.ml"
         in
        _menhir_goto_def_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv466)) : 'freshtv468)
    | _ ->
        _menhir_fail ()

and _menhir_goto_plc : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1823 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv429 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 1833 "imp_parser.ml"
        ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1837 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | CLN | FOR_ALL | L_BLK | L_RCD | N | NAM _ | R_RCD | TEST | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv425 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 1851 "imp_parser.ml"
            ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1855 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 13 "imp_parser.mly"
       (string)
# 1860 "imp_parser.ml"
            ))), _, (_4 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1864 "imp_parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1871 "imp_parser.ml"
            ) = 
# 95 "imp_parser.mly"
                        ( Imp.Plc_For_All (Imp.Class_Type,_2,_4) )
# 1875 "imp_parser.ml"
             in
            _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv427 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 1885 "imp_parser.ml"
            ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1889 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv428)) : 'freshtv430)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv435 * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1898 "imp_parser.ml"
        ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1902 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | FOR_ALL | L_BLK | L_RCD | N | NAM _ | R_RCD | TEST | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv431 * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1914 "imp_parser.ml"
            ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1918 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1923 "imp_parser.ml"
            ))), _, (_3 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1927 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1933 "imp_parser.ml"
            ) = 
# 94 "imp_parser.mly"
                ( Imp.Plc_IO (_1,_3) )
# 1937 "imp_parser.ml"
             in
            _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv433 * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1947 "imp_parser.ml"
            ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1951 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv434)) : 'freshtv436)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv441 * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1960 "imp_parser.ml"
        ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1964 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | FOR_ALL | L_BLK | L_RCD | N | NAM _ | R_RCD | TEST | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv437 * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1976 "imp_parser.ml"
            ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1980 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1985 "imp_parser.ml"
            ))), _, (_3 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1989 "imp_parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 1995 "imp_parser.ml"
            ) = 
# 90 "imp_parser.mly"
                ( Imp.Plc_App (_1,_3) )
# 1999 "imp_parser.ml"
             in
            _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv439 * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2009 "imp_parser.ml"
            ))) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2013 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv440)) : 'freshtv442)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv447 * _menhir_state * (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2022 "imp_parser.ml"
        )) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2026 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | CLN | FOR_ALL | L_RCD | N | NAM _ | R_RCD | TEST | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv443 * _menhir_state * (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2040 "imp_parser.ml"
            )) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2044 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2049 "imp_parser.ml"
            ))), _, (_2 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2053 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2058 "imp_parser.ml"
            ) = 
# 87 "imp_parser.mly"
             ( _1@[_2] )
# 2062 "imp_parser.ml"
             in
            _menhir_goto_plcs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv444)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv445 * _menhir_state * (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2072 "imp_parser.ml"
            )) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2076 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv446)) : 'freshtv448)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv453 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2085 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | L_BLK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv449 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2099 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | ARR_STT ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | GL_NAM _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | INT _v ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | L_PRN ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | L_RCD ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | MCR _v ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | ROT _v ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv450)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv451 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2131 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv452)) : 'freshtv454)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv459 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2140 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | CLN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv455 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2154 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2159 "imp_parser.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2165 "imp_parser.ml"
            ) = 
# 83 "imp_parser.mly"
            ( _2 )
# 2169 "imp_parser.ml"
             in
            _menhir_goto_plc_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv456)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv457 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2179 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv458)) : 'freshtv460)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv377 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 2195 "imp_parser.ml"
        ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | EOF | FOR_ALL | L_BLK | L_RCD | N | NAM _ | R_RCD | SRC | TEST | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv373 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 2209 "imp_parser.ml"
            ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 13 "imp_parser.mly"
       (string)
# 2214 "imp_parser.ml"
            ))), _, (_4 : 'tv_typ)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 114 "imp_parser.mly"
                        ( Imp.Typ_For_All (Imp.Class_Type,_2,_4) )
# 2221 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv375 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 2231 "imp_parser.ml"
            ))) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)) : 'freshtv378)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv383 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | EOF | FOR_ALL | L_BLK | L_RCD | N | NAM _ | R_RCD | SRC | TEST | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv379 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 113 "imp_parser.mly"
                ( Imp.Typ_IO (_1,_3) )
# 2251 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv381 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)) : 'freshtv384)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv389 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IO ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | APP | CLN | DEF | EOF | FOR_ALL | L_BLK | L_RCD | N | NAM _ | R_RCD | SRC | TEST | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv385 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typ)), _, (_3 : 'tv_typ)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_typ = 
# 109 "imp_parser.mly"
                ( Imp.Typ_App (_1,_3) )
# 2277 "imp_parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv387 * _menhir_state * 'tv_typ)) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv388)) : 'freshtv390)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv395 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | EOF | FOR_ALL | L_RCD | N | NAM _ | R_RCD | SRC | TEST | Z ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv391 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_typs)), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _v : 'tv_typs = 
# 106 "imp_parser.mly"
             ( _1@[_2] )
# 2304 "imp_parser.ml"
             in
            _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv393 * _menhir_state * 'tv_typs) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)) : 'freshtv396)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv417 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | L_BLK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv413 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | INT _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv409) = Obj.magic _menhir_stack in
                let (_v : (
# 14 "imp_parser.mly"
       (int)
# 2336 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv407) = Obj.magic _menhir_stack in
                let ((_1 : (
# 14 "imp_parser.mly"
       (int)
# 2344 "imp_parser.ml"
                )) : (
# 14 "imp_parser.mly"
       (int)
# 2348 "imp_parser.ml"
                )) = _v in
                ((let _v : 'tv_typ_const = 
# 119 "imp_parser.mly"
        ( (Imp.Typ_Z,Imp.Tkn_Z _1) )
# 2353 "imp_parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv405) = _menhir_stack in
                let (_v : 'tv_typ_const) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv403 * _menhir_state) * _menhir_state * 'tv_typ)) * 'tv_typ_const) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | R_BLK ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv399 * _menhir_state) * _menhir_state * 'tv_typ)) * 'tv_typ_const) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv397 * _menhir_state) * _menhir_state * 'tv_typ)) * 'tv_typ_const) = Obj.magic _menhir_stack in
                    ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)), (_4 : 'tv_typ_const)) = _menhir_stack in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : 'tv_typ = 
# 110 "imp_parser.mly"
                                   ( Imp.DepTyp (_4,_2) )
# 2377 "imp_parser.ml"
                     in
                    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)) : 'freshtv400)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ((('freshtv401 * _menhir_state) * _menhir_state * 'tv_typ)) * 'tv_typ_const) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv402)) : 'freshtv404)) : 'freshtv406)) : 'freshtv408)) : 'freshtv410)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv411 * _menhir_state) * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv412)) : 'freshtv414)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv415 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv416)) : 'freshtv418)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | IO ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | CLN | DEF | EOF | R_RCD | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv419 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_typ_top = 
# 102 "imp_parser.mly"
            ( _2 )
# 2419 "imp_parser.ml"
             in
            _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv421 * _menhir_state) * _menhir_state * 'tv_typ) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv422)) : 'freshtv424)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv327 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv325 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState68 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv323 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 245 "imp_parser.mly"
                    ( Imp.Agl _2 )
# 2456 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)) : 'freshtv326)
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv328)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv331 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv329 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 251 "imp_parser.mly"
                ( Imp.Prj (_1,_3) )
# 2481 "imp_parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv330)) : 'freshtv332)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv335 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | AGL | AGL_END | ARR | ARR_END | ARR_STT | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | PLS | ROT _ | R_BLK | R_PRN | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv333 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 247 "imp_parser.mly"
                ( Imp.Plus (_1,_3) )
# 2504 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv334)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv336)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv339 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | AGL | AGL_END | ARR | ARR_END | ARR_STT | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | MLT | PLS | ROT _ | R_BLK | R_PRN | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv337 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 248 "imp_parser.mly"
                ( Imp.Mult (_1,_3) )
# 2529 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv340)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv343 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | AGL | AGL_END | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | MLT | PLS | ROT _ | R_BLK | R_PRN | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv341 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 250 "imp_parser.mly"
                ( Imp.App (_1,_3) )
# 2552 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77) : 'freshtv344)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv349 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2564 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | PLS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | R_BLK ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv347 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2582 "imp_parser.ml"
            ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState79 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv345 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2590 "imp_parser.ml"
            ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2596 "imp_parser.ml"
            ))), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2604 "imp_parser.ml"
            ) = 
# 91 "imp_parser.mly"
                              ( Imp.DepPlc (_4,_2) )
# 2608 "imp_parser.ml"
             in
            _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)) : 'freshtv348)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv350)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv351 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | PLS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | SPL ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) MenhirState92
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92) : 'freshtv352)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv355 * _menhir_state * (
# 13 "imp_parser.mly"
       (string)
# 2642 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | MCR _v ->
            _menhir_run94 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | PLS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv353 * _menhir_state * (
# 13 "imp_parser.mly"
       (string)
# 2662 "imp_parser.ml"
            ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 13 "imp_parser.mly"
       (string)
# 2667 "imp_parser.ml"
            ))), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_macros = 
# 210 "imp_parser.mly"
                 ( )
# 2673 "imp_parser.ml"
             in
            _menhir_goto_macros _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv356)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv357 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | PLS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | SPL ->
            _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            _menhir_reduce47 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101) : 'freshtv358)
    | MenhirState41 | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv361 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | PLS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState106
        | AGL | ARR | ARR_END | ARR_STT | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv359 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 241 "imp_parser.mly"
                 ( _1@[_2] )
# 2723 "imp_parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv362)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv367 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | PLS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv365 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState116 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv363 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 249 "imp_parser.mly"
                    ( _2 )
# 2758 "imp_parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)) : 'freshtv366)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv368)
    | MenhirState34 | MenhirState38 | MenhirState120 | MenhirState130 | MenhirState123 | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | APP ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | MLT ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | PLS ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | PRJ ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState128
        | ARR | ARR_END | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv369 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_h_frm = 
# 231 "imp_parser.mly"
        ( Imp.Opr { src=Imp.Plc_Top; dst=Imp.Plc_Top; opr=_1} )
# 2786 "imp_parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState128) : 'freshtv372)
    | _ ->
        _menhir_fail ()

and _menhir_reduce32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 240 "imp_parser.mly"
    ( [] )
# 2801 "imp_parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_const : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_const -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_const) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv319) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_const) : 'tv_const) = _v in
    ((let _v : 'tv_exp = 
# 246 "imp_parser.mly"
          ( _1 )
# 2818 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)) : 'freshtv322)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_goto_plcs : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2831 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv317 * _menhir_state * (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2839 "imp_parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | L_RCD ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | N ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | TEST ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | Z ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | CLN | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv315 * _menhir_state * (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2861 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 2866 "imp_parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2871 "imp_parser.ml"
        ) = 
# 82 "imp_parser.mly"
         ( Imp.Plc_Rcd _1 )
# 2875 "imp_parser.ml"
         in
        _menhir_goto_plc_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv316)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv318)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv313) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2893 "imp_parser.ml"
    ) = 
# 92 "imp_parser.mly"
      ( Imp.Plc_Z )
# 2897 "imp_parser.ml"
     in
    _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | L_RCD ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | N ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | TEST ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | Z ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv311) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 2934 "imp_parser.ml"
    ) = 
# 93 "imp_parser.mly"
      ( Imp.Plc_Name "ℕ" )
# 2938 "imp_parser.ml"
     in
    _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv312)

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | FOR_ALL | L_RCD | N | NAM _ | R_RCD | TEST | Z ->
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 13 "imp_parser.mly"
       (string)
# 2969 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLH ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv303 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 2980 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FOR_ALL ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | L_RCD ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | N ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | NAM _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | TEST ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | Z ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv304)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv305 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 3008 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv306)) : 'freshtv308)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_gl_etr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (((('freshtv301) * (
# 13 "imp_parser.mly"
       (string)
# 3032 "imp_parser.ml"
    ))) * _menhir_state * 'tv_flow_lst) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | MDL_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv297) * (
# 13 "imp_parser.mly"
       (string)
# 3042 "imp_parser.ml"
        ))) * _menhir_state * 'tv_flow_lst) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv295) * (
# 13 "imp_parser.mly"
       (string)
# 3048 "imp_parser.ml"
        ))) * _menhir_state * 'tv_flow_lst) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, (_2 : (
# 13 "imp_parser.mly"
       (string)
# 3053 "imp_parser.ml"
        ))), _, (_4 : 'tv_flow_lst)), _, (_5 : 'tv_gl_etr_lst)) = _menhir_stack in
        let _6 = () in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_mdl = 
# 47 "imp_parser.mly"
                                            ()
# 3061 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293) = _menhir_stack in
        let (_v : 'tv_def_mdl) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
        let (_v : 'tv_def_mdl) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289) = Obj.magic _menhir_stack in
        let ((_1 : 'tv_def_mdl) : 'tv_def_mdl) = _v in
        ((let _v : (
# 28 "imp_parser.mly"
      (unit)
# 3075 "imp_parser.ml"
        ) = 
# 44 "imp_parser.mly"
            ()
# 3079 "imp_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287) = _menhir_stack in
        let (_v : (
# 28 "imp_parser.mly"
      (unit)
# 3086 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285) = Obj.magic _menhir_stack in
        let (_v : (
# 28 "imp_parser.mly"
      (unit)
# 3093 "imp_parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
        let ((_1 : (
# 28 "imp_parser.mly"
      (unit)
# 3100 "imp_parser.ml"
        )) : (
# 28 "imp_parser.mly"
      (unit)
# 3104 "imp_parser.ml"
        )) = _v in
        (Obj.magic _1 : 'freshtv284)) : 'freshtv286)) : 'freshtv288)) : 'freshtv290)) : 'freshtv292)) : 'freshtv294)) : 'freshtv296)) : 'freshtv298)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv299) * (
# 13 "imp_parser.mly"
       (string)
# 3114 "imp_parser.ml"
        ))) * _menhir_state * 'tv_flow_lst) * _menhir_state * 'tv_gl_etr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv300)) : 'freshtv302)

and _menhir_run148 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | CLN | FOR_ALL | L_RCD | N | NAM _ | TEST | Z ->
        _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack) MenhirState148
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState148

and _menhir_run153 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState153
    | CLN | FOR_ALL | L_RCD | N | NAM _ | TEST | Z ->
        _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack) MenhirState153
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153

and _menhir_goto_plc_ept : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_plc_ept -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_plc_ept) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | D_EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState90 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | ARR_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | GL_NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | INT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | L_PRN ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | L_RCD ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | MCR _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | ROT _v ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv278)
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState90 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | ARR_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | GL_NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
        | INT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
        | L_PRN ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | L_RCD ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | MCR _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
        | ROT _v ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv280)
    | AGL | ARR | ARR_END | ARR_STT | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
        _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) MenhirState90
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv282)

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv275 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 3227 "imp_parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv271 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 3237 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | CNN ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | AGL | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
            _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv272)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv273 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 3259 "imp_parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)) : 'freshtv276)

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | L_RCD ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | N ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
    | TEST ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState10
    | CLN | DEF | EOF | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typ_top = 
# 101 "imp_parser.mly"
         ( Imp.Typ_Rcd _1 )
# 3291 "imp_parser.ml"
         in
        _menhir_goto_typ_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv270)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 111 "imp_parser.mly"
      ( Imp.Typ_Z )
# 3309 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | L_RCD ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | N ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | TEST ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "imp_parser.mly"
       (string)
# 3339 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv263) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 13 "imp_parser.mly"
       (string)
# 3349 "imp_parser.ml"
    )) : (
# 13 "imp_parser.mly"
       (string)
# 3353 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_name = 
# 121 "imp_parser.mly"
        ( _1 )
# 3358 "imp_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv261) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_name) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState4 | MenhirState6 | MenhirState10 | MenhirState13 | MenhirState18 | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
        let _v : 'tv_typ = 
# 115 "imp_parser.mly"
         ( Imp.Typ_Val _1 )
# 3375 "imp_parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv246)) : 'freshtv248)
    | MenhirState47 | MenhirState49 | MenhirState52 | MenhirState55 | MenhirState60 | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv249 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
        let _v : (
# 30 "imp_parser.mly"
      (Imp.plc)
# 3387 "imp_parser.ml"
        ) = 
# 96 "imp_parser.mly"
         ( Imp.Plc_Val _1 )
# 3391 "imp_parser.ml"
         in
        _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv250)) : 'freshtv252)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv255 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | DTA | END_FLW_LST | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv253 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_name)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_prd = 
# 78 "imp_parser.mly"
                          ( [(_4,_2)] )
# 3411 "imp_parser.ml"
             in
            _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv254)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151) : 'freshtv256)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv259 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState156
        | DTA | END_FLW_LST | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv257 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_typ_top)), _, (_4 : 'tv_name)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 74 "imp_parser.mly"
                             ( [(_4,_2)] )
# 3435 "imp_parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv258)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState156) : 'freshtv260)
    | _ ->
        _menhir_fail ()) : 'freshtv262)) : 'freshtv264)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv243) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 112 "imp_parser.mly"
      ( Imp.Typ_Name "ℕ" )
# 3455 "imp_parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv244)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | FOR_ALL | L_RCD | N | NAM _ | R_RCD | TEST | Z ->
        _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack) MenhirState9
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | VAL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 13 "imp_parser.mly"
       (string)
# 3486 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SLH ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv235 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 3497 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FOR_ALL ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | L_RCD ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | N ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | NAM _v ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
            | TEST ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | Z ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13) : 'freshtv236)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv237 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 3525 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)) : 'freshtv240)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (int)
# 3540 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv233) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (int)
# 3550 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (int)
# 3554 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 258 "imp_parser.mly"
        ( Imp.Root _1 )
# 3559 "imp_parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv234)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "imp_parser.mly"
       (string)
# 3566 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv231) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 13 "imp_parser.mly"
       (string)
# 3576 "imp_parser.ml"
    )) : (
# 13 "imp_parser.mly"
       (string)
# 3580 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 254 "imp_parser.mly"
        ( Imp.Gl_call ("%"^_1) )
# 3585 "imp_parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState37 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | ARR_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | GL_NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | INT _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | L_PRN ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | L_RCD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MCR _v ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | ROT _v ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv230)
    | AGL | ARR_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | R_RCD ->
        _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | ARR_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | GL_NAM _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | INT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | L_PRN ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | L_RCD ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | MCR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | ROT _v ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "imp_parser.mly"
       (int)
# 3660 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 14 "imp_parser.mly"
       (int)
# 3670 "imp_parser.ml"
    )) : (
# 14 "imp_parser.mly"
       (int)
# 3674 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 257 "imp_parser.mly"
        ( Imp.Opr_Z _1 )
# 3679 "imp_parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv228)

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "imp_parser.mly"
       (string)
# 3686 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 13 "imp_parser.mly"
       (string)
# 3696 "imp_parser.ml"
    )) : (
# 13 "imp_parser.mly"
       (string)
# 3700 "imp_parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 259 "imp_parser.mly"
            ( Imp.Gl_call _1 )
# 3705 "imp_parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv226)

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | CNN ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | AGL | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
        _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | ARR_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | GL_NAM _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | INT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | L_PRN ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | L_RCD ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | MCR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | ROT _v ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_reduce64 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 3758 "imp_parser.ml"
    ) = 
# 86 "imp_parser.mly"
    ( [] )
# 3762 "imp_parser.ml"
     in
    _menhir_goto_plcs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | L_RCD ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | N ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | TEST ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | Z ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_goto_flow_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_flow_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv219) * (
# 13 "imp_parser.mly"
       (string)
# 3798 "imp_parser.ml"
        ))) * _menhir_state * 'tv_flow_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END_GL_ETR_LST ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState176 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv211) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            ((let _1 = () in
            let _v : 'tv_gl_etr_lst = 
# 54 "imp_parser.mly"
                    ()
# 3815 "imp_parser.ml"
             in
            _menhir_goto_gl_etr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv212)) : 'freshtv214)
        | LCE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv217) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState176 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv215 * _menhir_state) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)) : 'freshtv218)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState176) : 'freshtv220)
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state * 'tv_def_plc) * _menhir_state * 'tv_flow_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221 * _menhir_state * 'tv_def_plc) * _menhir_state * 'tv_flow_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_def_plc)), _, (_2 : 'tv_flow_lst)) = _menhir_stack in
        let _v : 'tv_flow_lst = 
# 51 "imp_parser.mly"
                      ()
# 3848 "imp_parser.ml"
         in
        _menhir_goto_flow_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv222)) : 'freshtv224)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_name : _menhir_env -> 'ttv_tail -> 'tv_def_name -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv209 * _menhir_state) * 'tv_def_name) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQV ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state) * 'tv_def_name) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | PRD ->
            _menhir_run148 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv206)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state) * 'tv_def_name) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)) : 'freshtv210)

and _menhir_reduce60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_plc_ept = 
# 214 "imp_parser.mly"
     ( Imp.Plc_Top )
# 3889 "imp_parser.ml"
     in
    _menhir_goto_plc_ept _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail * _menhir_state -> (
# 13 "imp_parser.mly"
       (string)
# 3896 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv199) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EXP ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | FOR_ALL | L_RCD | N | NAM _ | SRC | TEST | Z ->
            _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack) MenhirState3
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv200)
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
        ((let _v : 'tv_typ_def = 
# 136 "imp_parser.mly"
    ( (Imp.Typ_Top,Imp.Typ_Top) )
# 3923 "imp_parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv202)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 3933 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)

and _menhir_reduce85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 105 "imp_parser.mly"
    ( [] )
# 3943 "imp_parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FOR_ALL ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | L_RCD ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | N ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | NAM _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | TEST ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_run34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | ARR_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | GL_NAM _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | INT _v ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | L_PRN ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | L_RCD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | MCR _v ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | ROT _v ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 29 "imp_parser.mly"
      (Imp.buffer)
# 4000 "imp_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv197) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 29 "imp_parser.mly"
      (Imp.buffer)
# 4009 "imp_parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv195) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 29 "imp_parser.mly"
      (Imp.buffer)
# 4017 "imp_parser.ml"
    )) : (
# 29 "imp_parser.mly"
      (Imp.buffer)
# 4021 "imp_parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv196)) : 'freshtv198)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CLN | FOR_ALL | L_RCD | N | NAM _ | TEST | Z ->
        _menhir_reduce64 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState183 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState176 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv59) * (
# 13 "imp_parser.mly"
       (string)
# 4053 "imp_parser.ml"
        ))) * _menhir_state * 'tv_flow_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv61) * (
# 13 "imp_parser.mly"
       (string)
# 4062 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv62)
    | MenhirState156 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv63 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState155 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv65 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState153 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState151 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv69 * _menhir_state) * _menhir_state * 'tv_typ_top)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState150 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71 * _menhir_state) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState148 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv75 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv77 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 4105 "imp_parser.ml"
        ))) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 4114 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState130 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv82)
    | MenhirState128 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState125 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv85) * _menhir_state * 'tv_vh_frm)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv88)
    | MenhirState120 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * 'tv_vh_frm_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv94)
    | MenhirState107 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv96)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv97 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv101 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv105 * _menhir_state * (
# 13 "imp_parser.mly"
       (string)
# 4179 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState95 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state * (
# 13 "imp_parser.mly"
       (string)
# 4188 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState93 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState92 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv111 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * 'tv_plc_ept) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv117) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv120)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv121 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 4226 "imp_parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState77 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState74 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv131 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv133 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv141 * _menhir_state) * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 4280 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 4289 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv145 * _menhir_state * (
# 30 "imp_parser.mly"
      (Imp.plc)
# 4298 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv147 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 4307 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149 * _menhir_state * (
# 31 "imp_parser.mly"
      (Imp.plc list)
# 4316 "imp_parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv155 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv167 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv169 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv173 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 4380 "imp_parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175) * _menhir_state * 'tv_typ_top)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv179 * _menhir_state * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv181 * _menhir_state) * (
# 13 "imp_parser.mly"
       (string)
# 4404 "imp_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState9 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv192)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv194)

and _menhir_run175 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv55) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_flow_lst = 
# 50 "imp_parser.mly"
                ()
# 4447 "imp_parser.ml"
     in
    _menhir_goto_flow_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv56)

and _menhir_run142 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NAM _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
        let (_v : (
# 13 "imp_parser.mly"
       (string)
# 4463 "imp_parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_APP ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv45 * (
# 13 "imp_parser.mly"
       (string)
# 4474 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv41 * (
# 13 "imp_parser.mly"
       (string)
# 4484 "imp_parser.ml"
                ))) = Obj.magic _menhir_stack in
                let (_v : (
# 13 "imp_parser.mly"
       (string)
# 4489 "imp_parser.ml"
                )) = _v in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv39 * (
# 13 "imp_parser.mly"
       (string)
# 4496 "imp_parser.ml"
                ))) = Obj.magic _menhir_stack in
                let ((_3 : (
# 13 "imp_parser.mly"
       (string)
# 4501 "imp_parser.ml"
                )) : (
# 13 "imp_parser.mly"
       (string)
# 4505 "imp_parser.ml"
                )) = _v in
                ((let (_menhir_stack, (_1 : (
# 13 "imp_parser.mly"
       (string)
# 4510 "imp_parser.ml"
                ))) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_def_name = 
# 71 "imp_parser.mly"
                  ( ([_1],_3) )
# 4516 "imp_parser.ml"
                 in
                _menhir_goto_def_name _menhir_env _menhir_stack _v) : 'freshtv40)) : 'freshtv42)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv43 * (
# 13 "imp_parser.mly"
       (string)
# 4526 "imp_parser.ml"
                ))) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv44)) : 'freshtv46)
        | EQV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv47 * (
# 13 "imp_parser.mly"
       (string)
# 4534 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, (_1 : (
# 13 "imp_parser.mly"
       (string)
# 4539 "imp_parser.ml"
            ))) = _menhir_stack in
            let _v : 'tv_def_name = 
# 70 "imp_parser.mly"
         ( ([],_1) )
# 4544 "imp_parser.ml"
             in
            _menhir_goto_def_name _menhir_env _menhir_stack _v) : 'freshtv48)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv49 * (
# 13 "imp_parser.mly"
       (string)
# 4554 "imp_parser.ml"
            )) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv50)) : 'freshtv52)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)

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
# 29 "imp_parser.mly"
      (Imp.buffer)
# 4590 "imp_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv37) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState0
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
# 29 "imp_parser.mly"
      (Imp.buffer)
# 4620 "imp_parser.ml"
            ) = 
# 41 "imp_parser.mly"
                ( Imp.End )
# 4624 "imp_parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv16)) : 'freshtv18)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)
    | CNN ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DTA ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LCE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv27 * _menhir_state)) = Obj.magic _menhir_stack in
                let (_v : (
# 13 "imp_parser.mly"
       (string)
# 4658 "imp_parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CLN ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv23 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 4669 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | EXP ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | FOR_ALL | L_RCD | N | NAM _ | SRC | TEST | Z ->
                        _menhir_reduce85 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv24)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv25 * _menhir_state)) * (
# 13 "imp_parser.mly"
       (string)
# 4689 "imp_parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)) : 'freshtv28)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv29 * _menhir_state)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)) : 'freshtv32)
        | NAM _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)) : 'freshtv36)
    | AGL | ARR_STT | D_EXP | EOF | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
        _menhir_reduce60 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv38))

and file : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 28 "imp_parser.mly"
      (unit)
# 4719 "imp_parser.ml"
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
# 13 "imp_parser.mly"
       (string)
# 4740 "imp_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DEF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv1) * (
# 13 "imp_parser.mly"
       (string)
# 4751 "imp_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | DTA ->
                    _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState174
                | END_FLW_LST ->
                    _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState174
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174) : 'freshtv2)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv3) * (
# 13 "imp_parser.mly"
       (string)
# 4771 "imp_parser.ml"
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
  

# 4790 "imp_parser.ml"
