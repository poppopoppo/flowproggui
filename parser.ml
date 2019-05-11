
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | TEST
    | STT_CLN
    | SRC
    | SPL
    | R_RCD
    | R_PRN
    | R_APP
    | ROT of (
# 13 "parser.mly"
       (int)
# 19 "parser.ml"
  )
    | PRD_STT
    | PRD
    | PLS
    | NAM of (
# 12 "parser.mly"
       (string)
# 27 "parser.ml"
  )
    | M_CNN
    | MLT
    | MCR of (
# 12 "parser.mly"
       (string)
# 34 "parser.ml"
  )
    | L_RCD
    | L_PRN
    | L_PRJ
    | L_APP
    | LCE
    | INT of (
# 13 "parser.mly"
       (int)
# 44 "parser.ml"
  )
    | GL_NAM of (
# 12 "parser.mly"
       (string)
# 49 "parser.ml"
  )
    | F_ALL
    | EXP
    | EQV
    | EOF
    | END_PRD
    | END_CO_PRD
    | D_EXP
    | DTA
    | DOT
    | DEF
    | CO_PRD_STT
    | CO_PRD
    | CNN
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
  | MenhirState122
  | MenhirState121
  | MenhirState119
  | MenhirState117
  | MenhirState116
  | MenhirState114
  | MenhirState113
  | MenhirState106
  | MenhirState104
  | MenhirState96
  | MenhirState94
  | MenhirState91
  | MenhirState89
  | MenhirState86
  | MenhirState82
  | MenhirState76
  | MenhirState73
  | MenhirState72
  | MenhirState70
  | MenhirState67
  | MenhirState66
  | MenhirState62
  | MenhirState61
  | MenhirState59
  | MenhirState58
  | MenhirState57
  | MenhirState56
  | MenhirState55
  | MenhirState53
  | MenhirState52
  | MenhirState49
  | MenhirState48
  | MenhirState47
  | MenhirState46
  | MenhirState45
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState41
  | MenhirState40
  | MenhirState38
  | MenhirState35
  | MenhirState31
  | MenhirState30
  | MenhirState26
  | MenhirState25
  | MenhirState24
  | MenhirState23
  | MenhirState22
  | MenhirState19
  | MenhirState18
  | MenhirState15
  | MenhirState8
  | MenhirState7
  | MenhirState4
  | MenhirState3
  | MenhirState0

# 1 "parser.mly"
  
open Flow

# 150 "parser.ml"

let rec _menhir_goto_coprd_tail : _menhir_env -> 'ttv_tail -> 'tv_coprd_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv537) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv531 * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | CNN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | AGL | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
            _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv532)
    | END_CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv533) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | CNN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | AGL | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
            _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv534)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv535) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv536)) : 'freshtv538)

and _menhir_goto_tail_code : _menhir_env -> 'ttv_tail -> 'tv_tail_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv529 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail_code) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv527 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail_code) : 'tv_tail_code) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
    let _v : 'tv_vh_frm_code = 
# 129 "parser.mly"
    (
      match _2 with
      | None -> _1
      | Some t -> Exp.Seq (_1,t)
    )
