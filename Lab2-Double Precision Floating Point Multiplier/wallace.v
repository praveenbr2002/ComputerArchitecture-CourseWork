`include "RCA106.v"

module threeleveladder(x,y,z,s,c);
	input [105:0]x,y,z;
	output [105:0]s,c;
	
	assign s = x^y^z;
	assign c[0] = 1'b0;
	assign c[105:1] = (x[105:0]&y[105:0]) | (y[105:0]&z[105:0]) | (z[105:0]&x[105:0]);
endmodule

module partialproduct(a,b,p);
	input [52:0]a;
	input [52:0]b;
	output reg [52:0][105:0]p;
	integer i;
	always @(a or b)
	begin
		for(i=0; i<53; i=i+1)
		begin
			if(b[i] === 1)
				p[i] <= (a << i);
			else
				p[i] = 106'b0;
		end
	end
endmodule

module wallace_multiplier_53bit(a,b,product);

	input [52:0] a;
	input [52:0] b;
	output [105:0] product;

	wire [52:0][105:0]pps;		//partial products
	partialproduct PP1(a,b,pps);


	wire [105:0] s11,s12,s13,s14,s15,s16,s17,s18,s19,s110,c11,c12,c13,c14,c15,c16,c17,c18,c19,c110;
	wire [105:0] s111,s112,s113,s114,s115,s116,s117,c111,c112,c113,c114,c115,c116,c117;

	threeleveladder add11  (pps[0][105:0],pps[1][105:0],pps[2][105:0],s11[105:0],c11[105:0]);
	threeleveladder add12  (pps[3][105:0],pps[4][105:0],pps[5][105:0],s12[105:0],c12[105:0]);
	threeleveladder add13  (pps[6][105:0],pps[7][105:0],pps[8][105:0],s13[105:0],c13[105:0]);
	threeleveladder add14  (pps[9][105:0],pps[10][105:0],pps[11][105:0],s14[105:0],c14[105:0]);
	threeleveladder add15  (pps[12][105:0],pps[13][105:0],pps[14][105:0],s15[105:0],c15[105:0]);
	threeleveladder add16  (pps[15][105:0],pps[16][105:0],pps[17][105:0],s16[105:0],c16[105:0]);
	threeleveladder add17  (pps[18][105:0],pps[19][105:0],pps[20][105:0],s17[105:0],c17[105:0]);
	threeleveladder add18  (pps[21][105:0],pps[22][105:0],pps[23][105:0],s18[105:0],c18[105:0]);
	threeleveladder add19  (pps[24][105:0],pps[25][105:0],pps[26][105:0],s19[105:0],c19[105:0]);
	threeleveladder add110 (pps[27][105:0],pps[28][105:0],pps[29][105:0],s110[105:0],c110[105:0]);
	
	threeleveladder add111 (pps[30][105:0],pps[31][105:0],pps[32][105:0],s111[105:0],c111[105:0]);
	threeleveladder add112 (pps[33][105:0],pps[34][105:0],pps[35][105:0],s112[105:0],c112[105:0]);
	threeleveladder add113 (pps[36][105:0],pps[37][105:0],pps[38][105:0],s113[105:0],c113[105:0]);
	threeleveladder add114 (pps[39][105:0],pps[40][105:0],pps[41][105:0],s114[105:0],c114[105:0]);
	threeleveladder add115 (pps[42][105:0],pps[43][105:0],pps[44][105:0],s115[105:0],c115[105:0]);
	threeleveladder add116 (pps[45][105:0],pps[46][105:0],pps[47][105:0],s116[105:0],c116[105:0]);
	threeleveladder add117 (pps[48][105:0],pps[49][105:0],pps[50][105:0],s117[105:0],c117[105:0]);

	wire [105:0] s21,s22,s23,s24,s25,s26,s27,c21,c22,c23,c24,c25,c26,c27;
	wire [105:0] s28,s29,s210,s211,s212,c28,c29,c210,c211,c212;

	threeleveladder add21  (s11[105:0],c11[105:0],s12[105:0],s21[105:0],c21[105:0]);
	threeleveladder add22  (c12[105:0],s13[105:0],c13[105:0],s22[105:0],c22[105:0]);
	threeleveladder add23  (s14[105:0],c14[105:0],s15[105:0],s23[105:0],c23[105:0]);
	threeleveladder add24  (c15[105:0],s16[105:0],c16[105:0],s24[105:0],c24[105:0]);
	threeleveladder add25  (s17[105:0],c17[105:0],s18[105:0],s25[105:0],c25[105:0]);
	threeleveladder add26  (c18[105:0],s19[105:0],c19[105:0],s26[105:0],c26[105:0]);
	threeleveladder add27  (s110[105:0],c110[105:0],s111[105:0],s27[105:0],c27[105:0]);
	
	threeleveladder add28  (c111[105:0],s112[105:0],c112[105:0],s28[105:0],c28[105:0]);
	threeleveladder add29  (s113[105:0],c113[105:0],s114[105:0],s29[105:0],c29[105:0]);
	threeleveladder add210 (c114[105:0],s115[105:0],c115[105:0],s210[105:0],c210[105:0]);
	threeleveladder add211 (s116[105:0],c116[105:0],s117[105:0],s211[105:0],c211[105:0]);
	threeleveladder add212 (c117[105:0],pps[51][105:0],pps[52][105:0],s212[105:0],c212[105:0]);
	
	wire [105:0] s31,s32,s33,s34,c31,c32,c33,c34;
	wire [105:0] s35,s36,s37,s38,c35,c36,c37,c38;

	threeleveladder add31 (s21[105:0],c21[105:0],s22[105:0],s31[105:0],c31[105:0]);
	threeleveladder add32 (c22[105:0],s23[105:0],c23[105:0],s32[105:0],c32[105:0]);
	threeleveladder add33 (s24[105:0],c24[105:0],s25[105:0],s33[105:0],c33[105:0]);
	threeleveladder add34 (c25[105:0],s26[105:0],c26[105:0],s34[105:0],c34[105:0]);
	
	threeleveladder add35 (s27[105:0],c27[105:0],s28[105:0],s35[105:0],c35[105:0]);
	threeleveladder add36 (c28[105:0],s29[105:0],c29[105:0],s36[105:0],c36[105:0]);
	threeleveladder add37 (s210[105:0],c210[105:0],s211[105:0],s37[105:0],c37[105:0]);
	threeleveladder add38 (c211[105:0],s212[105:0],c212[105:0],s38[105:0],c38[105:0]);

	wire [105:0] s41,s42,s43,c41,c42,c43;
	wire [105:0] s44,s45,c44,c45;

	threeleveladder add41 (s31[105:0],c31[105:0],s32[105:0],s41[105:0],c41[105:0]);
	threeleveladder add42 (c32[105:0],s33[105:0],c33[105:0],s42[105:0],c42[105:0]);
	threeleveladder add43 (s34[105:0],c34[105:0],s35[105:0],s43[105:0],c43[105:0]);

	threeleveladder add45 (c35[105:0],s36[105:0],c36[105:0],s44[105:0],c44[105:0]);
	threeleveladder add46 (s37[105:0],c37[105:0],s38[105:0],s45[105:0],c45[105:0]);

	wire [105:0] s51,s52,c51,c52;
	wire [105:0] s53,c53;

	threeleveladder add51 (s41[105:0],c41[105:0],s42[105:0],s51[105:0],c51[105:0]);
	threeleveladder add52 (c42[105:0],s43[105:0],c43[105:0],s52[105:0],c52[105:0]);
	
	threeleveladder add53 (s44[105:0],c44[105:0],s45[105:0],s53[105:0],c53[105:0]);

	wire [105:0] s61,c61;
	wire [105:0] s62,c62;

	threeleveladder add61 (s51[105:0],c51[105:0],s52[105:0],s61[105:0],c61[105:0]);
	
	threeleveladder add62 (c52[105:0],s53[105:0],c53[105:0],s62[105:0],c62[105:0]);

	wire [105:0] s71,c71;
	wire [105:0] s72,c72;

	threeleveladder add71 (s61[105:0],c61[105:0],s62[105:0],s71[105:0],c71[105:0]);
	threeleveladder add72 (c62[105:0],c45[105:0],c38[105:0],s72[105:0],c72[105:0]);

	wire [105:0] s81,c81;

	threeleveladder add81 (s71[105:0],c71[105:0],s72[105:0],s81[105:0],c81[105:0]);
	
	wire [105:0] s91,c91;

	threeleveladder add91 (s81[105:0],c81[105:0],c72[105:0],s91[105:0],c91[105:0]);

	wire cout;
	RCA_106bit RCA1 (s91,c91,product,cout);

endmodule