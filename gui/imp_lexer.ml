# 1 "imp_lexer.mll"
 
    open Imp_parser
    exception Error of string

# 7 "imp_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\193\255\194\255\002\000\079\000\089\000\000\000\199\255\
    \200\255\206\255\208\255\209\255\210\255\211\255\218\255\219\255\
    \220\255\228\255\229\255\099\000\233\255\236\255\001\000\001\000\
    \132\000\129\000\249\255\009\000\098\000\255\255\003\000\099\000\
    \113\000\101\000\241\255\227\255\045\000\250\255\029\000\000\000\
    \001\000\251\255\234\255\242\255\013\000\033\000\007\000\007\000\
    \032\000\036\000\006\000\124\000\141\000\222\255\223\255\224\255\
    \225\255\226\255\004\000\248\255\230\255\221\255\245\255\239\255\
    \237\255\238\255\216\255\217\255\214\255\215\255\205\255\212\255\
    \213\255\203\255\204\255\201\255\202\255\247\255\054\001\244\255\
    \037\000\240\255\254\000\008\001\004\000\254\255\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\060\000\059\000\062\000\057\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\062\000\255\255\255\255\023\000\048\000\
    \009\000\062\000\255\255\062\000\062\000\255\255\255\255\255\255\
    \255\255\001\000\255\255\255\255\012\000\255\255\002\000\255\255\
    \003\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\058\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\009\000\255\255\
    \255\255\255\255\024\000\059\000\255\255\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\255\255\255\255\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\255\255\255\255\
    \255\255\255\255\000\000\255\255\255\255\000\000\255\255\031\000\
    \031\000\031\000\000\000\000\000\255\255\000\000\255\255\255\255\
    \255\255\000\000\000\000\000\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\000\000\000\000\
    \000\000\000\000\255\255\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \255\255\000\000\255\255\255\255\085\000\000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\003\000\003\000\003\000\086\000\003\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\009\000\003\000\000\000\006\000\019\000\012\000\006\000\
    \011\000\010\000\007\000\008\000\000\000\005\000\028\000\041\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\020\000\029\000\000\000\023\000\079\000\021\000\
    \000\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\043\000\026\000\018\000\017\000\060\000\
    \016\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\015\000\022\000\014\000\013\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\083\000\083\000\083\000\083\000\083\000\083\000\083\000\
    \083\000\083\000\083\000\082\000\082\000\082\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\031\000\032\000\033\000\
    \032\000\000\000\075\000\074\000\073\000\067\000\066\000\040\000\
    \063\000\042\000\070\000\077\000\032\000\069\000\068\000\035\000\
    \038\000\076\000\065\000\064\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\034\000\037\000\
    \072\000\071\000\027\000\080\000\036\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\039\000\
    \081\000\000\000\025\000\078\000\000\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\062\000\
    \002\000\046\000\048\000\000\000\255\255\044\000\000\000\000\000\
    \000\000\052\000\051\000\050\000\049\000\059\000\061\000\000\000\
    \000\000\000\000\000\000\053\000\054\000\000\000\000\000\000\000\
    \045\000\000\000\000\000\055\000\056\000\057\000\000\000\000\000\
    \047\000\000\000\000\000\000\000\030\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\058\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \083\000\083\000\083\000\083\000\083\000\083\000\083\000\083\000\
    \083\000\083\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\077\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\255\255\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \000\000\255\255\000\000\000\000\000\000\000\000\000\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\000\000\000\000\000\000\000\000\078\000\000\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
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
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\003\000\003\000\000\000\084\000\003\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\003\000\255\255\000\000\000\000\000\000\006\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\040\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\023\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\036\000\000\000\000\000\000\000\058\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\005\000\019\000\019\000\019\000\019\000\019\000\
    \019\000\019\000\019\000\019\000\019\000\028\000\031\000\032\000\
    \033\000\255\255\044\000\045\000\045\000\048\000\048\000\039\000\
    \050\000\036\000\046\000\024\000\032\000\047\000\047\000\027\000\
    \027\000\044\000\049\000\049\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\030\000\027\000\
    \046\000\046\000\000\000\022\000\027\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\038\000\
    \080\000\255\255\000\000\024\000\255\255\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
    \024\000\024\000\024\000\024\000\024\000\024\000\024\000\051\000\
    \000\000\025\000\025\000\255\255\084\000\025\000\255\255\255\255\
    \255\255\025\000\025\000\025\000\025\000\052\000\051\000\255\255\
    \255\255\255\255\255\255\052\000\052\000\255\255\255\255\255\255\
    \025\000\255\255\255\255\052\000\052\000\052\000\255\255\255\255\
    \025\000\255\255\255\255\255\255\028\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\052\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \083\000\083\000\083\000\083\000\083\000\083\000\083\000\083\000\
    \083\000\083\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\078\000\255\255\255\255\
    \255\255\255\255\255\255\031\000\255\255\033\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \255\255\032\000\255\255\255\255\255\255\255\255\255\255\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\255\255\255\255\255\255\255\255\078\000\255\255\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\078\000\078\000\078\000\078\000\078\000\078\000\078\000\
    \078\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
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
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255";
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
# 16 "imp_lexer.mll"
          ( Util.pnt true "start line comment\n"; line_comment lexbuf )
