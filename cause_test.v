//------------------------------------------------
// cause_test.v
// Cause Test  Module
// Authors: X
// Date: 2017/3/9
//------------------------------------------------
`include "./cause_unit.v"
`include "./head.v"
`timescale 1ps/1ps
module cause_test();
	reg clk;
	reg rst;
	reg r_p;
	reg r_h;
	reg bd_p;
	reg exception_abort;
	reg irq_h;
	reg irq_s;
	reg [5:0] ip_h;
	reg [1:0] ip_s;
	reg [4:0] exception_code;
	wire [31:0] read_data;
cause_unit cause_unit(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.bd_p(bd_p),
	.exception_abort(exception_abort),
	.irq_s(irq_s),
	.irq_h(irq_h),
	.ip_s(ip_s),
	.ip_h(ip_h),
	.exception_code(exception_code),
	.read_data(read_data));
always #50 clk = ~ clk;
	initial
	begin 
		rst = `ENABLE;
		clk = 0;
		exception_abort = `DISABLE;
		irq_s = `DISABLE;
		irq_h = `DISABLE;
		r_h = `DISABLE;
		#100
		rst = `DISABLE;
		exception_abort = `ENABLE;
		exception_code = 5'b00001;
		bd_p = `ENABLE;
		r_p = `ENABLE;
		#100
		bd_p = `DISABLE;
		#100
		exception_abort = `DISABLE;
		irq_h = `ENABLE;
		ip_h= 6'b100000;
		r_p = `ENABLE;
		#100
		irq_h = `DISABLE;
		irq_s = `ENABLE;
		ip_s = 2'b10;
		#100
		r_p = `DISABLE;
		#100 
		r_h = `ENABLE;
		#200 $finish;
	end 
	initial
	begin
		$dumpfile("cause.vcd");
		$dumpvars(0,cause_test);
	end
endmodule // cause_test