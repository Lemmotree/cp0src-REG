//------------------------------------------------
// nested_error_epc_unit.v
// Nested Error EPC Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./error_epc_unit.v"
module nested_err_epc_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire cache_err,
	input wire bd_p,
	input wire we_s,
	input wire [31:0] pc_p,
	input wire [31:0] write_data,
	output wire [31:0] read_data);
error_epc_unit nested_err_epc(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.cache_err(cache_err),
	.we_s(we_s),
	.bd_p(bd_p),
	.pc_p(pc_p),
	.write_data(write_data),
	.read_data(read_data));
endmodule // nested_err_epc_unit