# 210 "imp_lexer.ml"

  | 1 ->
# 17 "imp_lexer.mll"
                      ( token lexbuf )
# 215 "imp_lexer.ml"

  | 2 ->
# 18 "imp_lexer.mll"
            ( LCE )
# 220 "imp_lexer.ml"

  | 3 ->
# 19 "imp_lexer.mll"
              ( MDL )
# 225 "imp_lexer.ml"

  | 4 ->
# 20 "imp_lexer.mll"
              ( MDL_END )
# 230 "imp_lexer.ml"

  | 5 ->
# 21 "imp_lexer.mll"
           ( DTA )
# 235 "imp_lexer.ml"

  | 6 ->
# 22 "imp_lexer.mll"
            ( SLH )
# 240 "imp_lexer.ml"

  | 7 ->
# 23 "imp_lexer.mll"
            ( FOR_ALL )
# 245 "imp_lexer.ml"

  | 8 ->
let
# 24 "imp_lexer.mll"
               lxm
# 251 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 24 "imp_lexer.mll"
                         ( VAL(lxm) )
# 255 "imp_lexer.ml"

  | 9 ->
let
# 25 "imp_lexer.mll"
              lxm
# 261 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 25 "imp_lexer.mll"
                  ( NAM(lxm) )
# 265 "imp_lexer.ml"

  | 10 ->
# 26 "imp_lexer.mll"
            ( ISO )
# 270 "imp_lexer.ml"

  | 11 ->
# 27 "imp_lexer.mll"
            ( EQV )
# 275 "imp_lexer.ml"

  | 12 ->
# 28 "imp_lexer.mll"
           ( ARR       )
# 280 "imp_lexer.ml"

  | 13 ->
# 29 "imp_lexer.mll"
             ( ARR_END )
# 285 "imp_lexer.ml"

  | 14 ->
# 30 "imp_lexer.mll"
            ( ARR_STT )
# 290 "imp_lexer.ml"

  | 15 ->
# 31 "imp_lexer.mll"
            ( IO_STT )
# 295 "imp_lexer.ml"

  | 16 ->
# 32 "imp_lexer.mll"
            ( SRC )
# 300 "imp_lexer.ml"

  | 17 ->
# 33 "imp_lexer.mll"
            ( EMT )
# 305 "imp_lexer.ml"

  | 18 ->
# 34 "imp_lexer.mll"
            ( CNT )
# 310 "imp_lexer.ml"

  | 19 ->
# 35 "imp_lexer.mll"
          ( ARG )
# 315 "imp_lexer.ml"

  | 20 ->
# 36 "imp_lexer.mll"
             ( IN )
# 320 "imp_lexer.ml"

  | 21 ->
# 37 "imp_lexer.mll"
             ( OUT )
# 325 "imp_lexer.ml"

  | 22 ->
# 38 "imp_lexer.mll"
          ( CLN )
# 330 "imp_lexer.ml"

  | 23 ->
# 39 "imp_lexer.mll"
          ( SPL )
# 335 "imp_lexer.ml"

  | 24 ->
let
# 40 "imp_lexer.mll"
                     lxm
# 341 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 40 "imp_lexer.mll"
                          ( MCR(lxm) )
# 345 "imp_lexer.ml"

  | 25 ->
# 41 "imp_lexer.mll"
                 ( AGL )
# 350 "imp_lexer.ml"

  | 26 ->
# 42 "imp_lexer.mll"
          ( AGL_END )
# 355 "imp_lexer.ml"

  | 27 ->
# 43 "imp_lexer.mll"
          ( SEQ )
# 360 "imp_lexer.ml"

  | 28 ->
# 44 "imp_lexer.mll"
            ( M_HLZ )
# 365 "imp_lexer.ml"

  | 29 ->
# 45 "imp_lexer.mll"
              ( COPRD )
