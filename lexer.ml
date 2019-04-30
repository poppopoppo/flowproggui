# 1 "lexer.mll"
 
    open Parser
    exception Error of string

# 7 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\227\255\228\255\002\000\062\000\147\000\157\000\233\255\
    \234\255\235\255\162\000\241\255\242\255\243\255\244\255\245\255\
    \246\255\000\000\177\000\001\000\157\000\119\000\254\255\255\255\
    \145\000\023\000\024\000\008\000\024\000\253\255\247\255\238\255\
    \240\255\239\255\232\255\237\255\251\255\248\255\250\255\249\255\
    \005\001\080\001\168\000";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\026\000\025\000\024\000\028\000\255\255\
    \255\255\255\255\028\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\028\000\028\000\003\000\028\000\028\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \019\000\019\000\024\000";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\255\255\255\255\255\255\000\000\
    \000\000\000\000\255\255\000\000\000\000\000\000\000\000\000\000\
    \000\000\255\255\255\255\255\255\255\255\255\255\000\000\000\000\
    \255\255\255\255\255\255\255\255\255\255\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\255\255\255\255";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\003\000\003\000\003\000\000\000\003\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\011\000\003\000\010\000\007\000\000\000\017\000\000\000\
    \013\000\012\000\008\000\009\000\000\000\006\000\000\000\000\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\000\000\000\000\039\000\036\000\018\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\016\000\019\000\015\000\014\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\033\000\030\000\000\000\000\000\000\000\000\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\031\000\029\000\032\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\021\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\042\000\042\000\042\000\
    \042\000\042\000\042\000\042\000\042\000\042\000\042\000\037\000\
    \042\000\042\000\042\000\042\000\042\000\042\000\042\000\042\000\
    \042\000\042\000\020\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\000\000\000\000\000\000\
    \002\000\000\000\000\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\026\000\023\000\035\000\
    \000\000\000\000\000\000\000\000\000\000\024\000\027\000\028\000\
    \000\000\000\000\000\000\000\000\000\000\038\000\000\000\000\000\
    \000\000\034\000\022\000\000\000\025\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\003\000\003\000\000\000\255\255\003\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\003\000\000\000\000\000\255\255\000\000\255\255\
    \000\000\000\000\000\000\000\000\255\255\000\000\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\255\255\017\000\019\000\000\000\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\025\000\027\000\255\255\255\255\255\255\255\255\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\026\000\028\000\026\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\005\000\005\000\006\000\006\000\006\000\
    \006\000\006\000\006\000\006\000\006\000\006\000\006\000\018\000\
    \042\000\042\000\042\000\042\000\042\000\042\000\042\000\042\000\
    \042\000\042\000\000\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\255\255\255\255\255\255\
    \000\000\255\255\255\255\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\020\000\021\000\024\000\
    \255\255\255\255\255\255\255\255\255\255\020\000\020\000\020\000\
    \255\255\255\255\255\255\255\255\255\255\018\000\255\255\255\255\
    \255\255\024\000\021\000\255\255\020\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \040\000\040\000\040\000\040\000\040\000\040\000\040\000\040\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
    \041\000\041\000\041\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 15 "lexer.mll"
                           ( LCE )
# 203 "lexer.ml"

  | 1 ->
# 16 "lexer.mll"
                           ( ARR       )
# 208 "lexer.ml"

  | 2 ->
# 17 "lexer.mll"
                               ( SRC             )
# 213 "lexer.ml"

  | 3 ->
# 18 "lexer.mll"
            ( CO_PRD )
# 218 "lexer.ml"

  | 4 ->
# 19 "lexer.mll"
            ( CO_PRD_STT )
# 223 "lexer.ml"

  | 5 ->
# 20 "lexer.mll"
            ( END_CO_PRD )
# 228 "lexer.ml"

  | 6 ->
# 21 "lexer.mll"
            ( PRD_STT )
# 233 "lexer.ml"

  | 7 ->
# 22 "lexer.mll"
            ( END_PRD )
# 238 "lexer.ml"

  | 8 ->
# 23 "lexer.mll"
                     ( DEF )
# 243 "lexer.ml"

  | 9 ->
# 24 "lexer.mll"
          ( L_RCD )
# 248 "lexer.ml"

  | 10 ->
# 25 "lexer.mll"
          ( R_RCD )
# 253 "lexer.ml"

  | 11 ->
# 26 "lexer.mll"
          ( CNN )
# 258 "lexer.ml"

  | 12 ->
# 27 "lexer.mll"
          ( L_PRN )
# 263 "lexer.ml"

  | 13 ->
# 28 "lexer.mll"
          ( R_PRN )
# 268 "lexer.ml"

  | 14 ->
# 29 "lexer.mll"
          ( EXP )
# 273 "lexer.ml"

  | 15 ->
# 30 "lexer.mll"
                      ( R_APP )
# 278 "lexer.ml"

  | 16 ->
# 31 "lexer.mll"
                     ( L_APP )
# 283 "lexer.ml"

  | 17 ->
# 32 "lexer.mll"
                      ( APP )
# 288 "lexer.ml"

  | 18 ->
# 33 "lexer.mll"
                                ( GL_NAM ("id") )
# 293 "lexer.ml"

  | 19 ->
let
# 34 "lexer.mll"
                             lxm
# 299 "lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 34 "lexer.mll"
                                  ( GL_NAM(lxm) )
# 303 "lexer.ml"

  | 20 ->
# 35 "lexer.mll"
          ( PLS )
# 308 "lexer.ml"

  | 21 ->
# 36 "lexer.mll"
          ( MLT )
# 313 "lexer.ml"

  | 22 ->
# 37 "lexer.mll"
          ( ROT )
# 318 "lexer.ml"

  | 23 ->
# 38 "lexer.mll"
                      ( AGL )
# 323 "lexer.ml"

  | 24 ->
let
# 39 "lexer.mll"
           lxm
# 329 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 39 "lexer.mll"
                ( INT (int_of_string lxm) )
# 333 "lexer.ml"

  | 25 ->
let
# 40 "lexer.mll"
                lxm
# 339 "lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 40 "lexer.mll"
                    ( NAM (lxm) )
# 343 "lexer.ml"

  | 26 ->
# 42 "lexer.mll"
                    ( token lexbuf                         )
# 348 "lexer.ml"

  | 27 ->
# 43 "lexer.mll"
                    ( EOF               )
# 353 "lexer.ml"

  | 28 ->
# 44 "lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 360 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

;;

