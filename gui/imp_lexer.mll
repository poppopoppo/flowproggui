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
    | ".;" (_)* ";."  { token lexbuf }
    | "§"  { LCE }
    | "§§"  { MDL }
    | "§§." { MDL_END }
    | "¶" { DTA }
    | "\\"  { SLH }
    | "∀" { FOR_ALL }
    | (name as lxm) "\'" { VAL(lxm) }
    | name as lxm { NAM(lxm) }
    | "≃" { ISO }
    | "=="  { EQV }
    | "»" { ARR       }
    | "»."  { ARR_END }
    | ".»" { ARR_STT }
    | "⊢" { SRC }
    | "⋎" { EMT }
    | "⋏" { CNT }
    | "?" { ARG }
    | "|»"  { IN }
    | "»|"  { OUT }
    | ":" { CLN }
    | "|" { SPL }
    | "%" (digit+ as lxm) { MCR(lxm) }
    | "∠" "["  { AGL }
    | "]" { AGL_END }
    | "^" { SEQ }
    | "¦"  { M_HLZ }
    | "∐"   { COPRD }
    | "∏"   { PRD }
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
