//------------------------------------------------
// badvinstr_test.v
// Badvinstr Test Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./badvinstr_unit.v"
`timescale 1ps/1ps
module badvinstr_test();
	reg clk;
	reg rst;
	reg r_p;
	reg r_h;
	reg exception_abort;
	reg irq;
	reg [31:0] badvinstr_p;
	wire [31:0] read_data;
	badvinstr_unit badvinstr(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.exception_abort(exception_abort),
	.irq(irq),
	.badvinstr_p(badvinstr_p),
	.read_data(read_data));
	always #50 clk = ~ clk;
initial
	begin
		clk = 0;
		rst = `ENABLE;
		r_h = `DISABLE;
		#100 
		rst = `DISABLE;
		#100
		exception_abort = `ENABLE;
		r_p = `ENABLE;
		badvinstr_p = 32'b0000_0000_0000_0000_0000_0000_0000_1111;
		#100
		r_p = `DISABLE;
		exception_abort = `DISABLE;
		irq = `ENABLE;
		r_h = `ENABLE;
		badvinstr_p = 32'b0000_0000_0000_0000_0000_0000_1111_1111;
		#100
		r_p = `DISABLE;
		r_h = `DISABLE;
		#200 $finish;
	end
initial
	begin
		$dumpfile("badvinstr.vcd");
		$dumpvars(0,badvinstr_test);
	end
endmodule // badvinstr_test
