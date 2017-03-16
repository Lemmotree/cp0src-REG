//------------------------------------------------
// nested_badvaddr_unit.v
// Nested Badvaddr Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./badvaddr_unit.v"
module nested_badvaddr_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire addr_err,
	input wire [31:0] badvaddr_p,
	output wire [31:0] read_data);
	badvaddr_unit nested_badvaddr(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.addr_err(addr_err),
	.badvaddr_p(badvaddr_p),
	.read_data(read_data));
endmodule // nested_badvaddr_unit