
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | VAL of (
# 9 "parser.mly"
       (int)
# 11 "parser.ml"
  )
    | TEST
    | STT
    | SRC
    | R_RCD
    | R_PRN
    | R_CNN
    | PRD_STT
    | PRD
    | PLS
    | NAM of (
# 8 "parser.mly"
       (string)
# 25 "parser.ml"
  )
    | MLT
    | L_RCD
    | L_PRN
    | L_CNN
    | LCE
    | INT of (
# 9 "parser.mly"
       (int)
# 35 "parser.ml"
  )
    | GL_NAM of (
# 8 "parser.mly"
       (string)
# 40 "parser.ml"
  )
    | EXP_GL_NAM of (
# 8 "parser.mly"
       (string)
# 45 "parser.ml"
  )
    | EXP
    | EOF
    | END_PRD
    | END_CO_PRD
    | END
    | D_EXP
    | DOT_VAL of (
# 9 "parser.mly"
       (int)
# 56 "parser.ml"
  )
    | DEF
    | CO_PRD_STT
    | CO_PRD
    | CNN
    | CLQ
    | CLN
    | ARR_CNN
    | ARR
  
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
  | MenhirState75
  | MenhirState70
  | MenhirState66
  | MenhirState60
  | MenhirState58
  | MenhirState56
  | MenhirState52
  | MenhirState48
  | MenhirState46
  | MenhirState45
  | MenhirState44
  | MenhirState41
  | MenhirState39
  | MenhirState37
  | MenhirState36
  | MenhirState31
  | MenhirState30
  | MenhirState25
  | MenhirState20
  | MenhirState15
  | MenhirState13
  | MenhirState8
  | MenhirState6
  | MenhirState5
  | MenhirState1
  | MenhirState0

# 1 "parser.mly"
  
open Flow

# 113 "parser.ml"

let rec _menhir_goto_gl_cod : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_cod -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv313 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv311 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState75 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cod)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 17 "parser.mly"
      (unit)
# 135 "parser.ml"
        ) = 
# 25 "parser.mly"
                (  )
# 139 "parser.ml"
         in
        _menhir_goto_text _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)) : 'freshtv312)
    | LCE ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv314)

and _menhir_goto_gl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_etr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_gl_etr) : 'tv_gl_etr) = _v in
        ((let _v : 'tv_gl_cod = 
# 29 "parser.mly"
           (  )
# 164 "parser.ml"
         in
        _menhir_goto_gl_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv302)) : 'freshtv304)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_etr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_gl_etr) : 'tv_gl_etr) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cod)) = _menhir_stack in
        let _v : 'tv_gl_cod = 
# 30 "parser.mly"
                  (  )
# 180 "parser.ml"
         in
        _menhir_goto_gl_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv306)) : 'freshtv308)
    | _ ->
        _menhir_fail ()

and _menhir_goto_clq_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_clq_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv299 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv294)
    | EOF | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_clq_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_gl_etr = 
# 35 "parser.mly"
                (  )
# 214 "parser.ml"
         in
        _menhir_goto_gl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv297 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv298)) : 'freshtv300)

and _menhir_goto_cprd_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cprd_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv291 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | CO_PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PRD_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | CO_PRD | END_CO_PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | ARR | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv286)
    | END_CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | CO_PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | PRD_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | ARR | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52) : 'freshtv288)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv290)) : 'freshtv292)

and _menhir_goto_prd_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv283 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | END_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | CO_PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PRD_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | ARR | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv278)
    | PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | CNN ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | CO_PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PRD_STT ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | END_PRD | PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | ARR | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv280)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)) : 'freshtv284)

and _menhir_goto_lc_cod : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lc_cod -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv221 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_prd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_prd_lst = 
# 115 "parser.mly"
                        ()
# 354 "parser.ml"
         in
        _menhir_goto_prd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)) : 'freshtv222)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cprd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_cprd = 
# 104 "parser.mly"
                                ( [] )
