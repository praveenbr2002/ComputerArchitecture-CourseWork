module FloatPointAdder_64b(A,B,sum);
	input [63:0]A,B;
	output [63:0]sum;
	wire [10:0] Ae,Be;
	wire [51:0] Am,Bm;
	wire As,Bs;
	wire [51:0] m3;
	wire [10:0] e3;
	wire s3;
	wire [52:0] M2;
	wire [53:0] res;
	wire[63:0] temp;
	//Initialize
	assign Ae = A[62:52] == B[62:52] ? (A[51:0] > B[51:0] ? A[62:52] : B[62:52]) : (A[62:52] > B[62:52] ? A[62:52] : B[62:52]);	
	assign Be = Ae == A[62:52] ? B[62:52] : A[62:52]; 	
	assign Am = Ae == A[62:52] ? A[51:0] : B[51:0];	
	assign As = Ae == A[62:52] ? A[63] : B[63];
	assign Bs = Ae == A[62:52] ? B[63] : A[63];
	assign Bm = Ae == A[62:52] ? B[51:0] : A[51:0];	
	//store sign bits , exponent bits and mantissa bits for processing during normalization
	assign s3 = As;
	assign m3 = Am;
	assign e3 = Ae;
	ShiftAndDenormalize S(Ae,Be,Am,Bm,M2);
	AddMantissa amantissa(Am,M2,As,Bs,res); //used to add both the mantissa after denormalisation
	Normalise Nor(As,Bs,s3,m3,e3,res,temp);
	assign sum = temp;
endmodule