# 216 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv525) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_code) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv481) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv479) = Obj.magic _menhir_stack in
        ((let _v : 'tv_coprd_tail = 
# 146 "parser.mly"
    ( [] )
# 232 "parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv480)) : 'freshtv482)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv491) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv489) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _, (_2 : 'tv_vh_frm_code)), (_3 : 'tv_coprd_tail)), _, (_5 : 'tv_vh_frm_code)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_coprd = 
# 142 "parser.mly"
    ( Some (Exp.CoPrd ([_2]@_3@[_5])) )
# 246 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv487) = _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv485) = Obj.magic _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv483) = Obj.magic _menhir_stack in
        let ((_1 : 'tv_coprd) : 'tv_coprd) = _v in
        ((let _v : 'tv_tail_code = 
# 138 "parser.mly"
          ( _1 )
# 260 "parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv484)) : 'freshtv486)) : 'freshtv488)) : 'freshtv490)) : 'freshtv492)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv495 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv493 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : 'tv_coprd_tail)), _, (_3 : 'tv_vh_frm_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_coprd_tail = 
# 147 "parser.mly"
                                  ( _1@[_3] )
# 273 "parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv494)) : 'freshtv496)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv499) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv497) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm_code)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail_code = 
# 137 "parser.mly"
                    ( Some _2 )
# 286 "parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv498)) : 'freshtv500)
    | MenhirState18 | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv523 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv521 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_code)) = _menhir_stack in
        let _v : 'tv_lc_code = 
# 87 "parser.mly"
                ( _1 )
# 298 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv519) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((match _menhir_s with
        | MenhirState30 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv503 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_code) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv501 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_lc_code) : 'tv_lc_code) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp = 
# 206 "parser.mly"
                    ( Exp.IO _2 )
# 319 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv502)) : 'freshtv504)
        | MenhirState18 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv517 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 327 "parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_code) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv515 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 335 "parser.ml"
            )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_5 : 'tv_lc_code) : 'tv_lc_code) = _v in
            ((let (((_menhir_stack, _menhir_s), (_2 : (
# 12 "parser.mly"
       (string)
# 342 "parser.ml"
            ))), (_3 : 'tv_typ_def)) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : 'tv_glb_etr = 
# 76 "parser.mly"
                                (
    let (src,dst) = _3 in
    Glb_St.Gl_Etr {
      name=_2;
      src=src;
      dst=dst;
      code=_5
      }
    )
# 357 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv513) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_glb_etr) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv511 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv507 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv505 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_etr)) = _menhir_stack in
                let _2 = () in
                let _v : (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 379 "parser.ml"
                ) = 
# 32 "parser.mly"
                ( Flow.Buffer.Glb _1 )
# 383 "parser.ml"
                 in
                _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv506)) : 'freshtv508)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv509 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv510)) : 'freshtv512)) : 'freshtv514)) : 'freshtv516)) : 'freshtv518)
        | _ ->
            _menhir_fail ()) : 'freshtv520)) : 'freshtv522)) : 'freshtv524)
    | _ ->
        _menhir_fail ()) : 'freshtv526)) : 'freshtv528)) : 'freshtv530)

and _menhir_run86 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | L_RCD ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState86
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86

and _menhir_goto_vh_frm_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState18 | MenhirState76 | MenhirState73 | MenhirState38 | MenhirState35 | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv469 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv459) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | CNN ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | AGL | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
                _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76) : 'freshtv460)
        | ARR_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv463) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv461) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_tail_code = 
# 136 "parser.mly"
            ( None )
# 462 "parser.ml"
             in
            _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv462)) : 'freshtv464)
        | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv465) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ACT ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | CNN ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | AGL | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
                _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv466)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv467 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv468)) : 'freshtv470)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv473 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv471 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 504 "parser.ml"
            ) = 
# 31 "parser.mly"
                   ( Flow.Buffer.Evo _1 )
# 508 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv472)) : 'freshtv474)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv475 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv476)) : 'freshtv478)
    | _ ->
        _menhir_fail ()

and _menhir_goto_vh_frm_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv451 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv447 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv445 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_h_frm = 
# 184 "parser.mly"
                                ( Exp.Canon _3 )
# 546 "parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)) : 'freshtv448)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv449 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv450)) : 'freshtv452)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv457 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv453 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_vh_frm_top = 
# 150 "parser.mly"
                    ( Exp.Canon _2 )
# 572 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv454)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv455 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv456)) : 'freshtv458)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv443 * _menhir_state * 'tv_plc_ept) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_exp_top) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv441 * _menhir_state * 'tv_plc_ept) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_exp_top) : 'tv_exp_top) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_plc_ept)) = _menhir_stack in
    let _v : 'tv_vh_frm_top = 
# 151 "parser.mly"
                    ( Exp.Exp (_1,_2) )
# 599 "parser.ml"
     in
    _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)) : 'freshtv444)

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv439 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv437 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail) : 'tv_tail) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_h_frm)) = _menhir_stack in
    let _v : 'tv_vh_frm = 
# 176 "parser.mly"
    (
      match _2 with
      | None -> _1
      | Some t -> Exp.Seq (_1,t)
    )
# 619 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv435) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv411 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv409 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_lst)), _, (_3 : 'tv_vh_frm)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_vh_frm_lst = 
# 172 "parser.mly"
                            ( _1@[_3] )
# 637 "parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv410)) : 'freshtv412)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv417) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv413) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | APP ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | ARR_STT ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | GL_NAM _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
            | INT _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
            | L_PRN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | L_RCD ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState91
            | MCR _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
            | ROT _v ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91) : 'freshtv414)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv415) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv416)) : 'freshtv418)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv425) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END_CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv421) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv419) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _, (_2 : 'tv_vh_frm)), _, (_4 : 'tv_vh_frm)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_tail = 
