
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
  | MenhirState53
  | MenhirState49
  | MenhirState47
  | MenhirState46
  | MenhirState45
  | MenhirState42
  | MenhirState40
  | MenhirState38
  | MenhirState37
  | MenhirState31
  | MenhirState26
  | MenhirState21
  | MenhirState20
  | MenhirState15
  | MenhirState13
  | MenhirState8
  | MenhirState6
  | MenhirState1
  | MenhirState0

# 1 "parser.mly"
  
open Flow

# 112 "parser.ml"

let rec _menhir_goto_gl_cod : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_cod -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv311 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv309 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState75 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv307 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cod)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 17 "parser.mly"
      (unit)
# 134 "parser.ml"
        ) = 
# 25 "parser.mly"
                (  )
# 138 "parser.ml"
         in
        _menhir_goto_text _menhir_env _menhir_stack _menhir_s _v) : 'freshtv308)) : 'freshtv310)
    | LCE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv312)

and _menhir_goto_gl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_etr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_gl_etr) : 'tv_gl_etr) = _v in
        ((let _v : 'tv_gl_cod = 
# 29 "parser.mly"
           (  )
# 163 "parser.ml"
         in
        _menhir_goto_gl_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv300)) : 'freshtv302)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv305 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_etr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv303 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_gl_etr) : 'tv_gl_etr) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cod)) = _menhir_stack in
        let _v : 'tv_gl_cod = 
# 30 "parser.mly"
                  (  )
# 179 "parser.ml"
         in
        _menhir_goto_gl_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)) : 'freshtv306)
    | _ ->
        _menhir_fail ()

and _menhir_goto_clq_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_clq_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv297 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv291 * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70) : 'freshtv292)
    | EOF | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv293 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_clq_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_gl_etr = 
# 35 "parser.mly"
                (  )
# 213 "parser.ml"
         in
        _menhir_goto_gl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv294)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv296)) : 'freshtv298)

and _menhir_goto_cprd_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cprd_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv289 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | CO_PRD_STT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | CO_PRD | END_CO_PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58) : 'freshtv284)
    | END_CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CO_PRD_STT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv286)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv288)) : 'freshtv290)

and _menhir_goto_prd_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | END_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | CO_PRD_STT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv276)
    | PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | CO_PRD_STT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | END_PRD | PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv278)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv280)) : 'freshtv282)

and _menhir_goto_lc_cod : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lc_cod -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv217 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_prd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_prd_lst = 
# 115 "parser.mly"
                        ()
# 345 "parser.ml"
         in
        _menhir_goto_prd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv218)) : 'freshtv220)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cprd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_cprd = 
# 104 "parser.mly"
                                ( [] )
# 362 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_cprd) : 'tv_cprd) = _v in
        ((let _v : 'tv_lc_cod = 
# 54 "parser.mly"
          ( Flow.Exp.CoPrd _1 )
# 379 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv222)) : 'freshtv224)) : 'freshtv226)) : 'freshtv228)) : 'freshtv230)
    | MenhirState56 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_base)) = _menhir_stack in
        let _v : 'tv_lc_cod = 
# 53 "parser.mly"
                     (Flow.Exp.Seq (_1,_2) )
# 395 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)) : 'freshtv234)
    | MenhirState58 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv237 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv235 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cprd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_cprd_lst = 
# 108 "parser.mly"
                            ()
# 412 "parser.ml"
         in
        _menhir_goto_cprd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv236)) : 'freshtv238)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv247 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_prd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_prd = 
# 111 "parser.mly"
                            ( [] )
# 429 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_prd) : 'tv_prd) = _v in
        ((let _v : 'tv_lc_cod = 
# 55 "parser.mly"
         ( Flow.Exp.Prd _1 )
# 446 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv240)) : 'freshtv242)) : 'freshtv244)) : 'freshtv246)) : 'freshtv248)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv249 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_cprd_lst = 
# 107 "parser.mly"
                      ()
# 463 "parser.ml"
         in
        _menhir_goto_cprd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv250)) : 'freshtv252)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv253 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_prd_lst = 
# 114 "parser.mly"
                   ()
# 480 "parser.ml"
         in
        _menhir_goto_prd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv254)) : 'freshtv256)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv273 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 488 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv271 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 496 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_7 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 8 "parser.mly"
       (string)
# 503 "parser.ml"
        ))), _, (_3 : 'tv_typs)), _, (_5 : 'tv_typs)) = _menhir_stack in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_lc_man = 
# 38 "parser.mly"
                                     ( )
# 511 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_man) = _v in
        ((match _menhir_s with
        | MenhirState66 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv259 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv257 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_clq_lst = 
# 41 "parser.mly"
               (  )
# 532 "parser.ml"
             in
            _menhir_goto_clq_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv258)) : 'freshtv260)
        | MenhirState38 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv263 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_gl_etr = 
