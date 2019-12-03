
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
  | SYNT_COPRD
  | STG of (string)
  | SRC_OUT
  | SRC_IL
  | SRC
  | SPL
  | SLH
  | SLF of (int)
  | SGN
  | SEQ
  | S8_STT
  | S8_P
  | S8_END
  | S8_E
  | R_RCD
  | R_PRN
  | R_OPN
  | R_LST
  | R_BLK
  | ROT of (int)
  | RM
  | REG of (string)
  | R64 of (int64)
  | R2 of (bool)
  | PRM of (string)
  | PRJ_IR
  | PRJ
  | PRD_END
  | PRD
  | PLS_NAT
  | PLS
  | OUT_IR
  | OUT of (int)
  | ORD_LEX_COPRD
  | ORD_COPRD
  | OP
  | NOT_SPL
  | NOT
  | NL
  | NAT of (int)
  | NAM of (string)
  | N
  | MTC_IR
  | MTC
  | MNS_NAT
  | MNS
  | MLT_NAT
  | MLT
  | MDL_EOP
  | MDL_END
  | MDL
  | MCR
  | L_VCT
  | L_RCD
  | L_PRN
  | L_OPN
  | L_LST_PLS
  | L_LST
  | L_BLK
  | LINE of (string)
  | LET
  | LCE_IR
  | LCE_EXEC
  | LCE_EQ
  | LCE
  | LB
  | ISO
  | IO
  | INT of (int)
  | INJ of (int)
  | INI_IR
  | IN of (int)
  | IMP
  | IDX of (int)
  | GRM
  | FOR_ALL
  | FNT
  | EXP
  | EXN
  | EQ
  | EOP_OUT
  | EOP_EXN
  | EOP
  | EOF
  | ENV
  | DTA_GRM
  | DTA
  | DSH
  | DOT_END
  | DOT
  | DEQ
  | DEF
  | CST
  | COPRD_PTN_END
  | COPRD_PTN
  | COPRD_END
  | COPRD
  | CNS_IR
  | CMM
  | CLN2
  | CLN
  | CHO of (int)
  | BYTE
  | ARR_REV_IN
  | ARR_REV
  | ARR_END
  | ARR
  | APP
  | AGL_TOP
  | AGL_OP of (int)
  | AGL_COD
  | AGL
  | ACT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val name_eof: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Lang.name)

val file_top: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Lang.Ast.glb_etr list)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Lang.Ast.mdl list)

val buffer: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Lang.Ast.line)
