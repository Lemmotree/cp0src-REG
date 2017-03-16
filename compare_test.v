//------------------------------------------------
// compare_test.v
// Compare Test  Module
// Authors: X
// Date: 2017/3/9
//------------------------------------------------
`include "./compare_unit.v"
`include "./head.v"
`timescale 1ps/1ps
module compare_test();
	reg clk;
	reg rst;
	reg r_p;
	reg r_h;
	reg we_h;
	reg we_s;
	reg [31:0] write_data;
	wire [31:0] read_data;
compare_unit compare_unit(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.we_h(we_h),
	.we_s(we_s),
	.write_data(write_data),
	.read_data(read_data));
always #50 clk = ~ clk;
initial
	begin
		clk = 0;
		rst = `ENABLE;
		we_s = `DISABLE;
		we_h = `DISABLE;
		r_h = `DISABLE;
		r_p = `DISABLE;
		#100
		rst = `DISABLE;
		we_h = `ENABLE;
		write_data = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
		r_h = `ENABLE;
		#100
		we_h = `DISABLE;
		r_h = `DISABLE;
		r_p = `ENABLE;
		we_s = `ENABLE;
		write_data = 32'b0000_0000_0000_0000_0000_0000_0000_1111;
		#200 $finish;
	end
initial
	begin
		$dumpfile("cmp.vcd");
		$dumpvars(0,compare_test);
	end

endmodule // compare_test