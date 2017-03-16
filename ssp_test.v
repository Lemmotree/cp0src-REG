 //------------------------------------------------
// ssp_test.v
// System Stack Point Test Unit Module
// Authors: X
// Date: 2017/3/14
//------------------------------------------------
`include "./head.v"
`include "./ssp_unit.v"
`timescale 1ps/1ps
module ssp_test();
	reg clk;
	reg rst;
	reg we_s;
	reg re_p;
	reg [31:0] write_data;
	wire [31:0] read_data;
 ssp_unit ssp(.clk(clk),
	.rst(rst),
	.we_s(we_s),
	.re_p(re_p),
	.write_data(write_data),
	.read_data(read_data));
 always #50 clk = ~ clk;
 initial
 begin
 	clk = 0;
 	rst = `ENABLE;
 	#100
 	rst = `DISABLE;
 	we_s = `ENABLE;
 	write_data = 32'b0000_0000_0000_0000_0000_0000_0000_1111;
 	re_p = `ENABLE;
 	#200 $finish;
 end
 initial
	begin
		$dumpfile("ssp.vcd");
		$dumpvars(0,ssp_test);
	end
endmodule // ssp_test