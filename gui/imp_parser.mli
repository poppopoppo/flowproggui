
(* The type of tokens. *)

type token = 
  | Z
  | WC
  | VCT
  | VAL of (string)
  | TYP_VCT
  | TYP_STG
  | TYP_SGN
  | TYP_OPN_VCT
  | TEST
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
  | R_HLZ
  | R_BLK
  | ROT of (int)
  | PRJ
  | PRD_END
  | PRD
  | PLS_EVL
  | PLS
  | OUT of (int)
  | NAM of (string)
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
  | INT of (int)
  | INJ
  | IN of (int)
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
  | CHO
  | ARR_END
  | ARR
  | APP_EVL
  | APP
  | AGL
  | ACT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Types.mdl)

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Types.buffer)
