#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int set_handler(int n,void* f){
	struct sigaction a;
	a.sa_flags = SA_SIGINFO;
	a.sa_sigaction = f;
	sigemptyset(&a.sa_mask);
	return sigaction(n,&a,NULL);
	};

int emt_s8_to(char* fn,void* buf,int n){
	int fd = creat(fn,S_IREAD | S_IWRITE);
	int r =	write(fd,buf,n);
	close(fd);
	return r;
}


