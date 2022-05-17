module register_file(Adrs1,Adrs2,Reg1,Reg2,Adest,Rdest);
   
   input [4:0] Adrs1,Adrs2,Adest;
   input [63:0] Rdest;
   output reg [63:0] Reg1,Reg2;

   reg  [63:0] regfile [31:0];

   always @(Adrs1,Adrs2,Adest,Rdest) 
   begin
       Reg1 = regfile[Adrs1];
       Reg2 = regfile[Adrs2];
       regfile[Adest] = Rdest;
   end
   initial 
   begin
       regfile[0] = 64'b0;regfile[1] = 64'b0;regfile[2] = 64'b0;regfile[3] = 64'b0;regfile[4] = 64'b0;regfile[5] = 64'b0;regfile[6] = 64'b0;regfile[7] = 64'b0;
       regfile[8] = 64'b0;regfile[9] = 64'b0;regfile[10] = 64'b0;regfile[11] = 64'b0;regfile[12] = 64'b0;regfile[13] = 64'b0;regfile[14] = 64'b0;
       regfile[15] = 64'b0;regfile[16] = 64'b0;regfile[17] = 64'b0;regfile[18] = 64'b0;regfile[19] = 64'b0;regfile[20] = 64'b0;regfile[21] = 64'b0;
       regfile[22] = 64'b0;regfile[23] = 64'b0;regfile[24] = 64'b0;regfile[25] = 64'b0;regfile[26] = 64'b0;regfile[27] = 64'b0;regfile[28] = 64'b0;
       regfile[29] = 64'b0;regfile[30] = 64'b0;regfile[31] = 64'b0;
   end
endmodule

module tb;
    
    reg [4:0] Adrs1,Adrs2,Adest;
    reg [63:0] Rdest;
    wire [63:0] Reg1,Reg2;

    register_file r1(Adrs1,Adrs2,Reg1,Reg2,Adest,Rdest);
    initial
    begin
        #0 Adrs1 = 5'b00001;Adrs2 = 5'b00010;Adest = 5'b00011;Rdest = 64'd32;

        #10 Adrs1 = 5'b00011;Adrs2 = 5'b00111;Adest = 5'b01011;Rdest = 64'd64;

        #20 Adrs1 = 5'b01011;Adrs2 = 5'b00011;Adest = 5'b00111;Rdest = 64'd128;

        #30 Adrs1 = 5'b00111;Adrs2 = 5'b01011;Adest = 5'b10111;Rdest = 64'd256;

        #40 Adrs1 = 5'b10111;Adrs2 = 5'b00111;Adest = 5'b11100;Rdest = 64'd512;
    end
    initial begin
        $monitor("\nAdrs1 = %b Adrs2 = %b Adest = %b Rdest = %d Reg1 = %d Reg2 = %d",Adrs1,Adrs2,Adest,Rdest,Reg1,Reg2);
    end


endmodule