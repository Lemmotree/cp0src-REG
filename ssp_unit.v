//------------------------------------------------
// ssp_unit.v
// System Stack Point Unit Module
// Authors: X
// Date: 2017/3/10
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module ssp_unit(input wire clk,
	input wire rst,
	input wire we_s,
	input wire re_p,
	input wire [31:0] write_data,
	output wire [31:0] read_data);
wire [31:0] ssp;
flopren #(32) SSP(.clk1(clk),.reset(rst),.en(we_s),.a(write_data),.y(ssp));
mux2 #(32) ssp_mux(.a(`UNKNOW),.b(ssp),.s(re_p),.y(read_data));
endmodule // ssp_unit