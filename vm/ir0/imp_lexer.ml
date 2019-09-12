# 1 "imp_lexer.mll"
 
    open Imp_parser
    exception Error of string

# 7 "imp_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\171\255\172\255\005\000\177\255\088\000\089\000\090\000\
    \181\255\185\255\186\255\187\255\193\255\194\255\195\255\196\255\
    \197\255\198\255\199\255\204\255\205\255\209\255\083\000\211\255\
    \218\255\220\255\223\255\224\255\233\255\234\255\007\000\008\000\
    \192\000\018\000\245\255\000\000\074\000\125\000\113\000\255\255\
    \114\000\115\000\094\000\064\000\253\255\034\000\035\000\036\000\
    \118\000\121\000\001\000\114\000\251\255\117\000\249\255\001\000\
    \033\000\013\000\247\255\246\255\046\000\230\255\044\000\025\000\
    \000\000\009\000\034\000\018\000\052\000\060\000\069\000\213\255\
    \214\255\215\255\216\255\142\000\221\255\244\255\182\255\192\255\
    \064\000\239\255\212\255\236\255\206\255\068\000\225\255\102\000\
    \104\000\166\000\012\001\208\255\022\001\033\001\207\255\202\255\
    \203\255\200\255\201\255\188\255\189\255\190\255\184\255\243\255\
    \079\001\009\000\159\000\238\255\087\000\038\000\078\000\240\255\
    \241\255\226\255\229\255\237\255\210\255\178\255\218\000\254\255\
    \255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\081\000\255\255\080\000\076\000\075\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\084\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\020\000\033\000\
    \013\000\084\000\255\255\084\000\036\000\001\000\084\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\024\000\023\000\072\000\
    \007\000\003\000\255\255\255\255\255\255\005\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\027\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\038\000\255\255\255\255\255\255\255\255\
    \064\000\255\255\255\255\255\255\255\255\028\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \013\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\000\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\255\255\
    \255\255\255\255\000\000\255\255\255\255\037\000\041\000\000\000\
    \255\255\041\000\042\000\255\255\000\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\000\000\255\255\000\000\255\255\
    \255\255\255\255\000\000\000\000\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\000\000\000\000\
    \255\255\000\000\000\000\000\000\000\000\255\255\000\000\255\255\
    \255\255\255\255\255\255\000\000\255\255\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\119\000\000\000\
    \000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\000\000\000\000\003\000\003\000\003\000\
    \000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\012\000\038\000\017\000\007\000\003\000\018\000\014\000\
    \016\000\015\000\010\000\011\000\008\000\009\000\004\000\022\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\026\000\037\000\029\000\013\000\028\000\027\000\
    \006\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\036\000\034\000\025\000\024\000\021\000\
    \023\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\020\000\031\000\019\000\030\000\117\000\
    \006\000\007\000\116\000\115\000\106\000\042\000\107\000\255\255\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\064\000\039\000\041\000\039\000\063\000\062\000\
    \066\000\043\000\070\000\068\000\067\000\044\000\061\000\060\000\
    \059\000\055\000\052\000\054\000\051\000\057\000\058\000\049\000\
    \053\000\069\000\060\000\045\000\047\000\102\000\100\000\096\000\
    \095\000\065\000\099\000\088\000\085\000\087\000\048\000\083\000\
    \078\000\098\000\097\000\046\000\081\000\101\000\079\000\080\000\
    \086\000\092\000\035\000\089\000\114\000\077\000\082\000\084\000\
    \113\000\000\000\105\000\071\000\072\000\040\000\041\000\040\000\
    \112\000\111\000\000\000\073\000\074\000\075\000\090\000\090\000\
    \090\000\090\000\090\000\090\000\090\000\090\000\090\000\090\000\
    \041\000\109\000\033\000\056\000\120\000\076\000\041\000\103\000\
    \000\000\000\000\108\000\000\000\000\000\000\000\110\000\000\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\106\000\000\000\000\000\000\000\104\000\
    \000\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\050\000\090\000\090\000\090\000\090\000\
    \090\000\090\000\090\000\090\000\090\000\090\000\093\000\093\000\
    \093\000\093\000\093\000\093\000\093\000\093\000\093\000\093\000\
    \000\000\093\000\093\000\093\000\093\000\093\000\093\000\093\000\
    \093\000\093\000\093\000\000\000\000\000\000\000\255\255\000\000\
    \000\000\105\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\091\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\255\255\000\000\255\255\000\000\000\000\103\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\255\255\094\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\000\000\000\000\000\000\000\000\104\000\000\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\000\000\000\000\000\000\000\000\000\000\
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
    ";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\000\000\003\000\003\000\
    \255\255\255\255\003\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\003\000\000\000\000\000\
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
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\000\
    \006\000\007\000\022\000\030\000\031\000\036\000\031\000\037\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\033\000\038\000\040\000\041\000\033\000\033\000\
    \033\000\042\000\033\000\033\000\033\000\043\000\045\000\046\000\
    \047\000\048\000\051\000\053\000\049\000\056\000\057\000\035\000\
    \050\000\033\000\060\000\035\000\035\000\062\000\063\000\065\000\
    \065\000\033\000\063\000\066\000\067\000\066\000\035\000\068\000\
    \075\000\064\000\064\000\035\000\080\000\063\000\069\000\069\000\
    \085\000\087\000\000\000\088\000\105\000\070\000\068\000\067\000\
    \109\000\255\255\031\000\070\000\070\000\038\000\040\000\041\000\
    \110\000\110\000\255\255\070\000\070\000\070\000\089\000\089\000\
    \089\000\089\000\089\000\089\000\089\000\089\000\089\000\089\000\
    \040\000\108\000\000\000\055\000\118\000\070\000\040\000\032\000\
    \255\255\255\255\031\000\255\255\255\255\255\255\108\000\255\255\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\106\000\255\255\255\255\255\255\032\000\
    \255\255\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\049\000\090\000\090\000\090\000\090\000\
    \090\000\090\000\090\000\090\000\090\000\090\000\092\000\092\000\
    \092\000\092\000\092\000\092\000\092\000\092\000\092\000\092\000\
    \255\255\093\000\093\000\093\000\093\000\093\000\093\000\093\000\
    \093\000\093\000\093\000\255\255\255\255\255\255\042\000\255\255\
    \255\255\106\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\090\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\038\000\255\255\041\000\255\255\255\255\104\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\037\000\093\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\255\255\255\255\255\255\255\255\104\000\255\255\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\104\000\104\000\104\000\104\000\104\000\104\000\
    \104\000\104\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\118\000\255\255\255\255\255\255\255\255\255\255\
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
    ";
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
let
# 17 "imp_lexer.mll"
                                                          lxm
