; tmp 
	TMP : resq 64 

	EXIT: resq 0
	FLG0: resq 1 
	FLG1: resq 1
	FTX0: resq 1
	NULL: resq 1 
	BUF0: resq 8
	SS_RCD_TOP: resq 64 
	SS_RCD_BTM: resq 64 
	SS_RCD_N: resq 64 
	GLV: resq GLV_N
	PAGE_SIZE: resq 1
	
; emt buffer 
	GD_BUF_PT: resq 1 
	GD_BUF_IT: resq 1
	EMT_BUF_OFS: resq 1 
 EMT_BUF: resb EMT_BUF_MAX 
	EMT_BUF_END: resb 1
	SS_RCD_C: resq (RCD_N+1)

;stat: resb 144
struc STAT
	.st_dev         resq 1
	.st_ino         resq 1
	.st_mode        resd 1
	.st_nlink       resd 1
	.st_uid         resd 1
	.st_gid         resd 1
	.st_rdev        resq 1
	.pad1           resq 1
	.st_size        resq 1
	.st_blksize     resd 1
	.pad2 resd 1
	.st_blocks      resq 1
	.st_atime       resq 1
	.st_atime_nsec  resq 1
	.st_mtime       resq 1
	.st_mtime_nsec  resq 1
	.st_ctime       resq 1
	.st_ctime_nsec  resq 1
	.__unused4  resd 1
	.__unused5  resd 1
endstruc