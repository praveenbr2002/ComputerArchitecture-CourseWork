module wallace_tb();

reg [63:0] A,B;
wire [127:0] Product;

wallace_multiplier WM1 (A[63:0],B[63:0],Product[127:0]);

initial 
begin
      #0  A = 64'b0111011001011011101001000111001000000100011000011100001001101011;B = 64'b1001011111100010010011000110101001110001111100001100111100000111;
      #10 A = 64'b0111111101111111011111110111111101111111011111110111111101111111;B = 64'b0111111101111111011111110111111101111111011111110111111101111111;
      #20 A = 64'b0001011101101111011001001101110001001001111101101011110100101110;B = 64'b1010100100010101100100101100001011101011000111011010010010110100;	    
      #30 A = 64'b1010010110111101001001001100100110011111101111110100001010101000;B = 64'b1110000100011110000111010001001110001000010101001100101110110000;
end

initial
begin
  $monitor("A = %b \nB = %b \nProduct = %b \n\n (i.e %d * %d = %d) \n\n\n", A[63:0],B[63:0],Product[127:0],A[63:0],B[63:0],Product[127:0]);
end


endmodule