# 1 "imp_lexer.mll"
 
    open Imp_parser
    exception Error of string

# 7 "imp_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\171\255\172\255\005\000\088\000\000\000\021\000\184\255\
    \068\000\069\000\070\000\197\255\199\255\200\255\201\255\202\255\
    \210\255\037\000\213\255\085\000\215\255\223\255\224\255\225\255\
    \229\255\230\255\009\000\238\255\073\000\162\000\018\000\244\255\
    \011\000\000\000\090\000\002\000\128\000\255\255\129\000\130\000\
    \131\000\094\000\112\000\100\000\222\255\036\000\037\000\125\000\
    \001\000\003\000\127\000\250\255\027\000\042\000\000\000\248\255\
    \245\255\051\000\246\255\047\000\034\000\048\000\000\000\014\000\
    \055\000\049\000\022\000\052\000\062\000\157\000\217\255\218\255\
    \219\255\220\255\221\255\105\000\243\255\226\255\216\255\240\255\
    \109\000\236\255\254\000\014\001\212\255\233\255\231\255\232\255\
    \208\255\209\255\206\255\207\255\204\255\205\255\195\255\163\000\
    \180\255\192\255\193\255\194\255\188\255\242\255\067\001\239\255\
    \017\000\101\000\235\255\214\255\203\255\179\255\178\255\177\255\
    \174\255\181\255\195\000\254\255\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\082\000\080\000\073\000\072\000\255\255\
    \066\000\065\000\064\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\044\000\255\255\084\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\027\000\255\255\057\000\014\000\084\000\255\255\
    \008\000\084\000\084\000\001\000\084\000\255\255\255\255\255\255\
    \000\000\255\255\255\255\002\000\255\255\018\000\068\000\006\000\
    \003\000\255\255\004\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\021\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\028\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\059\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\014\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\255\255\255\255\255\255\000\000\
    \255\255\255\255\255\255\000\000\000\000\000\000\000\000\000\000\
    \000\000\255\255\000\000\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\000\000\255\255\255\255\255\255\000\000\
    \255\255\255\255\255\255\035\000\038\000\000\000\038\000\038\000\
    \038\000\041\000\041\000\041\000\000\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\255\255\255\255\255\255\000\000\
    \000\000\255\255\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\000\000\000\000\
    \255\255\000\000\255\255\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \255\255\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\115\000\000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\000\000\255\255\003\000\003\000\003\000\
    \000\000\000\000\003\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \003\000\011\000\036\000\014\000\006\000\003\000\015\000\005\000\
    \013\000\012\000\009\000\010\000\007\000\008\000\034\000\019\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\024\000\035\000\006\000\028\000\032\000\025\000\
    \005\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\022\000\031\000\023\000\021\000\018\000\
    \020\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\017\000\026\000\016\000\027\000\113\000\
    \111\000\110\000\109\000\108\000\107\000\105\000\103\000\058\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\062\000\064\000\112\000\041\000\060\000\059\000\
    \067\000\042\000\069\000\068\000\066\000\065\000\043\000\042\000\
    \057\000\056\000\037\000\037\000\040\000\037\000\044\000\048\000\
    \052\000\061\000\050\000\042\000\046\000\051\000\054\000\057\000\
    \100\000\063\000\095\000\094\000\091\000\090\000\047\000\098\000\
    \085\000\093\000\092\000\045\000\089\000\088\000\055\000\087\000\
    \086\000\079\000\033\000\049\000\077\000\080\000\099\000\081\000\
    \082\000\101\000\096\000\104\000\106\000\116\000\000\000\000\000\
    \078\000\000\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\039\000\039\000\039\000\039\000\
    \097\000\105\000\030\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\053\000\000\000\000\000\
    \002\000\102\000\255\255\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\076\000\000\000\000\000\
    \000\000\000\000\000\000\070\000\071\000\000\000\000\000\104\000\
    \000\000\000\000\000\000\072\000\073\000\074\000\083\000\083\000\
    \083\000\083\000\083\000\083\000\083\000\083\000\083\000\083\000\
    \000\000\000\000\000\000\000\000\000\000\075\000\083\000\083\000\
    \083\000\083\000\083\000\083\000\083\000\083\000\083\000\083\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\000\000\000\000\
    \000\000\000\000\101\000\084\000\000\000\000\000\000\000\000\000\
    \255\255\000\000\000\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\000\000\000\000\000\000\
    \255\255\255\255\255\255\255\255\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\000\000\000\000\
    \000\000\000\000\102\000\000\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\000\000\000\000\
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
    \000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\035\000\000\000\003\000\003\000\
    \255\255\255\255\003\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\003\000\000\000\005\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\006\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\
    \008\000\009\000\010\000\017\000\019\000\026\000\028\000\032\000\
    \004\000\004\000\004\000\004\000\004\000\004\000\004\000\004\000\
    \004\000\004\000\030\000\030\000\004\000\034\000\030\000\030\000\
    \030\000\041\000\030\000\030\000\030\000\030\000\042\000\043\000\
    \045\000\046\000\036\000\038\000\039\000\040\000\033\000\033\000\
    \047\000\030\000\049\000\042\000\033\000\050\000\053\000\057\000\
    \059\000\030\000\061\000\061\000\063\000\063\000\033\000\060\000\
    \066\000\062\000\062\000\033\000\064\000\064\000\054\000\065\000\
    \065\000\068\000\000\000\048\000\075\000\067\000\060\000\067\000\
    \080\000\029\000\095\000\026\000\104\000\114\000\255\255\255\255\
    \068\000\255\255\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\036\000\038\000\039\000\040\000\
    \060\000\105\000\000\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\052\000\255\255\255\255\
    \000\000\029\000\035\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\029\000\029\000\029\000\
    \029\000\029\000\029\000\029\000\029\000\069\000\255\255\255\255\
    \255\255\255\255\255\255\069\000\069\000\255\255\255\255\105\000\
    \255\255\255\255\255\255\069\000\069\000\069\000\082\000\082\000\
    \082\000\082\000\082\000\082\000\082\000\082\000\082\000\082\000\
    \255\255\255\255\255\255\255\255\255\255\069\000\083\000\083\000\
    \083\000\083\000\083\000\083\000\083\000\083\000\083\000\083\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\041\000\255\255\
    \255\255\255\255\255\255\255\255\043\000\255\255\255\255\255\255\
    \255\255\255\255\102\000\083\000\255\255\255\255\255\255\255\255\
    \042\000\255\255\255\255\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\255\255\255\255\255\255\
    \036\000\038\000\039\000\040\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\255\255\255\255\
    \255\255\255\255\102\000\255\255\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\102\000\102\000\
    \102\000\102\000\102\000\102\000\102\000\102\000\255\255\255\255\
    \255\255\255\255\255\255\114\000\255\255\255\255\255\255\255\255\
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
    \255\255\255\255\255\255\255\255";
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
# 16 "imp_lexer.mll"
                                  lxm