# 34 "parser.mly"
               (   )
# 549 "parser.ml"
             in
            _menhir_goto_gl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv262)) : 'freshtv264)
        | MenhirState70 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv267 * _menhir_state * 'tv_clq_lst)) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv265 * _menhir_state * 'tv_clq_lst)) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_3 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_clq_lst)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_clq_lst = 
# 42 "parser.mly"
                       ( )
# 566 "parser.ml"
             in
            _menhir_goto_clq_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)) : 'freshtv268)
        | _ ->
            _menhir_fail ()) : 'freshtv270)) : 'freshtv272)) : 'freshtv274)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arr_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arr_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state) * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | L_CNN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | L_PRN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv203 * _menhir_state) * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState26 in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv201 * _menhir_state) * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_arr_lst)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_canon = 
# 73 "parser.mly"
                        ( Flow.Exp.Canon _2 )
# 608 "parser.ml"
             in
            _menhir_goto_canon _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)) : 'freshtv204)
        | VAL _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26) : 'freshtv206)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | L_CNN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | L_PRN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | VAL _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | LCE | PRD | PRD_STT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv213 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_lst)) = _menhir_stack in
            let _v : 'tv_canon_base = 
# 62 "parser.mly"
            ( Exp.Canon _1 )
# 642 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv211) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_canon_base) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv209 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_canon_base) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_3 : 'tv_canon_base) : 'tv_canon_base) = _v in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_arr_base = 
# 58 "parser.mly"
                        ( _3 )
# 662 "parser.ml"
             in
            _menhir_goto_arr_base _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)) : 'freshtv210)) : 'freshtv212)) : 'freshtv214)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv216)
    | _ ->
        _menhir_fail ()

and _menhir_reduce28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lc_cod = 
# 52 "parser.mly"
    ( Flow.Exp.End )
# 677 "parser.ml"
     in
    _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CO_PRD_STT ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | PRD_STT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | END_PRD | PRD ->
        _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | CO_PRD_STT ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | PRD_STT ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | CO_PRD | END_CO_PRD ->
        _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run44 : _menhir_env -> 'ttv_tail -> (
# 8 "parser.mly"
       (string)
# 722 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv199) = Obj.magic _menhir_stack in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 731 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 735 "parser.ml"
    )) = _v in
    ((let _v : 'tv_nam = 
# 49 "parser.mly"
        ( _1 )
# 740 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv197) = _menhir_stack in
    let (_v : 'tv_nam) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv195 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    let (_v : 'tv_nam) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv193 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_nam) : 'tv_nam) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
    let _v : 'tv_typs = 
# 46 "parser.mly"
             ( _1@[_2] )
# 755 "parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv194)) : 'freshtv196)) : 'freshtv198)) : 'freshtv200)

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
        let (_menhir_stack : 'freshtv189 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv185 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_base)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 816 "parser.ml"
            ) = 
# 21 "parser.mly"
                 ( _1 )
# 820 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv181) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 828 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv179) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 836 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv177) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 844 "parser.ml"
            )) : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 848 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv178)) : 'freshtv180)) : 'freshtv182)) : 'freshtv184)) : 'freshtv186)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv187 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)) : 'freshtv190)
    | MenhirState45 | MenhirState46 | MenhirState47 | MenhirState60 | MenhirState49 | MenhirState58 | MenhirState56 | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv191 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | CO_PRD_STT ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | PRD_STT ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
            _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56) : 'freshtv192)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState31 | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_arr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv169 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_arr) : 'tv_arr) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr_lst)) = _menhir_stack in
        let _v : 'tv_arr_lst = 
# 77 "parser.mly"
                ( _1@[_2] )
# 895 "parser.ml"
         in
        _menhir_goto_arr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv170)) : 'freshtv172)
    | MenhirState20 | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv175) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_arr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_arr) : 'tv_arr) = _v in
        ((let _v : 'tv_arr_lst = 
# 76 "parser.mly"
        ( [_1] )
# 910 "parser.ml"
         in
        _menhir_goto_arr_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)) : 'freshtv176)
    | _ ->
        _menhir_fail ()

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv161 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 925 "parser.ml"
        ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _v
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv157 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 937 "parser.ml"
            ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv158)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 948 "parser.ml"
            ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)) : 'freshtv162)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv167 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 957 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv163 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 967 "parser.ml"
            ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ARR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | CO_PRD_STT ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | PRD_STT ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | CLQ | EOF | LCE ->
                _menhir_reduce28 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv164)
        | NAM _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv165 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 993 "parser.ml"
            ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)) : 'freshtv168)
    | _ ->
        _menhir_fail ()

