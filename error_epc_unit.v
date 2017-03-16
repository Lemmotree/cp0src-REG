//------------------------------------------------
// error_epc_unit.v
// Error EPC Unit Module
// Authors: X
// Date: 2017/3/14
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module error_epc_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire cache_err,
	input wire bd_p,
	input wire we_s,
	input wire [31:0] pc_p,
	input wire [31:0] write_data,
	output wire [31:0] read_data);
wire [31:0] err_epc_t,err_epc,err_epc_data;
wire re,we;
assign re = r_p | r_h;
assign we = cache_err | we_s;
assign err_epc_t = bd_p ? (pc_p - 4) : pc_p;
assign err_epc_data = (we_s & (~ cache_err)) ? write_data
				: (((~ we_s) & cache_err) ? err_epc_t : `UNKNOW);
flopren #(32) ErrEPC(.clk1(clk),.reset(rst),.en(we),
	.a(err_epc_data),.y(err_epc));
mux2 #(32) ErrEPC_mux(.a(`UNKNOW),.b(err_epc),.s(re),.y(read_data));
endmodule
