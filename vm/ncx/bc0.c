#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>
#include <ctype.h>

#define IR_ID 0
#define IR_CLL 4
#define IR_AGL 6
#define IR_RET 8
#define IR_INI 10
#define IR_GLB_CLL 11

#define K_RCD 0
#define K_STG 1
#define K_Z 2
#define K_SGN 3
#define K_COP 4
#define K_FNC 5
#define K_BTM 6

#define K_F_PLS 0
#define K_F_MLT 1
#define K_F_MNS 2
#define K_F_CMP 3
#define K_F_EQ 4
#define K_F_FIX 5
#define K_F_EXN 6
#define K_F_INJ 7
#define K_F_CHO 8
#define K_F_FNC 9

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
  enum reg_ptn_t { PTN_R, PTN_A PTN_RO , PTN_R_LB, PTN_RO_LB } t;
  union {
    struct { int hd_n; reg_ptn* hd; reg tl; } rcd ;
    struct { int hd_n; reg_ptn* hd; char** lb; reg tl; } rcd_lb;
    reg atm;
  } v;
} reg_ptn;
typedef void* pt
typedef struct { int n; pt v; } rcd;
typedef struct { int i; pt k; } co_p;
typedef struct int z;
typedef struct int sgn;
typedef struct char* stg;
typedef struct {
  enum { PLS, MLT, MNS, CMP, EQ, FIX, EXN, INJ, CHO, FNC } t;
  int v;
} glb_etr;

