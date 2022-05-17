`include "RCA128.v"

module threeleveladder(x,y,z,s,c);
	input [127:0]x,y,z;
	output [127:0]s,c;
	
	assign s = x^y^z;
	assign c[0] = 1'b0;
	assign c[127:1] = (x[127:0]&y[127:0]) | (y[127:0]&z[127:0]) | (z[127:0]&x[127:0]);

endmodule

module partialproduct(a,b,p);
	input [63:0]a;
	input [63:0]b;
	output reg [63:0][127:0]p;
	integer i;
	always @(a or b)
	begin
		for(i=0; i<64; i=i+1)
		begin
			if(b[i] === 1)
				p[i] <= (a << i);
			else
				p[i] = 128'b0;
		end
	end
endmodule

module wallace_multiplier(a,b,product);

	input [63:0] a;
	input [63:0] b;
	output [127:0] product;

	wire [63:0][127:0]pps;		//partial products
	partialproduct PP1(a,b,pps);


	wire [127:0] s11,s12,s13,s14,s15,s16,s17,s18,s19,s110,c11,c12,c13,c14,c15,c16,c17,c18,c19,c110;
	wire [127:0] s111,s112,s113,s114,s115,s116,s117,s118,s119,s120,s121,c111,c112,c113,c114,c115,c116,c117,c118,c119,c120,c121;

	threeleveladder add11  (pps[0][127:0],pps[1][127:0],pps[2][127:0],s11[127:0],c11[127:0]);
	threeleveladder add12  (pps[3][127:0],pps[4][127:0],pps[5][127:0],s12[127:0],c12[127:0]);
	threeleveladder add13  (pps[6][127:0],pps[7][127:0],pps[8][127:0],s13[127:0],c13[127:0]);
	threeleveladder add14  (pps[9][127:0],pps[10][127:0],pps[11][127:0],s14[127:0],c14[127:0]);
	threeleveladder add15  (pps[12][127:0],pps[13][127:0],pps[14][127:0],s15[127:0],c15[127:0]);
	threeleveladder add16  (pps[15][127:0],pps[16][127:0],pps[17][127:0],s16[127:0],c16[127:0]);
	threeleveladder add17  (pps[18][127:0],pps[19][127:0],pps[20][127:0],s17[127:0],c17[127:0]);
	threeleveladder add18  (pps[21][127:0],pps[22][127:0],pps[23][127:0],s18[127:0],c18[127:0]);
	threeleveladder add19  (pps[24][127:0],pps[25][127:0],pps[26][127:0],s19[127:0],c19[127:0]);
	threeleveladder add110 (pps[27][127:0],pps[28][127:0],pps[29][127:0],s110[127:0],c110[127:0]);
	
	threeleveladder add111 (pps[30][127:0],pps[31][127:0],pps[32][127:0],s111[127:0],c111[127:0]);
	threeleveladder add112 (pps[33][127:0],pps[34][127:0],pps[35][127:0],s112[127:0],c112[127:0]);
	threeleveladder add113 (pps[36][127:0],pps[37][127:0],pps[38][127:0],s113[127:0],c113[127:0]);
	threeleveladder add114 (pps[39][127:0],pps[40][127:0],pps[41][127:0],s114[127:0],c114[127:0]);
	threeleveladder add115 (pps[42][127:0],pps[43][127:0],pps[44][127:0],s115[127:0],c115[127:0]);
	threeleveladder add116 (pps[45][127:0],pps[46][127:0],pps[47][127:0],s116[127:0],c116[127:0]);
	threeleveladder add117 (pps[48][127:0],pps[49][127:0],pps[50][127:0],s117[127:0],c117[127:0]);
	threeleveladder add118 (pps[51][127:0],pps[52][127:0],pps[53][127:0],s118[127:0],c118[127:0]);
	threeleveladder add119 (pps[54][127:0],pps[55][127:0],pps[56][127:0],s119[127:0],c119[127:0]);
	threeleveladder add120 (pps[57][127:0],pps[58][127:0],pps[59][127:0],s120[127:0],c120[127:0]);
	threeleveladder add121 (pps[60][127:0],pps[61][127:0],pps[62][127:0],s121[127:0],c121[127:0]);

	wire [127:0] s21,s22,s23,s24,s25,s26,s27,c21,c22,c23,c24,c25,c26,c27;
	wire [127:0] s28,s29,s210,s211,s212,s213,s214,c28,c29,c210,c211,c212,c213,c214;

	threeleveladder add21  (s11[127:0],c11[127:0],s12[127:0],s21[127:0],c21[127:0]);
	threeleveladder add22  (c12[127:0],s13[127:0],c13[127:0],s22[127:0],c22[127:0]);
	threeleveladder add23  (s14[127:0],c14[127:0],s15[127:0],s23[127:0],c23[127:0]);
	threeleveladder add24  (c15[127:0],s16[127:0],c16[127:0],s24[127:0],c24[127:0]);
	threeleveladder add25  (s17[127:0],c17[127:0],s18[127:0],s25[127:0],c25[127:0]);
	threeleveladder add26  (c18[127:0],s19[127:0],c19[127:0],s26[127:0],c26[127:0]);
	threeleveladder add27  (s110[127:0],c110[127:0],s111[127:0],s27[127:0],c27[127:0]);
	
	threeleveladder add28  (c111[127:0],s112[127:0],c112[127:0],s28[127:0],c28[127:0]);
	threeleveladder add29  (s113[127:0],c113[127:0],s114[127:0],s29[127:0],c29[127:0]);
	threeleveladder add210 (c114[127:0],s115[127:0],c115[127:0],s210[127:0],c210[127:0]);
	threeleveladder add211 (s116[127:0],c116[127:0],s117[127:0],s211[127:0],c211[127:0]);
	threeleveladder add212 (c117[127:0],s118[127:0],c118[127:0],s212[127:0],c212[127:0]);
	threeleveladder add213 (s119[127:0],c119[127:0],s120[127:0],s213[127:0],c213[127:0]);
	threeleveladder add214 (c120[127:0],s121[127:0],c121[127:0],s214[127:0],c214[127:0]);
	
	wire [127:0] s31,s32,s33,s34,c31,c32,c33,c34;
	wire [127:0] s35,s36,s37,s38,s39,c35,c36,c37,c38,c39;

	threeleveladder add31 (s21[127:0],c21[127:0],s22[127:0],s31[127:0],c31[127:0]);
	threeleveladder add32 (c22[127:0],s23[127:0],c23[127:0],s32[127:0],c32[127:0]);
	threeleveladder add33 (s24[127:0],c24[127:0],s25[127:0],s33[127:0],c33[127:0]);
	threeleveladder add34 (c25[127:0],s26[127:0],c26[127:0],s34[127:0],c34[127:0]);
	
	threeleveladder add35 (s27[127:0],c27[127:0],s28[127:0],s35[127:0],c35[127:0]);
	threeleveladder add36 (c28[127:0],s29[127:0],c29[127:0],s36[127:0],c36[127:0]);
	threeleveladder add37 (s210[127:0],c210[127:0],s211[127:0],s37[127:0],c37[127:0]);
	threeleveladder add38 (c211[127:0],s212[127:0],c212[127:0],s38[127:0],c38[127:0]);
	threeleveladder add39 (s213[127:0],c213[127:0],s214[127:0],s39[127:0],c39[127:0]);

	wire [127:0] s41,s42,s43,c41,c42,c43;
	wire [127:0] s44,s45,s46,c44,c45,c46;

	threeleveladder add41 (s31[127:0],c31[127:0],s32[127:0],s41[127:0],c41[127:0]);
	threeleveladder add42 (c32[127:0],s33[127:0],c33[127:0],s42[127:0],c42[127:0]);
	threeleveladder add43 (s34[127:0],c34[127:0],s35[127:0],s43[127:0],c43[127:0]);

	threeleveladder add45 (c35[127:0],s36[127:0],c36[127:0],s44[127:0],c44[127:0]);
	threeleveladder add46 (s37[127:0],c37[127:0],s38[127:0],s45[127:0],c45[127:0]);
	threeleveladder add44 (c38[127:0],s39[127:0],c39[127:0],s46[127:0],c46[127:0]);

	wire [127:0] s51,s52,c51,c52;
	wire [127:0] s53,s54,c53,c54;

	threeleveladder add51 (s41[127:0],c41[127:0],s42[127:0],s51[127:0],c51[127:0]);
	threeleveladder add52 (c42[127:0],s43[127:0],c43[127:0],s52[127:0],c52[127:0]);
	
	threeleveladder add53 (s44[127:0],c44[127:0],s45[127:0],s53[127:0],c53[127:0]);
	threeleveladder add54 (c45[127:0],s46[127:0],c46[127:0],s54[127:0],c54[127:0]);

	wire [127:0] s61,c61;
	wire [127:0] s62,s63,c62,c63;

	threeleveladder add61 (s51[127:0],c51[127:0],s52[127:0],s61[127:0],c61[127:0]);
	
	threeleveladder add62 (c52[127:0],s53[127:0],c53[127:0],s62[127:0],c62[127:0]);
	threeleveladder add63 (s54[127:0],c54[127:0],c214[127:0],s63[127:0],c63[127:0]);

	wire [127:0] s71,c71;
	wire [127:0] s72,c72;

	threeleveladder add71 (s61[127:0],c61[127:0],s62[127:0],s71[127:0],c71[127:0]);
	threeleveladder add72 (c62[127:0],s63[127:0],c63[127:0],s72[127:0],c72[127:0]);

	wire [127:0] s81,c81;

	threeleveladder add81 (s71[127:0],c71[127:0],s72[127:0],s81[127:0],c81[127:0]);
	
	wire [127:0] s91,c91;

	threeleveladder add91 (s81[127:0],c81[127:0],c72[127:0],s91[127:0],c91[127:0]);
	
	wire [127:0] s101,c101;

	threeleveladder add101(s91[127:0],c91[127:0],pps[63][127:0],s101[127:0],c101[127:0]);

	wire cout;
	RCA_128bit RCA1 (s101,c101,product,cout);

endmodule