# 189 "parser.mly"
                                                ( Some (Exp.CoPrd [_2;_4]) )
# 700 "parser.ml"
             in
            _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv420)) : 'freshtv422)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv423) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv424)) : 'freshtv426)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv429) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv427) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 188 "parser.mly"
               ( Some _2 )
# 720 "parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv428)) : 'freshtv430)
    | MenhirState19 | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv433 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv431 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm)) = _menhir_stack in
        let _v : 'tv_vh_frm_lst = 
# 171 "parser.mly"
            ( [_1] )
# 732 "parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)) : 'freshtv434)
    | _ ->
        _menhir_fail ()) : 'freshtv436)) : 'freshtv438)) : 'freshtv440)

and _menhir_goto_macro : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_macro -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv399 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv397 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_macro) : 'tv_macro) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_exp_top = 
# 155 "parser.mly"
                  ( _2 )
# 755 "parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)) : 'freshtv400)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv401 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_macro) : 'tv_macro) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_exp_top = 
# 156 "parser.mly"
                    ( Flow.Exp.L_App (_2,Flow.Exp.Root 0) )
# 772 "parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv402)) : 'freshtv404)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv407 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macro) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv405 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_macro) : 'tv_macro) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
        let _v : 'tv_exp_top = 
# 154 "parser.mly"
                  ( Exp.Rcd _1 )
# 788 "parser.ml"
         in
        _menhir_goto_exp_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv406)) : 'freshtv408)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_plc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_plc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv395 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv391 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_plc)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 812 "parser.ml"
        ) = 
# 37 "parser.mly"
                ( _1 )
# 816 "parser.ml"
         in
        _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)) : 'freshtv392)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv393 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)) : 'freshtv396)

and _menhir_goto_h_frm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv387 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv377) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | ARR_STT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | GL_NAM _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | L_PRN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | L_RCD ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | MCR _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | ROT _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96) : 'freshtv378)
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv381) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv379) = Obj.magic _menhir_stack in
        ((let _1 = () in
        let _v : 'tv_tail = 
# 187 "parser.mly"
            ( None )
# 873 "parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv380)) : 'freshtv382)
    | CO_PRD_STT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | ARR_STT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | GL_NAM _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
        | L_PRN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | L_RCD ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | MCR _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
        | ROT _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89) : 'freshtv384)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv385 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv386)) : 'freshtv388)

and _menhir_goto_macros : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_macros -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv371 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 920 "parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macros) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv369 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 928 "parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_macros) : 'tv_macros) = _v in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 12 "parser.mly"
       (string)
# 935 "parser.ml"
        ))), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_macros = 
# 164 "parser.mly"
                       ( )
# 941 "parser.ml"
         in
        _menhir_goto_macros _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)) : 'freshtv372)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv375 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_macros) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_macros) : 'tv_macros) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_macro = 
# 160 "parser.mly"
                ( )
# 958 "parser.ml"
         in
        _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)) : 'freshtv376)
    | _ ->
        _menhir_fail ()

and _menhir_run60 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 967 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv365 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 979 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | ARR_STT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | GL_NAM _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | L_PRN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | L_RCD ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | MCR _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | ROT _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61) : 'freshtv366)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 1013 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv368)

and _menhir_reduce41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_macro = 
# 159 "parser.mly"
    ( )
# 1023 "parser.ml"
     in
    _menhir_goto_macro _menhir_env _menhir_stack _menhir_s _v

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | MCR _v ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59

and _menhir_run45 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | L_RCD ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run47 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | L_RCD ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | L_RCD ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run52 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | L_RCD ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState22 | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv361 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | ARR_STT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | GL_NAM _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | L_PRN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | L_RCD ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | MCR _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | ROT _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv359 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState26 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv357 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 205 "parser.mly"
                        ( Exp.Rcd _2 )
# 1198 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)) : 'freshtv360)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv362)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv363 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | ARR_STT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | GL_NAM _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | L_PRN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | L_RCD ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MCR _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | ROT _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | SPL ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            _menhir_reduce41 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv364)
    | _ ->
        _menhir_fail ()

and _menhir_goto_plc_top : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1243 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv305 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1253 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv301 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1263 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv299 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1270 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1275 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1282 "parser.ml"
            ) = 
