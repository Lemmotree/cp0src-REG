//------------------------------------------------
// badvaddr_test.v
// Badvaddr Test Unit Module
// Authors: X
// Date: 2017/3/14
//------------------------------------------------
`include "./head.v"
`include "./badvaddr_unit.v"
`timescale 1ps/1ps
module badvaddr_test();
	reg clk;
	reg rst;
	reg r_p;
	reg r_h;
	reg addr_err;
	reg [31:0] badvaddr_p;
	wire [31:0] read_data;
	badvaddr_unit badvaddr(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.addr_err(addr_err),
	.badvaddr_p(badvaddr_p),
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
		addr_err = `DISABLE;
		r_p = `ENABLE;
		#100
		r_p = `DISABLE;
		addr_err = `ENABLE;
		badvaddr_p = 32'b0000_0000_0000_0000_0000_0000_0000_1111;
		r_p = `ENABLE;
		#100
		r_p = `DISABLE;
		r_h = `ENABLE;
		#200 $finish;
	end
initial
	begin
		$dumpfile("badvaddr.vcd");
		$dumpvars(0,badvaddr_test);
	end
endmodule // badvaddr_test
