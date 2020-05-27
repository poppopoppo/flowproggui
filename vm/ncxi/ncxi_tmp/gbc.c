#include <stdlib.h>
#define PTR_N 10000
typedef struct {
  (void*)[2*PTR_N] vct;
  int max;
  int min;
  int n;
} ps;
ps ps = { 
 void* new()
