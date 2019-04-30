
module MenhirBasics = struct
  
  exception Error
  
  type token = 
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
# 21 "parser.ml"
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
# 32 "parser.ml"
  )
    | GL_NAM of (
# 8 "parser.mly"
       (string)
# 37 "parser.ml"
  )
    | EXP
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
    | ARR
    | APP
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
  | MenhirState49
  | MenhirState41
  | MenhirState39
  | MenhirState35
  | MenhirState33
  | MenhirState32
  | MenhirState31
  | MenhirState30
  | MenhirState25
  | MenhirState22
  | MenhirState20
  | MenhirState18
  | MenhirState16
  | MenhirState13
  | MenhirState11
  | MenhirState10
  | MenhirState5
  | MenhirState3
  | MenhirState0

# 1 "parser.mly"
  
open Flow

# 93 "parser.ml"

let rec _menhir_goto_cnn_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cnn_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv233 * _menhir_state) * _menhir_state * 'tv_cnn_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | CO_PRD_STT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | L_RCD ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | ARR | CO_PRD | END_CO_PRD | EOF | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state) * _menhir_state * 'tv_cnn_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cnn_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_arr = 
# 84 "parser.mly"
                ( Exp.Canon _2 )
# 127 "parser.ml"
         in
        _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv234)

and _menhir_goto_buffer : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 20 "parser.mly"
      (Flow.Exp.buf)
# 138 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv229) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 20 "parser.mly"
      (Flow.Exp.buf)
# 147 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv227) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 20 "parser.mly"
      (Flow.Exp.buf)
# 155 "parser.ml"
    )) : (
# 20 "parser.mly"
      (Flow.Exp.buf)
# 159 "parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv228)) : 'freshtv230)

and _menhir_goto_exp_str : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_str -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp_str) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_exp_str) : 'tv_exp_str) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
        let _v : 'tv_exp_lst = 
# 94 "parser.mly"
                     ( _1@[_2] )
# 179 "parser.ml"
         in
        _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv216)) : 'freshtv218)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp_str) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_exp_str) : 'tv_exp_str) = _v in
        ((let _v : 'tv_cnn_lst = 
# 89 "parser.mly"
            ( [_1] )
# 194 "parser.ml"
         in
        _menhir_goto_cnn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)) : 'freshtv222)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state * 'tv_cnn_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp_str) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state * 'tv_cnn_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_exp_str) : 'tv_exp_str) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cnn_lst)) = _menhir_stack in
        let _v : 'tv_cnn_lst = 
# 90 "parser.mly"
                    ( _1)
# 210 "parser.ml"
         in
        _menhir_goto_cnn_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)) : 'freshtv226)
    | _ ->
        _menhir_fail ()

and _menhir_run18 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_run20 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20

and _menhir_run22 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState22
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22

and _menhir_goto_arr_base : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arr_base -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv155 * _menhir_state) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | EXP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | AGL | APP | ARR | CO_PRD_STT | END_CO_PRD | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
                _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv156)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv157 * _menhir_state) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)) : 'freshtv160)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv173 * _menhir_state) * _menhir_state * 'tv_arr_base)) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | END_CO_PRD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv169 * _menhir_state) * _menhir_state * 'tv_arr_base)) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv167 * _menhir_state) * _menhir_state * 'tv_arr_base)) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_arr_base)), _, (_4 : 'tv_arr_base)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_cprd = 
# 81 "parser.mly"
                                                  ( Exp.CoPrd (_2,_4) )
# 328 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv165) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_cprd) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv163) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_cprd) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_cprd) : 'tv_cprd) = _v in
            ((let _v : 'tv_exp_str = 
# 97 "parser.mly"
         ( _1 )
# 345 "parser.ml"
             in
            _menhir_goto_exp_str _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)) : 'freshtv164)) : 'freshtv166)) : 'freshtv168)) : 'freshtv170)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv171 * _menhir_state) * _menhir_state * 'tv_arr_base)) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)) : 'freshtv174)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv177 * _menhir_state * 'tv_arr)) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv175 * _menhir_state * 'tv_arr)) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_arr)), _, (_3 : 'tv_arr_base)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_arr_base = 
# 78 "parser.mly"
                      ( _1 )
# 365 "parser.ml"
         in
        _menhir_goto_arr_base _menhir_env _menhir_stack _menhir_s _v) : 'freshtv176)) : 'freshtv178)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv185 * _menhir_state) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv181 * _menhir_state) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv179 * _menhir_state) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_arr_base)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp_str = 
# 98 "parser.mly"
                          ( _2 )
# 386 "parser.ml"
             in
            _menhir_goto_exp_str _menhir_env _menhir_stack _menhir_s _v) : 'freshtv180)) : 'freshtv182)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv183 * _menhir_state) * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)) : 'freshtv186)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_base)) = _menhir_stack in
        let _v : 'tv_lc_code = 
