
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
    | PRD_STT
    | PRD
    | PLS
    | NAM of (
# 8 "parser.mly"
       (string)
# 24 "parser.ml"
  )
    | MLT
    | L_RCD
    | L_PRN
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
    | EOF
    | END_PRD
    | END_CO_PRD
    | END
    | DOT_VAL of (
# 9 "parser.mly"
       (int)
# 48 "parser.ml"
  )
    | DEF
    | CO_PRD_STT
    | CO_PRD
    | CLQ
    | CLN
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
  | MenhirState69
  | MenhirState64
  | MenhirState60
  | MenhirState53
  | MenhirState51
  | MenhirState48
  | MenhirState44
  | MenhirState42
  | MenhirState41
  | MenhirState40
  | MenhirState39
  | MenhirState38
  | MenhirState35
  | MenhirState33
  | MenhirState31
  | MenhirState30
  | MenhirState21
  | MenhirState19
  | MenhirState18
  | MenhirState13
  | MenhirState11
  | MenhirState6
  | MenhirState2
  | MenhirState1
  | MenhirState0

# 1 "parser.mly"
  
open Flow

# 102 "parser.ml"

let rec _menhir_goto_gl_cod : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_cod -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv289 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState69 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cod)) = _menhir_stack in
        let _2 = () in
        let _v : (
# 17 "parser.mly"
      (unit)
# 124 "parser.ml"
        ) = 
# 25 "parser.mly"
                (  )
# 128 "parser.ml"
         in
        _menhir_goto_text _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)) : 'freshtv288)
    | LCE ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69) : 'freshtv290)

and _menhir_goto_gl_etr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_etr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_etr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_gl_etr) : 'tv_gl_etr) = _v in
        ((let _v : 'tv_gl_cod = 
# 29 "parser.mly"
           (  )
# 153 "parser.ml"
         in
        _menhir_goto_gl_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv278)) : 'freshtv280)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_etr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_gl_etr) : 'tv_gl_etr) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cod)) = _menhir_stack in
        let _v : 'tv_gl_cod = 
# 30 "parser.mly"
                  (  )
# 169 "parser.ml"
         in
        _menhir_goto_gl_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv282)) : 'freshtv284)
    | _ ->
        _menhir_fail ()

and _menhir_goto_clq_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_clq_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv275 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269 * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64) : 'freshtv270)
    | EOF | LCE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_clq_lst)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_gl_etr = 
# 35 "parser.mly"
                (  )
# 203 "parser.ml"
         in
        _menhir_goto_gl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv273 * _menhir_state) * _menhir_state * 'tv_clq_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)) : 'freshtv276)

and _menhir_goto_cprd_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cprd_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv267 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | CO_PRD_STT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PRD_STT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | CO_PRD | END_CO_PRD ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv262)
    | END_CO_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv263 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | CO_PRD_STT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PRD_STT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48) : 'freshtv264)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265 * _menhir_state * 'tv_cprd_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv266)) : 'freshtv268)

and _menhir_goto_prd_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_prd_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv259 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | END_PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv253 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CO_PRD_STT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PRD_STT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53) : 'freshtv254)
    | PRD ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv255 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | CO_PRD_STT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | PRD_STT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | END_PRD | PRD ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44) : 'freshtv256)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state * 'tv_prd_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)) : 'freshtv260)

and _menhir_goto_lc_cod : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_lc_cod -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv197 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv195 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_prd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_prd_lst = 
# 104 "parser.mly"
                        ()
# 335 "parser.ml"
         in
        _menhir_goto_prd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv196)) : 'freshtv198)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cprd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_cprd = 
# 93 "parser.mly"
                                ( [] )
# 352 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_cprd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv199) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_cprd) : 'tv_cprd) = _v in
        ((let _v : 'tv_lc_cod = 
# 54 "parser.mly"
          ( Flow.Exp.CoPrd _1 )
# 369 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv200)) : 'freshtv202)) : 'freshtv204)) : 'freshtv206)) : 'freshtv208)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv211 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv209 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_cprd_lst)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_cprd_lst = 
# 97 "parser.mly"
                            ()
# 386 "parser.ml"
         in
        _menhir_goto_cprd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)) : 'freshtv212)
    | MenhirState53 ->
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
        let _v : 'tv_prd = 