# 370 "imp_lexer.ml"

  | 30 ->
# 46 "imp_lexer.mll"
              ( PRD )
# 375 "imp_lexer.ml"

  | 31 ->
# 47 "imp_lexer.mll"
            ( EOP )
# 380 "imp_lexer.ml"

  | 32 ->
# 48 "imp_lexer.mll"
            ( COPRD_END )
# 385 "imp_lexer.ml"

  | 33 ->
# 49 "imp_lexer.mll"
            ( PRD_END )
# 390 "imp_lexer.ml"

  | 34 ->
# 50 "imp_lexer.mll"
            ( DEF )
# 395 "imp_lexer.ml"

  | 35 ->
# 51 "imp_lexer.mll"
          ( ACT )
# 400 "imp_lexer.ml"

  | 36 ->
# 52 "imp_lexer.mll"
          ( L_RCD )
# 405 "imp_lexer.ml"

  | 37 ->
# 53 "imp_lexer.mll"
          ( R_RCD )
# 410 "imp_lexer.ml"

  | 38 ->
# 54 "imp_lexer.mll"
            ( L_HLZ )
# 415 "imp_lexer.ml"

  | 39 ->
# 55 "imp_lexer.mll"
            ( R_HLZ  )
# 420 "imp_lexer.ml"

  | 40 ->
# 56 "imp_lexer.mll"
            ( L_LST )
# 425 "imp_lexer.ml"

  | 41 ->
# 57 "imp_lexer.mll"
            ( R_LST )
# 430 "imp_lexer.ml"

  | 42 ->
# 58 "imp_lexer.mll"
            ( L_OPN )
# 435 "imp_lexer.ml"

  | 43 ->
# 59 "imp_lexer.mll"
            ( R_OPN )
# 440 "imp_lexer.ml"

  | 44 ->
# 60 "imp_lexer.mll"
          ( CNN )
# 445 "imp_lexer.ml"

  | 45 ->
# 61 "imp_lexer.mll"
          ( SGN )
# 450 "imp_lexer.ml"

  | 46 ->
# 62 "imp_lexer.mll"
          ( L_PRN )
# 455 "imp_lexer.ml"

  | 47 ->
# 63 "imp_lexer.mll"
          ( R_PRN )
# 460 "imp_lexer.ml"

  | 48 ->
# 64 "imp_lexer.mll"
          ( EQ )
# 465 "imp_lexer.ml"

  | 49 ->
# 65 "imp_lexer.mll"
          ( EXP )
# 470 "imp_lexer.ml"

  | 50 ->
# 66 "imp_lexer.mll"
            ( R_APP )
# 475 "imp_lexer.ml"

  | 51 ->
# 67 "imp_lexer.mll"
            ( APP )
# 480 "imp_lexer.ml"

  | 52 ->
# 68 "imp_lexer.mll"
            ( PRJ )
# 485 "imp_lexer.ml"

  | 53 ->
# 69 "imp_lexer.mll"
            ( Z )
# 490 "imp_lexer.ml"

  | 54 ->
# 70 "imp_lexer.mll"
            ( N )
# 495 "imp_lexer.ml"

  | 55 ->
# 71 "imp_lexer.mll"
          ( PLS )
# 500 "imp_lexer.ml"

  | 56 ->
# 72 "imp_lexer.mll"
          ( MLT )
# 505 "imp_lexer.ml"

  | 57 ->
let
# 73 "imp_lexer.mll"
                      lxm
# 511 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 73 "imp_lexer.mll"
                           ( ROT (String.length lxm) )
# 515 "imp_lexer.ml"

  | 58 ->
# 74 "imp_lexer.mll"
             ( AGL )
# 520 "imp_lexer.ml"

  | 59 ->
let
# 75 "imp_lexer.mll"
           lxm
# 526 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 75 "imp_lexer.mll"
                ( INT (int_of_string lxm) )
# 530 "imp_lexer.ml"

  | 60 ->
# 76 "imp_lexer.mll"
                    ( token lexbuf                         )
# 535 "imp_lexer.ml"

  | 61 ->
# 77 "imp_lexer.mll"
                    ( EOF               )
# 540 "imp_lexer.ml"

  | 62 ->
# 78 "imp_lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 547 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and line_comment lexbuf =
   __ocaml_lex_line_comment_rec lexbuf 84
and __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 82 "imp_lexer.mll"
          ( Util.pnt true "end line comment\n"; token lexbuf )
# 559 "imp_lexer.ml"

  | 1 ->
# 83 "imp_lexer.mll"
      ( line_comment lexbuf )
# 564 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state

;;