# 371 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv227) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_cprd) : 'tv_cprd) = _v in
        ((let _v : 'tv_lc_cod = 
# 54 "parser.mly"
          ( Flow.Exp.CoPrd _1 )
# 388 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)) : 'freshtv226)) : 'freshtv228)) : 'freshtv230)) : 'freshtv232)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv235 * _menhir_state * 'tv_arr_base)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv233 * _menhir_state * 'tv_arr_base)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_base)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_lc_cod = 
# 53 "parser.mly"
                         (Flow.Exp.Seq (_1,_3) )
# 405 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv234)) : 'freshtv236)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv239 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv237 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cprd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_cprd_lst = 
# 108 "parser.mly"
                            ()
# 422 "parser.ml"
         in
        _menhir_goto_cprd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv238)) : 'freshtv240)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv249 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_prd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_prd = 
# 111 "parser.mly"
                            ( [] )
# 439 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv245) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_prd) : 'tv_prd) = _v in
        ((let _v : 'tv_lc_cod = 
# 55 "parser.mly"
         ( Flow.Exp.Prd _1 )
# 456 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)) : 'freshtv244)) : 'freshtv246)) : 'freshtv248)) : 'freshtv250)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv253 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_cprd_lst = 
# 107 "parser.mly"
                      ()
# 473 "parser.ml"
         in
        _menhir_goto_cprd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv252)) : 'freshtv254)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_prd_lst = 
# 114 "parser.mly"
                   ()
# 490 "parser.ml"
         in
        _menhir_goto_prd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)) : 'freshtv258)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv275 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 498 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv273 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 506 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_7 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 8 "parser.mly"
       (string)
# 513 "parser.ml"
        ))), _, (_3 : 'tv_typs)), _, (_5 : 'tv_typs)) = _menhir_stack in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_lc_man = 
# 38 "parser.mly"
                                     ( )
# 521 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_man) = _v in
        ((match _menhir_s with
        | MenhirState66 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv259 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_clq_lst = 
# 41 "parser.mly"
               (  )
# 542 "parser.ml"
             in
            _menhir_goto_clq_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)) : 'freshtv262)
        | MenhirState37 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv265 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv263 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_gl_etr = 
# 34 "parser.mly"
               (   )
# 559 "parser.ml"
             in
            _menhir_goto_gl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv264)) : 'freshtv266)
        | MenhirState70 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv269 * _menhir_state * 'tv_clq_lst)) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv267 * _menhir_state * 'tv_clq_lst)) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_3 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_clq_lst)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_clq_lst = 
# 42 "parser.mly"
                       ( )
# 576 "parser.ml"
             in
            _menhir_goto_clq_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)) : 'freshtv270)
        | _ ->
            _menhir_fail ()) : 'freshtv272)) : 'freshtv274)) : 'freshtv276)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | L_CNN ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | L_PRN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv205 * _menhir_state) * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState25 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv203 * _menhir_state) * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_arr_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_canon = 
# 73 "parser.mly"
                        ( Flow.Exp.Canon _2 )
# 618 "parser.ml"
             in
            _menhir_goto_canon _menhir_env _menhir_stack _menhir_s _v) : 'freshtv204)) : 'freshtv206)
        | VAL _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25) : 'freshtv208)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | L_CNN ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | L_PRN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | VAL _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | ARR | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_lst)) = _menhir_stack in
            let _v : 'tv_canon_base = 
# 62 "parser.mly"
            ( Exp.Canon _1 )
# 652 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv213) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_canon_base) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv211 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_canon_base) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv209 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_canon_base) : 'tv_canon_base) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_arr_base = 
# 58 "parser.mly"
                    ( _2 )
# 671 "parser.ml"
             in
            _menhir_goto_arr_base _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)) : 'freshtv212)) : 'freshtv214)) : 'freshtv216)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv218)
    | _ ->
        _menhir_fail ()

and _menhir_run43 : _menhir_env -> 'ttv_tail -> (
# 8 "parser.mly"
       (string)
