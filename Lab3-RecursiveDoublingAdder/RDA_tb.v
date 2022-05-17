// 64 bit Recursive Doubling Adder Design Test bench


module wallace_tb();

reg [63:0] A,B;
reg [1:0]Cin;           // Cin = 00 for kill and Cin=11 for generate
wire [64:0] Sum;

Recursive_Doubling_Adder RDA1 (A[63:0],B[63:0],Cin,Sum[64:0]); 

initial
begin
    A=12345678; B=98765432; Cin=2'b11;
	#10
	
	A=98765432; B=12345678; Cin=2'b00;
	#10
	
	$finish;
end

initial
begin
  $monitor("A  : %b\nB  : %b\nCin: %b\nOp : %b\n%d + %d + %d = %d\n\n", A,B,Cin[0],Sum,A,B,Cin[0],Sum);
end

endmodule