and _menhir_goto_val__ : _menhir_env -> 'ttv_tail -> 'tv_val__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv155 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 1007 "parser.ml"
    )) * 'tv_val__) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_VAL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143 * 'tv_val__) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (int)
# 1018 "parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141 * 'tv_val__) = Obj.magic _menhir_stack in
        let ((_2 : (
# 9 "parser.mly"
       (int)
# 1026 "parser.ml"
        )) : (
# 9 "parser.mly"
       (int)
# 1030 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, (_1 : 'tv_val__)) = _menhir_stack in
        let _v : 'tv_val__ = 
# 102 "parser.mly"
                  ( _1@[_2] )
# 1036 "parser.ml"
         in
        _menhir_goto_val__ _menhir_env _menhir_stack _v) : 'freshtv142)) : 'freshtv144)
    | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | GL_NAM _ | INT _ | LCE | L_CNN | L_PRN | L_RCD | MLT | PLS | PRD | PRD_STT | R_PRN | R_RCD | VAL _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv151 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 1044 "parser.ml"
        )) * 'tv_val__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 9 "parser.mly"
       (int)
# 1049 "parser.ml"
        ))), (_2 : 'tv_val__)) = _menhir_stack in
        let _v : 'tv_val_ = 
# 98 "parser.mly"
              ( Exp.Val (_1::_2) )
# 1054 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_val_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_val_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_val_) : 'tv_val_) = _v in
        ((let _v : 'tv_poly = 
# 92 "parser.mly"
          ( _1 )
# 1071 "parser.ml"
         in
        _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv146)) : 'freshtv148)) : 'freshtv150)) : 'freshtv152)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv153 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 1081 "parser.ml"
        )) * 'tv_val__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)) : 'freshtv156)

and _menhir_goto_gl_cll_lst : _menhir_env -> 'ttv_tail -> 'tv_gl_cll_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv139 * _menhir_state) * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
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
        let (_menhir_stack : ('freshtv137 * _menhir_state) * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState6 in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state) * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let ((_menhir_stack, _menhir_s), (_2 : 'tv_gl_cll_lst)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_gl_cll = 
# 86 "parser.mly"
                            ( Exp.Rcd _2 )
# 1116 "parser.ml"
         in
        _menhir_goto_gl_cll _menhir_env _menhir_stack _menhir_s _v) : 'freshtv136)) : 'freshtv138)
    | VAL _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6) : 'freshtv140)

and _menhir_goto_canon : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_canon -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_canon) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv131) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_canon) : 'tv_canon) = _v in
    ((let _v : 'tv_arr = 
# 68 "parser.mly"
           ( _1 )
# 1139 "parser.ml"
     in
    _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv132)) : 'freshtv134)

and _menhir_goto_poly : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_poly -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState8 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv113 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | R_PRN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv109 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv107 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_poly)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_poly = 
# 96 "parser.mly"
                     ( _2 )
# 1169 "parser.ml"
             in
            _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)) : 'freshtv110)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv111 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)) : 'freshtv114)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv119 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | GL_NAM _ | INT _ | LCE | L_CNN | L_PRN | L_RCD | PLS | PRD | PRD_STT | R_PRN | R_RCD | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv115 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_poly)), _, (_3 : 'tv_poly)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_poly = 
# 94 "parser.mly"
                  ( Exp.Plus (_1,_3) )
# 1195 "parser.ml"
             in
            _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv116)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv117 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)) : 'freshtv120)
    | MenhirState15 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_poly)), _, (_3 : 'tv_poly)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_poly = 
# 95 "parser.mly"
                  ( Exp.Mult (_1,_3) )
# 1215 "parser.ml"
         in
        _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv122)) : 'freshtv124)
    | MenhirState1 | MenhirState31 | MenhirState20 | MenhirState26 | MenhirState21 | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | GL_NAM _ | INT _ | LCE | L_CNN | L_PRN | L_RCD | PRD | PRD_STT | R_RCD | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv125 * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_poly)) = _menhir_stack in
            let _v : 'tv_gl_cll = 
# 85 "parser.mly"
         ( (Flow.Exp.Poly _1) )
# 1235 "parser.ml"
             in
            _menhir_goto_gl_cll _menhir_env _menhir_stack _menhir_s _v) : 'freshtv126)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv127 * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)) : 'freshtv130)
    | _ ->
        _menhir_fail ()