# 227 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) (lexbuf.Lexing.lex_curr_pos + -1) in
# 16 "imp_lexer.mll"
                                            ( STG(lxm) )
# 231 "imp_lexer.ml"

  | 1 ->
# 17 "imp_lexer.mll"
                    ( Util.pnt true "start line comment\n"; token lexbuf )
# 236 "imp_lexer.ml"

  | 2 ->
# 18 "imp_lexer.mll"
                      ( token lexbuf )
# 241 "imp_lexer.ml"

  | 3 ->
# 19 "imp_lexer.mll"
            ( LCE )
# 246 "imp_lexer.ml"

  | 4 ->
# 20 "imp_lexer.mll"
              ( MDL )
# 251 "imp_lexer.ml"

  | 5 ->
# 21 "imp_lexer.mll"
              ( MDL_END )
# 256 "imp_lexer.ml"

  | 6 ->
# 22 "imp_lexer.mll"
           ( DTA )
# 261 "imp_lexer.ml"

  | 7 ->
# 23 "imp_lexer.mll"
               ( DTA_GRM )
# 266 "imp_lexer.ml"

  | 8 ->
# 24 "imp_lexer.mll"
          ( ORD_COPRD )
# 271 "imp_lexer.ml"

  | 9 ->
# 25 "imp_lexer.mll"
            ( ORD_LEX_COPRD )
# 276 "imp_lexer.ml"

  | 10 ->
# 26 "imp_lexer.mll"
             ( NOT_SPL )
# 281 "imp_lexer.ml"

  | 11 ->
# 27 "imp_lexer.mll"
            ( SLH )
# 286 "imp_lexer.ml"

  | 12 ->
# 28 "imp_lexer.mll"
            ( FOR_ALL )
# 291 "imp_lexer.ml"

  | 13 ->
let
# 29 "imp_lexer.mll"
               lxm
# 297 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 29 "imp_lexer.mll"
                         ( VAL(lxm) )
# 301 "imp_lexer.ml"

  | 14 ->
let
# 30 "imp_lexer.mll"
              lxm
# 307 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 30 "imp_lexer.mll"
                  ( NAM(lxm) )
# 311 "imp_lexer.ml"

  | 15 ->
# 31 "imp_lexer.mll"
            ( ISO )
# 316 "imp_lexer.ml"

  | 16 ->
# 32 "imp_lexer.mll"
            ( DEQ )
# 321 "imp_lexer.ml"

  | 17 ->
# 33 "imp_lexer.mll"
          ( LET )
