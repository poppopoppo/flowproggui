
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
    | L_PRJ
    | L_APP
    | LCE
    | INT of (
# 9 "parser.mly"
       (int)
# 34 "parser.ml"
  )
    | GL_NAM of (
# 8 "parser.mly"
       (string)
# 39 "parser.ml"
  )
    | EXP
    | EQV
    | EOP
    | EOF
    | END_PRD
    | END_CO_PRD
    | DTA
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
  | MenhirState89
  | MenhirState88
  | MenhirState87
  | MenhirState86
  | MenhirState85
  | MenhirState83
  | MenhirState82
  | MenhirState81
  | MenhirState80
  | MenhirState79
  | MenhirState71
  | MenhirState68
  | MenhirState67
  | MenhirState65
  | MenhirState62
  | MenhirState56
  | MenhirState51
  | MenhirState49
  | MenhirState46
  | MenhirState43
  | MenhirState42
  | MenhirState41
  | MenhirState35
  | MenhirState31
  | MenhirState28
  | MenhirState26
  | MenhirState24
  | MenhirState22
  | MenhirState21
  | MenhirState18
  | MenhirState16
  | MenhirState15
  | MenhirState13
  | MenhirState12
  | MenhirState7
  | MenhirState6
  | MenhirState4
  | MenhirState3
  | MenhirState0

# 1 "parser.mly"
  
open Flow

# 120 "parser.ml"

let rec _menhir_run46 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | L_RCD ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_goto_vh_frm_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv411 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv407 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv405 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _), _, (_3 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_h_frm = 
# 161 "parser.mly"
                                ( Exp.Canon _3 )
# 171 "parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv406)) : 'freshtv408)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv409 * _menhir_state) * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv410)) : 'freshtv412)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv417 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | M_CNN ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv413 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_vh_frm_lst)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_vh_frm_top = 
# 143 "parser.mly"
                    ( Exp.Canon _2 )
# 197 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv415 * _menhir_state) * _menhir_state * 'tv_vh_frm_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv416)) : 'freshtv418)
    | _ ->
        _menhir_fail ()

and _menhir_goto_coprd_tail : _menhir_env -> 'ttv_tail -> 'tv_coprd_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv403) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv397 * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | EXP ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv398)
    | END_CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv399) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | EXP ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65) : 'freshtv400)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv401) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv402)) : 'freshtv404)

and _menhir_goto_tail : _menhir_env -> 'ttv_tail -> 'tv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv395 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv393 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail) : 'tv_tail) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_h_frm)) = _menhir_stack in
    let _v : 'tv_vh_frm = 
# 153 "parser.mly"
    (
      match _2 with
      | None -> _1
      | Some t -> Exp.Seq (_1,t)
    )
# 274 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv391) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv367 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv365 * _menhir_state * 'tv_vh_frm_lst)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_lst)), _, (_3 : 'tv_vh_frm)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_vh_frm_lst = 
# 149 "parser.mly"
                            ( _1@[_3] )
# 292 "parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)) : 'freshtv368)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv373) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv369) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | APP ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | GL_NAM _v ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | INT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | L_PRN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | L_RCD ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | ROT ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv370)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv371) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv372)) : 'freshtv374)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv381) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END_CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv377) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv375) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _, (_2 : 'tv_vh_frm)), _, (_4 : 'tv_vh_frm)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_tail = 
# 166 "parser.mly"
                                                ( Some (Exp.CoPrd [_2;_4]) )
# 351 "parser.ml"
             in
            _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv376)) : 'freshtv378)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv379) * _menhir_state * 'tv_vh_frm)) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv380)) : 'freshtv382)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv385) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv383) * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail = 
# 165 "parser.mly"
               ( Some _2 )
# 371 "parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv384)) : 'freshtv386)
    | MenhirState41 | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv389 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv387 * _menhir_state * 'tv_vh_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm)) = _menhir_stack in
        let _v : 'tv_vh_frm_lst = 
# 148 "parser.mly"
            ( [_1] )
# 383 "parser.ml"
         in
        _menhir_goto_vh_frm_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)) : 'freshtv390)
    | _ ->
        _menhir_fail ()) : 'freshtv392)) : 'freshtv394)) : 'freshtv396)

and _menhir_goto_tail_code : _menhir_env -> 'ttv_tail -> 'tv_tail_code -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv363 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let (_v : 'tv_tail_code) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv361 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_tail_code) : 'tv_tail_code) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
    let _v : 'tv_vh_frm_code = 