# 30 "parser.mly"
             ( _1 )
# 405 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv199 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 415 "parser.ml"
        )) * 'tv_typ)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_code) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv197 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 423 "parser.ml"
        )) * 'tv_typ)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_5 : 'tv_lc_code) : 'tv_lc_code) = _v in
        ((let (((_menhir_stack, _menhir_s), (_2 : (
# 8 "parser.mly"
       (string)
# 430 "parser.ml"
        ))), (_3 : 'tv_typ)) = _menhir_stack in
        let _4 = () in
        let _1 = () in
        let _v : 'tv_glb_etr = 
# 27 "parser.mly"
                            ( (_2,_5) )
# 437 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv195) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_glb_etr) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv189 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv187 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_glb_etr)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 20 "parser.mly"
      (Flow.Exp.buf)
# 459 "parser.ml"
            ) = 
# 24 "parser.mly"
                ( Glb _1 )
# 463 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)) : 'freshtv190)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv191 * _menhir_state * 'tv_glb_etr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)) : 'freshtv194)) : 'freshtv196)) : 'freshtv198)) : 'freshtv200)) : 'freshtv202)) : 'freshtv204)) : 'freshtv206)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv207 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_base)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 20 "parser.mly"
      (Flow.Exp.buf)
# 489 "parser.ml"
            ) = 
# 23 "parser.mly"
                 ( Evo _1 )
# 493 "parser.ml"
             in
            _menhir_goto_buffer _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)) : 'freshtv210)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv211 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)) : 'freshtv214)
    | _ ->
        _menhir_fail ()

and _menhir_goto_exp : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv101 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | APP ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | GL_NAM _v ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
            | INT _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
            | L_PRN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | ROT ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState25
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25) : 'freshtv102)
        | L_APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv103 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)) : 'freshtv106)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv111 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | CO_PRD | CO_PRD_STT | DOT | END_CO_PRD | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | PLS | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv107 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 104 "parser.mly"
                ( Exp.Plus (_1,_3) )
# 567 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv109 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)) : 'freshtv112)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | CO_PRD | CO_PRD_STT | DOT | END_CO_PRD | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | MLT | PLS | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv113 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_exp = 
# 105 "parser.mly"
                ( Exp.Mult (_1,_3) )
# 593 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv114)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)) : 'freshtv118)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv119 * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_exp)), _, (_3 : 'tv_exp)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_exp = 
# 107 "parser.mly"
                  ( Exp.L_App (_1,_3) )
# 613 "parser.ml"
         in
        _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)) : 'freshtv122)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv127 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | CO_PRD | CO_PRD_STT | DOT | END_CO_PRD | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_PRN | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv123 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)), _, (_4 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 103 "parser.mly"
                    ( Exp.App (_2,_4) )
# 637 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv124)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv125 * _menhir_state) * _menhir_state * 'tv_exp)) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)) : 'freshtv128)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv131 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv129 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_exp = 
# 106 "parser.mly"
                    ( _2 )
# 671 "parser.ml"
             in
            _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv130)) : 'freshtv132)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv133 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)) : 'freshtv136)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv141 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | ARR | CO_PRD | END_CO_PRD | EOF | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv137 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_arr = 
# 86 "parser.mly"
            ( _2 )
# 701 "parser.ml"
             in
            _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv138)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv139 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)) : 'freshtv142)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | CO_PRD | CO_PRD_STT | END_CO_PRD | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv143 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_exp)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_exp_str = 
# 100 "parser.mly"
            ( Exp.Agl _2 )
# 731 "parser.ml"
             in
            _menhir_goto_exp_str _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv145 * _menhir_state) * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)) : 'freshtv148)
    | MenhirState49 | MenhirState30 | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_APP ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack)
        | MLT ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack)
        | AGL | APP | ARR | CO_PRD | CO_PRD_STT | END_CO_PRD | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv149 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp)) = _menhir_stack in
            let _v : 'tv_exp_str = 
# 99 "parser.mly"
        ( _1 )
# 760 "parser.ml"
             in
            _menhir_goto_exp_str _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv151 * _menhir_state * 'tv_exp) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)) : 'freshtv154)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv99 * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | EXP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | AGL | APP | ARR | CO_PRD | CO_PRD_STT | END_CO_PRD | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
            _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv94)
    | CO_PRD | END_CO_PRD | EOF | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr)) = _menhir_stack in
        let _v : 'tv_arr_base = 
# 77 "parser.mly"
        ( _1 )
# 804 "parser.ml"
         in
        _menhir_goto_arr_base _menhir_env _menhir_stack _menhir_s _v) : 'freshtv96)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)) : 'freshtv100)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_run7 : _menhir_env -> 'ttv_tail -> (
