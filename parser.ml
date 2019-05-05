
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Z
    | TEST
    | STT
    | SRC
    | R_RCD
    | R_PRN
    | R_APP
    | ROT
    | PRD_STT
    | PRD
    | PLS
    | NAM of (
# 8 "parser.mly"
       (string)
# 22 "parser.ml"
  )
    | M_CNN
    | MLT
    | L_RCD
    | L_PRN
    | L_APP
    | LCE
    | INT of (
# 9 "parser.mly"
       (int)
# 33 "parser.ml"
  )
    | GL_NAM of (
# 8 "parser.mly"
       (string)
# 38 "parser.ml"
  )
    | EXP
    | EOP
    | EOF
    | END_PRD
    | END_CO_PRD
    | DOT
    | DEF
    | CO_PRD_STT
    | CO_PRD
    | CNN
    | CLQ
    | CLN
    | ARR_END
    | ARR
    | APP
    | AGL_END
    | AGL
  
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
  | MenhirState84
  | MenhirState83
  | MenhirState82
  | MenhirState81
  | MenhirState73
  | MenhirState70
  | MenhirState69
  | MenhirState67
  | MenhirState64
  | MenhirState58
  | MenhirState53
  | MenhirState51
  | MenhirState48
  | MenhirState45
  | MenhirState44
  | MenhirState43
  | MenhirState37
  | MenhirState32
  | MenhirState30
  | MenhirState28
  | MenhirState26
  | MenhirState25
  | MenhirState22
  | MenhirState20
  | MenhirState19
  | MenhirState17
  | MenhirState16
  | MenhirState12
  | MenhirState11
  | MenhirState10
  | MenhirState6
  | MenhirState3
  | MenhirState0

# 1 "parser.mly"
  
open Flow

# 111 "parser.ml"

let rec _menhir_run48 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | L_RCD ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_goto_vh_frm_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv365 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv361 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv359 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_h_frm = 
# 131 "parser.mly"
                                ( Exp.Canon _3 )
# 162 "parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)) : 'freshtv362)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv363 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)) : 'freshtv366)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv371 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv367 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_vh_frm_top = 
# 113 "parser.mly"
                    ( Exp.Canon _2 )
# 188 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv369 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv370)) : 'freshtv372)
    | _ ->
        _menhir_fail ()

and _menhir_goto_coprd_tail : _menhir_env -> 'ttv_tail -> 'tv_coprd_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv357) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv351 * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | EXP ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv352)
    | END_CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv353) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | EXP ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv354)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv355) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv356)) : 'freshtv358)

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv347 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail) : 'tv_tail) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_h_frm)) = _menhir_stack in
    let _v : 'tv_vh_frm = 
# 123 "parser.mly"
    (
      match _2 with
      | None -> _1
      | Some t -> Exp.Seq (_1,t)
    )
# 265 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv345) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv321 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv319 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_lst)), _, (_3 : 'tv_vh_frm)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_vh_frm_lst = 
# 119 "parser.mly"
                            ( _1@[_3] )
# 283 "parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)) : 'freshtv322)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv327) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv323) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | APP ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | GL_NAM _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | INT _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | L_PRN ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | L_RCD ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | ROT ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv324)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv325) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv326)) : 'freshtv328)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv335) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END_CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv331) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv329) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _, (_2 : 'tv_vh_frm)), _, (_4 : 'tv_vh_frm)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_tail = 
# 136 "parser.mly"
                                                ( Some (Exp.CoPrd [_2;_4]) )
# 342 "parser.ml"
             in
            _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv330)) : 'freshtv332)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv333) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv337) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 135 "parser.mly"
               ( Some _2 )
# 362 "parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv338)) : 'freshtv340)
    | MenhirState43 | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv343 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv341 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm)) = _menhir_stack in
        let _v : 'tv_vh_frm_lst = 
# 118 "parser.mly"
            ( [_1] )
# 374 "parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)) : 'freshtv344)
    | _ ->
        _menhir_fail ()) : 'freshtv346)) : 'freshtv348)) : 'freshtv350)

and _menhir_goto_tail_code : _menhir_env -> 'ttv_tail -> 'tv_tail_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv317 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail_code) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv315 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail_code) : 'tv_tail_code) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
    let _v : 'tv_vh_frm_code = 