# 684 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 693 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 697 "parser.ml"
    )) = _v in
    ((let _v : 'tv_nam = 
# 49 "parser.mly"
        ( _1 )
# 702 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv199) = _menhir_stack in
    let (_v : 'tv_nam) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv197 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    let (_v : 'tv_nam) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv195 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_nam) : 'tv_nam) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
    let _v : 'tv_typs = 
# 46 "parser.mly"
             ( _1@[_2] )
# 717 "parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv196)) : 'freshtv198)) : 'freshtv200)) : 'freshtv202)

and _menhir_reduce28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lc_cod = 
# 52 "parser.mly"
    ( Flow.Exp.End )
# 726 "parser.ml"
     in
    _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | CO_PRD_STT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | PRD_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | END_PRD | PRD ->
        _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | ARR | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
        _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CO_PRD_STT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | PRD_STT ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CO_PRD | END_CO_PRD ->
        _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | ARR | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
        _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_poly -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | L_PRN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | VAL _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run15 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_poly -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | L_PRN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | VAL _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_goto_arr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState30 | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_arr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_arr) : 'tv_arr) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_lst)) = _menhir_stack in
        let _v : 'tv_arr_lst = 
# 77 "parser.mly"
                ( _1@[_2] )
# 820 "parser.ml"
         in
        _menhir_goto_arr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)) : 'freshtv190)
    | MenhirState1 | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv193) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_arr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_arr) : 'tv_arr) = _v in
        ((let _v : 'tv_arr_lst = 
# 76 "parser.mly"
        ( [_1] )
# 835 "parser.ml"
         in
        _menhir_goto_arr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv192)) : 'freshtv194)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 850 "parser.ml"
        ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _v
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv175 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 862 "parser.ml"
            ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState41) : 'freshtv176)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv177 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 873 "parser.ml"
            ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)) : 'freshtv180)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv185 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 882 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv181 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 892 "parser.ml"
            ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | CO_PRD_STT ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | PRD_STT ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | CLQ | EOF | LCE ->
                _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | ARR | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
                _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv182)
        | NAM _v ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv183 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 920 "parser.ml"
            ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)) : 'freshtv186)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_arr_base : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arr_base -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv167 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv163 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv161 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_base)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 952 "parser.ml"
            ) = 
# 21 "parser.mly"
                 ( _1 )
# 956 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv159) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 964 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv157) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 972 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 980 "parser.ml"
            )) : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 984 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv156)) : 'freshtv158)) : 'freshtv160)) : 'freshtv162)) : 'freshtv164)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv165 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)) : 'freshtv168)
    | MenhirState44 | MenhirState45 | MenhirState46 | MenhirState60 | MenhirState48 | MenhirState58 | MenhirState56 | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | CNN ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | CO_PRD_STT ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | PRD_STT ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
                _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | ARR | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
                _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv170)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv171 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)) : 'freshtv174)
    | _ ->
        _menhir_fail ()

and _menhir_goto_val__ : _menhir_env -> 'ttv_tail -> 'tv_val__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv153 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 1037 "parser.ml"
    )) * 'tv_val__) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_VAL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * 'tv_val__) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (int)
# 1048 "parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * 'tv_val__) = Obj.magic _menhir_stack in
        let ((_2 : (
# 9 "parser.mly"
       (int)
# 1056 "parser.ml"
        )) : (
# 9 "parser.mly"
       (int)
# 1060 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, (_1 : 'tv_val__)) = _menhir_stack in
        let _v : 'tv_val__ = 
# 102 "parser.mly"
                  ( _1@[_2] )
# 1066 "parser.ml"
         in
        _menhir_goto_val__ _menhir_env _menhir_stack _v) : 'freshtv140)) : 'freshtv142)
    | ARR | EOF | GL_NAM _ | INT _ | L_CNN | L_PRN | L_RCD | MLT | PLS | R_PRN | R_RCD | VAL _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv149 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 1074 "parser.ml"
        )) * 'tv_val__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 9 "parser.mly"
       (int)
