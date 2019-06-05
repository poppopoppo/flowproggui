
(* The type of tokens. *)

type token = 
  | Z
  | VAL of (string)
  | STT_CLN
  | STG of (string)
  | SRC
  | SPL
  | SLH
  | SLF of (int)
  | SGN
  | SEQ
  | R_RCD
  | R_PRN
  | R_OPN
  | R_LST
  | R_HLZ_TAIL
  | R_HLZ
  | R_BLK
  | R_APP
  | ROT of (int)
  | PRJ
  | PRD_END
  | PRD
  | PLS_EVL
  | PLS
  | OUT
  | NAM of (string)
  | N
  | M_HLZ
  | M_CNN
  | MNS
  | MLT_EVL
  | MLT
  | MDL_END
  | MDL
  | MCR of (string)
  | L_RCD
  | L_PRN
  | L_OPN
  | L_LST
  | L_HLZ
  | L_BLK
  | LCE
  | ISO
  | IO_STT
  | IO
  | INT of (int)
  | IN
  | FOR_ALL
  | EXP
  | EQV
  | EQ
  | EOP
  | EOF
  | END_PRD
  | END_CO_PRD
  | EMT
  | DTA
  | DEF
  | CST
  | CO_PRD
  | COPRD_END
  | COPRD
  | CNT
  | CNN
  | CLS_NAM
  | CLS
  | CLN
  | ARR_STT
  | ARR_END
  | ARR
  | ARG
  | APP_EVL
  | APP
  | AGL_END
  | AGL
  | ACT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Types.mdl)

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Types.buffer)
