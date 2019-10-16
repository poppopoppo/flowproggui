#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>
#include <ctype.h>

char* ir_id = "id"
char* ir_cll = "cll"
char* ir_il_cll = "il_cll"
char* ir_agl = "agl"
char* ir_ret = "ret"
char* ir_ini = "ini"
typedef int reg;
typedef int pt;
typedef struct {
  char* cp;
  int flg;
} iter;
struct void_list {
  enum { CNS,NIL } t;
  struct cns {
    void* hd;
    struct void_list* tl;
  } cns;
};
typedef struct void_list void_list_t;
typedef struct {
  enum reg_ptn_t {
    PTN_R, PTN_A
  } reg_ptn_t;
  union {
    struct {
      void_list_t* ptn_hd;
      reg ptn_tl;
    } ptn_rcd ;
    reg ptn_atm;
  } reg_ptn_v;
} reg_ptn;
typedef struct rcd_tkn {
  enum rcd_tkn_t { RCD_RCD, RCD_STG, RCD_Z,
    RCD_SGN, RCD_COP ,RCD_FNC, BTM
  } t;
  union rcd_tkn_v {
    void_list_t* rcd;
    union rcd_atm {
      char* stg;
      int z;
      int sgn;
      struct { int i; struct rcd_tkn* k;
      } co_p;
      struct {
        enum { PLS, MLT, MNS, CMP, EQ, FIX, EXN, INJ,
          CHO, FNC
        } t;
        union fnc_v {
          struct inj { int i;
          } inj;
          struct cho { int i;
          } cho;
          struct {
            reg* rs;
            pt* jmp_pt;
          } fnc;
        } v;
      } fnc;
    } atm;
  } v;
} rcd_tkn;
typedef struct {
  enum op_t { PRJ, RCD, INI, RM, ID, CALL, AGL, RET
  } op_t;
  union op_v {
    struct prj {
      reg src;
      int dsts_n;
      reg* dsts;
    } prj;
    struct rcd {
      int srcs_n;
      reg* srcs;
      reg dst;
    } rcd;
    struct ini {
      rcd_tkn* k;
      reg src;
    } ini;
    reg rm;
    struct id {
      reg src;
      int dsts_n;
      reg* dsts;
    } id;
    struct call {
      int ry_n;
      reg* ry;
      reg rf;
      int rx_n;
      reg* rx;
    } call;
    struct agl {
      pt* jmps;
      reg ra;
      int rr_n;
      reg* rr;
    } agl;
    struct ret {
      pt p;
      int rs_n;
      reg* rs;
    } ret;
  } op_v;
} op;
typedef op* code;
typedef rcd_tkn* vct;
typedef op* pt;
typedef struct {
  reg reg;
  rcd_tkn* tkn;
} cs_k;
typedef struct {
  enum cs_f_t { IL, CS } t;
  pt ret_pt;
  reg* ret_rs;
  void_list_t* cs_v;
} cs_f;
typedef cs_f* cs[252];
typedef struct {
  int code_l;
  op* code;
  op* pc;
  int vct_l;
  vct vct;
  cs_f* cs_b;
  cs_f* cs_p;
} st;
int len_list(void_list_t* l){
  void_list_t* tl;
  switch (l->t){
    case NIL:
      return 0;
    case CNS:
      tl = l->cns.tl;
      return (1+(len_list(tl)));
  }
};
void arr_of_list(void** a,void_list_t* l){
  int n = len_list(l);
  void_list_t* li = l;
  a = malloc(sizeof(void*) * n);
  while (n>=0) {
    *a = li->cns.hd;
    ++a;
    n = n-1;
    li = li->cns.tl;
  };
};
struct reg_list {
  enum { R_CNS, R_NIL } reg_list_t;
  struct reg_list_v {
    int hd;
    struct reg_list* tl;
  } reg_list_v;
};
void csm(char* c,iter* itr){
  char* ci = c;
  char* cb = itr->cp;
  if (itr->flg!=(-1)){
    while(1){
      if (*ci=='\0'){
        ++(itr->cp);
        break;
      };
      if (*ci==*itr->cp){
        ++ci;
        ++(itr->cp);
      } else {
        itr->flg = -1;
        itr->cp = cb;
        break;
      };
    };
  };
};

