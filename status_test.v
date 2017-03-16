//------------------------------------------------
// status_test.v
// Status Test  Module
// Authors: X
// Date: 2017/3/14
//------------------------------------------------
`include "./status_unit.v"
`include "./head.v"
`timescale 1ps/1ps
module status_test;
always #50 clk = ~ clk;
	reg clk;
	reg rst;
	reg r_p;
	reg r_h;
	reg ei_en;
	reg di_en;
	reg cu0_en;
	reg cp0_unusable;
	reg um_en;
	reg um;
	reg eret;
	reg we_s;
	reg cache_err;
	reg [31:0] write_data;
	wire [31:0] read_data;
	status_unit status_unit(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.ei_en(ei_en),
	.di_en(di_en),
	.cu0_en(cu0_en),
	.cp0_unusable(cp0_unusable),
	.um_en(um_en),
	.um(um),
	.eret(eret),
	.we_s(we_s),
	.sr(`UNTAKEN),
	.nmi(`UNTAKEN),
	.write_data(write_data),
	.read_data(read_data));
	initial
	begin
		clk = 0; #100 rst = 1; 
		cp0_unusable = `UNUSABLE;
		r_h = `DISABLE;
		eret = `DISABLE;
		#100 rst = 0;
		#100 we_s = `ENABLE;
		cache_err = `DISABLE;
		ei_en = `DISABLE;
		di_en = `DISABLE;
		um_en = `ENABLE;
		cu0_en = `ENABLE;
		um = `KERNEL_MODE;
		cp0_unusable = `USABLE;
		write_data = 32'b0000_0000000_00_000_11111111_000_1_0_1_1_1;
		r_p = `ENABLE;
		#100
		cp0_unusable = `UNUSABLE;
		um = `USER_MODE;
		#100
		r_p = `DISABLE;
		r_h = `ENABLE;
		we_s = `DISABLE;
		di_en = `ENABLE;
		#100
		di_en = `DISABLE;
		ei_en = `ENABLE;
		#100
		ei_en = `DISABLE;
		eret = `ENABLE;
		#100 
		eret = `DISABLE;
		#200 $finish;	
	end
	initial
	begin
		$dumpfile("status.vcd");
		$dumpvars(0,status_test);
	end

endmodule // status_test