# 122 "parser.mly"
    (
      match _2 with
      | None -> _1
      | Some t -> Exp.Seq (_1,t)
    )
# 405 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv359) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_vh_frm_code) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv319) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv317) = Obj.magic _menhir_stack in
        ((let _v : 'tv_coprd_tail = 
# 139 "parser.mly"
    ( [] )
# 421 "parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv318)) : 'freshtv320)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv329) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv327) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _, (_2 : 'tv_vh_frm_code)), (_3 : 'tv_coprd_tail)), _, (_5 : 'tv_vh_frm_code)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_coprd = 
# 135 "parser.mly"
    ( Some (Exp.CoPrd ([_2]@_3@[_5])) )
# 435 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv325) = _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
        let (_v : 'tv_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
        let ((_1 : 'tv_coprd) : 'tv_coprd) = _v in
        ((let _v : 'tv_tail_code = 
# 131 "parser.mly"
          ( _1 )
# 449 "parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv322)) : 'freshtv324)) : 'freshtv326)) : 'freshtv328)) : 'freshtv330)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv333 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv331 * 'tv_coprd_tail)) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, (_1 : 'tv_coprd_tail)), _, (_3 : 'tv_vh_frm_code)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_coprd_tail = 
# 140 "parser.mly"
                                  ( _1@[_3] )
# 462 "parser.ml"
         in
        _menhir_goto_coprd_tail _menhir_env _menhir_stack _v) : 'freshtv332)) : 'freshtv334)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv337) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv335) * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (_2 : 'tv_vh_frm_code)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_tail_code = 
# 130 "parser.mly"
                    ( Some _2 )
# 475 "parser.ml"
         in
        _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv336)) : 'freshtv338)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv357 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv355 * _menhir_state * 'tv_vh_frm_code) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_code)) = _menhir_stack in
        let _v : 'tv_lc_code = 
# 67 "parser.mly"
                ( _1 )
# 487 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv353) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv351 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 497 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv349 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 505 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_lc_code) : 'tv_lc_code) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 8 "parser.mly"
       (string)
# 512 "parser.ml"
        ))), (_3 : 'tv_typ_def)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 56 "parser.mly"
                                (
    let (src,dst) = _3 in
    Glb_St.Gl_Etr {
      name=_2;
      src=src;
      dst=dst;
      code=_5
      }
    )
# 527 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv347) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv345 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv341 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv339 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_etr)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 21 "parser.mly"
      (Flow.Buffer.t)
# 549 "parser.ml"
            ) = 
# 26 "parser.mly"
                ( Flow.Buffer.Glb _1 )
# 553 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv340)) : 'freshtv342)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv343 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv344)) : 'freshtv346)) : 'freshtv348)) : 'freshtv350)) : 'freshtv352)) : 'freshtv354)) : 'freshtv356)) : 'freshtv358)
    | _ ->
        _menhir_fail ()) : 'freshtv360)) : 'freshtv362)) : 'freshtv364)

and _menhir_goto_h_frm : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_h_frm -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv315 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | GL_NAM _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | INT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
        | L_PRN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | L_RCD ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | ROT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv306)
    | ARR_END ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307) = Obj.magic _menhir_stack in
        ((let _1 = () in
        let _v : 'tv_tail = 
# 164 "parser.mly"
            ( None )
# 608 "parser.ml"
         in
        _menhir_goto_tail _menhir_env _menhir_stack _v) : 'freshtv308)) : 'freshtv310)
    | CO_PRD_STT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | GL_NAM _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | INT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | L_PRN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | L_RCD ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | ROT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv312)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv313 * _menhir_state * 'tv_h_frm) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv314)) : 'freshtv316)

and _menhir_run24 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run26 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_run31 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_goto_vh_frm_top : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_vh_frm_top -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 | MenhirState68 | MenhirState65 | MenhirState62 | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv295 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv285) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | EXP ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
                _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) MenhirState71
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv286)
        | ARR_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv289) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv287) = Obj.magic _menhir_stack in
            ((let _1 = () in
            let _v : 'tv_tail_code = 
# 129 "parser.mly"
            ( None )
# 775 "parser.ml"
             in
            _menhir_goto_tail_code _menhir_env _menhir_stack _v) : 'freshtv288)) : 'freshtv290)
        | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | EXP ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
                _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62) : 'freshtv292)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv293 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv294)) : 'freshtv296)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv299 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv297 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_vh_frm_top)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 21 "parser.mly"
      (Flow.Buffer.t)
# 817 "parser.ml"
            ) = 
# 25 "parser.mly"
                   ( Flow.Buffer.Evo _1 )
