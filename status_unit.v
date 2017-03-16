//------------------------------------------------
// status_unit.v
// Status Unit Module
// Authors: X
// Date: 2017/3/10
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module status_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire ei_en,
	input wire di_en,
	input wire cu0_en,
	input wire cp0_unusable,
	input wire um_en,
	input wire um,
	input wire eret,
	input wire we_s,
	input wire sr,
	input wire nmi,
	input wire [31:0] write_data,
	output wire [31:0] read_data);
wire [31:0] status;
wire re;
wire ie_data,ie_en;
wire exl_en,erl_en,exl_data,erl_data;
assign ie_en = ei_en | di_en | we_s;
assign re = r_p | r_h;
assign exl_en = eret | we_s;
assign erl_en = eret | we_s;
assign exl_data = (eret & (~ we_s)) ? `ZERO 
: (((~ eret) & we_s ) ? write_data[1] : `UNKNOW);
assign erl_data = (eret & (~ we_s)) ? `ZERO 
: (((~ eret) & we_s ) ? write_data[2] : `UNKNOW);
assign ie_data = (ei_en & (~ di_en) & (~ we_s)) ? `ENABLE 
			: (((~ ei_en) & di_en & (~ we_s)) ? `DISABLE  
			: (((~ ei_en) & (~ di_en) & we_s) ? write_data[0] : `UNKNOW));
flopren #(1) cu0(.clk1(clk),.reset(rst),.en(cu0_en),.a(cp0_unusable),.y(status[28]));
flopren #(1) SR(.clk1(clk),.reset(rst),.en(sr),.a(sr),.y(status[20]));
flopren #(1) NMI(.clk1(clk),.reset(rst),.en(nmi),.a(nmi),.y(status[19]));
flopren #(8) IM(.clk1(clk),.reset(rst),.en(we_s),.a(write_data[15:8]),.y(status[15:8]));
flopren #(1) UM(.clk1(clk),.reset(rst),.en(um_en),.a(um),.y(status[4]));
flopren #(1) ERL(.clk1(clk),.reset(rst),.en(erl_en),.a(erl_data),.y(status[2]));
flopren #(1) EXL(.clk1(clk),.reset(rst),.en(exl_en),.a(exl_data),.y(status[1]));
flopren #(1) IE(.clk1(clk),.reset(rst),.en(ie_en),.a(ie_data),.y(status[0]));
flopr #(3) cu3_cu1(.clk1(clk),.reset(rst),.a(`ZERO),.y(status[31:29]));
flopr #(7) sta_undefine_0(.clk1(clk),.reset(rst),.a(`ZERO),.y(status[27:21]));
flopr #(3) sta_undefine_1(.clk1(clk),.reset(rst),.a(`ZERO),.y(status[18:16]));
flopr #(3) sta_undefine_2(.clk1(clk),.reset(rst),.a(`ZERO),.y(status[7:5]));
flopr #(1) sta_undefine_3(.clk1(clk),.reset(rst),.a(`ZERO),.y(status[3]));
mux2 #(32) status_mux(.a(`UNKNOW),.b(status),.s(re),.y(read_data));
endmodule // status_unit