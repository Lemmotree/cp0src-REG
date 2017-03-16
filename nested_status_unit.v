//------------------------------------------------
// nested_status_test.v
// Nested Status Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./status_unit.v"
`include "./head.v"
module nested_status_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire ei_en,
	input wire di_en,
	input wire cp0_unusable,
	input wire um,
	input wire eret,
	input wire we_s,
	input wire sr,
	input wire nmi,
	input wire [31:0] write_data,
	output wire [31:0] read_data);
status_unit nested_status(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.ei_en(ei_en),
	.di_en(di_en),
	.cp0_unusable(cp0_unusable),
	.um(um),
	.eret(eret),
	.we_s(we_s),
	.sr(`UNTAKEN),
	.nmi(`UNTAKEN),
	.write_data(write_data),
	.read_data(read_data));
	
endmodule // nested_status_unit