# 100 "parser.mly"
                            ( [] )
# 403 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_prd) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_prd) : 'tv_prd) = _v in
        ((let _v : 'tv_lc_cod = 
# 55 "parser.mly"
         ( Flow.Exp.Prd _1 )
# 420 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv214)) : 'freshtv216)) : 'freshtv218)) : 'freshtv220)) : 'freshtv222)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv225 * _menhir_state) * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv223 * _menhir_state) * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_arr)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_lc_cod = 
# 53 "parser.mly"
                    (Flow.Exp.Seq (_2,_3) )
# 437 "parser.ml"
         in
        _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)) : 'freshtv226)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv227 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_cprd_lst = 
# 96 "parser.mly"
                      ()
# 454 "parser.ml"
         in
        _menhir_goto_cprd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv228)) : 'freshtv230)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv231 * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_prd_lst = 
# 103 "parser.mly"
                   ()
# 471 "parser.ml"
         in
        _menhir_goto_prd_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)) : 'freshtv234)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv251 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 479 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_cod) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv249 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 487 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_7 : 'tv_lc_cod) : 'tv_lc_cod) = _v in
        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 8 "parser.mly"
       (string)
# 494 "parser.ml"
        ))), _, (_3 : 'tv_typs)), _, (_5 : 'tv_typs)) = _menhir_stack in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_lc_man = 
# 38 "parser.mly"
                                     ( )
# 502 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_lc_man) = _v in
        ((match _menhir_s with
        | MenhirState60 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv237 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv235 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_clq_lst = 
# 41 "parser.mly"
               (  )
# 523 "parser.ml"
             in
            _menhir_goto_clq_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv236)) : 'freshtv238)
        | MenhirState31 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv241 * _menhir_state) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv239 * _menhir_state) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_2 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_gl_etr = 
# 34 "parser.mly"
               (   )
# 540 "parser.ml"
             in
            _menhir_goto_gl_etr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv240)) : 'freshtv242)
        | MenhirState64 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv245 * _menhir_state * 'tv_clq_lst)) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_lc_man) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv243 * _menhir_state * 'tv_clq_lst)) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((_3 : 'tv_lc_man) : 'tv_lc_man) = _v in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_clq_lst)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_clq_lst = 
# 42 "parser.mly"
                       ( )
# 557 "parser.ml"
             in
            _menhir_goto_clq_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv244)) : 'freshtv246)
        | _ ->
            _menhir_fail ()) : 'freshtv248)) : 'freshtv250)) : 'freshtv252)
    | _ ->
        _menhir_fail ()

and _menhir_run37 : _menhir_env -> 'ttv_tail -> (
# 8 "parser.mly"
       (string)
