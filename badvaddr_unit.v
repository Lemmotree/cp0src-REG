//------------------------------------------------
// badvaddr_unit.v
// Badvaddr Unit Module
// Authors: X
// Date: 2017/3/9
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module badvaddr_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire addr_err,
	input wire [31:0] badvaddr_p,
	output wire [31:0] read_data);
wire re;
wire we_h;
wire [31:0] badvaddr;
assign re = r_h | r_p;
assign we_h = addr_err ? `ENABLE : `DISABLE;
flopren #(32) badvaddr_reg(.clk1(clk),.reset(rst),.en(we_h),
	.a(badvaddr_p),.y(badvaddr));
mux2 #(32) badvaddr_mux(.a(`UNKNOW),.b(badvaddr),.s(re),.y(read_data));	
endmodule 

