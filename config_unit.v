//------------------------------------------------
// config_unit.v
// Configure Reg Unit Module
// Authors: X
// Date: 2017/3/14
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module config_unit(input wire clk,
	input wire rst,
	input wire r_p,
	output wire [31:0] read_data);
	flopren #(32) config_reg(.clk1(clk),.reset(rst),
		.en(r_p),.a(`ZERO),.y(read_data);
endmodule // config_unit