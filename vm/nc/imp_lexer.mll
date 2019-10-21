{
    open Imp_parser
    exception Error of string
}

let space = [' ' '\t' '\r' '\n']
let line = [' ' '\t' '\r']
let digit = ['0'-'9']
let alpha = ['a'-'z' 'A'-'Z']
let ascii = ['a'-'z' 'A'-'Z' '0'-'9' '(' ')' '!' '"' '#'
  '*' '+' ';' ':' '<' '>' ',' '.' '?' '/' '\\' '_'
  '$' '%' '&' '\'' '=' '~' '~' '|' '{' '}' '`' '@' '[' ']' ]
let hex = [ 'a'-'f' 'A'-'F' '0'-'9' ]
let alnum = digit | alpha
let name = alpha+  ("_" | digit | alpha)*
let r64 = "0r" digit+
let hr64 = "0xr" hex+
let z = (('-' digit+)|digit+)
rule token = parse
    | '\"' (([^ '\"' '\\']|"\\\""|"\\\\"|"\\t"|"\\n")* as lxm) '\"' { STG(Scanf.unescaped lxm) }
    | ";" [^ '\n']* { Util.pnt true "start line comment\n"; token lexbuf }
    | "[;" [^ ';']* ";]"  { token lexbuf }
    | "0r" (digit+ as lxm) { R64(Int64.of_string lxm) }
    | "0xr" (hex+ as lxm) { R64(Int64.of_string ("0x"^lxm)) }
    | "0x2r0" { R2(false) }
    | "0x2r1" { R2(true) }
    | "§"  { LCE }
    | "§+0" { LCE_IR  }
    | "§§"  { MDL }
    | "§§." { MDL_END }
    | "¶" { DTA }
    | "¶+ℙ" { DTA_GRM }
    | "¬|"  { NOT_SPL }
    | "\\"  { SLH }
    | "∀" { FOR_ALL }
    | "%" (name as lxm) { REG(lxm) }
    | (name as lxm) "\'" { VAL(lxm) }
    | name as lxm { NAM(lxm) }
    | "|◂"  { OUT_IR }
    | "|◃"  { PRJ_IR  }
    | "◃|"  { CNS_IR  }
    | "|~"  { INI_IR }
    | "~|"  { MTC_IR }
    | "≃" { ISO }
    | "~" { LET }
    | "<" { OP }
    | ">" { LB }
    | "»" { ARR }
    | "«" { ARR_REV }
    | "«|"  { ARR_REV_IN }
    | (('|')+ as lxm) "»" { IN(String.length lxm) }
    | "»" (('|')+ as lxm)  { OUT(String.length lxm) }
    | "⊢" { SRC }
    | "|⊢"  { SRC_OUT }
    | "⊢|"  { SRC_IL }
    | "¿" { EXN }
    | ":" { CLN }
    | "::" { CLN2 }
    | "|" { SPL }
    | "∠"  { AGL }
    | "]" { R_BLK }
    | "[" { L_BLK }
    | "^" { SEQ }
    | "?"  { MTC }
    | "∐"   { COPRD }
    | "∐." { COPRD_END }
    | "∐\\" { COPRD_PTN }
    | "∐.\\" { COPRD_PTN_END }
    | "∏"   { PRD }
    | "∎" { EOP }
    | "∎|" { EOP_EXN }
    | "|∎" { EOP_OUT }
    | "∇" { COPRD_END }
    | "∆" { PRD_END }
    | "≒" { DEF }
    | "`" { ACT }
    | "//"  { CST }
    | "_" { WC }
    | "↑[" (digit+ as lxm) "]" { INJ(int_of_string lxm) }
    | "↓[" (digit+ as lxm) "]" { CHO(int_of_string lxm) }
    | "∠[" (digit+ as lxm) "]" { AGL_OP(int_of_string lxm) }
    | "⊵" { VCT }
    | "{" { L_RCD }
    | "}" { R_RCD }
    | "⟦" { L_LST }
    | "⟧" { R_LST }
    | "‹" { L_OPN }
    | "›" { R_OPN }
    | "&" { SGN }
    | "#" { VCT_INI }
    | "(" { L_PRN }
    | ")" { R_PRN }
    | "\'" { DSH }
    | "=" { EQ }
    | "!" { EXP }
    | "◂" { APP }
    | "◃" { PRJ }
    | "ℤ" { Z }
    | "ℕ" { N }
    | "ℙ" { TYP_STG }
    | "+" { PLS }
    | "*" { MLT }
    | "-" { MNS }
    | "⅁" { GRM }
    | "¬" { NOT }
    | "∐*"  { ORD_LEX_COPRD }
    | "," { CMM }
    | "$" (("\'")* as lxm) { ROT (String.length lxm) }
    | "@" (("\'")* as lxm) { SLF (String.length lxm) }
    | (digit+ as lxm) "\'" { IDX (int_of_string lxm) }
    | "." { DOT }
    | "∠"  { AGL }
    | digit+ as lxm  { INT (int_of_string lxm) }
    | space+        { token lexbuf                         }
    | '\n'  { NL }
    | eof           { EOF               }
    | _             { raise (Error (Printf.sprintf
                      "At offset %d: unexpected character.\n"
                      (Lexing.lexeme_start lexbuf))) }
and line_comment = parse
  | "\n"  { Util.pnt true "end line comment\n"; token lexbuf }
  | _ { line_comment lexbuf }
