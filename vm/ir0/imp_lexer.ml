# 1 "imp_lexer.mll"
 
    open Imp_parser
    exception Error of string

# 7 "imp_lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\168\255\169\255\005\000\173\255\088\000\089\000\090\000\
    \177\255\181\255\182\255\183\255\189\255\190\255\191\255\192\255\
    \193\255\194\255\195\255\006\000\203\255\207\255\084\000\209\255\
    \217\255\219\255\222\255\223\255\233\255\234\255\008\000\023\000\
    \209\000\020\000\245\255\001\000\074\000\011\000\100\000\255\255\
    \117\000\101\000\091\000\062\000\253\255\216\255\036\000\037\000\
    \038\000\120\000\138\000\002\000\116\000\251\255\119\000\249\255\
    \002\000\034\000\017\000\247\255\246\255\050\000\230\255\046\000\
    \027\000\000\000\011\000\037\000\047\000\025\000\064\000\066\000\
    \070\000\211\255\212\255\213\255\214\255\157\000\220\255\244\255\
    \178\255\188\255\076\000\239\255\210\255\236\255\204\255\077\000\
    \226\255\224\255\225\255\111\000\112\000\186\000\029\001\206\255\
    \054\001\064\001\205\255\198\255\199\255\196\255\197\255\184\255\
    \185\255\186\255\180\255\243\255\093\001\201\255\020\000\107\000\
    \238\255\057\000\085\000\240\255\241\255\229\255\237\255\208\255\
    \200\255\174\255\012\000\254\255\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\085\000\255\255\084\000\080\000\079\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\053\000\255\255\255\255\087\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\020\000\034\000\
    \013\000\087\000\255\255\087\000\037\000\001\000\087\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\024\000\023\000\
    \076\000\007\000\003\000\255\255\255\255\255\255\005\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\027\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\040\000\255\255\255\255\
    \255\255\255\255\068\000\255\255\255\255\255\255\255\255\028\000\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\013\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\255\255\000\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\255\255\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\255\255\255\255\
    \255\255\255\255\000\000\255\255\255\255\037\000\041\000\000\000\
    \255\255\041\000\042\000\255\255\000\000\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\000\000\255\255\000\000\
    \255\255\255\255\255\255\000\000\000\000\255\255\000\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\255\255\000\000\000\000\
    \000\000\000\000\255\255\000\000\000\000\000\000\000\000\255\255\
    \000\000\000\000\000\000\255\255\255\255\255\255\255\255\000\000\
    \255\255\255\255\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\255\255\000\000\255\255\255\255\
    \000\000\255\255\255\255\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\123\000\000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\003\000\003\000\000\000\000\000\003\000\003\000\003\000\
    \000\000\000\000\003\000\000\000\000\000\255\255\124\000\000\000\
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
    \032\000\032\000\032\000\020\000\031\000\019\000\030\000\121\000\
    \006\000\007\000\120\000\119\000\118\000\042\000\039\000\039\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\109\000\111\000\065\000\112\000\043\000\041\000\
    \064\000\063\000\067\000\044\000\072\000\070\000\069\000\068\000\
    \062\000\061\000\060\000\056\000\053\000\055\000\058\000\045\000\
    \050\000\054\000\059\000\071\000\046\000\048\000\061\000\106\000\
    \104\000\100\000\099\000\066\000\103\000\052\000\092\000\049\000\
    \091\000\102\000\101\000\087\000\047\000\090\000\089\000\105\000\
    \040\000\040\000\035\000\085\000\081\000\082\000\079\000\080\000\
    \083\000\088\000\096\000\093\000\073\000\074\000\086\000\117\000\
    \114\000\041\000\084\000\000\000\075\000\076\000\077\000\116\000\
    \115\000\110\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\033\000\041\000\057\000\000\000\078\000\111\000\
    \000\000\041\000\094\000\094\000\094\000\094\000\094\000\094\000\
    \094\000\094\000\094\000\094\000\000\000\000\000\000\000\000\000\
    \107\000\113\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\255\255\255\255\000\000\000\000\000\000\
    \000\000\000\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\000\000\110\000\000\000\000\000\
    \108\000\000\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\051\000\094\000\094\000\094\000\
    \094\000\094\000\094\000\094\000\094\000\094\000\094\000\000\000\
    \000\000\000\000\000\000\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\255\255\255\255\097\000\097\000\
    \097\000\097\000\097\000\097\000\097\000\097\000\097\000\097\000\
    \097\000\097\000\097\000\097\000\097\000\097\000\097\000\097\000\
    \097\000\097\000\095\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\107\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\098\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \000\000\000\000\000\000\000\000\108\000\000\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
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
    \000\000\000\000\000\000\000\000\000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\255\255\000\000\003\000\003\000\
    \255\255\255\255\003\000\255\255\255\255\037\000\122\000\255\255\
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
    \006\000\007\000\019\000\022\000\030\000\036\000\038\000\041\000\
    \005\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
    \005\000\005\000\031\000\031\000\033\000\031\000\042\000\040\000\
    \033\000\033\000\033\000\043\000\033\000\033\000\033\000\033\000\
    \046\000\047\000\048\000\049\000\052\000\054\000\057\000\035\000\
    \035\000\051\000\058\000\033\000\035\000\035\000\061\000\063\000\
    \064\000\066\000\066\000\033\000\064\000\050\000\067\000\035\000\
    \067\000\065\000\065\000\069\000\035\000\068\000\068\000\064\000\
    \038\000\041\000\000\000\070\000\071\000\071\000\072\000\077\000\
    \082\000\087\000\091\000\092\000\072\000\072\000\069\000\110\000\
    \113\000\040\000\070\000\255\255\072\000\072\000\072\000\114\000\
    \114\000\031\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\040\000\056\000\255\255\072\000\111\000\
    \255\255\040\000\093\000\093\000\093\000\093\000\093\000\093\000\
    \093\000\093\000\093\000\093\000\255\255\255\255\255\255\255\255\
    \032\000\031\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\037\000\122\000\255\255\255\255\255\255\
    \255\255\255\255\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\255\255\111\000\255\255\255\255\
    \032\000\255\255\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\050\000\094\000\094\000\094\000\
    \094\000\094\000\094\000\094\000\094\000\094\000\094\000\255\255\
    \255\255\255\255\255\255\042\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\038\000\041\000\096\000\096\000\
    \096\000\096\000\096\000\096\000\096\000\096\000\096\000\096\000\
    \097\000\097\000\097\000\097\000\097\000\097\000\097\000\097\000\
    \097\000\097\000\094\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\108\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\097\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \255\255\255\255\255\255\255\255\108\000\255\255\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
    \108\000\108\000\108\000\108\000\108\000\108\000\108\000\108\000\
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
    \255\255\255\255\255\255\255\255\255\255\255\255";
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
# 236 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) (lexbuf.Lexing.lex_curr_pos + -1) in
# 16 "imp_lexer.mll"
                                                                    ( STG(Scanf.unescaped lxm) )
