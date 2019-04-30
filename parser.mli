
(* The type of tokens. *)

type token = 
  | TEST
  | STT
  | SRC
  | R_RCD
  | R_PRN
  | R_APP
  | ROT
  | PRD_STT
  | PRD
  | PLS
  | NAM of (string)
  | M_CNN
  | MLT
  | L_RCD
  | L_PRN
  | L_APP
  | LCE
  | INT of (int)
  | GL_NAM of (string)
  | EXP
  | EOF
  | END_PRD
  | END_CO_PRD
  | DOT
  | DEF
  | CO_PRD_STT
  | CO_PRD
  | CNN
  | CLQ
  | CLN
  | ARR
  | APP
  | AGL

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Flow.Exp.buf)