# 67 "parser.mly"
                        ( _2 )
# 1286 "parser.ml"
             in
            _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv300)) : 'freshtv302)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv303 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1296 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv304)) : 'freshtv306)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv311) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1305 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv307) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1315 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | DEF | L_RCD | NAM _ | Z ->
                _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15) : 'freshtv308)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv309) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1335 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv310)) : 'freshtv312)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv315) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1344 "parser.ml"
        ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1348 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv313) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1354 "parser.ml"
        ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1358 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _, (_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1363 "parser.ml"
        ))), _, (_4 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1367 "parser.ml"
        ))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_typ_def = 
# 91 "parser.mly"
                            ( (_2,_4) )
# 1374 "parser.ml"
         in
        _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv314)) : 'freshtv316)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv323 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1382 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv319 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1392 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv317 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1399 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1404 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_plc_ept = 
# 168 "parser.mly"
                    ( _2 )
# 1411 "parser.ml"
             in
            _menhir_goto_plc_ept _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)) : 'freshtv320)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv321 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1421 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv322)) : 'freshtv324)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv329 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 1430 "parser.ml"
        ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1434 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv325 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 1444 "parser.ml"
            ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1448 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXP ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | EOF | L_RCD | NAM _ | Z ->
                _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) MenhirState106
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106) : 'freshtv326)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv327 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 1468 "parser.ml"
            ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1472 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv328)) : 'freshtv330)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv343 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 1481 "parser.ml"
        ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1485 "parser.ml"
        ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1489 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv341 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 1495 "parser.ml"
        ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1499 "parser.ml"
        ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1503 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), (_3 : (
# 12 "parser.mly"
       (string)
# 1508 "parser.ml"
        ))), _, (_5 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1512 "parser.ml"
        ))), _, (_7 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1516 "parser.ml"
        ))) = _menhir_stack in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_glb_mode = 
# 72 "parser.mly"
                                        ( (_3,_5,_7) )
# 1525 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv339) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_mode) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv333 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv331 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_mode)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 1547 "parser.ml"
            ) = 
# 33 "parser.mly"
                 (
      let (n,s,d) = _1 in
      (Flow.Buffer.Glb_mode { name=n; src=s; dst=d })
         )
# 1554 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)) : 'freshtv334)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv335 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv336)) : 'freshtv338)) : 'freshtv340)) : 'freshtv342)) : 'freshtv344)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv349 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1569 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv345 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1579 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv346)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv347 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1597 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)) : 'freshtv350)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv355 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1606 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv351 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1616 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState121 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState121) : 'freshtv352)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv353 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1634 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv354)) : 'freshtv356)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv293 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1654 "parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv291 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1662 "parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1669 "parser.ml"
        ))), _, (_4 : 'tv_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 50 "parser.mly"
                                       ( (_4,_2)::_5 )
# 1676 "parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv292)) : 'freshtv294)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv297 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv295 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_def_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_plc = 
# 41 "parser.mly"
                                ( Flow.Buffer.Def (Data.CoPrd { name=_2; cns=_4 }) )
# 1694 "parser.ml"
         in
        _menhir_goto_def_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)) : 'freshtv298)
    | _ ->
        _menhir_fail ()

and _menhir_goto_def_prd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_prd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv285 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1708 "parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv283 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1716 "parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1723 "parser.ml"
        ))), _, (_4 : 'tv_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_prd = 
# 54 "parser.mly"
                                  ( (_4,_2)::_5 )
# 1730 "parser.ml"
         in
        _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv284)) : 'freshtv286)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv289 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv287 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_prd) : 'tv_def_prd) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_def_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_plc = 
# 42 "parser.mly"
                              ( Flow.Buffer.Def (Data.Prd { name=_2; cns=_4 }) )
# 1748 "parser.ml"
         in
        _menhir_goto_def_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv288)) : 'freshtv290)
    | _ ->
        _menhir_fail ()

and _menhir_goto_plc : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1757 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277 * _menhir_state * (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 1766 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1772 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state * (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 1778 "parser.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1784 "parser.ml"
        )) : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1788 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 1793 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 1798 "parser.ml"
        ) = 
# 62 "parser.mly"
             ( _1@[_2] )
# 1802 "parser.ml"
         in
        _menhir_goto_plcs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv276)) : 'freshtv278)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1812 "parser.ml"
        )) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1820 "parser.ml"
        )) : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1824 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 1831 "parser.ml"
        ) = 
