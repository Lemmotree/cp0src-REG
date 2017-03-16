//------------------------------------------------
// badvinstr_unit.v
// Badvinstr Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module badvinstr_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire exception_abort,
	input wire irq,
	input wire [31:0] badvinstr_p,
	output wire [31:0] read_data);
wire re;
wire we_h;
wire [31:0] badvinstr;
assign re = r_h | r_p;
assign we_h = exception_abort | irq;
flopren #(32) badvinstr_reg(.clk1(clk),.reset(rst),.en(we_h),
	.a(badvinstr_p),.y(badvinstr));
mux2 #(32) badvinstr_mux(.a(`UNKNOW),.b(badvinstr),.s(re),.y(read_data));	
endmodule 

