module full_adder(a,b,cin,sum,cout); 
	input a,b,cin;
	output cout,sum;
	wire s1,s2,s3;
	xor g1(s1,a,b);
	and g2(s2,a,b);
	xor g3(sum,s1,cin);
	and g4(s3,s1,cin);
	or g5(cout,s3,s2);
endmodule

module RCA_4bit(A,B,Cin,Sum,Cout);
	input [3:0]A,B;
	input Cin;
	output [3:0]Sum;
	output Cout;
	wire [2:0]transferC;	
	full_adder FA1 (A[0],B[0],Cin,Sum[0],transferC[0]);
	full_adder FA2 (A[1],B[1],transferC[0],Sum[1],transferC[1]);
	full_adder FA3 (A[2],B[2],transferC[1],Sum[2],transferC[2]);
	full_adder FA4 (A[3],B[3],transferC[2],Sum[3],Cout);
endmodule

module RCA_16bit(A,B,Cin,Sum,Cout);
	input [15:0]A,B;
	input Cin;
	output [15:0]Sum;
	output Cout;
	wire [2:0]transferC;
	RCA_4bit RCA41 (A[3:0],B[3:0],Cin,Sum[3:0],transferC[0]);
	RCA_4bit RCA42 (A[7:4],B[7:4],transferC[0],Sum[7:4],transferC[1]);
	RCA_4bit RCA43 (A[11:8],B[11:8],transferC[1],Sum[11:8],transferC[2]);
	RCA_4bit RCA44 (A[15:12],B[15:12],transferC[2],Sum[15:12],Cout);
endmodule

module RCA_64bit(A,B,Cin,Sum,Cout);    // Function to perform addition of the mantissa bits
	input [63:0]A,B;
	input Cin;
	output [63:0]Sum;
	output Cout;
	wire [3:0]transferC;
	RCA_16bit RCA161 (A[15:0],B[15:0],Cin,Sum[15:0],transferC[0]);
	RCA_16bit RCA162 (A[31:16],B[31:16],transferC[0],Sum[31:16],transferC[1]);
	RCA_16bit RCA163 (A[47:32],B[47:32],transferC[1],Sum[47:32],transferC[2]);
	RCA_16bit RCA164 (A[63:48],B[63:48],transferC[1],Sum[63:48],Cout);	
endmodule

module RCA_106bit(A,B,Sum,Cout);
	input [105:0]A,B;
	output [105:0]Sum;
	output Cout;
	wire [5:0]transferC;
	RCA_64bit RCA641 (A[63:0],B[63:0],1'b0,Sum[63:0],transferC[0]);
	RCA_16bit RCA165 (A[79:64],B[79:64],transferC[0],Sum[79:64],transferC[1]);
	RCA_16bit RCA166 (A[95:80],B[95:80],transferC[1],Sum[95:80],transferC[2]);
	RCA_4bit RCA45 	 (A[99:96],B[99:96],transferC[2],Sum[99:96],transferC[3]);
	RCA_4bit RCA46 	 (A[103:100],B[103:100],transferC[3],Sum[103:100],transferC[4]);
	full_adder FA5	 (A[104],B[104],transferC[4],Sum[104],transferC[5]);
	full_adder FA6	 (A[105],B[105],transferC[5],Sum[105],Cout);
endmodule