
typedef enum { PRJ, INI, RM, ID, CALL, AGL
} op_t;
typedef int reg;
typedef struct {
  int etr;
  int etr_i;
} pt;
typedef struct {
  enum reg_ptn_t {
    PTN_R, PTN_A
  } reg_ptn_t;
  union {
    struct {
      struct reg_ptn** ptn_hd;
      reg ptn_tl;
    } ptn_rcd ;
    reg ptn_atm;
  } reg_ptn_v;
} reg_ptn;
typedef struct rcd_tkn {
  enum { RCD_RCD, RCD_STG, RCD_Z,
    RCD_Z2, RCD_ZI64, RCD_SGN, RCD_COP ,RCD_FNC
  } rcd_tkn_t;
  union rcd_tkn_v {
    struct rcd_tkn **rcd_rcd;
    union {
      char* stg;
      int z;
      int z2;
      int zi64;
      int sgn;
      struct {
        int i;
        struct rcd_tkn* co_p;
      } tkn_co_p;
      struct {
        enum { PLS, MLT, MNS, CMP, EQ, FIX, EXN, INJ,
          CHO, FNC
        } fnc_t;
        union fnc_v {
          int inj;
          int cho;
          struct {
            pt* jmp_pt;
          } fnc;
        } fnc_v;
      } tkn_fnc;
    } rcd_atm;
  } rcd_tkn_v;
} rcd_tkn;
typedef struct {
  op_t op_t;
  union op_v {
    struct prj {
      reg reg_src;
      reg* reg_hds;
    } prj;
    struct ini {
      rcd_tkn* ini_tkn;
      reg reg_src;
    } ini;
    reg rm;
    struct id {
      reg src_reg;
      reg* dst_regs;
    } id;
    struct call {
      reg_ptn* ry;
      reg rf;
      reg_ptn* rx;
    } call;
    struct agl {
      pt** agl_jmps;
      reg ra;
      reg_ptn* rr;
    } agl;
  } op_v;
} op;
typedef op** code;
typedef rcd_tkn* vct;
typedef struct {
  reg reg;
  rcd_tkn* tkn;
} cs_k;
typedef struct {
  pt* ret_pt;
  cs_k* cs_v;
} cs_f;