typedef struct {
  enum op_t { INI, ID, CALL, AGL, RET
  } t;
  union op_v {
    struct ini { rcd_tkn* k; reg src; } ini;
    struct id { reg_ptn* src; int dsts_n; reg_ptn* dsts; } id;
    struct call { reg_ptn* y; reg f; reg_ptn* x; } call;
    struct agl { int jmps_n; int* jmps; reg ra; reg_ptn* ri; } agl;
    struct ret { reg_ptn* r; } ret;
  } v;
} op;
typedef op* code;
typedef reg_v* vct;
typedef struct { reg reg; reg_v* tkn; } cs_k;
typedef struct {
  enum cs_f_t { IL, CS } t;
  op* ret_pt;
  reg* ret_rs;
  void_list_t* cs_v;
} cs_f;
typedef cs_f* cs[252];
typedef struct { int code_l; op* code; op* pc; int vct_l; vct vct; cs_f* cs_b; cs_f* cs_p; } st;
void copy_rcd_tkn(rcd_tkn* src,rcd_tkn* dst);
void set_unt(vct vct,reg r);
void free_vct(vct vct);
void load_bc(char* s,st* st);
void set_unt(vct vct,reg r){
  vct[r].v.rcd.n = 0;
};
void free_vct(vct vct){
};
int len_list(void_list_t* l){
  void_list_t* tl;
  switch (l->t){
    case NIL:
      return 0;
    case CNS:
      tl = l->cns.tl;
      return (1+(len_list(tl)));
  };
};
void load_rcd_tkn(char* c0,rcd_tkn* k){
 char* c = c0;
 char* c1 = c0;
 int i = 0;
 int j = 0;
 switch (*c) {
   case K_RCD:
   ++c; k->t = RCD_RCD;
   k->v.rcd.n = *((int*)c); c = c+4;
   k->v.rcd.rcd = malloc(sizeof(rcd_tkn*)*k->v.rcd.n);
   while(i<k->v.rcd.n){
     k->v.rcd.rcd[i] = malloc(sizeof(rcd_tkn));
     load_rcd_tkn(c,k->v.rcd.rcd[i]);
   };
   break;
   case K_STG:
   ++c; k->t = RCD_STG;
   i = 0; c1 = c;
   while (*c != '\0') { ++i; ++c; };
   k->v.atm.stg = malloc(sizeof(char)*i);
   while(j<i){ k->v.atm.stg[j] = c1[j]; };
   break;
   case K_Z:
   ++c; k->t = RCD_Z;
   k->v.atm.z = *((int*)c); c = c+4;
   break;
   case K_SGN:
   ++c; k->t = RCD_SGN;
   k->v.atm.sgn = *((int*)c); c = c+4;
   break;
   case K_COP:
   ++c; k->t = RCD_COP;
   k->v.atm.co_p.i = *((int*)c); c = c+4;
   k->v.atm.co_p.k = malloc(sizeof(rcd_tkn));
   load_rcd_tkn(c,k->v.atm.co_p.k);
   break;
   case K_FNC:
   ++c; k->t = RCD_FNC;
   switch (*c){
     case K_F_PLS:
     ++c; k->v.atm.fnc.t = PLS;
     break;
     case K_F_MLT:
     ++c; k->v.atm.fnc.t = MLT;
     break;
     case K_F_MNS:
     ++c; k->v.atm.fnc.t = MNS;
     break;
     case K_F_CMP:
     ++c; k->v.atm.fnc.t = CMP;
     break;
     case K_F_EQ:
     ++c; k->v.atm.fnc.t = EQ;
     break;
     case K_F_FIX:
     ++c; k->v.atm.fnc.t = FIX;
     break;
     case K_F_FNC:
     ++c; k->v.atm.fnc.t = FNC;
     k->v.atm.fnc.v.fnc.rs_n = *((int*)c); c = c+4;
     i = 0;
     while(i<k->v.atm.fnc.v.fnc.rs_n){
       k->v.atm.fnc.v.fnc.rs[i] = *((int*)c); c = c+4;
     };
     k->v.atm.fnc.v.fnc.jmp_pt = *((int*)c); c = c+4;
     break;
   };
 };
};
void load_op(char* c,op* o){
  int i = 0;
  switch(*c){
    case IR_ID:
    ++c; o->t = ID;
    o->v.id.src = *((int*)c); c = c+4;
    o->v.id.dsts_n = *((int*)c); c = c+4;
    o->v.id.dsts = malloc(sizeof(reg)*o->v.id.dsts_n);
    while(i<o->v.id.dsts_n){
      o->v.id.dsts[i] = *((int*)c);
      c = c+4;
    };
    break;
    case IR_CLL:
    ++c; o->t = CALL;
    o->v.call.ry_n = *((int*)c); c = c+4;
    o->v.call.ry = malloc(sizeof(reg)*o->v.call.ry_n);
    while(i<o->v.call.ry_n){
      o->v.call.ry[i] = *((int*)c); c = c+4;
    };
    o->v.call.rf = *((int*)c); c = c+4;
    o->v.call.rx_n = *((int*)c); c = c+4;
    o->v.call.rx = malloc(sizeof(reg)*o->v.call.rx_n);
    while(i<o->v.call.rx_n){
      o->v.call.rx[i] = *((int*)c); c = c+4;
    };
    break;
    case IR_AGL:
    ++c; o->t = AGL;
    o->v.agl.jmps_n = *((int*)c); c = c+4;
    while(i<o->v.agl.jmps_n){
      o->v.agl.jmps[i] = *((int*)c); c = c+4;
    };
    o->v.agl.ra = *((int*)c); c = c+4;
    o->v.agl.rr_n = *((int*)c); c = c+4;
    while(i<o->v.agl.rr_n){
      o->v.agl.rr[i] = *((int*)c); c = c+4;
    };
    break;
    case IR_INI:
    ++c; o->t = INI;
    load_rcd_tkn(c,o->v.ini.k);
    o->v.ini.src = *((int*)c); c = c+4;
    break;
    case IR_RET:
    ++c; o->t = RET;
    o->v.ret.p = *((int*)c); c = c+4;
    o->v.ret.rs_n = *((int*)c); c = c+4;
    while(i<o->v.ret.rs_n){
      o->v.ret.rs[i] = *((int*)c); c = c+4;
    };
    break;
  };
};
void load_bc(char* c,st* st){
  st->vct_l = *((int*)c);
  c = c+4;
  st->code_l = *((int*)c);
  c = c+4;
  st->code = malloc(sizeof(op)*st->code_l);
  int i = 0;
  op* o = st->code;
  while(i<st->code_l){
    load_op(c,o);
    ++i; ++o;
  };
};
void free_r(vct vct,reg i){
  vct[i].t = BTM;
};
char* save_rcd_tkn(char* s,rcd_tkn* k){
};
void save_vct(st* st,char* s){
};
void mk_cs_f(st* st,op* ret_pt,reg* rs,cs_f* f){
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
      p->t = CNS;
      p->cns.hd = malloc(sizeof(cs_k));
      ((cs_k*)(p->cns.hd))->reg = i;
      get_r(st->vct,i,(rcd_tkn*)((cs_k*)(p->cns.hd))->tkn);
      free_r(st->vct,i);
      p = p->cns.tl;
    };
  };
  p = malloc(sizeof(void_list_t));
  p->t = NIL;
};

