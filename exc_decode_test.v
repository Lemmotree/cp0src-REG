//------------------------------------------------
// exc_decode_test.v
// Exception Decode Test  Module
// Authors: X
// Date: 2017/3/9
//------------------------------------------------
`include "./exc_decode.v"
`timescale  1ps/1ps
module exc_decode_test;
	reg [4:0] excode = 0;
	wire addr_err_f;
	wire cache_err_f;
	wire bus_err_f;
	wire cp0_unused;
	wire instr_undefine;
	wire overflow;
	wire trap;
	wire syscall;
	wire break_point;
	wire addr_err_m;
	wire cache_err_m;
	wire bus_err_m;
	exc_decode exc_decode(.excode(excode),
		.addr_err_f(addr_err_f),
		.cache_err_f(cache_err_f),
		.bus_err_f(bus_err_f),
		.cp0_unused(cp0_unused),
		.instr_undefine(instr_undefine),
		.overflow(overflow),
		.trap(trap),
		.syscall(syscall),
		.break_point(break_point),
		.addr_err_m(addr_err_m),
		.cache_err_m(cache_err_m),
		.bus_err_m(bus_err_m));
initial
	begin
		 repeat(12)
		 	begin
			#50 excode = excode + 1; 
		end
		#50 $finish;
			
	end
 initial
	begin
		$dumpfile("exc_decode.vcd");
		$dumpvars(0,exc_decode_test);
	end

endmodule // exc_decode_test