# 568 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv193) = Obj.magic _menhir_stack in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 577 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 581 "parser.ml"
    )) = _v in
    ((let _v : 'tv_nam = 
# 49 "parser.mly"
        ( _1 )
# 586 "parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv191) = _menhir_stack in
    let (_v : 'tv_nam) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv189 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    let (_v : 'tv_nam) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv187 * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
    let ((_2 : 'tv_nam) : 'tv_nam) = _v in
    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_typs)) = _menhir_stack in
    let _v : 'tv_typs = 
# 46 "parser.mly"
             ( _1@[_2] )
# 601 "parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)) : 'freshtv190)) : 'freshtv192)) : 'freshtv194)

and _menhir_reduce22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_lc_cod = 
# 52 "parser.mly"
    ( Flow.Exp.End )
# 610 "parser.ml"
     in
    _menhir_goto_lc_cod _menhir_env _menhir_stack _menhir_s _v

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | CO_PRD_STT ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | PRD_STT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | END_PRD | PRD ->
        _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ARR ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | CO_PRD_STT ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | PRD_STT ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | CO_PRD | END_CO_PRD ->
        _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState40
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | GL_NAM _ | INT _ | LCE | L_PRN | L_RCD | PRD | PRD_STT | VAL _ ->
        _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run11 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_poly -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | L_PRN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState11
    | VAL _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11

and _menhir_run13 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_poly -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | L_PRN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | VAL _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_goto_typs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_typs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 708 "parser.ml"
        ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _v
        | SRC ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv175 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 720 "parser.ml"
            ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv176)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv177 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 731 "parser.ml"
            ))) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)) : 'freshtv180)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv185 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 740 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DEF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv181 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 750 "parser.ml"
            ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ARR ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | CO_PRD_STT ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | PRD_STT ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | CLQ | EOF | LCE ->
                _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState38
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38) : 'freshtv182)
        | NAM _v ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv183 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 776 "parser.ml"
            ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)) : 'freshtv186)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_arr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv157 * _menhir_state * 'tv_gl_cll_lst) * _menhir_state) * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv153 * _menhir_state * 'tv_gl_cll_lst) * _menhir_state) * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv151 * _menhir_state * 'tv_gl_cll_lst) * _menhir_state) * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_gl_cll_lst)), _), _, (_3 : 'tv_arr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_gl_cll_lst = 
# 68 "parser.mly"
                               ( _1@[_3] )
# 810 "parser.ml"
             in
            _menhir_goto_gl_cll_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv152)) : 'freshtv154)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv155 * _menhir_state * 'tv_gl_cll_lst) * _menhir_state) * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)) : 'freshtv158)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167 * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv165 * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_arr)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 836 "parser.ml"
            ) = 
# 21 "parser.mly"
            ( _1 )
# 840 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv163) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 848 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 856 "parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv159) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 864 "parser.ml"
            )) : (
# 18 "parser.mly"
      (Flow.Exp.arr)
# 868 "parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv160)) : 'freshtv162)) : 'freshtv164)) : 'freshtv166)) : 'freshtv168)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169 * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)) : 'freshtv172)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv173 * _menhir_state) * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ARR ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | CO_PRD_STT ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PRD_STT ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | CLQ | CO_PRD | END_CO_PRD | END_PRD | EOF | LCE | PRD ->
            _menhir_reduce22 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv174)
    | _ ->
        _menhir_fail ()

and _menhir_run19 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_gl_cll_lst -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | GL_NAM _ | INT _ | L_PRN | L_RCD | R_RCD | VAL _ ->
        _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19

and _menhir_goto_val__ : _menhir_env -> 'ttv_tail -> 'tv_val__ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv149 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 921 "parser.ml"
    )) * 'tv_val__) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DOT_VAL _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * 'tv_val__) = Obj.magic _menhir_stack in
        let (_v : (
# 9 "parser.mly"
       (int)
# 932 "parser.ml"
        )) = _v in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * 'tv_val__) = Obj.magic _menhir_stack in
        let ((_2 : (
# 9 "parser.mly"
       (int)
# 940 "parser.ml"
        )) : (
# 9 "parser.mly"
       (int)
# 944 "parser.ml"
        )) = _v in
        ((let (_menhir_stack, (_1 : 'tv_val__)) = _menhir_stack in
        let _v : 'tv_val__ = 
# 91 "parser.mly"
                  ( _1@[_2] )
# 950 "parser.ml"
         in
        _menhir_goto_val__ _menhir_env _menhir_stack _v) : 'freshtv136)) : 'freshtv138)
    | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | GL_NAM _ | INT _ | LCE | L_PRN | L_RCD | MLT | PLS | PRD | PRD_STT | R_PRN | R_RCD | VAL _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv145 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 958 "parser.ml"
        )) * 'tv_val__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 9 "parser.mly"
       (int)
# 963 "parser.ml"
        ))), (_2 : 'tv_val__)) = _menhir_stack in
        let _v : 'tv_val_ = 
# 87 "parser.mly"
              ( Exp.Val (_1::_2) )
# 968 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_val_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_val_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_val_) : 'tv_val_) = _v in
        ((let _v : 'tv_poly = 
# 81 "parser.mly"
          ( _1 )
# 985 "parser.ml"
         in
        _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv140)) : 'freshtv142)) : 'freshtv144)) : 'freshtv146)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * _menhir_state * (
# 9 "parser.mly"
       (int)
