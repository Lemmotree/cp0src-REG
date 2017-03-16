//------------------------------------------------
// cause_unit.v
// Cause Unit Module
// Authors: X
// Date: 2017/3/9
//------------------------------------------------
`include "./head.v"
`include "./components.v"
module cause_unit(input wire clk,
	input wire rst,
	input wire r_p,
	input wire r_h,
	input wire bd_p,
	input wire exception_abort,
	input wire irq_h,
	input wire irq_s,
	input wire [1:0] ip_s,
	input wire [5:0] ip_h,
	input wire [4:0] exception_code,
	output wire [31:0] read_data);
wire [31:0] cause;
wire we_h;
wire re;
wire irq;
assign re = r_p | r_h;
assign irq = irq_h | irq_s;
assign we_h = exception_abort | irq;
flopren #(1) BD(.clk1(clk),.reset(rst),.en(we_h),.a(bd_p),.y(cause[31]));
flopren #(1) IV(.clk1(clk),.reset(rst),.en(irq),
	.a(irq),.y(cause[23]));
flopren #(6) IP_H(.clk1(clk),.reset(rst),.en(irq_h),.a(ip_h),.y(cause[15:10]));
flopren #(2) IP_S(.clk1(clk),.reset(rst),.en(irq_s),.a(ip_s),.y(cause[9:8]));
flopren #(5) excode(.clk1(clk),.reset(rst),.en(exception_abort),
	.a(exception_code),.y(cause[6:2]));
flopr #(7) cau_undefine_0(.clk1(clk),.reset(rst),.a(`ZERO),.y(cause[30:24]));
flopr #(7) cau_undefine_1(.clk1(clk),.reset(rst),.a(`ZERO),.y(cause[22:16]));
flopr #(1) cau_undefine_2(.clk1(clk),.reset(rst),.a(`ZERO),.y(cause[7]));
flopr #(2) cau_undefine_3(.clk1(clk),.reset(rst),.a(`ZERO),.y(cause[1:0]));
mux2 #(32) cause_mux(.a(`UNKNOW),.b(cause),.s(re),.y(read_data));	
endmodule
 