# 240 "imp_lexer.ml"

  | 1 ->
# 17 "imp_lexer.mll"
                    ( Util.pnt true "start line comment\n"; token lexbuf )
# 245 "imp_lexer.ml"

  | 2 ->
# 18 "imp_lexer.mll"
                          ( token lexbuf )
# 250 "imp_lexer.ml"

  | 3 ->
# 19 "imp_lexer.mll"
            ( LCE )
# 255 "imp_lexer.ml"

  | 4 ->
# 20 "imp_lexer.mll"
             ( LCE_IR  )
# 260 "imp_lexer.ml"

  | 5 ->
# 21 "imp_lexer.mll"
              ( MDL )
# 265 "imp_lexer.ml"

  | 6 ->
# 22 "imp_lexer.mll"
              ( MDL_END )
# 270 "imp_lexer.ml"

  | 7 ->
# 23 "imp_lexer.mll"
           ( DTA )
# 275 "imp_lexer.ml"

  | 8 ->
# 24 "imp_lexer.mll"
               ( DTA_GRM )
# 280 "imp_lexer.ml"

  | 9 ->
# 25 "imp_lexer.mll"
             ( NOT_SPL )
# 285 "imp_lexer.ml"

  | 10 ->
# 26 "imp_lexer.mll"
            ( SLH )