void ini(vct vct,struct ini* ini){
  set_r(vct,ini->src,ini->k);
};
void id(vct vct,struct id* id){
  int i = 0;
  while(i<id->dsts_n){
    mov_ptn(vct,id->src,id->dsts[i]);
  };
  free_ptn(vct,id->src);
};
void mov_ptn(vct vct,reg_ptn* src,reg_ptn* dst){
  int i; int j;
  switch(src->t){
  case PTN_A:
  switch(dst->t){
    case PTN_A:
    if (dst->v.atm!=(-1)) {
      mov(vct[src->v.atm],vct[dst->v.atm]);
    };
    break;
    case PTN_R:
    i = 0;
    while(i<dst->v.hd_n){
      mov(((rcd*)vct[src->v.atm])->v[i],vct[dst->v.hd[i]]);
    };
    break;
  };
  break;
  case PTN_R:
  switch(dst->t){
    case PTN_A:
    if (dst->v.atm!=-1) {
      vct[dst->atm] = malloc(sizeof(rcd));
      vct[dst->atm]->k = malloc(sizeof(void*)*src->v.hd_n);
      while(i<src->v.hd_n){
        mov(vct[src->v.hd[i]],vct[dst->atm]->k+i);
      };
    };
    break;
    case PTN_R:
    i = 0;
    while(i<src->v.hd_n){
      mov(vct[src->v.hd[i]],vct[dst->v.hd[i]]);
    };
    break;
  };
  break;
};
void call(st* st,struct call* call){
  rcd_tkn* f;
  rcd_tkn** xs;
  rcd_tkn* y;
  ++st->cs_p;
  get_r(st->vct,call->rf,f);
  get_rs(st->vct,call->rx_n,call->rx,xs);
  switch((glb_etr*)st->vct[call->f]->t){
    case PLS:
    st->vct[call->y.v.atm] = st->vct[call->x.v.atm] = st->vct+(call->ry[0]);
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
    st->pc = st->code+y->v.atm.fnc.v.fnc.jmp_pt;
    set_rs(st->vct,y->v.atm.fnc.v.fnc.rs_n,y->v.atm.fnc.v.fnc.rs,xs);
  //  mk_cs_f(st->vct,call,st->cs_p);
    break;
  };
};
void agl(st* st,struct agl* agl){
  ++st->cs_p;
  st->cs_p->t = IL;
  st->cs_p->ret_pt = st->pc+1;
  st->cs_p->ret_rs = malloc(sizeof(reg)*agl->rr_n);
  int i = 0;
  rcd_tkn* k;
  while(i<agl->rr_n){
    st->cs_p->ret_rs[i] = agl->rr[i];
    ++i;
  };
  get_r(st->vct,agl->ra,k);
  switch(k->t){
    case RCD_COP:
    set_r(st->vct,agl->ra,k->v.atm.co_p.k);
    st->pc = st->code+agl->jmps[k->v.atm.co_p.i];
    break;
    case RCD_Z:
    set_unt(st->vct,agl->ra);
    if(k->v.atm.z == 0){
      st->pc = st->code+agl->jmps[0];
    } else {
      st->pc = st->code+agl->jmps[1];
    };
    break;
  };
};
int ret(st* st,struct ret* ret){
  int i = 0;
  rcd_tkn** ks = malloc(sizeof(rcd_tkn*)*ret->rs_n);
  get_rs(st->vct,ret->rs_n,ret->rs,ks);
  st->pc = st->cs_p->ret_pt;
  switch(st->cs_p->t){
    case IL:
    set_rs(st->vct,ret->rs_n,ret->rs,ks);
    free(st->cs_p->ret_rs);
    --st->cs_p;
    return 1;
    case CS:
    free_vct(st->vct);
    set_rs(st->vct,ret->rs_n,ret->rs,ks);
    free(st->cs_p->ret_rs);
    --st->cs_p;
    return 1;
  };
};
void run_vm(st* st){
    int ri = 0;
    st->pc = st->code;
    vct vct = st->vct;
    enum op_t op_t;
    again:
    op_t = st->pc->t;
    st->pc++;
    switch (op_t) {
        case INI:
          ini(vct,&(st->pc->v.ini));
          goto again;
        case ID:
          id(vct,&(st->pc->v.id));
          goto again;
        case CALL:
          call(st,&(st->pc->v.call));
          goto again;
        case AGL:
          agl(st,&(st->pc->v.agl));
          goto again;
        case RET:
          ri = ret(st,&(st->pc->v.ret));
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
  FILE* fp; FILE* fpk; st st;
  char* ks; int bn; char* bs;
  fp = fopen("default.lir","r");
  fread(&bn,sizeof(int),1,fp);
  bs = malloc(sizeof(char)*bn);
  fread(&bs,sizeof(char),bn,fp);
  load_bc(bs,&st);
  fclose(fp);
  run_vm(&st);
  return 1;
};
