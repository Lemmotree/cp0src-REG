/********************************************************************
// 文件：	components.v
// 名称：	
//
// 功能：	流水线中的其他部件
//
// 输入：	
//			
// 输出：	
//
// 时间：	2013-9-2 
//
********************************************************************/

 
 `timescale	1ns/1ps
 
module adder(input  [31:0] a, b,
             output [31:0] y);

	assign  y = a + b;
endmodule

module mux2 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a, b, 
              input              s, 
              output [WIDTH-1:0] y);

    assign  y = s ? b : a; 
endmodule

module mux3 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a, b, c,
              input  [1:0]       s, 
              output [WIDTH-1:0] y);

	assign  y = s[1] ? c : (s[0] ? b : a); 
endmodule

module mux4 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a, b, c, d,
              input  [1:0]       s, 
              output [WIDTH-1:0] y);

	assign  y = s[1] ? (s[0] ? d : c) : (s[0] ? b : a); 
endmodule

module or2(input[31:0]	a,b,
		   output[31:0]	y);
		   
	assign	y=a|b;
endmodule 

module eqcmp #(parameter WIDTH = 32)
             (input [WIDTH-1:0] a, b,
              output            aeqb);

	assign  aeqb = (a == b);
endmodule

module eqzcmp #(parameter WIDTH = 32)
                 (input [WIDTH-1:0]  a,
                  output        aeqz);

	assign  aeqz = (a == 0);
endmodule

module neqzcmp #(parameter WIDTH = 32)
                 (input [WIDTH-1:0]  a,
                  output        aneqz);

	assign  aneqz = (a != 0);
endmodule

module gtzcmp #(parameter WIDTH = 32)
                 (input [WIDTH-1:0] a,
                  output       agtz);

	assign  agtz = ~a[WIDTH-1] & (a[WIDTH-2:0] !== 0);
endmodule

module ltzcmp #(parameter WIDTH = 32)
                 (input [WIDTH-1:0] a,
                  output       altz);

	assign  altz = a[WIDTH-1];           
endmodule

//当enable为1时进行符号位拓展；否则进行零拓展
module	signext #(parameter INPUT=16, OUTPUT=32)
				(input[INPUT-1:0]	a,
				input		   enable,
				output[OUTPUT-1:0]	y);
				
	wire	extension;
	
	assign	extension=(enable ? a[INPUT-1]:0) ;
	assign	y={{(OUTPUT-INPUT){extension}},a};
endmodule 

// 左移2位
module sl2(input  [31:0] a,
           output [31:0] y);

	assign  y = {a[29:0], 2'b00};
endmodule

module dec2 (input  [1:0] x,
             output [3:0] y);

  assign #1 y = (x[0] ? (x[1] ? 4'b1000 : 4'b0010)
                      : (x[1] ? 4'b0100 : 4'b0001));
endmodule

module flopr #(parameter WIDTH = 32)
             (
              input clk1,
			  input reset,
			  input [WIDTH-1:0] a,
			  output reg [WIDTH-1 :0] y
             );
			 
	always @(posedge clk1)
	   y <= reset ? 0 : a;
endmodule

module flopren  #(parameter WIDTH = 32)
             (
              input clk1,
			  input reset,
			  input en,
			  input [WIDTH-1:0] a,
			  output reg [WIDTH-1 :0] y
             );
	always @(posedge clk1  )
	   y <= reset ? 0 : (en ? a : y);
endmodule

module flopen  #(parameter WIDTH = 32)
             (
              input clk1,
			  input en,
			  input [WIDTH-1:0] a,
			  output reg [WIDTH-1 :0] y
             );
			 
	always @(posedge clk1)
	    y <= en ? a : y;
endmodule 

module floprenc #(parameter WIDTH = 32)
              (
              input clk1,
			  input reset,
			  input en,
			  input clear,
			  input [WIDTH-1:0] a,
			  output reg [WIDTH-1 :0] y
             );
			 
	always @(posedge clk1 )
	 y <= reset ? 0 : (en ? (clear ? 0 : a): y);
	 
endmodule 

module floprc #(parameter WIDTH = 32)
              (input clk1,
			  input reset,
			  input clear,
			  input [WIDTH-1:0] a,
			  output reg [WIDTH-1:0] y
			  );
			  
	always @(posedge clk1)
	    y <= reset ? 0 : (clear ? 0 : a);
endmodule 
	
	
	
	
module inc #(parameter WIDTH = 32)
            (input  [WIDTH-1:0] a,
             output [WIDTH-1:0] y,
             output             cout);
 
  assign  {cout, y} = a + 1'b1;
endmodule

module and_2 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a, b,
              output [WIDTH-1:0] y);

  assign  y = a & b;
endmodule

module zerodetect #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a,
              output             y);
 
  assign  y = ~|a;
endmodule

module xor2 #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a, b,
              output [WIDTH-1:0] y);

  assign  y = a ^ b;
endmodule
 
 module adderc #(parameter WIDTH = 32)
             (input  [WIDTH-1:0] a, b,
              input              cin,
              output [WIDTH-1:0] y,
              output             cout);
 
  assign  {cout, y} = a + b + cin;
endmodule
	  