# 58 "parser.mly"
            ( _2 )
# 1835 "parser.ml"
         in
        _menhir_goto_plc_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)) : 'freshtv282)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv225 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState44 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 197 "parser.mly"
                    ( Exp.Agl _2 )
# 1865 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)) : 'freshtv226)
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv228)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv231 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | AGL | AGL_END | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | PLS | ROT _ | R_PRN | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv229 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 200 "parser.mly"
                ( Exp.Plus (_1,_3) )
# 1900 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv230)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46) : 'freshtv232)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv235 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | AGL | AGL_END | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | MLT | PLS | ROT _ | R_PRN | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv233 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 201 "parser.mly"
                ( Exp.Mult (_1,_3) )
# 1925 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv234)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv236)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv239 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv237 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 204 "parser.mly"
                  ( Exp.L_Prj (_1,_3) )
# 1942 "parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv238)) : 'freshtv240)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv243 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | AGL | AGL_END | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_APP | L_PRN | L_RCD | MCR _ | MLT | PLS | ROT _ | R_PRN | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv241 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 203 "parser.mly"
                  ( Exp.L_App (_1,_3) )
# 1961 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv244)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv245 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState55 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | APP ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | ARR_STT ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | GL_NAM _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
            | INT _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
            | L_PRN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | L_RCD ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | MCR _v ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
            | ROT _v ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv246)
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55) : 'freshtv248)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv251 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | AGL | AGL_END | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | R_PRN | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv249 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 199 "parser.mly"
                    ( Exp.App (_2,_4) )
# 2039 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv250)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57) : 'freshtv252)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv253 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | SPL ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            _menhir_reduce41 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv254)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv257 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 2073 "parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | MCR _v ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv255 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 2093 "parser.ml"
            ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 12 "parser.mly"
       (string)
# 2098 "parser.ml"
            ))), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_macros = 
# 163 "parser.mly"
                 ( )
# 2104 "parser.ml"
             in
            _menhir_goto_macros _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv258)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv259 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | SPL ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            _menhir_reduce41 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv260)
    | MenhirState26 | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | AGL | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | R_RCD | SPL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv261 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 193 "parser.mly"
                 ( _1@[_2] )
# 2154 "parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv262)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72) : 'freshtv264)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv267 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState82 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv265 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 202 "parser.mly"
                    ( _2 )
# 2189 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)) : 'freshtv268)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv270)
    | MenhirState19 | MenhirState23 | MenhirState86 | MenhirState96 | MenhirState89 | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | L_PRJ ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | MLT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | PLS ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState94
        | ARR | ARR_END | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv271 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_h_frm = 
# 183 "parser.mly"
        ( Exp.Exp (Flow.Plc.Mt,_1) )
# 2217 "parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv274)
    | _ ->
        _menhir_fail ()

and _menhir_reduce31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 192 "parser.mly"
    ( [] )
# 2232 "parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_const : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_const -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_const) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_const) : 'tv_const) = _v in
    ((let _v : 'tv_exp = 
# 198 "parser.mly"
          ( _1 )
# 2249 "parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)) : 'freshtv222)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_goto_plc_ept : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_plc_ept -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_plc_ept) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | D_EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState40 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | ARR_STT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | GL_NAM _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | L_PRN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | L_RCD ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MCR _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | ROT _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv214)
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState40 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | ARR_STT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | GL_NAM _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | L_PRN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | L_RCD ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
        | MCR _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | ROT _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv216)
    | AGL | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
        _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv218)

and _menhir_goto_plcs : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 2337 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv211 * _menhir_state * (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 2345 "parser.ml"
    )) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | CLN | DEF | EOF | R_RCD | SRC ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state * (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 2361 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 2366 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2371 "parser.ml"
        ) = 
# 57 "parser.mly"
         ( Flow.Plc.Rcd _1 )
# 2375 "parser.ml"
         in
        _menhir_goto_plc_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8) : 'freshtv212)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv207) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2393 "parser.ml"
    ) = 
# 65 "parser.mly"
      ( Flow.Plc.Z )
# 2397 "parser.ml"
     in
    _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 2404 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv205) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 12 "parser.mly"
       (string)
