module bitwise_AND(R,A,B);
	input [63:0] A,B;
    output [63:0] R;
	and and1[63:0](R,A,B);
endmodule

module bitwise_XOR(R,A,B);
	input [63:0] A,B;
    output [63:0] R;
	xor xor1[63:0](R,A,B);
endmodule

module bitwise_NAND(R,A,B);
	input [63:0] A,B;
    output [63:0] R;
	nand nand1[63:0](R,A,B);
endmodule

module bitwise_OR(R,A,B);
	input [63:0] A,B;
    output [63:0] R;
	or or1[63:0](R,A,B);
endmodule

module bitwise_NOT(R,A);
	input [63:0] A;
    output [63:0] R;
	not not1[63:0](R,A);
endmodule

module bitwise_NOR(R,A,B);
	input [63:0] A,B;
    output [63:0] R;
	nor nor1[63:0](R,A,B);
endmodule

module two_complement(R,A);
	input [63:0] A;
    output [63:0] R;
	assign R = ~(A)+64'h0000_0000_0000_0001; 
endmodule

module bitwise_XNOR(R,A,B);
	input [63:0] A,B;
    output [63:0] R;
	xnor xn1[63:0](R,A,B);
endmodule

module ALU (A,B,select,Result);

	input [63:0] A,B;
	input [2:0] select;
    output [63:0] Result;	
	wire [63:0] res1,res2,res3,res4,res5,res6,res7,res8;
	
	bitwise_AND  g1  (res1,A,B);
	bitwise_XOR  g2  (res2,A,B);
	bitwise_NAND g3  (res3,A,B);
	bitwise_OR   g4  (res4,A,B);
	bitwise_NOT  g5  (res5,A);
	bitwise_NOR  g6  (res6,A,B);
	two_complement g7(res7,A);
	bitwise_XNOR g8  (res8,A,B);
	
	assign Result = (select == 3'b000 ? res1 : select == 3'b001 ? res2 :  select == 3'b010 ? res3 : select == 3'b011 ? res4 : select == 3'b100 ? res5 : select == 3'b101 ? res6 
	: select == 3'b110 ? res7 : select == 3'b111 ? res8 : 64'h0000_0000_0000_0000);
	
endmodule

module ALU_tb();
	
    reg [63:0] A,B;
	reg [2:0] Select;
    wire [63:0] Result;
	ALU A1 (A,B,Select,Result);
	initial begin
        A = 64'h000000000000000C; B = 64'h0000000000000009;
		Select = 3'b000;
		#10
		 
		A = 64'h000000000000000C; B = 64'h0000000000000009;
		Select = 3'b001;
		#10
		
		 
		A = 64'h000000000000000C; B = 64'h0000000000000009;
		Select = 3'b010;
		#10
		
		 
		A = 64'h000000000000000C; B = 64'h0000000000000009;
		Select = 3'b011;
		#10
		
		 
		A = 64'h000000000000000C; B = 64'h0000000000000009;
		Select = 3'b100;
		#10
		
		 
		A = 64'h000000000000000C; B = 64'h0000000000000009;
		Select = 3'b101;
		#10
		
		 
		A = 64'h000000000000000C; B = 64'h0000000000000009;
		Select = 3'b110;
		#10
		
		 
		A = 64'h000000000000000C; B = 64'h0000000000000009;
		Select = 3'b111;
		#10
		
		$finish;
    end

	initial begin
        $monitor("\nA = %b\nB = %b \nSelect = %b \nResult = %b\n",A,B,Select,Result);
    end
	
endmodule