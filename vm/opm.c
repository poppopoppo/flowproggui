#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <stdint.h>
#include <ctype.h>

typedef int reg;
typedef void* pt;
typedef void* vct;
typedef struct { int n; pt v; } rcd;
typedef struct { int i; pt v; } co_p;
typedef enum {
  PRJ, CNS, GL_CLL, AGL, RPC, RET, 