# 2414 "parser.ml"
    )) : (
# 12 "parser.mly"
       (string)
# 2418 "parser.ml"
    )) = _v in
    ((let _v : 'tv_name = 
# 70 "parser.mly"
        ( _1 )
# 2423 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv203) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_name) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState4 | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
        let _v : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2440 "parser.ml"
        ) = 
# 66 "parser.mly"
         ( Flow.Plc.Name _1 )
# 2444 "parser.ml"
         in
        _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv192)) : 'freshtv194)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv197 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2452 "parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | PRD ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv195 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2464 "parser.ml"
            ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2469 "parser.ml"
            ))), _, (_4 : 'tv_name)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_prd = 
# 53 "parser.mly"
                          ( [(_4,_2)] )
# 2476 "parser.ml"
             in
            _menhir_goto_def_prd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv196)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv198)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv201 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2488 "parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv199 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2500 "parser.ml"
            ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2505 "parser.ml"
            ))), _, (_4 : 'tv_name)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 49 "parser.mly"
                             ( [(_4,_2)] )
# 2512 "parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv200)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv202)
    | _ ->
        _menhir_fail ()) : 'freshtv204)) : 'freshtv206)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | L_RCD | NAM _ | R_RCD | Z ->
        _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run114 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | CLN | L_RCD | NAM _ | Z ->
        _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) MenhirState114
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114

and _menhir_run119 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | CLN | L_RCD | NAM _ | Z ->
        _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) MenhirState119
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState119

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parser.mly"
       (int)
# 2570 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv189) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 13 "parser.mly"
       (int)
# 2580 "parser.ml"
    )) : (
# 13 "parser.mly"
       (int)
# 2584 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 211 "parser.mly"
        ( Exp.Root _1 )
# 2589 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv190)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 2596 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv187) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 12 "parser.mly"
       (string)
# 2606 "parser.ml"
    )) : (
# 12 "parser.mly"
       (string)
# 2610 "parser.ml"
    )) = _v in
    ((let _v : 'tv_exp = 
# 207 "parser.mly"
        ( Exp.Gl_call ("%"^_1) )
# 2615 "parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState22 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | APP ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | ARR_STT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | GL_NAM _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | L_PRN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | L_RCD ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | MCR _v ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | ROT _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv186)
    | AGL | APP | ARR_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | R_RCD ->
        _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack) MenhirState22
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
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | L_RCD ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "parser.mly"
       (int)
# 2694 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv183) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 13 "parser.mly"
       (int)
# 2704 "parser.ml"
    )) : (
# 13 "parser.mly"
       (int)
# 2708 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 210 "parser.mly"
        ( Exp.Z _1 )
# 2713 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv184)

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "parser.mly"
       (string)
# 2720 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv181) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 12 "parser.mly"
       (string)
# 2730 "parser.ml"
    )) : (
# 12 "parser.mly"
       (string)
# 2734 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 212 "parser.mly"
            ( Exp.Gl_call _1 )
# 2739 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | CNN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | AGL | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
        _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | L_RCD ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | L_RCD ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_reduce49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_plc_ept = 
# 167 "parser.mly"
     ( Flow.Plc.Mt )
# 2823 "parser.ml"
     in
    _menhir_goto_plc_ept _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv179 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2834 "parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2844 "parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACT ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | CNN ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | AGL | APP | ARR | ARR_END | ARR_STT | CO_PRD_STT | D_EXP | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
            _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18) : 'freshtv176)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv177 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 2866 "parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)) : 'freshtv180)

and _menhir_reduce53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 2876 "parser.ml"
    ) = 
# 61 "parser.mly"
    ( [] )