# 290 "imp_lexer.ml"

  | 11 ->
# 27 "imp_lexer.mll"
            ( FOR_ALL )
# 295 "imp_lexer.ml"

  | 12 ->
let
# 28 "imp_lexer.mll"
               lxm
# 301 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 28 "imp_lexer.mll"
                         ( VAL(lxm) )
# 305 "imp_lexer.ml"

  | 13 ->
let
# 29 "imp_lexer.mll"
              lxm
# 311 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 29 "imp_lexer.mll"
                  ( NAM(lxm) )
# 315 "imp_lexer.ml"

  | 14 ->
# 30 "imp_lexer.mll"
              ( OUT_IR )
# 320 "imp_lexer.ml"

  | 15 ->
# 31 "imp_lexer.mll"
              ( PRJ_IR  )
# 325 "imp_lexer.ml"

  | 16 ->
# 32 "imp_lexer.mll"
              ( CNS_IR  )
# 330 "imp_lexer.ml"

  | 17 ->
# 33 "imp_lexer.mll"
            ( INI_IR )
# 335 "imp_lexer.ml"

  | 18 ->
# 34 "imp_lexer.mll"
            ( RM  )
# 340 "imp_lexer.ml"

  | 19 ->
# 35 "imp_lexer.mll"
            ( ISO )
# 345 "imp_lexer.ml"

  | 20 ->
# 36 "imp_lexer.mll"
          ( LET )
# 350 "imp_lexer.ml"

  | 21 ->
# 37 "imp_lexer.mll"
          ( OP )
# 355 "imp_lexer.ml"

  | 22 ->
# 38 "imp_lexer.mll"
          ( LB )
# 360 "imp_lexer.ml"

  | 23 ->
# 39 "imp_lexer.mll"
           ( ARR )
# 365 "imp_lexer.ml"

  | 24 ->
# 40 "imp_lexer.mll"
           ( ARR_REV )
# 370 "imp_lexer.ml"

  | 25 ->
# 41 "imp_lexer.mll"
             ( ARR_REV_IN )
# 375 "imp_lexer.ml"

  | 26 ->
let
# 42 "imp_lexer.mll"
                 lxm
# 381 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -2) in
# 42 "imp_lexer.mll"
                           ( IN(String.length lxm) )
# 385 "imp_lexer.ml"

  | 27 ->
let
# 43 "imp_lexer.mll"
                      lxm
# 391 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 2) lexbuf.Lexing.lex_curr_pos in
# 43 "imp_lexer.mll"
                            ( OUT(String.length lxm) )
# 395 "imp_lexer.ml"

  | 28 ->
# 44 "imp_lexer.mll"
            ( SRC )
# 400 "imp_lexer.ml"

  | 29 ->
# 45 "imp_lexer.mll"
              ( SRC_OUT )
# 405 "imp_lexer.ml"

  | 30 ->
# 46 "imp_lexer.mll"
            ( EMT )
# 410 "imp_lexer.ml"

  | 31 ->
# 47 "imp_lexer.mll"
            ( CNT )
# 415 "imp_lexer.ml"

  | 32 ->
# 48 "imp_lexer.mll"
          ( EXN )
# 420 "imp_lexer.ml"

  | 33 ->
# 49 "imp_lexer.mll"
          ( CLN )
# 425 "imp_lexer.ml"

  | 34 ->
# 50 "imp_lexer.mll"
          ( SPL )
# 430 "imp_lexer.ml"

  | 35 ->
# 51 "imp_lexer.mll"
             ( AGL )