# 234 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) (lexbuf.Lexing.lex_curr_pos + -1) in
# 17 "imp_lexer.mll"
                                                                    ( STG(Scanf.unescaped lxm) )
# 238 "imp_lexer.ml"

  | 1 ->
# 18 "imp_lexer.mll"
                    ( Util.pnt true "start line comment\n"; token lexbuf )
# 243 "imp_lexer.ml"

  | 2 ->
# 19 "imp_lexer.mll"
                          ( token lexbuf )
# 248 "imp_lexer.ml"

  | 3 ->
# 20 "imp_lexer.mll"
            ( LCE )
# 253 "imp_lexer.ml"

  | 4 ->
# 21 "imp_lexer.mll"
             ( LCE_IR  )
# 258 "imp_lexer.ml"

  | 5 ->
# 22 "imp_lexer.mll"
              ( MDL )
# 263 "imp_lexer.ml"

  | 6 ->
# 23 "imp_lexer.mll"
              ( MDL_END )
# 268 "imp_lexer.ml"

  | 7 ->
# 24 "imp_lexer.mll"
           ( DTA )
# 273 "imp_lexer.ml"

  | 8 ->
# 25 "imp_lexer.mll"
               ( DTA_GRM )
# 278 "imp_lexer.ml"

  | 9 ->
# 26 "imp_lexer.mll"
             ( NOT_SPL )
# 283 "imp_lexer.ml"

  | 10 ->
# 27 "imp_lexer.mll"
            ( SLH )
# 288 "imp_lexer.ml"

  | 11 ->
# 28 "imp_lexer.mll"
            ( FOR_ALL )
# 293 "imp_lexer.ml"

  | 12 ->
let
# 29 "imp_lexer.mll"
               lxm
# 299 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 29 "imp_lexer.mll"
                         ( VAL(lxm) )
# 303 "imp_lexer.ml"

  | 13 ->
let
# 30 "imp_lexer.mll"
              lxm
# 309 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 30 "imp_lexer.mll"
                  ( NAM(lxm) )
# 313 "imp_lexer.ml"

  | 14 ->
# 31 "imp_lexer.mll"
              ( OUT_IR )
# 318 "imp_lexer.ml"

  | 15 ->
# 32 "imp_lexer.mll"
              ( PRJ_IR  )
# 323 "imp_lexer.ml"

  | 16 ->
# 33 "imp_lexer.mll"
              ( CNS_IR  )
# 328 "imp_lexer.ml"

  | 17 ->
# 34 "imp_lexer.mll"
            ( INI_IR )
# 333 "imp_lexer.ml"

  | 18 ->
# 35 "imp_lexer.mll"
            ( RM  )