# 2880 "parser.ml"
     in
    _menhir_goto_plcs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | NAM _v ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | Z ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_goto_def_name : _menhir_env -> 'ttv_tail -> 'tv_def_name -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv173 * _menhir_state) * 'tv_def_name) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQV ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv169 * _menhir_state) * 'tv_def_name) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            _menhir_run119 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | PRD ->
            _menhir_run114 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv170)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * _menhir_state) * 'tv_def_name) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)) : 'freshtv174)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | APP ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | ARR_STT ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | GL_NAM _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | L_PRN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | L_RCD ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | MCR _v ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | ROT _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv55 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2968 "parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState121 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv57 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2977 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState119 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv61 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 2991 "parser.ml"
        ))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv63 * _menhir_state) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 3000 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv67 * _menhir_state) * 'tv_def_name)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState106 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv69 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 3019 "parser.ml"
        ))) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 3023 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv71 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 3032 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv74)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv77) * _menhir_state * 'tv_vh_frm)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv80)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv81 * _menhir_state * 'tv_vh_frm_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState76 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv86)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv87 * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv88)
    | MenhirState72 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv93 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3097 "parser.ml"
        ))) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state * (
# 12 "parser.mly"
       (string)
# 3106 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv107 * _menhir_state) * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv109 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv111 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv115 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv119 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_exp) * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv123 * _menhir_state * 'tv_exp) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_plc_ept) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv135) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv138)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv143 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv151 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv155 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3249 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv157) * _menhir_state * (
# 27 "parser.mly"
      (Flow.Plc.t)
# 3258 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state * (
# 28 "parser.mly"
      (Flow.Plc.t list)
# 3267 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv161 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv166)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv168)

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 3293 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv53) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 3302 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 3310 "parser.ml"
    )) : (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 3314 "parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv52)) : 'freshtv54)

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | CLN | L_RCD | NAM _ | Z ->
        _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

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

and buffer : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 3348 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv49) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ACT ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv3 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : (
# 26 "parser.mly"
      (Flow.Buffer.t)
# 3388 "parser.ml"
            ) = 
# 38 "parser.mly"
                ( Flow.Buffer.End )
# 3392 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv2)) : 'freshtv4)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv5 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv6)) : 'freshtv8)
    | CNN ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DTA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
            let (_v : (
# 12 "parser.mly"
       (string)
# 3418 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | R_APP ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv15 * (
# 12 "parser.mly"
       (string)
# 3429 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAM _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv11 * (
# 12 "parser.mly"
       (string)
# 3439 "parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let (_v : (
# 12 "parser.mly"
       (string)
# 3444 "parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv9 * (
# 12 "parser.mly"
       (string)
# 3451 "parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let ((_3 : (
# 12 "parser.mly"
       (string)
# 3456 "parser.ml"
                    )) : (
# 12 "parser.mly"
       (string)
# 3460 "parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, (_1 : (
# 12 "parser.mly"
       (string)
# 3465 "parser.ml"
                    ))) = _menhir_stack in
                    let _2 = () in
                    let _v : 'tv_def_name = 
# 46 "parser.mly"
                  ( _1 )
# 3471 "parser.ml"
                     in
                    _menhir_goto_def_name _menhir_env _menhir_stack _v) : 'freshtv10)) : 'freshtv12)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv13 * (
# 12 "parser.mly"
       (string)
# 3481 "parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv14)) : 'freshtv16)
            | EQV ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv17 * (
# 12 "parser.mly"
       (string)
# 3489 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, (_1 : (
# 12 "parser.mly"
       (string)
# 3494 "parser.ml"
                ))) = _menhir_stack in
                let _v : 'tv_def_name = 
# 45 "parser.mly"
         ( _1 )
# 3499 "parser.ml"
                 in
                _menhir_goto_def_name _menhir_env _menhir_stack _v) : 'freshtv18)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv19 * (
# 12 "parser.mly"
       (string)
# 3509 "parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv20)) : 'freshtv22)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv23 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)) : 'freshtv26)
    | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LCE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv35 * _menhir_state) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv31 * _menhir_state)) = Obj.magic _menhir_stack in
                let (_v : (
# 12 "parser.mly"
       (string)
# 3539 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CLN ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv27 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 3550 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | EXP ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                    | L_RCD | NAM _ | SRC | Z ->
                        _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) MenhirState104
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv28)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv29 * _menhir_state)) * (
# 12 "parser.mly"
       (string)
# 3570 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)) : 'freshtv32)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv33 * _menhir_state)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)) : 'freshtv36)
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 12 "parser.mly"
       (string)
# 3587 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CLN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | EXP ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | L_RCD | NAM _ | SRC | Z ->
                    _menhir_reduce53 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv38)
            | DEF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv39) = Obj.magic _menhir_stack in
                ((let _v : 'tv_typ_def = 
# 90 "parser.mly"
    ( (Flow.Plc.Mt,Flow.Plc.Mt) )
# 3613 "parser.ml"
                 in
                _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv40)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv41 * _menhir_state) * (
# 12 "parser.mly"
       (string)
# 3623 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)) : 'freshtv44)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)) : 'freshtv48)
    | AGL | APP | ARR_STT | D_EXP | EOF | EXP | GL_NAM _ | INT _ | L_PRN | L_RCD | MCR _ | ROT _ | SPL ->
        _menhir_reduce49 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv50))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 3644 "parser.ml"
