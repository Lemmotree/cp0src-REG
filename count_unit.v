//------------------------------------------------
// count_unit.v
// Count Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module count_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire we_h,
	output wire  [31:0] read_data);
//wire [31:0] acc;
wire [31:0] count;
assign re = r_h | r_p;
/*flopr #(32) acc_reg(.clk1(clk),
	.reset(rst),.a(acc+1),.y(acc));*/
flopren #(32) count_reg(.clk1(clk),
	.reset(rst),.en(we_h),.a(count+1),.y(count));
mux2 #(32) count_mux(.a(`UNKNOW),
	.b(count),.s(re),.y(read_data));
endmodule // count_unit