# 995 "parser.ml"
        )) * 'tv_val__) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)) : 'freshtv150)

and _menhir_goto_poly : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_poly -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
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
# 85 "parser.mly"
                     ( _2 )
# 1026 "parser.ml"
             in
            _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)) : 'freshtv114)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv115 * _menhir_state) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)) : 'freshtv118)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | GL_NAM _ | INT _ | LCE | L_PRN | L_RCD | PLS | PRD | PRD_STT | R_PRN | R_RCD | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv119 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_poly)), _, (_3 : 'tv_poly)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_poly = 
# 83 "parser.mly"
                  ( Exp.Plus (_1,_3) )
# 1052 "parser.ml"
             in
            _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv120)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv121 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)) : 'freshtv124)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv127 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv125 * _menhir_state * 'tv_poly)) * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_poly)), _, (_3 : 'tv_poly)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_poly = 
# 84 "parser.mly"
                  ( Exp.Mult (_1,_3) )
# 1072 "parser.ml"
         in
        _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv126)) : 'freshtv128)
    | MenhirState18 | MenhirState21 | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | MLT ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack)
        | PLS ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack)
        | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | GL_NAM _ | INT _ | LCE | L_PRN | L_RCD | PRD | PRD_STT | R_RCD | VAL _ ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_poly) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_poly)) = _menhir_stack in
            let _v : 'tv_gl_cll = 
# 72 "parser.mly"
         ( (Flow.Exp.Poly _1) )
# 1092 "parser.ml"
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
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_cll) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_gl_cll) : 'tv_gl_cll) = _v in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_dmatr = 
# 78 "parser.mly"
                    ( Exp.DMatr _3 )
# 1123 "parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv101) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_dmatr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_dmatr) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_dmatr) : 'tv_dmatr) = _v in
        ((let _v : 'tv_arr = 
# 60 "parser.mly"
           ( _1 )
# 1140 "parser.ml"
         in
        _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv98)) : 'freshtv100)) : 'freshtv102)) : 'freshtv104)) : 'freshtv106)
    | MenhirState18 | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_gl_cll) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_gl_cll) : 'tv_gl_cll) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cll_lst)) = _menhir_stack in
        let _v : 'tv_gl_cll_lst = 
# 67 "parser.mly"
                      ( _1@[(Exp.Gl_call _2)] )
# 1156 "parser.ml"
         in
        _menhir_goto_gl_cll_lst _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)) : 'freshtv110)
    | _ ->
        _menhir_fail ()

and _menhir_reduce39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_typs = 
# 45 "parser.mly"
    ( [] )
# 1167 "parser.ml"
     in
    _menhir_goto_typs _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_gl_cll_lst : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_gl_cll_lst -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState1 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state) * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | INT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | L_PRN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | L_RCD ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState18
        | VAL _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
        | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | LCE | PRD | PRD_STT | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv83 * _menhir_state) * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_gl_cll_lst)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_matr = 
# 75 "parser.mly"
                    ( Exp.Matr _2 )
# 1199 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv81) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_matr) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv79) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_matr) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv77) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_matr) : 'tv_matr) = _v in
            ((let _v : 'tv_arr = 
# 59 "parser.mly"
          ( _1 )
# 1216 "parser.ml"
             in
            _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv78)) : 'freshtv80)) : 'freshtv82)) : 'freshtv84)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18) : 'freshtv86)
    | MenhirState41 | MenhirState0 | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | INT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | L_PRN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | L_RCD ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | VAL _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | LCE | PRD | PRD_STT | R_RCD ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_gl_cll_lst)) = _menhir_stack in
            let _v : 'tv_canon = 
# 63 "parser.mly"
                ( Flow.Exp.Canon _1 )
