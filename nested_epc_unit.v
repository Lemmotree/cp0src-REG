//------------------------------------------------
// nested_epc_unit.v
// Nested EPC Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./epc_unit.v"
module nested_epc_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire we_s,
	input wire we_h,
	input wire bd_p,
	input wire [31:0] write_data,
	input wire [31:0] pc_p,
	output wire [31:0] read_data);
	
	epc_unit nested_epc(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.we_s(we_s),
	.we_h(we_h),
	.bd_p(bd_p),
	.pc_p(pc_p),
	.write_data(write_data),
	.read_data(read_data));
endmodule // nested_epc_unit