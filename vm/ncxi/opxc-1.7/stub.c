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
#include <stdio.h>

#include <sys/ucontext.h>
#include <ucontext.h>

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
	close(fd);
	return r;
}


