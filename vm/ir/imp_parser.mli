
(* The type of tokens. *)

type token = 
  | Z
  | WC
  | VCT_INI
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
  | PLS_NAT
  | PLS_EVL
  | PLS
  | OUT of (int)
  | ORD_LEX_COPRD
  | ORD_COPRD
  | NOT_SPL
  | NOT
  | NAT of (int)
  | NAM of (string)
  | N
  | M_HLZ
  | MNS_NAT
  | MNS
  | MLT_NAT
  | MLT_EVL
  | MLT
  | MDL_END
  | MDL
  | MCR
  | L_VCT
  | L_RCD
  | L_PRN
  | L_OPN
  | L_LST_PLS
  | L_LST
  | L_HLZ
  | L_BLK
  | LET
  | LCE
  | ISO
  | IO
  | INT of (int)
  | INJ of (int)
  | IN of (int)
  | IDX of (int)
  | GRM
  | FOR_ALL
  | FNT
  | EXP
  | EXN
  | EQ
  | EOP
  | EOF
  | EMT
  | DTA_GRM
  | DTA
  | DSH
  | DOT
  | DEQ
  | DEF
  | CST
  | COPRD_END
  | COPRD
  | CNT
  | CMM
  | CLN
  | CHO of (int)
  | ARR_REV_IN
  | ARR_REV
  | ARR_END
  | ARR
  | APP_EVL
  | APP
  | AGL_TOP
  | AGL_COD
  | AGL
  | ACT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Lang.Ast.mdl list)

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Lang.Ast.line)
