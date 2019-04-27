
(* The type of tokens. *)

type token = 
  | VAL of (int)
  | TEST
  | STT
  | SRC
  | R_RCD
  | R_PRN
  | PRD_STT
  | PRD
  | PLS
  | NAM of (string)
  | MLT
  | L_RCD
  | L_PRN
  | LCE
  | INT of (int)
  | GL_NAM of (string)
  | EXP
  | EOF
  | END_PRD
  | END_CO_PRD
  | END
  | DOT_VAL of (int)
  | DEF
  | CO_PRD_STT
  | CO_PRD
  | CLQ
  | CLN
  | ARR

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val text: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Flow.Exp.arr)
