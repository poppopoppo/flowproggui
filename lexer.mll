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
    | "\226\138\162" (* ⊢ *) { SRC             }
    | "|<"  { CO_PRD_STT }
    | ">|"  { END_CO_PRD }
    | "&<"  { PRD_STT }
    | ">&"  { END_PRD }
    | "\226\137\146" { DEF }
    | "{" { L_RCD }
    | "}" { R_RCD }
    | '(' { L_PRN }
    | ')' { R_PRN }
    | "!" { EXP }
    |  "\226\136\142" (* ∎ *) { GL_NAM ("id") }
    | "+" { PLS }
    | '*' { MLT }
    | "$" (z as lxm) { VAL(int_of_string lxm) }
    | z as lxm  { INT (int_of_string lxm) }
    | alpha+ as lxm { NAM (lxm) }
    | "." (z as lxm) { DOT_VAL (int_of_string lxm) }
    | space+        { token lexbuf                         }
    | eof           { EOF                                  }
    | _             { raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) }
