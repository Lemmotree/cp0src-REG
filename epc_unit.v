//------------------------------------------------
// epc_unit.v
// EPC Unit Module
// Authors: X
// Date: 2017/3/14
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module epc_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire we_s,
	input wire we_h,
	input wire bd_p,
	input wire [31:0] write_data,
	input wire [31:0] pc_p,
	output wire  [31:0] read_data);
wire [31:0] epc_t,epc,epc_data;
wire we;
wire re;
assign re = r_h | r_p;
assign we = we_h | we_s;
assign epc_t = bd_p ? (pc_p - 4) : pc_p;
assign epc_data = (we_s & (~ we_h)) ? write_data 
				: (((~ we_s) & we_h) ? epc_t : `UNKNOW);
flopren #(32) EPC(.clk1(clk),.reset(rst),.en(we),
	.a(epc_data),.y(epc));
mux2 #(32) EPC_mux(.a(`UNKNOW),.b(epc),.s(re),.y(read_data));
endmodule
