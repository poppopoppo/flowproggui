#include <stdio.h>
#include <signal.h>
int set_handler(int n,void* f){
	struct sigaction a;
	a.sa_flags = SA_SIGINFO;
	a.sa_sigaction = f;
	sigemptyset(&a.sa_mask);
	return sigaction(n,&a,NULL);
	};