# 92 "parser.mly"
    (
      match _2 with
      | None -> _1
      | Some t -> Exp.Seq (_1,t)
    )
# 396 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv313) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_code) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv273) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271) = Obj.magic _menhir_stack in
        ((let _v : 'tv_coprd_tail = 
# 109 "parser.mly"
    ( [] )
# 412 "parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv272)) : 'freshtv274)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv283) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv281) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _, (_2 : 'tv_vh_frm_code)), (_3 : 'tv_coprd_tail)), _, (_5 : 'tv_vh_frm_code)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_coprd = 
# 105 "parser.mly"
    ( Some (Exp.CoPrd ([_2]@_3@[_5])) )
# 426 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279) = _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275) = Obj.magic _menhir_stack in
        let ((_1 : 'tv_coprd) : 'tv_coprd) = _v in
        ((let _v : 'tv_tail_code = 
# 101 "parser.mly"
          ( _1 )
# 440 "parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv276)) : 'freshtv278)) : 'freshtv280)) : 'freshtv282)) : 'freshtv284)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv287 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv285 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : 'tv_coprd_tail)), _, (_3 : 'tv_vh_frm_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_coprd_tail = 
# 110 "parser.mly"
                                  ( _1@[_3] )
# 453 "parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv286)) : 'freshtv288)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv291) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv289) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm_code)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail_code = 
# 100 "parser.mly"
                    ( Some _2 )
# 466 "parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv290)) : 'freshtv292)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_code)) = _menhir_stack in
        let _v : 'tv_lc_code = 
# 37 "parser.mly"
                ( _1 )
# 478 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv305 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 488 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv303 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 496 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_lc_code) : 'tv_lc_code) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 8 "parser.mly"
       (string)
# 503 "parser.ml"
        ))), (_3 : 'tv_typ_def)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 34 "parser.mly"
                                ( (_2,_5) )
# 510 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv295 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv293 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_etr)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 20 "parser.mly"
      (Flow.buf)
# 532 "parser.ml"
            ) = 
# 24 "parser.mly"
                ( Flow.Glb _1 )
# 536 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv294)) : 'freshtv296)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv297 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)) : 'freshtv300)) : 'freshtv302)) : 'freshtv304)) : 'freshtv306)) : 'freshtv308)) : 'freshtv310)) : 'freshtv312)
    | _ ->
        _menhir_fail ()) : 'freshtv314)) : 'freshtv316)) : 'freshtv318)

and _menhir_goto_h_frm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv259) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | L_RCD ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv260)
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv263) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261) = Obj.magic _menhir_stack in
        ((let _1 = () in
        let _v : 'tv_tail = 
# 134 "parser.mly"
            ( None )
# 591 "parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv262)) : 'freshtv264)
    | CO_PRD_STT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | L_RCD ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv266)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)) : 'freshtv270)

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run32 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "parser.mly"
      (Flow.buf)
# 701 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv257) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 20 "parser.mly"
      (Flow.buf)
# 710 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv255) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "parser.mly"
      (Flow.buf)
# 718 "parser.ml"
    )) : (
# 20 "parser.mly"
      (Flow.buf)
# 722 "parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv256)) : 'freshtv258)

and _menhir_goto_vh_frm_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState73 | MenhirState70 | MenhirState67 | MenhirState64 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv235) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EXP ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
                _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv236)
        | ARR_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv239) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv237) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_tail_code = 
# 99 "parser.mly"
            ( None )
# 762 "parser.ml"
             in
            _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv238)) : 'freshtv240)
        | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv241) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | EXP ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
                _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv242)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv243 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)) : 'freshtv246)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv253 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv249 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv247 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 20 "parser.mly"
      (Flow.buf)
# 804 "parser.ml"
            ) = 
# 23 "parser.mly"
                   ( Flow.Evo _1 )
# 808 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv248)) : 'freshtv250)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv251 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)) : 'freshtv254)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv179 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv175 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv173 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 144 "parser.mly"
                    ( Exp.Agl _2 )
# 843 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)) : 'freshtv176)
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)) : 'freshtv180)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | AGL | AGL_END | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | PLS | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv181 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 147 "parser.mly"
                ( Exp.Plus (_1,_3) )
