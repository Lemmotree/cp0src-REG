//------------------------------------------------
// compare_unit.v
// Compare Unit Module
// Authors: X
// Date: 2017/3/15
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module compare_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire we_h,
	input wire we_s,
	input wire [31:0] write_data,
	output wire [31:0] read_data);
wire [31:0] compare;
wire we,re;
//由于只有一个读写数据端口，硬件的读写信号同一时刻只能有一个有效
assign we = we_h | we_s;
assign re = r_p | r_h;
flopren #(32) compare_reg(.clk1(clk),.reset(rst),.en(we),
	.a(write_data),.y(compare));
mux2 #(32) compare_mux(.a(`UNKNOW),.b(compare),.s(re),.y(read_data));
endmodule // compare_unit