# 1079 "parser.ml"
        ))), (_2 : 'tv_val__)) = _menhir_stack in
        let _v : 'tv_val_ = 
# 98 "parser.mly"
              ( Exp.Val (_1::_2) )
# 1084 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_val_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_val_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_val_) : 'tv_val_) = _v in
        ((let _v : 'tv_poly = 
# 92 "parser.mly"
          ( _1 )
# 1101 "parser.ml"
         in
        _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)) : 'freshtv146)) : 'freshtv148)) : 'freshtv150)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 1111 "parser.ml"
        )) * 'tv_val__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)) : 'freshtv154)

and _menhir_goto_canon : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_canon -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv137) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_canon) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv135) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_canon) : 'tv_canon) = _v in
    ((let _v : 'tv_arr = 
# 68 "parser.mly"
           ( _1 )
# 1129 "parser.ml"
     in
    _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv136)) : 'freshtv138)

and _menhir_goto_poly : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_poly -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv113 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv111 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_poly)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_poly = 
# 96 "parser.mly"
                     ( _2 )
# 1159 "parser.ml"
             in
            _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)) : 'freshtv114)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv115 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)) : 'freshtv118)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | ARR | EOF | GL_NAM _ | INT _ | L_CNN | L_PRN | L_RCD | PLS | R_PRN | R_RCD | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv119 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_poly)), _, (_3 : 'tv_poly)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_poly = 
# 94 "parser.mly"
                  ( Exp.Plus (_1,_3) )
# 1185 "parser.ml"
             in
            _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)) : 'freshtv124)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv125 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_poly)), _, (_3 : 'tv_poly)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_poly = 
# 95 "parser.mly"
                  ( Exp.Mult (_1,_3) )
# 1205 "parser.ml"
         in
        _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv126)) : 'freshtv128)
    | MenhirState31 | MenhirState30 | MenhirState1 | MenhirState25 | MenhirState20 | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | ARR | EOF | GL_NAM _ | INT _ | L_CNN | L_PRN | L_RCD | R_RCD | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_poly)) = _menhir_stack in
            let _v : 'tv_gl_cll = 
# 85 "parser.mly"
         ( (Flow.Exp.Poly _1) )
# 1225 "parser.ml"
             in
            _menhir_goto_gl_cll _menhir_env _menhir_stack _menhir_s _v) : 'freshtv130)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)) : 'freshtv134)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_cll : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_cll -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState31 | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_cll) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_gl_cll) : 'tv_gl_cll) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cll_lst)) = _menhir_stack in
        let _v : 'tv_gl_cll_lst = 
# 81 "parser.mly"
                      ( _1@[_2] )
# 1254 "parser.ml"
         in
        _menhir_goto_gl_cll_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv98)) : 'freshtv100)
    | MenhirState30 | MenhirState1 | MenhirState25 | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_cll) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_gl_cll) : 'tv_gl_cll) = _v in
        ((let _v : 'tv_exp = 
# 89 "parser.mly"
           ( Exp.Exp _1 )
# 1269 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_exp) : 'tv_exp) = _v in
        ((let _v : 'tv_arr = 
# 69 "parser.mly"
         ( _1 )
# 1286 "parser.ml"
         in
        _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv102)) : 'freshtv104)) : 'freshtv106)) : 'freshtv108)) : 'freshtv110)
    | _ ->
        _menhir_fail ()

and _menhir_reduce44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 45 "parser.mly"
    ( [] )
# 1297 "parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_gl_cll_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_cll_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state) * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | L_PRN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv83 * _menhir_state) * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState6 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv81 * _menhir_state) * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_gl_cll_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_gl_cll = 
# 86 "parser.mly"
                            ( Exp.Rcd _2 )