# 821 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv298)) : 'freshtv300)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv301 * _menhir_state * 'tv_vh_frm_top) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv302)) : 'freshtv304)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL_END ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv219 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv217 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 174 "parser.mly"
                    ( Exp.Agl _2 )
# 856 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv218)) : 'freshtv220)
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv221 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)) : 'freshtv224)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv229 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | AGL | AGL_END | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | PLS | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv225 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 177 "parser.mly"
                ( Exp.Plus (_1,_3) )
# 894 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv226)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv227 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)) : 'freshtv230)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv235 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | AGL | AGL_END | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MLT | PLS | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv231 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 178 "parser.mly"
                ( Exp.Mult (_1,_3) )
# 922 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv233 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)) : 'freshtv236)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv239 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv237 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 181 "parser.mly"
                  ( Exp.L_Prj (_1,_3) )
# 942 "parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv238)) : 'freshtv240)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv245 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | AGL | AGL_END | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_APP | L_PRN | L_RCD | MLT | PLS | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv241 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 180 "parser.mly"
                  ( Exp.L_App (_1,_3) )
# 961 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv243 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)) : 'freshtv246)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv251 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv247 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AGL ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | APP ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | GL_NAM _v ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | INT _v ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | L_PRN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | L_RCD ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | ROT ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv248)
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv249 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)) : 'freshtv252)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv257 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | AGL | AGL_END | APP | ARR | ARR_END | CO_PRD_STT | DOT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv253 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 176 "parser.mly"
                    ( Exp.App (_2,_4) )
# 1039 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv254)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv255 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)) : 'freshtv258)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv265 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv261 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv259 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 179 "parser.mly"
                    ( _2 )
# 1075 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)) : 'freshtv262)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv263 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)) : 'freshtv266)
    | MenhirState67 | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv267 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_lst = 
# 170 "parser.mly"
                 ( _1@[_2] )
# 1106 "parser.ml"
             in
            _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv269 * _menhir_state * 'tv_exp_lst) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)) : 'freshtv272)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv277 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv273 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_vh_frm_top = 
# 145 "parser.mly"
            ( Exp.Exp (Flow.Plc.Mt,_2) )
# 1138 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv275 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv276)) : 'freshtv278)
    | MenhirState41 | MenhirState43 | MenhirState46 | MenhirState56 | MenhirState49 | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack)
        | L_PRJ ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | ARR | ARR_END | CO_PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_h_frm = 
# 160 "parser.mly"
        ( Exp.Exp (Flow.Plc.Mt,_1) )
# 1169 "parser.ml"
             in
            _menhir_goto_h_frm _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)) : 'freshtv284)
    | _ ->
        _menhir_fail ()

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_plc = 
# 46 "parser.mly"
      ( Flow.Plc.Z )
# 1192 "parser.ml"
     in
    _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv216)

and _menhir_goto_const : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_const -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_const) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv211) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_const) : 'tv_const) = _v in
    ((let _v : 'tv_exp = 
# 175 "parser.mly"
          ( _1 )
# 1209 "parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv212)) : 'freshtv214)

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState42 | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | GL_NAM _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | INT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | L_PRN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | L_RCD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | ROT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv203 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState16 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv201 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 182 "parser.mly"
                        ( Exp.Rcd _2 )
# 1251 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)) : 'freshtv204)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16) : 'freshtv206)
    | MenhirState0 | MenhirState12 | MenhirState71 | MenhirState62 | MenhirState68 | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | GL_NAM _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | INT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
        | L_PRN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | L_RCD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | ROT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | ARR | ARR_END | CO_PRD_STT | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv207 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
            let _v : 'tv_vh_frm_top = 
# 144 "parser.mly"
            ( Exp.Exp (Flow.Plc.Mt,Exp.Rcd _1) )
# 1285 "parser.ml"
             in
            _menhir_goto_vh_frm_top _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67) : 'freshtv210)
    | _ ->
        _menhir_fail ()

and _menhir_goto_plcs : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1298 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv173) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1308 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv171) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1320 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState4 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv172)
        | Z ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv174)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv177) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1337 "parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1341 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
        | Z ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState7
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv175) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1355 "parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1359 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _, (_2 : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1364 "parser.ml"
            ))), _), _, (_4 : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1368 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ_def = 
# 71 "parser.mly"
                      ( (Flow.Plc.Rcd _2,Flow.Plc.Rcd _4) )
# 1375 "parser.ml"
             in
            _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv176)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7) : 'freshtv178)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv181 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1387 "parser.ml"
        ))) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1391 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv179 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1403 "parser.ml"
            ))) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1407 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState80 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv180)
        | Z ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80) : 'freshtv182)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv195 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1424 "parser.ml"
        ))) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1428 "parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1432 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
        | Z ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((((('freshtv193 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 1446 "parser.ml"
            ))) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1450 "parser.ml"
            )) * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1454 "parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (((((_menhir_stack, _menhir_s), (_3 : (