# 435 "imp_lexer.ml"

  | 36 ->
# 52 "imp_lexer.mll"
          ( R_BLK )
# 440 "imp_lexer.ml"

  | 37 ->
# 53 "imp_lexer.mll"
          ( L_BLK )
# 445 "imp_lexer.ml"

  | 38 ->
# 54 "imp_lexer.mll"
          ( SEQ )
# 450 "imp_lexer.ml"

  | 39 ->
# 55 "imp_lexer.mll"
            ( M_HLZ )
# 455 "imp_lexer.ml"

  | 40 ->
# 56 "imp_lexer.mll"
              ( COPRD )
# 460 "imp_lexer.ml"

  | 41 ->
# 57 "imp_lexer.mll"
              ( PRD )
# 465 "imp_lexer.ml"

  | 42 ->
# 58 "imp_lexer.mll"
            ( EOP )
# 470 "imp_lexer.ml"

  | 43 ->
# 59 "imp_lexer.mll"
            ( COPRD_END )
# 475 "imp_lexer.ml"

  | 44 ->
# 60 "imp_lexer.mll"
            ( PRD_END )
# 480 "imp_lexer.ml"

  | 45 ->
# 61 "imp_lexer.mll"
            ( DEF )
# 485 "imp_lexer.ml"

  | 46 ->
# 62 "imp_lexer.mll"
          ( ACT )
# 490 "imp_lexer.ml"

  | 47 ->
# 63 "imp_lexer.mll"
            ( CST )
# 495 "imp_lexer.ml"

  | 48 ->
# 64 "imp_lexer.mll"
          ( WC )
# 500 "imp_lexer.ml"

  | 49 ->
let
# 65 "imp_lexer.mll"
                        lxm
# 506 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 4) (lexbuf.Lexing.lex_curr_pos + -1) in
# 65 "imp_lexer.mll"
                                 ( INJ(int_of_string lxm) )
# 510 "imp_lexer.ml"

  | 50 ->
let
# 66 "imp_lexer.mll"
                        lxm
# 516 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 4) (lexbuf.Lexing.lex_curr_pos + -1) in
# 66 "imp_lexer.mll"
                                 ( CHO(int_of_string lxm) )
# 520 "imp_lexer.ml"

  | 51 ->
# 67 "imp_lexer.mll"
            ( VCT )
# 525 "imp_lexer.ml"

  | 52 ->
# 68 "imp_lexer.mll"
          ( L_RCD )
# 530 "imp_lexer.ml"

  | 53 ->
# 69 "imp_lexer.mll"
          ( R_RCD )
# 535 "imp_lexer.ml"

  | 54 ->
# 70 "imp_lexer.mll"
           ( L_HLZ )
# 540 "imp_lexer.ml"

  | 55 ->
# 71 "imp_lexer.mll"
           ( R_HLZ  )
# 545 "imp_lexer.ml"

  | 56 ->
# 72 "imp_lexer.mll"
            ( L_LST )
# 550 "imp_lexer.ml"

  | 57 ->
# 73 "imp_lexer.mll"
            ( R_LST )
# 555 "imp_lexer.ml"

  | 58 ->
# 74 "imp_lexer.mll"
            ( L_OPN )
# 560 "imp_lexer.ml"

  | 59 ->
# 75 "imp_lexer.mll"
            ( R_OPN )
# 565 "imp_lexer.ml"

  | 60 ->
# 76 "imp_lexer.mll"
          ( SGN )
# 570 "imp_lexer.ml"

  | 61 ->
# 77 "imp_lexer.mll"
          ( VCT_INI )
# 575 "imp_lexer.ml"

  | 62 ->
# 78 "imp_lexer.mll"
          ( L_PRN )
# 580 "imp_lexer.ml"

  | 63 ->
# 79 "imp_lexer.mll"
          ( R_PRN )
# 585 "imp_lexer.ml"

  | 64 ->
# 80 "imp_lexer.mll"
           ( DSH )
# 590 "imp_lexer.ml"

  | 65 ->