# 877 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv182)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv183 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)) : 'freshtv186)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv191 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | AGL | AGL_END | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MLT | PLS | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv187 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 148 "parser.mly"
                ( Exp.Mult (_1,_3) )
# 903 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv189 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)) : 'freshtv192)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv195 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv193 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 150 "parser.mly"
                  ( Exp.L_App (_1,_3) )
# 923 "parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv194)) : 'freshtv196)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv201 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv197 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | APP ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | GL_NAM _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | INT _v ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | L_PRN ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | L_RCD ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | ROT ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37) : 'freshtv198)
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv199 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)) : 'freshtv202)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv207 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | AGL | AGL_END | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv203 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 146 "parser.mly"
                    ( Exp.App (_2,_4) )
# 990 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv204)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv205 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)) : 'freshtv208)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv215 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv211 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv209 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 149 "parser.mly"
                    ( _2 )
# 1024 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)) : 'freshtv212)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv213 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)) : 'freshtv216)
    | MenhirState69 | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv217 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 140 "parser.mly"
                 ( _1@[_2] )
# 1053 "parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv218)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv219 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)) : 'freshtv222)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_vh_frm_top = 
# 115 "parser.mly"
            ( Exp.Exp _2 )
# 1083 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv225 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)) : 'freshtv228)
    | MenhirState43 | MenhirState45 | MenhirState48 | MenhirState58 | MenhirState51 | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv229 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_h_frm = 
# 130 "parser.mly"
        ( Exp.Exp _1 )
# 1112 "parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv230)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv231 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)) : 'freshtv234)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv147) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState10 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | Z ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState11
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv148)
        | Z ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv150)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv153) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | Z ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv151) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _, (_2 : 'tv_typs)), _), _, (_4 : 'tv_typs)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 41 "parser.mly"
                      ( Flow.St.Rcd _2 )
# 1183 "parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv152)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv154)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv157 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1195 "parser.ml"
        ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv155 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1207 "parser.ml"
            ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState82 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_RCD ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | Z ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv156)
        | Z ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv158)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv171 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1233 "parser.ml"
        ))) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | Z ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv169 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1247 "parser.ml"
            ))) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), (_3 : (
# 8 "parser.mly"
       (string)
# 1252 "parser.ml"
            ))), _, (_5 : 'tv_typs)), _), _, (_7 : 'tv_typs)) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_glb_mode = 
# 30 "parser.mly"
                                  ( (_3,Flow.St.Rcd _5) )
# 1261 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_glb_mode) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv165 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv161 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv159 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_mode)) = _menhir_stack in
                let _2 = () in
                let _v : (
# 20 "parser.mly"
      (Flow.buf)
# 1283 "parser.ml"
                ) = 
# 25 "parser.mly"
                 (
      let (x,y) = _1 in
      (Flow.Glb_mode (x,y)) )
# 1289 "parser.ml"
                 in
                _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv160)) : 'freshtv162)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv163 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)) : 'freshtv166)) : 'freshtv168)) : 'freshtv170)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84) : 'freshtv172)
    | _ ->
        _menhir_fail ()

and _menhir_goto_const : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_const -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_const) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_const) : 'tv_const) = _v in
    ((let _v : 'tv_exp = 
# 145 "parser.mly"
          ( _1 )
# 1319 "parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)) : 'freshtv146)

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState44 | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | L_RCD ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv135 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState20 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv133 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 151 "parser.mly"
                        ( Exp.Rcd _2 )
# 1361 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv134)) : 'freshtv136)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv138)
    | MenhirState0 | MenhirState16 | MenhirState73 | MenhirState64 | MenhirState70 | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | L_RCD ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv139 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_vh_frm_top = 
# 114 "parser.mly"
            ( Exp.Exp (Exp.Rcd _1) )
# 1395 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv140)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv142)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv123 * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typ) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv121 * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_typ) : 'tv_typ) = _v in
        ((let (_menhir_stack, (_1 : 'tv_rcd_lst)) = _menhir_stack in
        let _v : 'tv_rcd_lst = 
# 81 "parser.mly"
                ( _1@[_2] )
# 1421 "parser.ml"
         in
        _menhir_goto_rcd_lst _menhir_env _menhir_stack _v) : 'freshtv122)) : 'freshtv124)
    | MenhirState82 | MenhirState84 | MenhirState10 | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv127 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typ) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_typ) : 'tv_typ) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
        let _v : 'tv_typs = 
# 70 "parser.mly"
             ( _1@[_2] )
# 1437 "parser.ml"
         in
        _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv126)) : 'freshtv128)
    | MenhirState81 | MenhirState83 | MenhirState3 | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_typ) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_typ) : 'tv_typ) = _v in
        ((let _v : 'tv_typs = 
# 69 "parser.mly"
        ( [_1] )
# 1452 "parser.ml"
         in
        _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv130)) : 'freshtv132)
    | _ ->
        _menhir_fail ()