# 1333 "parser.ml"
             in
            _menhir_goto_gl_cll _menhir_env _menhir_stack _menhir_s _v) : 'freshtv82)) : 'freshtv84)
        | VAL _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv86)
    | MenhirState44 | MenhirState45 | MenhirState46 | MenhirState60 | MenhirState58 | MenhirState56 | MenhirState52 | MenhirState48 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | L_PRN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | VAL _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | ARR | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cll_lst)) = _menhir_stack in
            let _v : 'tv_exp_base = 
# 65 "parser.mly"
                ( Exp.Exp (Exp.Rcd _1) )
# 1365 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv91) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_exp_base) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_exp_base) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_exp_base) : 'tv_exp_base) = _v in
            ((let _v : 'tv_arr_base = 
# 59 "parser.mly"
             ( _1 )
# 1382 "parser.ml"
             in
            _menhir_goto_arr_base _menhir_env _menhir_stack _menhir_s _v) : 'freshtv88)) : 'freshtv90)) : 'freshtv92)) : 'freshtv94)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv96)
    | _ ->
        _menhir_fail ()

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1395 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv79) = Obj.magic _menhir_stack in
    ((let _v : 'tv_val__ = 
# 101 "parser.mly"
    ( [] )
# 1405 "parser.ml"
     in
    _menhir_goto_val__ _menhir_env _menhir_stack _v) : 'freshtv80)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | L_PRN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | VAL _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | GL_NAM _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | L_CNN ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | L_PRN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | L_RCD ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState20
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState20 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_canon = 
# 72 "parser.mly"
                  ( Flow.Exp.Canon [] )
# 1462 "parser.ml"
         in
        _menhir_goto_canon _menhir_env _menhir_stack _menhir_s _v) : 'freshtv76)) : 'freshtv78)
    | VAL _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1475 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 9 "parser.mly"
       (int)
# 1485 "parser.ml"
    )) : (
# 9 "parser.mly"
       (int)
# 1489 "parser.ml"
    )) = _v in
    ((let _v : 'tv_poly = 
# 93 "parser.mly"
        ( (Z _1) )
# 1494 "parser.ml"
     in
    _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv74)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1501 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv71) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 1511 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 1515 "parser.ml"
    )) = _v in
    ((let _v : 'tv_gl_cll = 
# 84 "parser.mly"
           ( (Exp.Ax _1) )
# 1520 "parser.ml"
     in
    _menhir_goto_gl_cll _menhir_env _menhir_stack _menhir_s _v) : 'freshtv72)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1527 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1539 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv68)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1550 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)

and _menhir_reduce22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_cll_lst = 
# 80 "parser.mly"
     ( [] )
# 1560 "parser.ml"
     in
    _menhir_goto_gl_cll_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | GL_NAM _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | L_CNN ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | L_PRN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | L_RCD ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | VAL _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv17 * _menhir_state * 'tv_clq_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv21 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv25 * _menhir_state * 'tv_arr_base)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState52 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv35 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1645 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv37 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1654 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1663 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState36 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv44)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state) * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * 'tv_poly)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * 'tv_poly)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state) * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv66)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState37 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv14)
    | NAM _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37

and _menhir_goto_text : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "parser.mly"
      (unit)
# 1761 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 17 "parser.mly"
      (unit)
# 1770 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "parser.mly"
      (unit)
# 1778 "parser.ml"
    )) : (
# 17 "parser.mly"
      (unit)
# 1782 "parser.ml"
    )) = _v in
    (Obj.magic _1 : 'freshtv10)) : 'freshtv12)

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
# 18 "parser.mly"
      (Flow.Exp.arr)
# 1811 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
        _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv8))

and text : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 17 "parser.mly"
      (unit)
# 1832 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState36 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : (
# 17 "parser.mly"
      (unit)
# 1852 "parser.ml"
        ) = 
# 24 "parser.mly"
        ()
# 1856 "parser.ml"
         in
        _menhir_goto_text _menhir_env _menhir_stack _menhir_s _v) : 'freshtv2)) : 'freshtv4)
    | LCE ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36) : 'freshtv6))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 1869 "parser.ml"