# 326 "imp_lexer.ml"

  | 18 ->
# 34 "imp_lexer.mll"
           ( ARR )
# 331 "imp_lexer.ml"

  | 19 ->
# 35 "imp_lexer.mll"
            ( CHO )
# 336 "imp_lexer.ml"

  | 20 ->
let
# 36 "imp_lexer.mll"
                 lxm
# 342 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -2) in
# 36 "imp_lexer.mll"
                           ( IN(String.length lxm) )
# 346 "imp_lexer.ml"

  | 21 ->
let
# 37 "imp_lexer.mll"
                      lxm
# 352 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 2) lexbuf.Lexing.lex_curr_pos in
# 37 "imp_lexer.mll"
                            ( OUT(String.length lxm) )
# 356 "imp_lexer.ml"

  | 22 ->
# 38 "imp_lexer.mll"
            ( SRC )
# 361 "imp_lexer.ml"

  | 23 ->
# 39 "imp_lexer.mll"
            ( EMT )
# 366 "imp_lexer.ml"

  | 24 ->
# 40 "imp_lexer.mll"
            ( CNT )
# 371 "imp_lexer.ml"

  | 25 ->
# 41 "imp_lexer.mll"
          ( EXN )
# 376 "imp_lexer.ml"

  | 26 ->
# 42 "imp_lexer.mll"
          ( CLN )
# 381 "imp_lexer.ml"

  | 27 ->
# 43 "imp_lexer.mll"
          ( SPL )
# 386 "imp_lexer.ml"

  | 28 ->
# 44 "imp_lexer.mll"
            ( AGL_TOP )
# 391 "imp_lexer.ml"

  | 29 ->
# 45 "imp_lexer.mll"
                 ( AGL )
# 396 "imp_lexer.ml"

  | 30 ->
# 46 "imp_lexer.mll"
          ( R_BLK )
# 401 "imp_lexer.ml"

  | 31 ->
# 47 "imp_lexer.mll"
          ( L_BLK )
# 406 "imp_lexer.ml"

  | 32 ->
# 48 "imp_lexer.mll"
          ( SEQ )
# 411 "imp_lexer.ml"

  | 33 ->
# 49 "imp_lexer.mll"
            ( M_HLZ )
# 416 "imp_lexer.ml"

  | 34 ->
# 50 "imp_lexer.mll"
              ( COPRD )
# 421 "imp_lexer.ml"

  | 35 ->
# 51 "imp_lexer.mll"
              ( PRD )
# 426 "imp_lexer.ml"

  | 36 ->
# 52 "imp_lexer.mll"
            ( EOP )
# 431 "imp_lexer.ml"

  | 37 ->
# 53 "imp_lexer.mll"
            ( COPRD_END )
# 436 "imp_lexer.ml"

  | 38 ->
# 54 "imp_lexer.mll"
            ( PRD_END )
# 441 "imp_lexer.ml"

  | 39 ->
# 55 "imp_lexer.mll"
            ( DEF )
# 446 "imp_lexer.ml"

  | 40 ->
# 56 "imp_lexer.mll"
          ( ACT )
# 451 "imp_lexer.ml"

  | 41 ->
# 57 "imp_lexer.mll"
            ( CST )
# 456 "imp_lexer.ml"

  | 42 ->
# 58 "imp_lexer.mll"
          ( WC )
# 461 "imp_lexer.ml"

  | 43 ->
let
# 59 "imp_lexer.mll"
                        lxm
# 467 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 4) (lexbuf.Lexing.lex_curr_pos + -1) in
# 59 "imp_lexer.mll"
                                 ( INJ(int_of_string lxm) )
# 471 "imp_lexer.ml"

  | 44 ->
# 60 "imp_lexer.mll"
          ( L_RCD )
# 476 "imp_lexer.ml"

  | 45 ->
# 61 "imp_lexer.mll"
          ( R_RCD )
# 481 "imp_lexer.ml"

  | 46 ->
# 62 "imp_lexer.mll"
            ( L_HLZ )
# 486 "imp_lexer.ml"

  | 47 ->
# 63 "imp_lexer.mll"
            ( R_HLZ  )
# 491 "imp_lexer.ml"

  | 48 ->
# 64 "imp_lexer.mll"
            ( L_LST )
# 496 "imp_lexer.ml"

  | 49 ->
# 65 "imp_lexer.mll"
            ( R_LST )
# 501 "imp_lexer.ml"

  | 50 ->
# 66 "imp_lexer.mll"
            ( L_OPN )
# 506 "imp_lexer.ml"

  | 51 ->
# 67 "imp_lexer.mll"
            ( R_OPN )
# 511 "imp_lexer.ml"

  | 52 ->
# 68 "imp_lexer.mll"
            ( L_VCT )
