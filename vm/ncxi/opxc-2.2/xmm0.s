eq_s8: ; rdi~s0 rsi=s1 rax~l
	mov rdx,rax 
	and rdx,~0xffff 
	movdqu xmm1,[rdi] 
	
