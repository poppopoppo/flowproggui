	BC_PT: dq 0x00ff0f0f
	SIG_FLG: dq 0 
	SIG_ETR: dq 0 
	SIG_RIP: dq 0
	GD_BUF_N: dq 0 
	EMT_FLG: dq 0 
	err_n: dq 0
	 SS_LN_C: dq 0
	S8_N: dq 0 
	CLR_N: dq 2 
	CLR_NULL: dq 0,0,1

	fmt_s8_l: db "%.*s",0
	fmt_exn: db "exn:%lld",10,0 
	fmt_err_line: db "err:%llx",10,0
	fmt_r64: db "%dr",0
	fmt_s8: db 34,"%s",34,0
	fmt_d: db "%lld",0
	fmt_d_nl: db "%lld",10,0
	fmt_x: db "%llx",0
	fmt_arr_l: db "{+ ",0
	fmt_arr_r: db "}",0
	fmt_rcd_l: db "{ ",0
	fmt_rcd_r: db "} ",0
	fmt_Clr_l: db "{= ",0 
	fmt_rcd_box_l: db "*{ "
	fmt_nl: db 10,0
	fmt_spc: db " ",0
	fmt_emt: db "_emt:",0
	fmt_getchar: db "_getchar:",0
	fmt_test0: db "sig segv handled!!:",0
	rt_err0: db "rt_err 0:",10,0 
	emt_bof_msg: db "EMT_BOF:",10,0 
 s8_e: dq 0,0

	fmt_info:
		db "info:",10
		db "S8_N=%d",10
		db "SS_LN_C=%d",10
		db "SS_LN_N=%d",10
		db 0
	fmt_info_rcd:
		db "rcd %d",10
		db "SS_RCD_C=%d",10
		db "SS_RCD_N=%d",10
		db 0

fmt_sig_hdl:
	db "sig_hdl:",10
	db "signal number=%d",10
	db "SIG_FLG=%llx",10
	db 0

s8_m: 
	dq 0x0 
	dq 0x0000_0000_0000_00ff
	dq 0x0000_0000_0000_ffff  
	dq 0x0000_0000_00ff_ffff  
	dq 0x0000_0000_ffff_ffff  
	dq 0x0000_00ff_ffff_ffff  
	dq 0x0000_ffff_ffff_ffff  
	dq 0x00ff_ffff_ffff_ffff  