//align the mantissa by shifting the decimal point by left for operand with lower exponent value
module ShiftAndDenormalize(Ae,Be,Am,Bm,res);
	input [10:0] Ae,Be;
	input [51:0] Am,Bm;
	output reg [52:0] res;
	integer D;
	reg [52:0] M;
	//Find D = Ae-Be and denormalize X2 for adding Am and Bm
	always @(Ae,Be,Am,Bm)
	begin
		M = {1'b1,Bm}; //M is used for considering the implicit bit before decimal point for right shift
		D = Ae - Be;   //find difference between Ae and Be 
		M = M >> D;    //right shift by D bits
		res = M;  //truncating and getting the denormalised mantissa value to get same exponents */
	end
endmodule

//Addition of 2 mantissa
module Addition(AM,M2,res);
	input  [52:0] AM,M2;
	output [53:0] res;
	FullAdder_mantissa Full(AM,M2,1'b0,res);
endmodule

//complement
module Complement(res,A);
	input [53:0]res;
	output [53:0]A;
	wire [53:0]res3;
	assign res3 = ~res[52:0] + 1'b1;
	wire [53:0] res4 = {1'b0 , res3[52:0]};
	//2's complement of mantissa part of res
	//res[53] -- carry bit -> if 0 --> 2;s complement (No end around carry) , else proceed
	wire [53:0] res1 = {1'b0,res4}; // 2's complement
	wire [53:0] res2 = {1'b0,res[52:0]}; //end around carry present -- neglect it
	assign A = (res[53] == 1'b0) ? res1 : res2;
endmodule	

//subtraction of 2 mantissa
module Subtraction(AM,M2,As,Bs,result);
	input [52:0] AM,M2;
	input As,Bs;
	output [53:0] result;
	wire [52:0]p1,p2;
	wire [52:0]Am,Bm;
	wire [53:0]res;
	//finding 2's complement
	assign Am = ~AM + 1'b1; //used if sign bit is negative
	assign Bm = ~M2 + 1'b1;
	assign p1 = (As == 1'b1) ? Am : AM;
	assign p2 = (Bs == 1'b1) ? Bm : M2;
	Addition ADD1(p1,p2,res);
	Complement C(res,result);
endmodule

//Add Mantissa after Denormlization to obtain same exponent 
module AddMantissa(Am,Bm,As,Bs,sum);
	input [51:0] Am;
	input [52:0] Bm;
	input As,Bs;
	output [53:0] sum;
	wire [53:0] res1,res2;
	//including the implicit bit before the mantissa for performing the addition or subtraction
	wire [52:0] AM = {1'b1,Am}; 
	//if(As != 1 and Bs != 1) or (As == 1 and Bs == 1) -- perform addition else -- subtraction 
	Addition    ADD(AM,Bm,res1);
	Subtraction SUB (AM,Bm,As,Bs,res2);
	assign sum = ((As != 1'b1 && Bs != 1'b1) || (As == 1'b1 && Bs == 1'b1)) ? res1:res2;
endmodule

//Normalize added numbers
module Normalize_pos(s,e,res,sum);
	input s;
	input [10:0]e;
	input [53:0]res;
	output [63:0]sum;
	wire [10:0] Ae;
	wire [53:0] res1 = res >> 1; //right shift by one bit
	wire [53:0] res2 = res >> 2; //right shift by two bits 
	wire [53:0] Am    = (res1[52] == 1'b1) ? res1:res2;
	wire [53:0] m     = (res[52] == 1'b1) ? res:Am;
	assign Ae = (m == res) ? e:((m == res1) ? e+1 : e+2);
	assign sum[63] = s;
	assign sum[62:52] = Ae;
	wire [51:0] M = m[51:0];
	assign sum[51:0] = M;
endmodule

//normalize subtracted result
module Normalize_neg(s,e,res,sum);
	input s;
	input [10:0] e;
	input [53:0] res;
	output reg [63:0]sum;
	reg [51:0] res1;
	reg [10:0] Ae;
	always @(*)
	begin 
		Ae = e;
		res1 = res[51:0];
		if(res1 == 0)
		begin 
			sum[51:0] = 0;
			sum[62:52] = 0;
			sum[63]   = 0;
		end
		else
		begin
			while(res1[51] != 1'b1)
			begin 
				res1 = res1 << 1; //left shift
				Ae   = Ae-1;
			end
			sum[63] = s;
			sum[51:0] = res1;
			sum[62:52] = Ae;
		end
	end
endmodule

//used to normalize the mantissa and adjust the exponent to obtain the final result
module Normalise(sign1,sign2,s,m,e,res,sum);
	input  [10:0]e;
	input  sign2,sign1,s;
	input  [51:0]m;
	input  [53:0]res;
	output [63:0]sum;
	wire [63:0]As,Bs;
	reg [53:0] temp;
	reg [10:0] E;
	Normalize_pos P(s,e,res,As); //To normalise positive numbers
	Normalize_neg N(s,e,res,Bs); //To normalize negative number
	assign sum = ((sign1 == 1'b0 && sign2 == 1'b0) || (sign1 == 1'b1 && sign2 == 1'b1)) ? As:Bs;
endmodule

// 1bit full adder
module FullAdder_1b(A,B,cin,sum,ca);
	input A,B,cin;
	output sum,ca;
	assign sum = A ^ B ^ cin;
	assign ca  = (((A ^ B)&cin) | (A & B));
endmodule

// 4 bit full adder
module FullAdder_4b(A,B,cin,sum,cout);
	input [3:0] A,B;
	input cin;
	output [3:0]sum;
	output cout;
	
	wire c1,c2,C3;
	FullAdder_1b FA1(A[0],B[0],cin,sum[0],c1);
	FullAdder_1b FA2(A[1],B[1],c1,sum[1],c2);
	FullAdder_1b FA3(A[2],B[2],c2,sum[2],c3);
	FullAdder_1b FA4(A[3],B[3],c3,sum[3],cout);
endmodule

// 8 bit full adder
module FullAdder_8b(A,B,cin,sum,cout);
	input [7:0]A,B;
	input cin;
	output [7:0]sum;
	output cout;
	
	wire c1;
	FullAdder_4b FA5(A[3:0],B[3:0],cin,sum[3:0],c1);
	FullAdder_4b FA6(A[7:4],B[7:4],c1,sum[7:4],cout);
endmodule

//16 bit full adder
module FullAdder_16b(A,B,cin,sum,cout);
	input [15:0]A,B;
	input cin;
	output [15:0]sum;
	output cout;
	
	wire c1;
	FullAdder_8b FA7(A[7:0],B[7:0],cin,sum[7:0],c1);
	FullAdder_8b FA8(A[15:8],B[15:8],c1,sum[15:8],cout);
endmodule

//52 bit adder for Mantissa
module FullAdder_mantissa(A,B,cin,sum);
	input [52:0]A,B;
	input cin;
	output [53:0] sum;
	
	wire c1,c2,c3,c4;
	FullAdder_16b FA9 (A[15:0],B[15:0],cin,sum[15:0],c1);
	FullAdder_16b FA10(A[31:16],B[31:16],c1,sum[31:16],c2);
	FullAdder_16b FA11(A[47:32],B[47:32],c2,sum[47:32],c3);
	FullAdder_4b  FA12(A[51:48],B[51:48],c3,sum[51:48],c4);
	FullAdder_1b  F13(A[52],B[52],c4,sum[52],sum[53]);
	
endmodule


//TEST BENCH
module FPA_64B2P_tb();
	reg [63:0] A,B;
	wire [63:0] R;
	FloatPointAdder_64b S(A,B,R);
	initial 
	begin
		//A = 64'b1110_1111_1001_0000_0000_1010_1110_1010_1110_1111_0000_0000_0000_0000_0000_0001; B = 64'b0110_1111_1011_0000_0000_1010_1110_1010_1110_1111_0000_0000_0000_0000_0000_0001;
		//A = 64'b1110_1111_1001_0000_0000_1010_1110_1010_1110_1111_0000_0000_0000_0000_0000_0001; B = 64'b1110_1101_1001_0000_0000_1010_1110_1010_1110_1111_0000_0000_0000_0000_0000_0011;
		A = 64'b1110_1111_1001_0000_0000_1010_1110_1010_1110_1111_0000_0000_0000_0000_0000_0001; B = 64'b0110_1111_1001_0000_0000_1010_1110_1010_1110_1111_0000_0000_0000_0000_0000_0001;
		//A = 64'h0000_0000_0000_0000 ; B = 64'h0000_0000_0000_0000;
	end
	initial
		$monitor("%b %b %b\n                            +                          \n%b %b %b\n------------------------------------------------------------------\n%b %b %b",A[63],A[62:52],A[51:0],B[63],B[62:52],B[51:0],R[63],R[62:52],R[51:0]);
endmodule