void spc(iter* itr){
  if (itr->flg!=(-1)){
    if (' '==*(itr->cp)){
      ++(itr->cp);
      spc(itr);
      itr->flg = 1;
    } else {
      itr->flg = -1;
    }
  }
};
void spcs(iter* itr){
  if (itr->flg!=(-1)){
    if (' '==*(itr->cp) || '\n'==*(itr->cp)){
      ++(itr->cp);
      spc(itr);
      itr->flg = 1;
    } else {
      itr->flg = -1;
    }
  }
};
long num(iter* itr){
  long n;
  if (itr->flg!=(-1)){
    char** endptr;
    n = strtol(itr->cp,endptr,0);
    if (itr->cp == *endptr){
      itr->flg = -1;
    } else {
      itr->flg = 1;
      itr->cp = *endptr;
    };
  };
  return n;
};
char any(iter* itr){
  char c;
  if (itr->flg!=(-1)){
    c = *(itr->cp);
    ++(itr->cp);
    itr->flg = 1;
    };
  return c;
};
struct reg_list* csm_reg_list(iter* itr){
  int hd;
  struct reg_list* l;
  spc(itr);
  if (itr->flg != -1){
    hd = num(itr);
    if (itr->flg == 1){
      l = malloc(sizeof(struct reg_list));
      l->reg_list_t = CNS;
      l->reg_list_v.hd = hd;
      l->reg_list_v.tl = csm_reg_list(itr);
    } else {
      l = malloc(sizeof(struct reg_list));
      l->reg_list_t = NIL;
    };
  };
  return l;
};
void copy_rcd_tkn(rcd_tkn* src,rcd_tkn* dst);
void csm_rcd_tkn(iter* itr,rcd_tkn* k);
void csm_rcd_atm(iter* itr,rcd_tkn* k);
void csm_rcd_rcd(iter* itr,rcd_tkn* k);
void csm_rcd_tkn(iter* itr,rcd_tkn* k){
  char* i0 = itr->cp;
  csm_rcd_rcd(itr,k);
  if (itr->flg == 1){
    return;
  } else {
    csm_rcd_atm(itr,k);
    if (itr->flg == 1){
      return;
    } else {
      itr->cp = i0;
      return;
    }
  }
};
void csm_rcd_rcd(iter* itr,rcd_tkn* k){
  char* c0 = itr->cp;
  char* c1 = itr->cp;
  void_list_t* rcd_list;
  void_list_t* tl = rcd_list;
  k->t = RCD_RCD;
  spc(itr); csm("{",itr); spc(itr);
  while(1){
    c1 = itr->cp;
    spc(itr); csm("}",itr); spc(itr);
    if (itr->flg == 1){
      tl = malloc(sizeof(void_list_t));
      tl->void_list_t = NIL;
      break;
    } else {
      itr->cp = c1;
      tl = malloc(sizeof(void_list_t));
      tl->void_list_t = CNS;
      csm_rcd_tkn(itr,tl->cns.hd);
      tl = tl->cns.tl;
    };
  };
  k->v.rcd = rcd_list;
};
void csm_rcd_atm(iter* itr,rcd_tkn* k){
    int i = 0;
    char* c;
    switch(t){
      case RCD_STG:
      csm("\"",itr);
      while(1){
        c = itr->cp;
        csm("\\\"",itr);
        if(itr->flg == 1){
          i = i+2;
        } else {
          itr->cp = c;
          csm("\"",itr);
          if (itr->flg == 1){
            break;
          } else {
            any(itr);
            ++i;
          };
        };
        k->v.atm.

};
void csm_prj(iter* itr,struct prj* prj){
  int src;
  struct reg_list* dst;
  char* cp0 = itr->cp;
  spc(itr); csm(ir_prj,itr);
  spc(itr); csm("\\",itr);
  spc(itr); src = num(itr);
  spc(itr); dst = csm_reg_list(itr);
  spc(itr); csm("<",itr);
  spc(itr); csm("\n",itr);
  if (itr->flg == -1){
    itr->cp = cp0;
  };
};
void csm_rm(iter* itr,reg* rm){
  reg r;
  spc(itr); csm(ir_rm,itr);
  spc(itr); r = num(itr); spc(itr); csm("\n",itr);
  *rm = r;
};
void csm_rcd(iter* itr,struct rcd* rcd){
};
void csm_ini(iter* itr,struct ini* ini){
  reg r;
  rcd_tkn* k;
  spc(itr); csm(ir_ini,itr); csm_rcd_tkn(itr,k);
  spc(itr); r = num(itr); spc(itr); csm("\n",itr);
};
void csm_id(iter* itr,struct id* id){
  reg r0;
  struct reg_list* rd;
  spc(itr); csm("$",itr); spc(itr); r0 = num(itr);
  spc(itr); csm("⊢",itr); spc(itr); rd = csm_reg_list(itr);
  spc(itr); csm("\n",itr);
};
void csm_call(iter* itr,struct call* call){
  reg f;
  struct reg_list* xs;
  spc(itr); csm("◂",itr); spc(itr); f = num(itr);
  spc(itr); xs = csm_reg_list(itr);
  spc(itr); csm("\n",itr);
};
void csm_agl(iter* itr,struct agl* agl){
  reg ra;
  struct reg_list* ps;
  struct reg_list* rcs;
};
void csm_ret(iter* itr,struct ret* ret){
};
op* csm_line(iter* itr,op* o){
  csm_prj(itr,&o->op_v.prj);
  if (itr->flg == 1){
    o->op_t = PRJ;
    return o;
  };
  csm_ini(itr,&o->op_v.ini);
  if (itr->flg == 1){
    o->op_t = INI;
    return o;
  };
  csm_id(itr,&o->op_v.id);
  if (itr->flg == 1){
    o->op_t = ID;
    return o;
  };
  csm_call(itr,&o->op_v.call);
  if (itr->flg == 1){
    o->op_t = CALL;
    return o;
  };
  csm_agl(itr,&o->op_v.agl);
  if (itr->flg == 1){
    o->op_t = AGL;
    return o;
  };
  csm_rcd(itr,&o->op_v.rcd);
  if (itr->flg == 1){
    o->op_t = RCD;
    return o;
  };
  csm_ret(itr,&o->op_v.ret);
  if (itr->flg == 1){
    o->op_t = RET;
    return o;
  };
  return NULL;
};
void csm_str(iter* itr,st* st){
  st = malloc(sizeof(st));
  spcs(itr);
  csm("§",itr); csm("§",itr); spc(itr); csm("\n",itr);
  spc(itr); csm("rN",itr); spc(itr); csm("=",itr); spc(itr); st->vct_l = num(itr);
  spc(itr); csm("oN",itr); spc(itr); csm("=",itr); spc(itr); st->code_l = num(itr);
  st->vct = malloc(sizeof(rcd_tkn)*st->vct_l);
  st->code = malloc(sizeof(op)*st->code_l);
  csm("§",itr);
  int o_n = 0;
  while(o_n != st->code_l){
    csm_line(itr,st->code+o_n);
    ++o_n;
  };
  st->cs_b = malloc(sizeof(cs_f)*256);
  st->cs_p = st->cs_b;
};
void csm_file(FILE* fp,st* st){
  char s[256];
  st = malloc(sizeof(st));
  fgets(s,256,fp);
  iter itr = { s, 1 };
  iter* ip = &itr;
  spcs(ip); csm("§§",ip);
  itr.cp = s; fgets(s,256,fp);
  spc(ip); csm("rN",ip); spc(ip); csm("=",ip); spc(ip); st->vct_l = num(ip);
  itr.cp = s; fgets(s,256,fp);
  spc(ip); csm("oN",ip); spc(ip); csm("=",ip); spc(ip); st->code_l = num(ip);
  st->vct = malloc(sizeof(rcd_tkn)*st->vct_l);
  st->code = malloc(sizeof(op)*st->code_l);
  itr.cp = s; fgets(s,256,fp);
  csm("§",ip);
  int o_n = 0;
  while(o_n != st->code_l){
    itr.cp = s; fgets(s,256,fp);
    csm_line(ip,st->code+o_n);
    ++o_n;
  };
  st->cs_b = malloc(sizeof(cs_f)*256);
  st->cs_p = st->cs_b;
};
void copy_list(void (*f_elm)(void* se,void* de),void_list_t* sl,void_list_t* dl){
  switch (sl->void_list_t) {
    case NIL:
    dl = malloc(sizeof(void_list_t));
    dl->void_list_t = NIL;
    break;
    case CNS:
    dl = malloc(sizeof(void_list_t));
    dl->void_list_t = CNS;
    (*f_elm)(sl->cns.hd,dl->cns.hd);
    copy_list(f_elm,sl->cns.tl,dl->cns.tl);
  };
};
void copy_rcd_tkn_void(void* src,void* dst){
  copy_rcd_tkn((void*)src,(void*)dst);
};
void copy_rcd_tkn(rcd_tkn* src,rcd_tkn* dst){
  switch(src->t){
    case RCD_RCD:
    dst = malloc(sizeof(rcd_tkn));
    dst->t = RCD_RCD;
    copy_list(&copy_rcd_tkn_void,src->v.rcd,dst->v.rcd);
    break;
    case RCD_STG:
    dst->v.atm.stg = malloc(sizeof(char)*(strlen(src->v.atm.stg)+1));
    break;
    case RCD_Z:
    dst->v.atm.z = src->v.atm.z;
    case RCD_SGN:
    dst->v.atm.sgn = src->v.atm.sgn;
    break;
    case RCD_COP:
    dst->v.atm.co_p.i = src->v.atm.co_p.i;
    copy_rcd_tkn(dst->v.atm.co_p.k,src->v.atm.co_p.k);
    break;
    case RCD_FNC:
    break;
    }
  }
void set_r(vct vct,reg i,rcd_tkn* k){
  copy_rcd_tkn(vct+i,k);
};
void get_r(vct vct,reg i,rcd_tkn* k){
  copy_rcd_tkn(k,vct+i);
};
void free_r(vct vct,reg i){
  vct[i].t = BTM;
};
void set_rs(vct vct,int n,reg* rs,rcd_tkn** ks){
  int ni = 0;
  while(ni<n){
    set_r(vct,rs[ni],ks[ni]);
    ++ni;
  };
};
void get_rs(vct vct,int n,reg* rs,rcd_tkn** ks){
  int i = 0;
  while(i<n){
    get_r(vct,rs[i],ks[i]);
    ++i;
  };
};
void get_ptn(vct vct,reg_ptn* r,rcd_tkn* k){
};
char* print_rcd_tkn(char* s,rcd_tkn* k){
  s = malloc(sizeof(char)*265);
  char* si = s;
  rcd_tkn* ki = k;
  void_list_t* lp;
  switch (ki->t){
    case RCD_RCD:
    *si = '{'; ++si; *si = ' '; ++si;
    lp = ki->v.rcd;
    while(1){
      switch(lp->void_list_t){
        case NIL:
        *si = '}'; ++si;
        goto etr0;
        case CNS:
        si = print_rcd_tkn(si,(rcd_tkn*)ki->v.rcd->cns.hd);
        *si = ' '; ++si;
        lp = lp->cns.tl;
      };
    };
    etr0:
    return si;
    case RCD_STG:
    case RCD_Z:
    case RCD_SGN:
    case RCD_COP:
    case RCD_FNC:
    return si;
  };
};
void print_vct(st* st,char* s){
};
void mk_cs_f(st* st,pt* ret_pt,reg* rs,cs_f* f){
  f = malloc(sizeof(cs_f));
  f->ret_pt = ret_pt;
  f->ret_rs = rs;
  void_list_t* p = f->cs_v;
  rcd_tkn* k;
  int i = 0;
  while(i<st->vct_l){
    switch (st->vct[i].t){
      case BTM:
      break;
      default:
      p = malloc(sizeof(void_list_t));
      p->void_list_t = CNS;
      p->cns.hd = malloc(sizeof(cs_k));
      ((cs_k*)(p->cns.hd))->reg = i;
      get_r(st->vct,i,(rcd_tkn*)((cs_k*)(p->cns.hd))->tkn);
      free_r(st->vct,i);
      p = p->cns.tl;
    };
  };
  p = malloc(sizeof(void_list_t));
  p->void_list_t = NIL;
};
void prj(vct vct,struct prj* prj){
  rcd_tkn* src;
  int ri = 0;
  get_r(vct,prj->src,src);
  void_list_t* rcd = src->v.rcd;
  reg* rp = prj->dsts;
  rcd_tkn* ki;
  while (ri<prj->dsts_n) {
    set_r(vct,*rp,(rcd_tkn*)rcd->cns.hd);
    rcd = rcd->cns.tl; ++rp; ++ri;
  };
};
void rcd(vct vct,struct rcd* rcd){
  rcd_tkn* k;
  int ri = 0;
  reg rs;
  void_list_t* ks;
  while(ri<rcd->srcs_n){
    ks = malloc(sizeof(void_list_t));
    ks->void_list_t = CNS;
    rs = rcd->srcs[ri];
    get_r(vct,rcd->srcs[ri],ks->cns.hd);
    ks = ks->cns.tl;
  };
  ks->void_list_t = NIL;
  vct[rcd->dst].t = RCD_RCD;
  vct[rcd->dst].v.rcd = ks;
};
void rm(vct vct,reg r){
  free_r(vct,r);
};
void ini(vct vct,struct ini* ini){
  set_r(vct,ini->src,ini->k);
}
void id(vct vct,struct id* id){
  int i = 0;
  reg* ri = id->dsts;
  while(i<id->dsts_n){
    set_r(vct,ri[i],vct+id->src);
    ri++;
  };
  free_r(vct,id->src);
};
void call(st* st,struct call* call){
  rcd_tkn* f;
  rcd_tkn** xs;
  rcd_tkn* y;
  ++st->cs_p;
  get_r(st->vct,call->rf,f);
  get_rs(st->vct,call->rx_n,call->rx,xs);
  switch(f->v.atm.fnc.t){
    case PLS:
    if (call->rx_n == 2 && call->ry_n==1) {
      y = st->vct+(call->ry[0]);
      y->t = RCD_Z;
      y->v.atm.z = xs[0]->v.atm.z + xs[1]->v.atm.z;
      free_r(st->vct,call->ry[0]);
      break;
    } else {
      perror("call:PLS:0");
      exit(-1);
    };
    case MLT:
    if (call->rx_n == 2 && call->ry_n==1) {
      y = st->vct+(call->ry[0]);
      y->t = RCD_Z;
      y->v.atm.z = xs[0]->v.atm.z * xs[1]->v.atm.z;
      free_r(st->vct,call->ry[0]);
      break;
    } else {
      perror("call:PLS:0");
      exit(-1);
    };
    case MNS:
    if (call->rx_n == 2 && call->ry_n==1) {
      y = st->vct+(call->ry[0]);
      y->t = RCD_Z;
      y->v.atm.z = xs[0]->v.atm.z - xs[1]->v.atm.z;
      free_r(st->vct,call->ry[0]);
      break;
    } else {
      perror("call:PLS:0");
      exit(-1);
    };
    case CMP:
    if (call->rx_n == 2 && call->ry_n==1) {
      y = st->vct+(call->ry[0]);
      y->t = RCD_Z;
      y->v.atm.z = xs[0]->v.atm.z <= xs[1]->v.atm.z;
      free_r(st->vct,call->ry[0]);
      break;
    } else {
      perror("call:PLS:0");
      exit(-1);
    };
    case EQ:
    if (call->rx_n == 2 && call->ry_n==1) {
      y = st->vct+(call->ry[0]);
      y->t = RCD_Z;
      y->v.atm.z = xs[0]->v.atm.z = xs[1]->v.atm.z;
      free_r(st->vct,call->ry[0]);
      break;
    } else {
      perror("call:PLS:0");
      exit(-1);
    };
    case FIX:
    case EXN:
    case INJ:
    case CHO:
    case FNC:
    mk_cs_f(st,st->pc,call->ry,st->cs_p+1);
    st->pc = y->v.atm.fnc.v.fnc.jmp_pt;
    set_rs(st->vct,y->v.atm.fnc.v.fnc.rs,xs);
  //  mk_cs_f(st->vct,call,st->cs_p);
    break;
  };
};
void agl(st* st,struct agl* agl){
  ++st->cs_p;
  st->cs_p.t = IL;
  st->cs_p.ret_pt = st->pc+1;
  st->cs_p.ret_rs = malloc(sizeof(reg)*agl->rr_n);
  int i = 0;
  rcd_tkn* k;
  while(i<agl->rr_n){
    st->cs_p.ret_rs[i] = agl->rr[i];
    ++i;
  };
  get_r(st->vct,agl->ra,k);
  switch(k->t){
    case RCD_COP:
    set_r(st->vct,agl->ra,k->v.atm.co_p.k);
    st->pc = agl->jmps[k->v.atm.co_p.i];
    break;
    case RCD_Z:
    set_unt(st->vct,agl->ra);
    if(k->v.atm.z == 0){
      st->pc = agl->jmps[0];
    } else {
      st->pc = agl->jmps[1];
    };
    break;
  };
};
int ret(st* st,struct ret* ret){
  int i = 0;
  rcd_tkn** k;= malloc(sizeof(rcd_tkn*)*ret->rs_n);
  get_rs(st->vct,ret->rs_n,ret->rs);
  st->pc = st->cs_p->ret_pt;
  switch(st->cs_p->t){
    case IL:
    set_rs(st->vct,ret->rs_n,k);
    free(st->cs_p->ret_rs);
    --st->cs_p;
    return 1;
    case CS:
    free_vct(st->vct);
    set_rs(st->vct,ret->rs_n,k);
    free(st->cs_p->ret_rs);
    --st->cs_p;
    return 1;
  }
};
void run_vm(st* st){
    int ri = 0;
    st->pc = st->code;
    vct vct = st->vct;
    enum op_t op_t;
    again:
    op_t = pc->op_t;
    pc++;
    switch (op_t) {
        case PRJ:
          prj(vct,&(pc->op_v.prj));
          goto again;
        case INI:
          ini(vct,&(pc->op_v.ini));
          goto again;
        case RCD:
          rcd(vct,&(pc->op_v.rcd));
          goto again;
        case RM:
          rm(vct,(pc->op_v.rm));
          goto again;
        case ID:
          id(vct,&(pc->op_v.id));
          goto again;
        case CALL:
          call(st,&(pc->op_v.call));
          goto again;
        case AGL:
          agl(st,&(pc->op_v.agl));
          goto again;
        case RET:
          ri = ret(st,&(pc->op_v.ret));
          if (ri==1) {
            goto ret;
          };
          goto again;
        default:
          perror("Unknown opcode");
    };
    ret:
    return;
};

int main(int argc, char *argv[]) {
  FILE* fp;
  FILE* fpk;
  st st;
  char* ks;
  fp = fopen("default.lir","r");
  csm_file(fp,&st);
  fclose(fp);
  run_vm(&st);
  fpk = fopen("default.lk","w");
  print_vct(&st,ks);
  fputs(ks,fpk);
  fclose(fpk);
  return 1;
};