# 8 "parser.mly"
       (string)
# 1459 "parser.ml"
            ))), _, (_5 : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1463 "parser.ml"
            ))), _), _, (_7 : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1467 "parser.ml"
            ))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_glb_mode = 
# 52 "parser.mly"
                                  ( (_3,Flow.Plc.Rcd _5,Flow.Plc.Rcd _7) )
# 1476 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv191) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_glb_mode) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv189 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EOF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv185 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_mode)) = _menhir_stack in
                let _2 = () in
                let _v : (
# 21 "parser.mly"
      (Flow.Buffer.t)
# 1498 "parser.ml"
                ) = 
# 27 "parser.mly"
                 (
      let (n,s,d) = _1 in
      (Flow.Buffer.Glb_mode { name=n; src=s; dst=d })
         )
# 1505 "parser.ml"
                 in
                _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv184)) : 'freshtv186)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv187 * _menhir_state * 'tv_glb_mode) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)) : 'freshtv190)) : 'freshtv192)) : 'freshtv194)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82) : 'freshtv196)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv199 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1524 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CLN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv197 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1534 "parser.ml"
            )) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState87 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88) : 'freshtv198)
        | NAM _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
        | Z ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87) : 'freshtv200)
    | _ ->
        _menhir_fail ()

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_def_coprd : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_def_coprd -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv155 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1577 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv153 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1585 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1592 "parser.ml"
        ))), _), _, (_4 : 'tv_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_coprd = 
# 39 "parser.mly"
                                    ( (_4,Flow.Plc.Rcd _2)::_5 )
# 1599 "parser.ml"
         in
        _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv154)) : 'freshtv156)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv169 * _menhir_state) * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_coprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv167 * _menhir_state) * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_4 : 'tv_def_coprd) : 'tv_def_coprd) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_name)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_def_plc = 
# 35 "parser.mly"
                            ( Flow.Buffer.Def (Data.CoPrd { name=_2; cns=_4 }) )
# 1617 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_def_plc) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv159 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_def_plc)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 21 "parser.mly"
      (Flow.Buffer.t)
# 1639 "parser.ml"
            ) = 
# 31 "parser.mly"
                ( _1 )
# 1643 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)) : 'freshtv160)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv161 * _menhir_state * 'tv_def_plc) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)) : 'freshtv164)) : 'freshtv166)) : 'freshtv168)) : 'freshtv170)
    | _ ->
        _menhir_fail ()

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState86

and _menhir_goto_plc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_plc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv151 * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1668 "parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_plc) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149 * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1676 "parser.ml"
    )) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_2 : 'tv_plc) : 'tv_plc) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1683 "parser.ml"
    ))) = _menhir_stack in
    let _v : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1688 "parser.ml"
    ) = 
# 43 "parser.mly"
             ( _1@[_2] )
# 1692 "parser.ml"
     in
    _menhir_goto_plcs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)) : 'freshtv152)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_const = 
# 186 "parser.mly"
        ( Exp.Root )
# 1706 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv148)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState42 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AGL ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | APP ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | GL_NAM _v ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | INT _v ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
        | L_PRN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | L_RCD ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | ROT ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43) : 'freshtv146)
    | AGL | APP | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
        _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1777 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 9 "parser.mly"
       (int)
# 1787 "parser.ml"
    )) : (
# 9 "parser.mly"
       (int)
# 1791 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 185 "parser.mly"
        ( Exp.Z _1 )
# 1796 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1803 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv141) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 1813 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 1817 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 187 "parser.mly"
            ( Exp.Gl_call _1 )
# 1822 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv142)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_reduce24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 169 "parser.mly"
    ( [] )
# 1881 "parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_typ_def : _menhir_env -> 'ttv_tail -> 'tv_typ_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv139 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1892 "parser.ml"
    )) * 'tv_typ_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv135 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1902 "parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | EXP ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | AGL | APP | ARR | ARR_END | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv136)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv137 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1924 "parser.ml"
        )) * 'tv_typ_def) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)) : 'freshtv140)

and _menhir_reduce34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 1934 "parser.ml"
    ) = 