and _menhir_goto_rcd_lst : _menhir_env -> 'ttv_tail -> 'tv_rcd_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv119 * _menhir_state) * 'tv_rcd_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_RCD ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state) * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState6 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv115 * _menhir_state) * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_rcd_lst)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_rcd = 
# 77 "parser.mly"
                        ( Flow.St.Rcd _2 )
# 1482 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_rcd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv111) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_rcd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_rcd) : 'tv_rcd) = _v in
        ((let _v : 'tv_typ = 
# 74 "parser.mly"
        ( _1 )
# 1499 "parser.ml"
         in
        _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)) : 'freshtv112)) : 'freshtv114)) : 'freshtv116)) : 'freshtv118)
    | Z ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv120)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv107) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_const = 
# 155 "parser.mly"
        ( Exp.Root )
# 1525 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState44 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | APP ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | GL_NAM _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | INT _v ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | L_PRN ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | L_RCD ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | ROT ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv106)
    | AGL | APP | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
        _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1596 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv103) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 9 "parser.mly"
       (int)
# 1606 "parser.ml"
    )) : (
# 9 "parser.mly"
       (int)
# 1610 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 154 "parser.mly"
        ( Exp.Z _1 )
# 1615 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv104)

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1622 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv101) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 1632 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 1636 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 156 "parser.mly"
            ( Exp.Gl_call _1 )
# 1641 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv102)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_reduce18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 139 "parser.mly"
    ( [] )
# 1700 "parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv99 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1711 "parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv95 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1721 "parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | EXP ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16) : 'freshtv96)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv97 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1743 "parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)) : 'freshtv100)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState84 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv29 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1756 "parser.ml"
        ))) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv31 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1765 "parser.ml"
        ))) * _menhir_state * 'tv_typs) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv33 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1774 "parser.ml"
        ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv35 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1783 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv38)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv40)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv43) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv46)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv48)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv49) * _menhir_state * 'tv_vh_frm)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv52)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * 'tv_vh_frm_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv61 * _menhir_state) * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState17 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv81 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1897 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv83) * _menhir_state * 'tv_typs) * _menhir_state) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv85) * _menhir_state * 'tv_typs) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv87) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state) * 'tv_rcd_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv92)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv94)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_typ = 
# 73 "parser.mly"
      ( Flow.St.Z None )
# 1940 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    ((let _v : 'tv_rcd_lst = 
# 80 "parser.mly"
    ( [] )
# 1953 "parser.ml"
     in
    _menhir_goto_rcd_lst _menhir_env _menhir_stack _v) : 'freshtv26)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | L_RCD ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | APP ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | GL_NAM _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | INT _v ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | L_PRN ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | L_RCD ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | ROT ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

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
# 20 "parser.mly"
      (Flow.buf)
# 2022 "parser.ml"
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
    let (_menhir_stack : 'freshtv23) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EXP ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LCE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv5 * _menhir_state)) = Obj.magic _menhir_stack in
                let (_v : (
# 8 "parser.mly"
       (string)
# 2065 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CLN ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv1 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2076 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | L_RCD ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState81
                    | Z ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState81
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv2)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv3 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2096 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv4)) : 'freshtv6)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv7 * _menhir_state)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)) : 'freshtv10)
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 8 "parser.mly"
       (string)
# 2113 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CLN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | L_RCD ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | Z ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv12)
            | DEF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
                ((let _v : 'tv_typ_def = 
# 40 "parser.mly"
    ( Flow.St.Rcd [] )
# 2139 "parser.ml"
                 in
                _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv14)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv15 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 2149 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)) : 'freshtv18)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)) : 'freshtv22)
    | AGL | APP | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
        _menhir_reduce18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv24))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 2170 "parser.ml"