# 81 "imp_lexer.mll"
          ( EQ )
# 595 "imp_lexer.ml"

  | 66 ->
# 82 "imp_lexer.mll"
          ( EXP )
# 600 "imp_lexer.ml"

  | 67 ->
# 83 "imp_lexer.mll"
            ( APP )
# 605 "imp_lexer.ml"

  | 68 ->
# 84 "imp_lexer.mll"
            ( PRJ )
# 610 "imp_lexer.ml"

  | 69 ->
# 85 "imp_lexer.mll"
            ( Z )
# 615 "imp_lexer.ml"

  | 70 ->
# 86 "imp_lexer.mll"
            ( N )
# 620 "imp_lexer.ml"

  | 71 ->
# 87 "imp_lexer.mll"
            ( TYP_STG )
# 625 "imp_lexer.ml"

  | 72 ->
# 88 "imp_lexer.mll"
          ( PLS )
# 630 "imp_lexer.ml"

  | 73 ->
# 89 "imp_lexer.mll"
          ( MLT )
# 635 "imp_lexer.ml"

  | 74 ->
# 90 "imp_lexer.mll"
          ( MNS )
# 640 "imp_lexer.ml"

  | 75 ->
# 91 "imp_lexer.mll"
            ( GRM )
# 645 "imp_lexer.ml"

  | 76 ->
# 92 "imp_lexer.mll"
           ( NOT )
# 650 "imp_lexer.ml"

  | 77 ->
# 93 "imp_lexer.mll"
              ( ORD_LEX_COPRD )
# 655 "imp_lexer.ml"

  | 78 ->
# 94 "imp_lexer.mll"
          ( CMM )
# 660 "imp_lexer.ml"

  | 79 ->
let
# 95 "imp_lexer.mll"
                      lxm
# 666 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 95 "imp_lexer.mll"
                           ( ROT (String.length lxm) )
# 670 "imp_lexer.ml"

  | 80 ->
let
# 96 "imp_lexer.mll"
                      lxm
# 676 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf (lexbuf.Lexing.lex_start_pos + 1) lexbuf.Lexing.lex_curr_pos in
# 96 "imp_lexer.mll"
                           ( SLF (String.length lxm) )
# 680 "imp_lexer.ml"

  | 81 ->
let
# 97 "imp_lexer.mll"
                 lxm
# 686 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos (lexbuf.Lexing.lex_curr_pos + -1) in
# 97 "imp_lexer.mll"
                           ( IDX (int_of_string lxm) )
# 690 "imp_lexer.ml"

  | 82 ->
# 98 "imp_lexer.mll"
          ( DOT )
# 695 "imp_lexer.ml"

  | 83 ->
# 99 "imp_lexer.mll"
             ( AGL )
# 700 "imp_lexer.ml"

  | 84 ->
let
# 100 "imp_lexer.mll"
                lxm
# 706 "imp_lexer.ml"
= Lexing.sub_lexeme lexbuf lexbuf.Lexing.lex_start_pos lexbuf.Lexing.lex_curr_pos in
# 100 "imp_lexer.mll"
                     ( INT (int_of_string lxm) )
# 710 "imp_lexer.ml"

  | 85 ->
# 101 "imp_lexer.mll"
                    ( token lexbuf                         )
# 715 "imp_lexer.ml"

  | 86 ->
# 102 "imp_lexer.mll"
                    ( EOF               )
# 720 "imp_lexer.ml"

  | 87 ->
# 103 "imp_lexer.mll"
                    ( raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) )
# 727 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and line_comment lexbuf =
   __ocaml_lex_line_comment_rec lexbuf 122
and __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 107 "imp_lexer.mll"
          ( Util.pnt true "end line comment\n"; token lexbuf )
# 739 "imp_lexer.ml"

  | 1 ->
# 108 "imp_lexer.mll"
      ( line_comment lexbuf )
# 744 "imp_lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_line_comment_rec lexbuf __ocaml_lex_state

;;

