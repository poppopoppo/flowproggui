#define _GNU_SOURCE 1 
#include<signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <malloc.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <sys/resource.h>

#include <sys/ucontext.h>
#include <ucontext.h>

struct OP_SRC_0
{
};
struct OP_SRC_1
{
  void *r0;
};
struct OP_SRC_2
{
  void* r0; 
  void* r1;
};
void *calloc_sf(size_t n, size_t size){
  void* p = calloc(n,size);
  if (p==NULL){
    printf("call_sf:0"); 
    exit(EXIT_FAILURE);
  }; 
  return p;
};
int ini_prc(void** p){
  int rc = 0;
  struct rlimit rl;
  *p = NULL;

  rl.rlim_cur = 4000000000;
  rl.rlim_max = 10000000000;

  rc = setrlimit(RLIMIT_AS, &rl);
  if (rc < 0)
  {
    printf("Error: setrlimit(%d) %s\n", errno, strerror(errno));
    return (-1);
  }
  return 0;
};
void* alc_gd_buf(int* ps){
	int pagesize = sysconf(_SC_PAGE_SIZE);
	if (pagesize == -1){ return NULL; }

	char* buffer = memalign(pagesize, 2 * pagesize);
	if (buffer == NULL){
		return NULL; }
	buffer[pagesize]=0;
	buffer[0]=0;
	buffer[1]=0;
	if (mprotect(buffer + pagesize, pagesize,
							 PROT_READ) == -1){ 
		return NULL;
							 }
		*ps = pagesize; 
		return buffer;
}
int set_handler(int n,void* f){
	struct sigaction a;
	a.sa_flags = SA_SIGINFO;
	a.sa_sigaction = f;
	sigemptyset(&a.sa_mask);
	return sigaction(n,&a,NULL);
	};
void* set_usr_hdl(void* usr,void *extra){
		ucontext_t *p = (ucontext_t *)extra;
		void* rip = p->uc_mcontext.gregs[REG_RIP];
		p->uc_mcontext.gregs[REG_RIP] = usr; 
		return rip;
	};

int emt_s8_to(char* fn,void* buf,int n){
	int fd = creat(fn,S_IREAD | S_IWRITE);
	int r =	write(fd,buf,n);
  if (r == -1)
  {
    printf("emt_s8_to:0");
    exit(EXIT_FAILURE);
  };
  close(fd);
  return r;
}
typedef u_int64_t uint64_t;
#if defined(_MSC_VER)

#define BIG_CONSTANT(x) (x)

// Other compilers

#else	// defined(_MSC_VER)

#define BIG_CONSTANT(x) (x##LLU)

#endif // !defined(_MSC_VER)
u_int64_t MurmurHash64A ( const void * key, int len, u_int64_t seed )
{
  const uint64_t m = BIG_CONSTANT(0xc6a4a7935bd1e995);
  const int r = 47;

  u_int64_t h = seed ^ (len * m);

  const uint64_t * data = (const uint64_t *)key;
  const uint64_t * end = data + (len/8);

  while(data != end)
  {
    uint64_t k = *data++;

    k *= m; 
    k ^= k >> r; 
    k *= m; 
    
    h ^= k;
    h *= m; 
  }

  const unsigned char * data2 = (const unsigned char*)data;

  switch(len & 7)
  {
  case 7: h ^= (uint64_t)(data2[6]) << 48;
  case 6: h ^= (uint64_t)(data2[5]) << 40;
  case 5: h ^= (uint64_t)(data2[4]) << 32;
  case 4: h ^= (uint64_t)(data2[3]) << 24;
  case 3: h ^= (uint64_t)(data2[2]) << 16;
  case 2: h ^= (uint64_t)(data2[1]) << 8;
  case 1: h ^= (uint64_t)(data2[0]);
          h *= m;
  };
 
  h ^= h >> r;
  h *= m;
  h ^= h >> r;

  return h;
} 

