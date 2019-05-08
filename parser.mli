
(* The type of tokens. *)

type token = 
  | Z
  | SRC
  | R_RCD
  | R_PRN
  | ROT of (int)
  | PLS
  | NAM of (string)
  | M_CNN
  | MLT
  | L_RCD
  | L_PRN
  | L_PRJ
  | L_APP
  | LCE
  | INT of (int)
  | GL_NAM of (string)
  | EXP
  | EQV
  | EOF
  | END_CO_PRD
  | DTA
  | DOT
  | DEF
  | CO_PRD_STT
  | CO_PRD
  | CNN
  | CLN
  | ARR_STT
  | ARR_END
  | ARR
  | APP
  | AGL_END
  | AGL

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Flow.Buffer.t)
