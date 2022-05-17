`include "wallace.v"

module Splitting(A,B,s1,s2,e1,e2,m1,m2,s3);    //  Function to initialize values
	input   [63:0]A,B;
	output  s1,s2,s3;
	output  [10:0] e1,e2;
	output  [51:0] m1,m2;
	assign e1 = A[62:52];
	assign e2 = B[62:52];
	assign m1 = A[51:0];
	assign m2 = B[51:0];
	assign s1 = A[63];
	assign s2 = B[63];
	assign s3 = s1^s2;	
endmodule

module Multiply_Mantissa(M1,M2,res);
	input [52:0]M1,M2;
	output [105:0]res;
	wallace_multiplier_53bit F1 (M1,M2,res);
endmodule

module Exponent(e1,e2,te3);
	input [10:0]e1,e2;
	output [10:0]te3;
	wire [11:0]temp1;
	wire [10:0]temp2;
	
	assign temp1 = e1 + 11'b10000000001; // 2's complement of -1023 is 10000000001
	assign temp2 = temp1;
	assign te3 = e2 + temp2;

endmodule

module Normalize(res,te3,s3,e3,m3,res2);
	input [105:0]res;
	input [10:0]te3;
	input s3;
	output [51:0]m3;
	output [10:0]e3;
	output [63:0]res2,Product;
	
	assign m3[51:0] = (res[105] == 1)? res[104:53]:res[103:52];
	assign e3 = (res[105] == 1)? te3+1:te3;
	
	assign res2[63]=s3;
	assign res2[62:52]=e3;
	assign res2[51:0]=m3;
endmodule

module BoundaryCheck(A,B,res2,e1,e2,s3,Product);
	input [63:0]A,B;
	input [63:0]res2;
	input [10:0]e1,e2;
	input s3;
	output [63:0]Product;
	wire [11:0]temp4;
	
	//assign temp4 = e1+e2;
	//assign Product[62:0] = (temp4[11])? 63'b111111111111111111111111111111111111111111111111111111111111111:(((A[62:0]==63'b111111111110000000000000000000000000000000000000000000000000000) || (B[62:0]==63'b111111111110000000000000000000000000000000000000000000000000000))? 64'b111111111110000000000000000000000000000000000000000000000000000: (((A==63'b0) || (B==63'b0))?63'b0:res2));
	assign Product[62:0] = (A==63'b0 || B==63'b0)?63'b0:((A==63'b1111_1111_1110_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000 || B==63'b1111_1111_1110_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000)?63'b1111_1111_1110_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_0000_000:res2[62:0]); 
	assign Product[63] = s3;

endmodule

module DPFPM(A,B,Product);

	input [63:0]A,B;
	output [63:0]Product;
	
	wire s1,s2;
	wire [10:0]e1,e2;
	wire [51:0]m1,m2;

	wire s3;
	wire [105:0]res;
	wire [51:0]m3;
	wire [10:0]te3,e3;
	wire [63:0]res2;
	
	Splitting S1 (A,B,s1,s2,e1,e2,m1,m2,s3);
	Multiply_Mantissa MM1 ({1'b1,m1},{1'b1,m2},res);
	Exponent E1 (e1,e2,te3);
	Normalize N1 (res,te3,s3,e3,m3,res2);
	BoundaryCheck BC1 (A,B,res2,e1,e2,s3,Product);
	
endmodule