# 516 "imp_lexer.ml"

  | 53 ->
# 69 "imp_lexer.mll"
          ( SGN )
# 521 "imp_lexer.ml"

  | 54 ->
# 70 "imp_lexer.mll"
          ( VCT )
# 526 "imp_lexer.ml"

  | 55 ->
# 71 "imp_lexer.mll"
          ( L_PRN )
# 531 "imp_lexer.ml"

  | 56 ->
# 72 "imp_lexer.mll"
          ( R_PRN )
# 536 "imp_lexer.ml"

  | 57 ->
# 73 "imp_lexer.mll"
          ( EQ )
# 541 "imp_lexer.ml"

  | 58 ->
# 74 "imp_lexer.mll"
          ( EXP )
# 546 "imp_lexer.ml"

  | 59 ->
# 75 "imp_lexer.mll"
            ( APP )
# 551 "imp_lexer.ml"

  | 60 ->
# 76 "imp_lexer.mll"
            ( PRJ )
# 556 "imp_lexer.ml"

  | 61 ->
# 77 "imp_lexer.mll"
            ( Z )
# 561 "imp_lexer.ml"

  | 62 ->
# 78 "imp_lexer.mll"
            ( N )
# 566 "imp_lexer.ml"

  | 63 ->
# 79 "imp_lexer.mll"
            ( TYP_STG )
# 571 "imp_lexer.ml"

  | 64 ->
# 80 "imp_lexer.mll"
          ( PLS )
# 576 "imp_lexer.ml"

  | 65 ->
# 81 "imp_lexer.mll"
          ( MLT )
# 581 "imp_lexer.ml"

  | 66 ->
# 82 "imp_lexer.mll"
          ( MNS )
# 586 "imp_lexer.ml"

  | 67 ->
# 83 "imp_lexer.mll"
            ( GRM )
# 591 "imp_lexer.ml"

  | 68 ->
# 84 "imp_lexer.mll"
           ( NOT )
# 596 "imp_lexer.ml"

  | 69 ->
# 85 "imp_lexer.mll"
          ( ORD_COPRD )
# 601 "imp_lexer.ml"

  | 70 ->
# 86 "imp_lexer.mll"
            ( ORD_LEX_COPRD )
# 606 "imp_lexer.ml"

  | 71 ->
# 87 "imp_lexer.mll"
          ( CMM )
# 611 "imp_lexer.ml"

  | 72 ->
let
# 88 "imp_lexer.mll"
                      lxm
# 617 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 88 "imp_lexer.mll"
                           ( ROT (String.length lxm) )
# 621 "imp_lexer.ml"

  | 73 ->
let
# 89 "imp_lexer.mll"
                      lxm
# 627 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 89 "imp_lexer.mll"
                           ( SLF (String.length lxm) )
# 631 "imp_lexer.ml"

  | 74 ->
let
# 90 "imp_lexer.mll"
                 lxm
# 637 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 90 "imp_lexer.mll"
                           ( IDX (int_of_string lxm) )
# 641 "imp_lexer.ml"

  | 75 ->
# 91 "imp_lexer.mll"
              ( APP_EVL )
# 646 "imp_lexer.ml"

  | 76 ->
# 92 "imp_lexer.mll"
           ( PLS_NAT )
# 651 "imp_lexer.ml"

  | 77 ->
# 93 "imp_lexer.mll"
           ( MLT_NAT )
# 656 "imp_lexer.ml"

  | 78 ->
# 94 "imp_lexer.mll"
            ( MNS_NAT )
# 661 "imp_lexer.ml"

  | 79 ->
# 95 "imp_lexer.mll"
             ( AGL )
# 666 "imp_lexer.ml"

  | 80 ->
let
# 96 "imp_lexer.mll"
                lxm
# 672 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 96 "imp_lexer.mll"
                     ( INT (int_of_string lxm) )
# 676 "imp_lexer.ml"

  | 81 ->
let
# 97 "imp_lexer.mll"
                 lxm
# 682 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 97 "imp_lexer.mll"
                           ( NAT (int_of_string lxm) )
# 686 "imp_lexer.ml"

  | 82 ->
# 98 "imp_lexer.mll"
                    ( token lexbuf                         )
# 691 "imp_lexer.ml"

  | 83 ->
# 99 "imp_lexer.mll"
                    ( EOF               )
# 696 "imp_lexer.ml"

  | 84 ->
# 100 "imp_lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 703 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and line_comment lexbuf =
   __ocaml_lex_line_comment_rec lexbuf 114
and __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 104 "imp_lexer.mll"
          ( Util.pnt true "end line comment\n"; token lexbuf )
# 715 "imp_lexer.ml"

  | 1 ->
# 105 "imp_lexer.mll"
      ( line_comment lexbuf )
# 720 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state

;;

