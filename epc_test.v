//------------------------------------------------
// epc_test.v
// EPC Test Unit Module
// Authors: X
// Date: 2017/3/14
//------------------------------------------------
`include "./head.v"
`include "./epc_unit.v"
`timescale 1ps/1ps
module epc_test();
	reg clk;
	reg rst;
	reg r_p;
	reg r_h;
	reg bd_p;
	reg we_s;
	reg we_h;
	reg [31:0] write_data;
	reg [31:0] pc_p;
	wire [31:0] read_data;

	epc_unit epc(.clk(clk),
	.rst(rst),
	.r_p(r_p),
	.r_h(r_h),
	.we_s(we_s),
	.we_h(we_h),
	.bd_p(bd_p),
	.pc_p(pc_p),
	.write_data(write_data),
	.read_data(read_data));
always #50 clk = ~ clk;
	initial
	begin
		clk = 0;
		#100 rst = `ENABLE;
		we_s = `DISABLE;
		r_p = `DISABLE;
		#100 rst = `DISABLE;
		#100
		pc_p = 32'b0000_0000_0000_0000_0000_0000_0000_0100; 
		we_h = `ENABLE;
		bd_p = `DISABLE;
		r_h = `ENABLE;
		#100 
		bd_p = `ENABLE;
		#100
		r_h = `DISABLE;
		we_h = `DISABLE;
		r_p = `ENABLE;
		we_s = `ENABLE;
		write_data = 32'b0000_0000_0000_0000_0000_0000_0000_1111; 
		r_p = `ENABLE;
		#200 $finish;
	end
	initial
	begin
		$dumpfile("epc.vcd");
		$dumpvars(0,epc_test);
	end
endmodule // epc_test
