//------------------------------------------------
// count_test.v
// Count Test  Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./count_unit.v"
`timescale 1ps/1ps
module count_test();
	reg clk;
	reg rst;
	reg r_p;
	reg r_h;
	reg we_h;
	wire [31:0] read_data;
count_unit count_unit(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.we_h(we_h),
	.read_data(read_data));
always #50 clk = ~ clk;
initial
	begin
		clk = 0;
		rst = `ENABLE;
		r_h = `DISABLE;
		r_p = `DISABLE;
		we_h = `DISABLE;
		#100
		rst = `DISABLE;
		we_h = `ENABLE;
		r_h = `ENABLE;
		#500
		r_h = `DISABLE;
		#200
		r_h = `ENABLE;
		#400 $finish;
	end
initial
	begin
		$dumpfile("count.vcd");
		$dumpvars(0,count_test);
	end
endmodule