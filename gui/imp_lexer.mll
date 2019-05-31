{
    open Imp_parser
    exception Error of string
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let ascii = ['a'-'z' 'A'-'Z' '0'-'9' '(' ')' '!' '"' '#'
  '$' '%' '&' '\'' '=' '~' '~' '|' '{' '}' '`' '@' '[' ']'
  '*' '+' ';' ':' '<' '>' ',' '.' '?' '/' '\\' '_' ]
let alnum = digit | alpha
let name = alpha+  ("_" | digit | alpha)*
let z = (('-' digit+)|digit+)
rule token = parse
    | ";" (_)* "\n"  { (print_string "comment\n";flush stdout);token lexbuf }
    | "§"  { LCE }
    | "§§"  { MDL }
    | "§§." { MDL_END }
    | "¶" { DTA }
    | "\\"  { SLH }
    | "∀" ("type" | "z") { FOR_ALL }
    | (name as lxm) "\'" { VAL(lxm) }
    | name as lxm { NAM(lxm) }
    | "≃" (* ≃ *) { EQV }
    | "»" (* » *)  { ARR       }
    | "»" "."  (* ». *) { ARR_END }
    | "." "»"  (* .» *)  { ARR_STT }
    | "⊢" (* ⊢ *) { SRC }
    | ":" { CLN }
    | "|" { SPL }
    | "%" (digit+ as lxm) { MCR(lxm) }
    | "∠" "["  (* ∠ *) { AGL }
    | "]" { AGL_END }
    | "^" { SEQ }
    | "¦"  (* ¦ *) { M_CNN }
    | "∐"   { CO_PRD }
    | ".∐"  { CO_PRD_STT }
    | "∐."  { END_CO_PRD }
    | "∏"   { PRD }
    | ".∏"  { PRD_STT }
    | "∏."  { END_PRD }
    | "∎" { EOP }
    | "∇" { COPRD_END }
    | "∆" { PRD_END }
    | "≒" { DEF }
    | "`" { ACT }
    | "{" { L_RCD }
    | "}" { R_RCD }
    | "⁅" { L_HLZ }
    | "⁆" { R_HLZ  }
    | "⟦" { L_LST }
    | "⟧" { R_LST }
    | "‹" { L_OPN }
    | "›" { R_OPN }
    | "~" { CNN }
    | "&" { SGN }
    | "(" { L_PRN }
    | ")" { R_PRN }
    | "=" { EQ }
    | "!" { EXP }
    | "‣" { R_APP }
    | "◂" { APP }
    | "◃" { PRJ }
    | "ℤ" { Z }
    | "ℕ" { N }
    | "+" { PLS }
    | "*" { MLT }
    | "$" (("\'")* as lxm) { ROT (String.length lxm) }
    | "∠"  { AGL }
    | z as lxm  { INT (int_of_string lxm) }
    | space+        { token lexbuf                         }
    | eof           { EOF               }
    | _             { raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) }
