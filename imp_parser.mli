
(* The type of tokens. *)

type token = 
  | Z
  | VAL of (string)
  | TEST
  | STT_CLN
  | SRC
  | SPL
  | SLH
  | SEQ
  | R_RCD
  | R_PRN
  | R_HLZ_TAIL
  | R_HLZ
  | R_BLK
  | R_APP
  | ROT of (int)
  | PRJ
  | PRD_TAIL
  | PRD_STT
  | PRD_END
  | PRD
  | PLS
  | NAM of (string)
  | N
  | M_HLZ
  | M_CNN
  | MLT
  | MDL_END
  | MDL
  | MCR of (string)
  | L_RCD
  | L_PRN
  | L_HLZ
  | L_BLK
  | LCE
  | IO
  | INT of (int)
  | GL_NAM of (string)
  | FOR_ALL
  | EXP
  | EQV
  | EOF
  | END_PRD
  | END_GL_ETR_LST
  | END_FLW_LST
  | END_CO_PRD
  | D_EXP
  | DTA
  | DOT
  | DEF
  | CO_PRD_STT
  | CO_PRD
  | COPRD_TAIL
  | COPRD_END
  | COPRD
  | CNN
  | CMT
  | CLS_NAM
  | CLS
  | CLN
  | ARR_STT
  | ARR_END
  | ARR
  | APP
  | AGL_END
  | AGL
  | ACT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Imp.buffer)
