//------------------------------------------------
// nested_badvinstr_unit.v
// Nested Badvinstr Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./badvinstr_unit.v"
module nested_badvinstr_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire exception_abort,
	input wire irq,
	input wire [31:0] badvinstr_p,
	output wire [31:0] read_data);
badvinstr_unit nested_badvinstr(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.exception_abort(exception_abort),
	.irq(irq),
	.badvinstr_p(badvinstr_p),
	.read_data(read_data));
endmodule // nested_badvinstr_unit
	