# 338 "imp_lexer.ml"

  | 19 ->
# 36 "imp_lexer.mll"
            ( ISO )
# 343 "imp_lexer.ml"

  | 20 ->
# 37 "imp_lexer.mll"
          ( LET )
# 348 "imp_lexer.ml"

  | 21 ->
# 38 "imp_lexer.mll"
          ( OP )
# 353 "imp_lexer.ml"

  | 22 ->
# 39 "imp_lexer.mll"
          ( LB )
# 358 "imp_lexer.ml"

  | 23 ->
# 40 "imp_lexer.mll"
           ( ARR )
# 363 "imp_lexer.ml"

  | 24 ->
# 41 "imp_lexer.mll"
           ( ARR_REV )
# 368 "imp_lexer.ml"

  | 25 ->
# 42 "imp_lexer.mll"
             ( ARR_REV_IN )
# 373 "imp_lexer.ml"

  | 26 ->
let
# 43 "imp_lexer.mll"
                 lxm
# 379 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -2) in
# 43 "imp_lexer.mll"
                           ( IN(String.length lxm) )
# 383 "imp_lexer.ml"

  | 27 ->
let
# 44 "imp_lexer.mll"
                      lxm
# 389 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 2) lexbuf.Lexing.lex_curr_pos in
# 44 "imp_lexer.mll"
                            ( OUT(String.length lxm) )
# 393 "imp_lexer.ml"

  | 28 ->
# 45 "imp_lexer.mll"
            ( SRC )
# 398 "imp_lexer.ml"

  | 29 ->
# 46 "imp_lexer.mll"
              ( SRC_OUT )
# 403 "imp_lexer.ml"

  | 30 ->
# 47 "imp_lexer.mll"
              ( SRC_IL )
# 408 "imp_lexer.ml"

  | 31 ->
# 48 "imp_lexer.mll"
          ( EXN )
# 413 "imp_lexer.ml"

  | 32 ->
# 49 "imp_lexer.mll"
          ( CLN )
# 418 "imp_lexer.ml"

  | 33 ->
# 50 "imp_lexer.mll"
          ( SPL )
# 423 "imp_lexer.ml"

  | 34 ->
# 51 "imp_lexer.mll"
             ( AGL )
# 428 "imp_lexer.ml"

  | 35 ->
# 52 "imp_lexer.mll"
          ( R_BLK )
# 433 "imp_lexer.ml"

  | 36 ->
# 53 "imp_lexer.mll"
          ( L_BLK )
# 438 "imp_lexer.ml"

  | 37 ->
# 54 "imp_lexer.mll"
          ( SEQ )
# 443 "imp_lexer.ml"

  | 38 ->
# 55 "imp_lexer.mll"
              ( COPRD )
# 448 "imp_lexer.ml"

  | 39 ->
# 56 "imp_lexer.mll"
              ( PRD )
# 453 "imp_lexer.ml"

  | 40 ->
# 57 "imp_lexer.mll"
            ( EOP )
# 458 "imp_lexer.ml"

  | 41 ->
# 58 "imp_lexer.mll"
            ( COPRD_END )
# 463 "imp_lexer.ml"

  | 42 ->
# 59 "imp_lexer.mll"
            ( PRD_END )
# 468 "imp_lexer.ml"

  | 43 ->
# 60 "imp_lexer.mll"
            ( DEF )
# 473 "imp_lexer.ml"

  | 44 ->
# 61 "imp_lexer.mll"
          ( ACT )
# 478 "imp_lexer.ml"

  | 45 ->
# 62 "imp_lexer.mll"
            ( CST )
# 483 "imp_lexer.ml"

  | 46 ->
# 63 "imp_lexer.mll"
          ( WC )
# 488 "imp_lexer.ml"

  | 47 ->
let
# 64 "imp_lexer.mll"
                        lxm
# 494 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 4) (lexbuf.Lexing.lex_curr_pos + -1) in
# 64 "imp_lexer.mll"
                                 ( INJ(int_of_string lxm) )
# 498 "imp_lexer.ml"

  | 48 ->
let
# 65 "imp_lexer.mll"
                        lxm
# 504 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 4) (lexbuf.Lexing.lex_curr_pos + -1) in
# 65 "imp_lexer.mll"
                                 ( CHO(int_of_string lxm) )
# 508 "imp_lexer.ml"

  | 49 ->
# 66 "imp_lexer.mll"
            ( VCT )
# 513 "imp_lexer.ml"

  | 50 ->
# 67 "imp_lexer.mll"
          ( L_RCD )
# 518 "imp_lexer.ml"

  | 51 ->
# 68 "imp_lexer.mll"
          ( R_RCD )
# 523 "imp_lexer.ml"

  | 52 ->
