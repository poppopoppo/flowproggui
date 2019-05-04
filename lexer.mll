{
    open Parser
    exception Error of string
}

let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let ascii = ['a'-'z' 'A'-'Z' '0'-'9' '(' ')' '!' '"' '#'
  '$' '%' '&' '\'' '=' '~' '~' '|' '{' '}' '`' '@' '[' ']'
  '*' '+' ';' ':' '<' '>' ',' '.' '?' '/' '\\' '_' ]
let alnum = digit | alpha
let z = (('-' digit+)|digit+)
rule token = parse
    | "\194\167"  (* § *) { LCE }
    | "\194\187" (* » *)  { ARR       }
    | "\194\187" "."  (* ». *) { ARR_END }
    | "\226\138\162" (* ⊢ *) { SRC             }
    | ":" { CLN }
    | "\226\136\160"  (* ∠ *) { AGL }
    | "\194\166"  (* ¦ *) { M_CNN }
    | "|"   { CO_PRD }
    | ".|"  { CO_PRD_STT }
    | "|."  { END_CO_PRD }
    | ".&"  { PRD_STT }
    | "&."  { END_PRD }
    | "\226\137\146" { DEF }
    | "{" { L_RCD }
    | "}" { R_RCD }
    | "~" { CNN }
    | '(' { L_PRN }
    | ')' { R_PRN }
    | "!" { EXP }
    | "\226\128\163"  { R_APP }
    | "\226\151\130" { L_APP }
    | "\226\128\161"  { APP }
    |  "\226\136\142" (* ∎ *) { EOP  }
    | "\226\132\164" (* ℤ *)  { Z }
    | "#" ((alpha+ alnum*)as lxm) { GL_NAM(lxm) }
    | "+" { PLS }
    | '*' { MLT }
    | "$" { ROT }
    | "\226\136\160"  { AGL }
    | z as lxm  { INT (int_of_string lxm) }
    | alpha+ as lxm { NAM (lxm) }

    | space+        { token lexbuf                         }
    | eof           { EOF               }
    | _             { raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) }