and _menhir_goto_gl_cll : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_cll -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_cll) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_gl_cll) : 'tv_gl_cll) = _v in
        ((let (_menhir_stack, (_1 : 'tv_gl_cll_lst)) = _menhir_stack in
        let _v : 'tv_gl_cll_lst = 
# 81 "parser.mly"
                      ( _1@[_2] )
# 1264 "parser.ml"
         in
        _menhir_goto_gl_cll_lst _menhir_env _menhir_stack _v) : 'freshtv84)) : 'freshtv86)
    | MenhirState31 | MenhirState20 | MenhirState26 | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_cll) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_gl_cll) : 'tv_gl_cll) = _v in
        ((let _v : 'tv_exp = 
# 89 "parser.mly"
           ( Exp.Exp _1 )
# 1279 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_exp) : 'tv_exp) = _v in
        ((let _v : 'tv_arr = 
# 69 "parser.mly"
         ( _1 )
# 1296 "parser.ml"
         in
        _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv88)) : 'freshtv90)) : 'freshtv92)) : 'freshtv94)) : 'freshtv96)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_cll) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_gl_cll) : 'tv_gl_cll) = _v in
        ((let _v : 'tv_exp_base = 
# 65 "parser.mly"
            ( Exp.Exp _1 )
# 1311 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp_base) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_exp_base) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_exp_base) : 'tv_exp_base) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_arr_base = 
# 59 "parser.mly"
                 ( _2 )
# 1330 "parser.ml"
         in
        _menhir_goto_arr_base _menhir_env _menhir_stack _menhir_s _v) : 'freshtv98)) : 'freshtv100)) : 'freshtv102)) : 'freshtv104)) : 'freshtv106)
    | _ ->
        _menhir_fail ()

and _menhir_reduce44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 45 "parser.mly"
    ( [] )
# 1341 "parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1348 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv81) = Obj.magic _menhir_stack in
    ((let _v : 'tv_val__ = 
# 101 "parser.mly"
    ( [] )
# 1358 "parser.ml"
     in
    _menhir_goto_val__ _menhir_env _menhir_stack _v) : 'freshtv82)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv79) = Obj.magic _menhir_stack in
    ((let _v : 'tv_gl_cll_lst = 
# 80 "parser.mly"
     ( [] )
# 1371 "parser.ml"
     in
    _menhir_goto_gl_cll_lst _menhir_env _menhir_stack _v) : 'freshtv80)

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

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | GL_NAM _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | L_CNN ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_PRN ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | L_RCD ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | R_RCD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv77 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState21 in
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
# 1422 "parser.ml"
         in
        _menhir_goto_canon _menhir_env _menhir_stack _menhir_s _v) : 'freshtv76)) : 'freshtv78)
    | VAL _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1435 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 9 "parser.mly"
       (int)
# 1445 "parser.ml"
    )) : (
# 9 "parser.mly"
       (int)
# 1449 "parser.ml"
    )) = _v in
    ((let _v : 'tv_poly = 
# 93 "parser.mly"
        ( (Z _1) )
# 1454 "parser.ml"
     in
    _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv74)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1461 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv71) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 1471 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 1475 "parser.ml"
    )) = _v in
    ((let _v : 'tv_gl_cll = 
# 84 "parser.mly"
           ( (Exp.Ax _1) )
# 1480 "parser.ml"
     in
    _menhir_goto_gl_cll _menhir_env _menhir_stack _menhir_s _v) : 'freshtv72)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1487 "parser.ml"
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
# 1499 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState40) : 'freshtv68)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1510 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CNN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState1 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | INT _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | L_CNN ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | L_PRN ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | L_RCD ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState20
        | VAL _v ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20) : 'freshtv66)
    | GL_NAM _v ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
    | INT _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState1 _v
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
        let (_menhir_stack : 'freshtv25 * _menhir_state * 'tv_arr_base) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv35 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1618 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv37 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1627 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1636 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv44)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState26 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state) * _menhir_state * 'tv_arr_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState20 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
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
        let (_menhir_stack : ('freshtv59 * _menhir_state) * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv63) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv64)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState38 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv14)
    | NAM _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_goto_text : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "parser.mly"
      (unit)
# 1729 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 17 "parser.mly"
      (unit)
# 1738 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "parser.mly"
      (unit)
# 1746 "parser.ml"
    )) : (
# 17 "parser.mly"
      (unit)
# 1750 "parser.ml"
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
# 1779 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv8))

and text : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 17 "parser.mly"
      (unit)
# 1798 "parser.ml"
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
        let (_menhir_s : _menhir_state) = MenhirState37 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : (
# 17 "parser.mly"
      (unit)
# 1818 "parser.ml"
        ) = 
# 24 "parser.mly"
        ()
# 1822 "parser.ml"
         in
        _menhir_goto_text _menhir_env _menhir_stack _menhir_s _v) : 'freshtv2)) : 'freshtv4)
    | LCE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37) : 'freshtv6))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 1835 "parser.ml"
