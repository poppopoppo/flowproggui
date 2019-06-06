
(* The type of tokens. *)

type token = 
  | Z
  | VAL
  | TYP_VCT
  | TYP_STR
  | TYP_SGN
  | TYP_OPN_VCT
  | STG
  | SRC
  | SPL
  | SLH
  | SLF
  | SGN
  | SEQ
  | R_RCD
  | R_PRN
  | R_OPN
  | R_LST
  | R_HLZ
  | R_BLK
  | ROT
  | PRJ
  | PRD_END
  | PRD
  | PLS_EVL
  | PLS
  | OUT
  | NAM
  | N
  | M_HLZ
  | MNS
  | MLT_EVL
  | MLT
  | MDL_END
  | MDL
  | MCR
  | L_RCD
  | L_PRN
  | L_OPN
  | L_LST
  | L_HLZ
  | L_BLK
  | LET
  | LCE
  | ISO
  | IO
  | INT
  | IN
  | FOR_ALL
  | FNT
  | EXP
  | EXN
  | EQ
  | EOP
  | EOF
  | EMT
  | DTA
  | DEQ
  | DEF
  | CST
  | COPRD_END
  | COPRD
  | CNT
  | CMM
  | CLN
  | ARR_END
  | ARR
  | APP_EVL
  | APP
  | AGL
  | ACT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ()

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ()
