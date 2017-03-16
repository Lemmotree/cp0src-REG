//------------------------------------------------
// exc_decode.v
// Exception Decode Unit Module
// Authors: X
// Date: 2017/3/9
//------------------------------------------------
`include "./head.v"
module exc_decode(input wire [4:0] excode,
	output wire addr_err_f,
	output wire cache_err_f,
	output wire bus_err_f,
	output wire cp0_unused,
	output wire instr_undefine,
	output wire overflow,
	output wire trap,
	output wire syscall,
	output wire break_point,
	output wire addr_err_m,
	output wire cache_err_m,
	output wire bus_err_m);
assign addr_err_f = (excode == `ADDR_ERR_F) ? `ENABLE : `DISABLE;
assign cache_err_f = (excode == `CACHE_ERR_F) ? `ENABLE : `DISABLE;
assign bus_err_f = (excode == `BUS_ERR_F) ? `ENABLE : `DISABLE;
assign cp0_unused = (excode == `CP0_UNUSED) ? `ENABLE : `DISABLE;
assign instr_undefine = (excode == `INSTR_UNDEFINE) ? `ENABLE : `DISABLE;
assign overflow = (excode == `OVERFLOW) ? `ENABLE : `DISABLE;
assign trap = (excode == `TRAP) ? `ENABLE : `DISABLE;
assign syscall = (excode == `SYSCALL) ? `ENABLE : `DISABLE;
assign break_point = (excode == `BREAK) ? `ENABLE : `DISABLE;
assign addr_err_m = (excode == `ADDR_ERR_M) ? `ENABLE : `DISABLE;
assign cache_err_m = (excode == `CACHE_ERR_M) ? `ENABLE : `DISABLE;
assign bus_err_m = (excode == `BUS_ERR_M) ? `ENABLE : `DISABLE;
endmodule // exc_decode