# 69 "imp_lexer.mll"
            ( L_LST )
# 528 "imp_lexer.ml"

  | 53 ->
# 70 "imp_lexer.mll"
            ( R_LST )
# 533 "imp_lexer.ml"

  | 54 ->
# 71 "imp_lexer.mll"
            ( L_OPN )
# 538 "imp_lexer.ml"

  | 55 ->
# 72 "imp_lexer.mll"
            ( R_OPN )
# 543 "imp_lexer.ml"

  | 56 ->
# 73 "imp_lexer.mll"
          ( SGN )
# 548 "imp_lexer.ml"

  | 57 ->
# 74 "imp_lexer.mll"
          ( VCT_INI )
# 553 "imp_lexer.ml"

  | 58 ->
# 75 "imp_lexer.mll"
          ( L_PRN )
# 558 "imp_lexer.ml"

  | 59 ->
# 76 "imp_lexer.mll"
          ( R_PRN )
# 563 "imp_lexer.ml"

  | 60 ->
# 77 "imp_lexer.mll"
           ( DSH )
# 568 "imp_lexer.ml"

  | 61 ->
# 78 "imp_lexer.mll"
          ( EQ )
# 573 "imp_lexer.ml"

  | 62 ->
# 79 "imp_lexer.mll"
          ( EXP )
# 578 "imp_lexer.ml"

  | 63 ->
# 80 "imp_lexer.mll"
            ( APP )
# 583 "imp_lexer.ml"

  | 64 ->
# 81 "imp_lexer.mll"
            ( PRJ )
# 588 "imp_lexer.ml"

  | 65 ->
# 82 "imp_lexer.mll"
            ( Z )
# 593 "imp_lexer.ml"

  | 66 ->
# 83 "imp_lexer.mll"
            ( N )
# 598 "imp_lexer.ml"

  | 67 ->
# 84 "imp_lexer.mll"
            ( TYP_STG )
# 603 "imp_lexer.ml"

  | 68 ->
# 85 "imp_lexer.mll"
          ( PLS )
# 608 "imp_lexer.ml"

  | 69 ->
# 86 "imp_lexer.mll"
          ( MLT )
# 613 "imp_lexer.ml"

  | 70 ->
# 87 "imp_lexer.mll"
          ( MNS )
# 618 "imp_lexer.ml"

  | 71 ->
# 88 "imp_lexer.mll"
            ( GRM )
# 623 "imp_lexer.ml"

  | 72 ->
# 89 "imp_lexer.mll"
           ( NOT )
# 628 "imp_lexer.ml"

  | 73 ->
# 90 "imp_lexer.mll"
              ( ORD_LEX_COPRD )
# 633 "imp_lexer.ml"

  | 74 ->
# 91 "imp_lexer.mll"
          ( CMM )
# 638 "imp_lexer.ml"

  | 75 ->
let
# 92 "imp_lexer.mll"
                      lxm
# 644 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 92 "imp_lexer.mll"
                           ( ROT (String.length lxm) )
# 648 "imp_lexer.ml"

  | 76 ->
let
# 93 "imp_lexer.mll"
                      lxm
# 654 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 93 "imp_lexer.mll"
                           ( SLF (String.length lxm) )
# 658 "imp_lexer.ml"

  | 77 ->
let
# 94 "imp_lexer.mll"
                 lxm
# 664 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 94 "imp_lexer.mll"
                           ( IDX (int_of_string lxm) )
# 668 "imp_lexer.ml"

  | 78 ->
# 95 "imp_lexer.mll"
          ( DOT )
# 673 "imp_lexer.ml"

  | 79 ->
# 96 "imp_lexer.mll"
             ( AGL )
# 678 "imp_lexer.ml"

  | 80 ->
let
# 97 "imp_lexer.mll"
                lxm
# 684 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 97 "imp_lexer.mll"
                     ( INT (int_of_string lxm) )
# 688 "imp_lexer.ml"

  | 81 ->
# 98 "imp_lexer.mll"
                    ( token lexbuf                         )
# 693 "imp_lexer.ml"

  | 82 ->
# 99 "imp_lexer.mll"
            ( NL )
# 698 "imp_lexer.ml"

  | 83 ->
# 100 "imp_lexer.mll"
                    ( EOF               )
# 703 "imp_lexer.ml"

  | 84 ->
# 101 "imp_lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 710 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and line_comment lexbuf =
   __ocaml_lex_line_comment_rec lexbuf 118
and __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 105 "imp_lexer.mll"
          ( Util.pnt true "end line comment\n"; token lexbuf )
# 722 "imp_lexer.ml"

  | 1 ->
# 106 "imp_lexer.mll"
      ( line_comment lexbuf )
# 727 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state

;;

