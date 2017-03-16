//------------------------------------------------
// nested_cause_unit.v
// Nested Cause Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./cause_unit.v"
module nested_cause_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire bd_p,
	input wire exception_abort,
	input wire irq,
	input wire [7:0] ip,
	input wire [4:0] exception_code,
	output wire [31:0] read_data);
cause_unit nested_cause(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.bd_p(bd_p),
	.exception_abort(exception_abort),
	.irq(irq),
	.ip(ip),
	.exception_code(exception_code),
	.read_data(cause_reg));
endmodule // nested_cause_unit