# 42 "parser.mly"
    ( [] )
# 1938 "parser.ml"
     in
    _menhir_goto_plcs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | L_RCD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1970 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 1980 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 1984 "parser.ml"
    )) = _v in
    ((let _v : 'tv_name = 
# 50 "parser.mly"
        ( _1 )
# 1989 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv131) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_name) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState87 | MenhirState80 | MenhirState82 | MenhirState4 | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv119 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv117 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_name)) = _menhir_stack in
        let _v : 'tv_plc = 
# 47 "parser.mly"
         ( Flow.Plc.Name _1 )
# 2006 "parser.ml"
         in
        _menhir_goto_plc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv118)) : 'freshtv120)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv125 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQV ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv121 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CO_PRD ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState85
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv122)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv123 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)) : 'freshtv126)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv129 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2039 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState89
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv127 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2051 "parser.ml"
            )) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let ((((_menhir_stack, _menhir_s), _, (_2 : (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2056 "parser.ml"
            ))), _), _, (_4 : 'tv_name)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_def_coprd = 
# 38 "parser.mly"
                          ( [(_4,Flow.Plc.Rcd _2)] )
# 2063 "parser.ml"
             in
            _menhir_goto_def_coprd _menhir_env _menhir_stack _menhir_s _v) : 'freshtv128)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89) : 'freshtv130)
    | _ ->
        _menhir_fail ()) : 'freshtv132)) : 'freshtv134)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | APP ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | GL_NAM _v ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INT _v ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | L_PRN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | L_RCD ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | ROT ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv39 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2106 "parser.ml"
        )) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState88 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv41 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2115 "parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState87 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv43 * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2124 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState86 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv47 * _menhir_state) * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState82 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv51 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2148 "parser.ml"
        ))) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2152 "parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2156 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv53 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2165 "parser.ml"
        ))) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2169 "parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState80 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv55 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2178 "parser.ml"
        ))) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2182 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState79 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv57 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2191 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv60)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv61 * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv62)
    | MenhirState67 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState65 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv65) * _menhir_state * 'tv_vh_frm_code) * 'tv_coprd_tail)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState62 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv68)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv70)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv71) * _menhir_state * 'tv_vh_frm)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv74)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * _menhir_state * 'tv_vh_frm_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv83 * _menhir_state) * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState28 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv87 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state) * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 2310 "parser.ml"
        )) * 'tv_typ_def)) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState7 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv107) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2319 "parser.ml"
        )) * _menhir_state) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2323 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv109) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2332 "parser.ml"
        )) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv111) * _menhir_state * (
# 22 "parser.mly"
      (Flow.Plc.t list)
# 2341 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv113) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv114)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv116)

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 21 "parser.mly"
      (Flow.Buffer.t)
# 2357 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv37) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 21 "parser.mly"
      (Flow.Buffer.t)
# 2366 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 21 "parser.mly"
      (Flow.Buffer.t)
# 2374 "parser.ml"
    )) : (
# 21 "parser.mly"
      (Flow.Buffer.t)
# 2378 "parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv36)) : 'freshtv38)

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
# 21 "parser.mly"
      (Flow.Buffer.t)
# 2397 "parser.ml"
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
    let (_menhir_stack : 'freshtv33) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
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
# 21 "parser.mly"
      (Flow.Buffer.t)
# 2435 "parser.ml"
            ) = 
# 32 "parser.mly"
                ( Flow.Buffer.End )
# 2439 "parser.ml"
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
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DTA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv10)
    | EXP ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | LCE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | NAM _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv15 * _menhir_state)) = Obj.magic _menhir_stack in
                let (_v : (
# 8 "parser.mly"
       (string)
# 2487 "parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | CLN ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv11 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2498 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState79) : 'freshtv12)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (('freshtv13 * _menhir_state)) * (
# 8 "parser.mly"
       (string)
# 2509 "parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)) : 'freshtv16)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv17 * _menhir_state)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)) : 'freshtv20)
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv27 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 8 "parser.mly"
       (string)
# 2526 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CLN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv22)
            | DEF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
                ((let _v : 'tv_typ_def = 
# 70 "parser.mly"
    ( (Flow.Plc.Mt,Flow.Plc.Mt) )
# 2543 "parser.ml"
                 in
                _menhir_goto_typ_def _menhir_env _menhir_stack _v) : 'freshtv24)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv25 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 2553 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)) : 'freshtv28)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv29 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)) : 'freshtv32)
    | AGL | APP | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
        _menhir_reduce24 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv34))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 2574 "parser.ml"