# 8 "parser.mly"
       (string)
# 823 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv91) = Obj.magic _menhir_stack in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 832 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 836 "parser.ml"
    )) = _v in
    ((let _v : 'tv_nam = 
# 66 "parser.mly"
        ( _1 )
# 841 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv89) = _menhir_stack in
    let (_v : 'tv_nam) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv87 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    let (_v : 'tv_nam) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv85 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_nam) : 'tv_nam) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
    let _v : 'tv_typs = 
# 63 "parser.mly"
             ( _1@[_2] )
# 856 "parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv86)) : 'freshtv88)) : 'freshtv90)) : 'freshtv92)

and _menhir_goto_const : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_const -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv83) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_const) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv81) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_const) : 'tv_const) = _v in
    ((let _v : 'tv_exp = 
# 102 "parser.mly"
          ( _1 )
# 873 "parser.ml"
     in
    _menhir_goto_exp _menhir_env _menhir_stack _menhir_s _v) : 'freshtv82)) : 'freshtv84)

and _menhir_goto_exp_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_exp_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv79 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | CO_PRD_STT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | L_RCD ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ARR | CO_PRD | END_CO_PRD | EOF | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_exp_lst)) = _menhir_stack in
        let _v : 'tv_arr = 
# 85 "parser.mly"
            ( Exp.Rcd _1 )
# 908 "parser.ml"
         in
        _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv78)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv80)

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _v
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv65) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv66)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv67) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)) : 'freshtv70)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv75) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) _v
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv71) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _, (_2 : 'tv_typs)), _, (_4 : 'tv_typs)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_typ = 
# 34 "parser.mly"
                      ()
# 957 "parser.ml"
             in
            _menhir_goto_typ _menhir_env _menhir_stack _v) : 'freshtv72)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv73) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)) : 'freshtv76)
    | _ ->
        _menhir_fail ()

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv63) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_const = 
# 111 "parser.mly"
        ( Exp.Root )
# 980 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv64)

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | EXP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | AGL | APP | ARR | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT | R_RCD ->
        _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1025 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv61) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 9 "parser.mly"
       (int)
# 1035 "parser.ml"
    )) : (
# 9 "parser.mly"
       (int)
# 1039 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 110 "parser.mly"
        ( Exp.Z _1 )
# 1044 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv62)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1051 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv59) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 1061 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 1065 "parser.ml"
    )) = _v in
    ((let _v : 'tv_const = 
# 112 "parser.mly"
            ( Exp.Gl_call _1 )
# 1070 "parser.ml"
     in
    _menhir_goto_const _menhir_env _menhir_stack _menhir_s _v) : 'freshtv60)

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | EXP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | AGL | APP | ARR | CO_PRD | CO_PRD_STT | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
        _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState16
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_reduce20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_exp_lst = 
# 93 "parser.mly"
    ( [] )
# 1138 "parser.ml"
     in
    _menhir_goto_exp_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv21 * _menhir_state) * _menhir_state * 'tv_cnn_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv25 * _menhir_state * 'tv_arr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv27 * _menhir_state) * _menhir_state * 'tv_arr_base)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_exp_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * _menhir_state) * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv43 * _menhir_state * 'tv_exp)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState16 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState10 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv51 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1225 "parser.ml"
        )) * 'tv_typ)) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv53) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv55) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv56)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv58)

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> 'tv_typ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv19 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1250 "parser.ml"
    )) * 'tv_typ) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DEF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv15 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1260 "parser.ml"
        )) * 'tv_typ) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | EXP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | AGL | APP | ARR | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
            _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10) : 'freshtv16)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv17 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1282 "parser.ml"
        )) * 'tv_typ) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)) : 'freshtv20)

and _menhir_reduce31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 62 "parser.mly"
    ( [] )
# 1292 "parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AGL ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | APP ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | CO_PRD_STT ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | GL_NAM _v ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | INT _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | L_PRN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | L_RCD ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | ROT ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

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
      (Flow.Exp.buf)
# 1359 "parser.ml"
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
    let (_menhir_stack : 'freshtv13) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EXP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
            let (_v : (
# 8 "parser.mly"
       (string)
# 1396 "parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CLN ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                _menhir_reduce31 _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv2)
            | DEF ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
                ((let _v : 'tv_typ = 
# 33 "parser.mly"
    ()
# 1413 "parser.ml"
                 in
                _menhir_goto_typ _menhir_env _menhir_stack _v) : 'freshtv4)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv5 * _menhir_state) * (
# 8 "parser.mly"
       (string)
# 1423 "parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv6)) : 'freshtv8)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)) : 'freshtv12)
    | AGL | APP | ARR | CO_PRD_STT | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | ROT ->
        _menhir_reduce20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv14))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 1444 "parser.ml"