# 1246 "parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv91) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_canon) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv89) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_canon) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : 'tv_canon) : 'tv_canon) = _v in
            ((let _v : 'tv_arr = 
# 58 "parser.mly"
           ( _1 )
# 1263 "parser.ml"
             in
            _menhir_goto_arr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv88)) : 'freshtv90)) : 'freshtv92)) : 'freshtv94)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv96)
    | _ ->
        _menhir_fail ()

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1276 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
    ((let _v : 'tv_val__ = 
# 90 "parser.mly"
    ( [] )
# 1286 "parser.ml"
     in
    _menhir_goto_val__ _menhir_env _menhir_stack _v) : 'freshtv76)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | INT _v ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | L_PRN ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState6
    | VAL _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 9 "parser.mly"
       (int)
# 1310 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 9 "parser.mly"
       (int)
# 1320 "parser.ml"
    )) : (
# 9 "parser.mly"
       (int)
# 1324 "parser.ml"
    )) = _v in
    ((let _v : 'tv_poly = 
# 82 "parser.mly"
        ( (Z _1) )
# 1329 "parser.ml"
     in
    _menhir_goto_poly _menhir_env _menhir_stack _menhir_s _v) : 'freshtv74)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1336 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv71) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 8 "parser.mly"
       (string)
# 1346 "parser.ml"
    )) : (
# 8 "parser.mly"
       (string)
# 1350 "parser.ml"
    )) = _v in
    ((let _v : 'tv_gl_cll = 
# 71 "parser.mly"
           ( (Exp.Ax _1) )
# 1355 "parser.ml"
     in
    _menhir_goto_gl_cll _menhir_env _menhir_stack _menhir_s _v) : 'freshtv72)

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 8 "parser.mly"
       (string)
# 1362 "parser.ml"
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
# 1374 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        _menhir_reduce39 _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv68)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv69 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1385 "parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)

and _menhir_reduce15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_gl_cll_lst = 
# 66 "parser.mly"
     ( [] )
# 1395 "parser.ml"
     in
    _menhir_goto_gl_cll_lst _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv65 * _menhir_state) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState1 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | GL_NAM _v ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | INT _v ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | L_PRN ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | VAL _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2) : 'freshtv66)
    | ARR | CLQ | CO_PRD | CO_PRD_STT | END_CO_PRD | END_PRD | EOF | GL_NAM _ | INT _ | LCE | L_PRN | L_RCD | PRD | PRD_STT | R_RCD | VAL _ ->
        _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState1
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState1

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state * 'tv_gl_cod) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState64 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv17 * _menhir_state * 'tv_clq_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState60 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState53 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv21 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv25 * _menhir_state * 'tv_cprd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState44 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * 'tv_prd_lst)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state) * _menhir_state * 'tv_arr) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState41 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState40 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv33 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState38 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv37 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1495 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv39 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1504 "parser.ml"
        ))) * _menhir_state * 'tv_typs)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * _menhir_state * (
# 8 "parser.mly"
       (string)
# 1513 "parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState30 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv46)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv49 * _menhir_state * 'tv_gl_cll_lst) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState18 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state) * _menhir_state * 'tv_gl_cll_lst) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState13 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv53 * _menhir_state * 'tv_poly)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state * 'tv_poly)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState6 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
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

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CLQ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState31 in
        ((let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAM _v ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState60 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60) : 'freshtv14)
    | NAM _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_goto_text : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 17 "parser.mly"
      (unit)
# 1601 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : (
# 17 "parser.mly"
      (unit)
# 1610 "parser.ml"
    )) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 17 "parser.mly"
      (unit)
# 1618 "parser.ml"
    )) : (
# 17 "parser.mly"
      (unit)
# 1622 "parser.ml"
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
# 1651 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = _menhir_init lexer lexbuf in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv7) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EXP ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EOF | GL_NAM _ | INT _ | L_PRN | L_RCD | VAL _ ->
        _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv8))

and text : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 17 "parser.mly"
      (unit)
# 1672 "parser.ml"
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
        let (_menhir_s : _menhir_state) = MenhirState30 in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        ((let _1 = () in
        let _v : (
# 17 "parser.mly"
      (unit)
# 1692 "parser.ml"
        ) = 
# 24 "parser.mly"
        ()
# 1696 "parser.ml"
         in
        _menhir_goto_text _menhir_env _menhir_stack _menhir_s _v) : 'freshtv2)) : 'freshtv4)
    | LCE ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30) : 'freshtv6))

# 233 "/home/kohe/.opam/system/lib/menhir/standard.mly"
  

# 1709 "parser.ml"
