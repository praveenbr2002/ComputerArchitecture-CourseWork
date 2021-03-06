// 64 bit Recursive Doubling Adder Design 

module Carry_KGP(A,B,C);   //  KGP carry value generator   00 - kill;  01,10 - propagate; 11 - generate
	input [1:0]A,B;
	output [1:0]C;
	assign C[1] = A[1]&A[0] | A[0]&B[1] | A[1]&B[1];
	assign C[0] = A[1]&A[0] | A[0]&B[0] | A[1]&B[0];
endmodule

module Recursive_Doubling_Adder(A,B,Cin,Sum);

	input [63:0] A,B;
	input [1:0] Cin;
	output [64:0] Sum;
	
	wire [1:0] X[63:0];
	wire [64:0] carry;
	
	wire [1:0] kgp_1[63:0];   // Total 6 stages  (64 = 2^6)
	wire [1:0] kgp_2[63:0];
	wire [1:0] kgp_3[63:0];
	wire [1:0] kgp_4[63:0];
	wire [1:0] kgp_5[63:0];
	wire [1:0] kgp_6[63:0];

	assign X[0]={A[0],B[0]};   // Concatenating X={A,B}
	assign X[1]={A[1],B[1]};
	assign X[2]={A[2],B[2]};
	assign X[3]={A[3],B[3]};
	assign X[4]={A[4],B[4]};
	assign X[5]={A[5],B[5]};
	assign X[6]={A[6],B[6]};
	assign X[7]={A[7],B[7]};
	assign X[8]={A[8],B[8]};
	assign X[9]={A[9],B[9]};
	assign X[10]={A[10],B[10]};
	assign X[11]={A[11],B[11]};
	assign X[12]={A[12],B[12]};
	assign X[13]={A[13],B[13]};
	assign X[14]={A[14],B[14]};
	assign X[15]={A[15],B[15]};
	assign X[16]={A[16],B[16]};
	assign X[17]={A[17],B[17]};
	assign X[18]={A[18],B[18]};
	assign X[19]={A[19],B[19]};
	assign X[20]={A[20],B[20]};
	assign X[21]={A[21],B[21]};
	assign X[22]={A[22],B[22]};
	assign X[23]={A[23],B[23]};
	assign X[24]={A[24],B[24]};
	assign X[25]={A[25],B[25]};
	assign X[26]={A[26],B[26]};
	assign X[27]={A[27],B[27]};
	assign X[28]={A[28],B[28]};
	assign X[29]={A[29],B[29]};
	assign X[30]={A[30],B[30]};
	assign X[31]={A[31],B[31]};
	assign X[32]={A[32],B[32]};
	assign X[33]={A[33],B[33]};
	assign X[34]={A[34],B[34]};
	assign X[35]={A[35],B[35]};
	assign X[36]={A[36],B[36]};
	assign X[37]={A[37],B[37]};
	assign X[38]={A[38],B[38]};
	assign X[39]={A[39],B[39]};
	assign X[40]={A[40],B[40]};
	assign X[41]={A[41],B[41]};
	assign X[42]={A[42],B[42]};
	assign X[43]={A[43],B[43]};
	assign X[44]={A[44],B[44]};
	assign X[45]={A[45],B[45]};
	assign X[46]={A[46],B[46]};
	assign X[47]={A[47],B[47]};
	assign X[48]={A[48],B[48]};
	assign X[49]={A[49],B[49]};
	assign X[50]={A[50],B[50]};
	assign X[51]={A[51],B[51]};
	assign X[52]={A[52],B[52]};
	assign X[53]={A[53],B[53]};
	assign X[54]={A[54],B[54]};
	assign X[55]={A[55],B[55]};
	assign X[56]={A[56],B[56]};
	assign X[57]={A[57],B[57]};
	assign X[58]={A[58],B[58]};
	assign X[59]={A[59],B[59]};
	assign X[60]={A[60],B[60]};
	assign X[61]={A[61],B[61]};
	assign X[62]={A[62],B[62]};
	assign X[63]={A[63],B[63]};

// Stage 1
Carry_KGP f0(X[0],Cin,kgp_1[0]);
Carry_KGP f1(X[1],X[0],kgp_1[1]);
Carry_KGP f2(X[2],X[1],kgp_1[2]);
Carry_KGP f3(X[3],X[2],kgp_1[3]);
Carry_KGP f4(X[4],X[3],kgp_1[4]);
Carry_KGP f5(X[5],X[4],kgp_1[5]);
Carry_KGP f6(X[6],X[5],kgp_1[6]);
Carry_KGP f7(X[7],X[6],kgp_1[7]);
Carry_KGP f8(X[8],X[7],kgp_1[8]);
Carry_KGP f9(X[9],X[8],kgp_1[9]);
Carry_KGP f10(X[10],X[9],kgp_1[10]);
Carry_KGP f11(X[11],X[10],kgp_1[11]);
Carry_KGP f12(X[12],X[11],kgp_1[12]);
Carry_KGP f13(X[13],X[12],kgp_1[13]);
Carry_KGP f14(X[14],X[13],kgp_1[14]);
Carry_KGP f15(X[15],X[14],kgp_1[15]);
Carry_KGP f16(X[16],X[15],kgp_1[16]);
Carry_KGP f17(X[17],X[16],kgp_1[17]);
Carry_KGP f18(X[18],X[17],kgp_1[18]);
Carry_KGP f19(X[19],X[18],kgp_1[19]);
Carry_KGP f20(X[20],X[19],kgp_1[20]);
Carry_KGP f21(X[21],X[20],kgp_1[21]);
Carry_KGP f22(X[22],X[21],kgp_1[22]);
Carry_KGP f23(X[23],X[22],kgp_1[23]);
Carry_KGP f24(X[24],X[23],kgp_1[24]);
Carry_KGP f25(X[25],X[24],kgp_1[25]);
Carry_KGP f26(X[26],X[25],kgp_1[26]);
Carry_KGP f27(X[27],X[26],kgp_1[27]);
Carry_KGP f28(X[28],X[27],kgp_1[28]);
Carry_KGP f29(X[29],X[28],kgp_1[29]);
Carry_KGP f30(X[30],X[29],kgp_1[30]);
Carry_KGP f31(X[31],X[30],kgp_1[31]);
Carry_KGP f32(X[32],X[31],kgp_1[32]);
Carry_KGP f33(X[33],X[32],kgp_1[33]);
Carry_KGP f34(X[34],X[33],kgp_1[34]);
Carry_KGP f35(X[35],X[34],kgp_1[35]);
Carry_KGP f36(X[36],X[35],kgp_1[36]);
Carry_KGP f37(X[37],X[36],kgp_1[37]);
Carry_KGP f38(X[38],X[37],kgp_1[38]);
Carry_KGP f39(X[39],X[38],kgp_1[39]);
Carry_KGP f40(X[40],X[39],kgp_1[40]);
Carry_KGP f41(X[41],X[40],kgp_1[41]);
Carry_KGP f42(X[42],X[41],kgp_1[42]);
Carry_KGP f43(X[43],X[42],kgp_1[43]);
Carry_KGP f44(X[44],X[43],kgp_1[44]);
Carry_KGP f45(X[45],X[44],kgp_1[45]);
Carry_KGP f46(X[46],X[45],kgp_1[46]);
Carry_KGP f47(X[47],X[46],kgp_1[47]);
Carry_KGP f48(X[48],X[47],kgp_1[48]);
Carry_KGP f49(X[49],X[48],kgp_1[49]);
Carry_KGP f50(X[50],X[49],kgp_1[50]);
Carry_KGP f51(X[51],X[50],kgp_1[51]);
Carry_KGP f52(X[52],X[51],kgp_1[52]);
Carry_KGP f53(X[53],X[52],kgp_1[53]);
Carry_KGP f54(X[54],X[53],kgp_1[54]);
Carry_KGP f55(X[55],X[54],kgp_1[55]);
Carry_KGP f56(X[56],X[55],kgp_1[56]);
Carry_KGP f57(X[57],X[56],kgp_1[57]);
Carry_KGP f58(X[58],X[57],kgp_1[58]);
Carry_KGP f59(X[59],X[58],kgp_1[59]);
Carry_KGP f60(X[60],X[59],kgp_1[60]);
Carry_KGP f61(X[61],X[60],kgp_1[61]);
Carry_KGP f62(X[62],X[61],kgp_1[62]);
Carry_KGP f63(X[63],X[62],kgp_1[63]);

// Stage 2
Carry_KGP f64(kgp_1[1],Cin,kgp_2[1]);
Carry_KGP f65(kgp_1[2],kgp_1[0],kgp_2[2]);
Carry_KGP f66(kgp_1[3],kgp_1[1],kgp_2[3]);
Carry_KGP f67(kgp_1[4],kgp_1[2],kgp_2[4]);
Carry_KGP f68(kgp_1[5],kgp_1[3],kgp_2[5]);
Carry_KGP f69(kgp_1[6],kgp_1[4],kgp_2[6]);
Carry_KGP f70(kgp_1[7],kgp_1[5],kgp_2[7]);
Carry_KGP f71(kgp_1[8],kgp_1[6],kgp_2[8]);
Carry_KGP f72(kgp_1[9],kgp_1[7],kgp_2[9]);
Carry_KGP f73(kgp_1[10],kgp_1[8],kgp_2[10]);
Carry_KGP f74(kgp_1[11],kgp_1[9],kgp_2[11]);
Carry_KGP f75(kgp_1[12],kgp_1[10],kgp_2[12]);
Carry_KGP f76(kgp_1[13],kgp_1[11],kgp_2[13]);
Carry_KGP f77(kgp_1[14],kgp_1[12],kgp_2[14]);
Carry_KGP f78(kgp_1[15],kgp_1[13],kgp_2[15]);
Carry_KGP f79(kgp_1[16],kgp_1[14],kgp_2[16]);
Carry_KGP f80(kgp_1[17],kgp_1[15],kgp_2[17]);
Carry_KGP f81(kgp_1[18],kgp_1[16],kgp_2[18]);
Carry_KGP f82(kgp_1[19],kgp_1[17],kgp_2[19]);
Carry_KGP f83(kgp_1[20],kgp_1[18],kgp_2[20]);
Carry_KGP f84(kgp_1[21],kgp_1[19],kgp_2[21]);
Carry_KGP f85(kgp_1[22],kgp_1[20],kgp_2[22]);
Carry_KGP f86(kgp_1[23],kgp_1[21],kgp_2[23]);
Carry_KGP f87(kgp_1[24],kgp_1[22],kgp_2[24]);
Carry_KGP f88(kgp_1[25],kgp_1[23],kgp_2[25]);
Carry_KGP f89(kgp_1[26],kgp_1[24],kgp_2[26]);
Carry_KGP f90(kgp_1[27],kgp_1[25],kgp_2[27]);
Carry_KGP f91(kgp_1[28],kgp_1[26],kgp_2[28]);
Carry_KGP f92(kgp_1[29],kgp_1[27],kgp_2[29]);
Carry_KGP f93(kgp_1[30],kgp_1[28],kgp_2[30]);
Carry_KGP f94(kgp_1[31],kgp_1[29],kgp_2[31]);
Carry_KGP f95(kgp_1[32],kgp_1[30],kgp_2[32]);
Carry_KGP f96(kgp_1[33],kgp_1[31],kgp_2[33]);
Carry_KGP f97(kgp_1[34],kgp_1[32],kgp_2[34]);
Carry_KGP f98(kgp_1[35],kgp_1[33],kgp_2[35]);
Carry_KGP f99(kgp_1[36],kgp_1[34],kgp_2[36]);
Carry_KGP f100(kgp_1[37],kgp_1[35],kgp_2[37]);
Carry_KGP f101(kgp_1[38],kgp_1[36],kgp_2[38]);
Carry_KGP f102(kgp_1[39],kgp_1[37],kgp_2[39]);
Carry_KGP f103(kgp_1[40],kgp_1[38],kgp_2[40]);
Carry_KGP f104(kgp_1[41],kgp_1[39],kgp_2[41]);
Carry_KGP f105(kgp_1[42],kgp_1[40],kgp_2[42]);
Carry_KGP f106(kgp_1[43],kgp_1[41],kgp_2[43]);
Carry_KGP f107(kgp_1[44],kgp_1[42],kgp_2[44]);
Carry_KGP f108(kgp_1[45],kgp_1[43],kgp_2[45]);
Carry_KGP f109(kgp_1[46],kgp_1[44],kgp_2[46]);
Carry_KGP f110(kgp_1[47],kgp_1[45],kgp_2[47]);
Carry_KGP f111(kgp_1[48],kgp_1[46],kgp_2[48]);
Carry_KGP f112(kgp_1[49],kgp_1[47],kgp_2[49]);
Carry_KGP f113(kgp_1[50],kgp_1[48],kgp_2[50]);
Carry_KGP f114(kgp_1[51],kgp_1[49],kgp_2[51]);
Carry_KGP f115(kgp_1[52],kgp_1[50],kgp_2[52]);
Carry_KGP f116(kgp_1[53],kgp_1[51],kgp_2[53]);
Carry_KGP f117(kgp_1[54],kgp_1[52],kgp_2[54]);
Carry_KGP f118(kgp_1[55],kgp_1[53],kgp_2[55]);
Carry_KGP f119(kgp_1[56],kgp_1[54],kgp_2[56]);
Carry_KGP f120(kgp_1[57],kgp_1[55],kgp_2[57]);
Carry_KGP f121(kgp_1[58],kgp_1[56],kgp_2[58]);
Carry_KGP f122(kgp_1[59],kgp_1[57],kgp_2[59]);
Carry_KGP f123(kgp_1[60],kgp_1[58],kgp_2[60]);
Carry_KGP f124(kgp_1[61],kgp_1[59],kgp_2[61]);
Carry_KGP f125(kgp_1[62],kgp_1[60],kgp_2[62]);
Carry_KGP f126(kgp_1[63],kgp_1[61],kgp_2[63]);

// Stage 3
Carry_KGP f127(kgp_2[3],Cin,kgp_3[3]);
Carry_KGP f128(kgp_2[4],kgp_2[0],kgp_3[4]);
Carry_KGP f129(kgp_2[5],kgp_2[1],kgp_3[5]);
Carry_KGP f130(kgp_2[6],kgp_2[2],kgp_3[6]);
Carry_KGP f131(kgp_2[7],kgp_2[3],kgp_3[7]);
Carry_KGP f132(kgp_2[8],kgp_2[4],kgp_3[8]);
Carry_KGP f133(kgp_2[9],kgp_2[5],kgp_3[9]);
Carry_KGP f134(kgp_2[10],kgp_2[6],kgp_3[10]);
Carry_KGP f135(kgp_2[11],kgp_2[7],kgp_3[11]);
Carry_KGP f136(kgp_2[12],kgp_2[8],kgp_3[12]);
Carry_KGP f137(kgp_2[13],kgp_2[9],kgp_3[13]);
Carry_KGP f138(kgp_2[14],kgp_2[10],kgp_3[14]);
Carry_KGP f139(kgp_2[15],kgp_2[11],kgp_3[15]);
Carry_KGP f140(kgp_2[16],kgp_2[12],kgp_3[16]);
Carry_KGP f141(kgp_2[17],kgp_2[13],kgp_3[17]);
Carry_KGP f142(kgp_2[18],kgp_2[14],kgp_3[18]);
Carry_KGP f143(kgp_2[19],kgp_2[15],kgp_3[19]);
Carry_KGP f144(kgp_2[20],kgp_2[16],kgp_3[20]);
Carry_KGP f145(kgp_2[21],kgp_2[17],kgp_3[21]);
Carry_KGP f146(kgp_2[22],kgp_2[18],kgp_3[22]);
Carry_KGP f147(kgp_2[23],kgp_2[19],kgp_3[23]);
Carry_KGP f148(kgp_2[24],kgp_2[20],kgp_3[24]);
Carry_KGP f149(kgp_2[25],kgp_2[21],kgp_3[25]);
Carry_KGP f150(kgp_2[26],kgp_2[22],kgp_3[26]);
Carry_KGP f151(kgp_2[27],kgp_2[23],kgp_3[27]);
Carry_KGP f152(kgp_2[28],kgp_2[24],kgp_3[28]);
Carry_KGP f153(kgp_2[29],kgp_2[25],kgp_3[29]);
Carry_KGP f154(kgp_2[30],kgp_2[26],kgp_3[30]);
Carry_KGP f155(kgp_2[31],kgp_2[27],kgp_3[31]);
Carry_KGP f156(kgp_2[32],kgp_2[28],kgp_3[32]);
Carry_KGP f157(kgp_2[33],kgp_2[29],kgp_3[33]);
Carry_KGP f158(kgp_2[34],kgp_2[30],kgp_3[34]);
Carry_KGP f159(kgp_2[35],kgp_2[31],kgp_3[35]);
Carry_KGP f160(kgp_2[36],kgp_2[32],kgp_3[36]);
Carry_KGP f161(kgp_2[37],kgp_2[33],kgp_3[37]);
Carry_KGP f162(kgp_2[38],kgp_2[34],kgp_3[38]);
Carry_KGP f163(kgp_2[39],kgp_2[35],kgp_3[39]);
Carry_KGP f164(kgp_2[40],kgp_2[36],kgp_3[40]);
Carry_KGP f165(kgp_2[41],kgp_2[37],kgp_3[41]);
Carry_KGP f166(kgp_2[42],kgp_2[38],kgp_3[42]);
Carry_KGP f167(kgp_2[43],kgp_2[39],kgp_3[43]);
Carry_KGP f168(kgp_2[44],kgp_2[40],kgp_3[44]);
Carry_KGP f169(kgp_2[45],kgp_2[41],kgp_3[45]);
Carry_KGP f170(kgp_2[46],kgp_2[42],kgp_3[46]);
Carry_KGP f171(kgp_2[47],kgp_2[43],kgp_3[47]);
Carry_KGP f172(kgp_2[48],kgp_2[44],kgp_3[48]);
Carry_KGP f173(kgp_2[49],kgp_2[45],kgp_3[49]);
Carry_KGP f174(kgp_2[50],kgp_2[46],kgp_3[50]);
Carry_KGP f175(kgp_2[51],kgp_2[47],kgp_3[51]);
Carry_KGP f176(kgp_2[52],kgp_2[48],kgp_3[52]);
Carry_KGP f177(kgp_2[53],kgp_2[49],kgp_3[53]);
Carry_KGP f178(kgp_2[54],kgp_2[50],kgp_3[54]);
Carry_KGP f179(kgp_2[55],kgp_2[51],kgp_3[55]);
Carry_KGP f180(kgp_2[56],kgp_2[52],kgp_3[56]);
Carry_KGP f181(kgp_2[57],kgp_2[53],kgp_3[57]);
Carry_KGP f182(kgp_2[58],kgp_2[54],kgp_3[58]);
Carry_KGP f183(kgp_2[59],kgp_2[55],kgp_3[59]);
Carry_KGP f184(kgp_2[60],kgp_2[56],kgp_3[60]);
Carry_KGP f185(kgp_2[61],kgp_2[57],kgp_3[61]);
Carry_KGP f186(kgp_2[62],kgp_2[58],kgp_3[62]);
Carry_KGP f187(kgp_2[63],kgp_2[59],kgp_3[63]);

// Stage 4
Carry_KGP f188(kgp_3[7],Cin,kgp_4[7]);
Carry_KGP f189(kgp_3[8],kgp_3[0],kgp_4[8]);
Carry_KGP f190(kgp_3[9],kgp_3[1],kgp_4[9]);
Carry_KGP f191(kgp_3[10],kgp_3[2],kgp_4[10]);
Carry_KGP f192(kgp_3[11],kgp_3[3],kgp_4[11]);
Carry_KGP f193(kgp_3[12],kgp_3[4],kgp_4[12]);
Carry_KGP f194(kgp_3[13],kgp_3[5],kgp_4[13]);
Carry_KGP f195(kgp_3[14],kgp_3[6],kgp_4[14]);
Carry_KGP f196(kgp_3[15],kgp_3[7],kgp_4[15]);
Carry_KGP f197(kgp_3[16],kgp_3[8],kgp_4[16]);
Carry_KGP f198(kgp_3[17],kgp_3[9],kgp_4[17]);
Carry_KGP f199(kgp_3[18],kgp_3[10],kgp_4[18]);
Carry_KGP f200(kgp_3[19],kgp_3[11],kgp_4[19]);
Carry_KGP f201(kgp_3[20],kgp_3[12],kgp_4[20]);
Carry_KGP f202(kgp_3[21],kgp_3[13],kgp_4[21]);
Carry_KGP f203(kgp_3[22],kgp_3[14],kgp_4[22]);
Carry_KGP f204(kgp_3[23],kgp_3[15],kgp_4[23]);
Carry_KGP f205(kgp_3[24],kgp_3[16],kgp_4[24]);
Carry_KGP f206(kgp_3[25],kgp_3[17],kgp_4[25]);
Carry_KGP f207(kgp_3[26],kgp_3[18],kgp_4[26]);
Carry_KGP f208(kgp_3[27],kgp_3[19],kgp_4[27]);
Carry_KGP f209(kgp_3[28],kgp_3[20],kgp_4[28]);
Carry_KGP f210(kgp_3[29],kgp_3[21],kgp_4[29]);
Carry_KGP f211(kgp_3[30],kgp_3[22],kgp_4[30]);
Carry_KGP f212(kgp_3[31],kgp_3[23],kgp_4[31]);
Carry_KGP f213(kgp_3[32],kgp_3[24],kgp_4[32]);
Carry_KGP f214(kgp_3[33],kgp_3[25],kgp_4[33]);
Carry_KGP f215(kgp_3[34],kgp_3[26],kgp_4[34]);
Carry_KGP f216(kgp_3[35],kgp_3[27],kgp_4[35]);
Carry_KGP f217(kgp_3[36],kgp_3[28],kgp_4[36]);
Carry_KGP f218(kgp_3[37],kgp_3[29],kgp_4[37]);
Carry_KGP f219(kgp_3[38],kgp_3[30],kgp_4[38]);
Carry_KGP f220(kgp_3[39],kgp_3[31],kgp_4[39]);
Carry_KGP f221(kgp_3[40],kgp_3[32],kgp_4[40]);
Carry_KGP f222(kgp_3[41],kgp_3[33],kgp_4[41]);
Carry_KGP f223(kgp_3[42],kgp_3[34],kgp_4[42]);
Carry_KGP f224(kgp_3[43],kgp_3[35],kgp_4[43]);
Carry_KGP f225(kgp_3[44],kgp_3[36],kgp_4[44]);
Carry_KGP f226(kgp_3[45],kgp_3[37],kgp_4[45]);
Carry_KGP f227(kgp_3[46],kgp_3[38],kgp_4[46]);
Carry_KGP f228(kgp_3[47],kgp_3[39],kgp_4[47]);
Carry_KGP f229(kgp_3[48],kgp_3[40],kgp_4[48]);
Carry_KGP f230(kgp_3[49],kgp_3[41],kgp_4[49]);
Carry_KGP f231(kgp_3[50],kgp_3[42],kgp_4[50]);
Carry_KGP f232(kgp_3[51],kgp_3[43],kgp_4[51]);
Carry_KGP f233(kgp_3[52],kgp_3[44],kgp_4[52]);
Carry_KGP f234(kgp_3[53],kgp_3[45],kgp_4[53]);
Carry_KGP f235(kgp_3[54],kgp_3[46],kgp_4[54]);
Carry_KGP f236(kgp_3[55],kgp_3[47],kgp_4[55]);
Carry_KGP f237(kgp_3[56],kgp_3[48],kgp_4[56]);
Carry_KGP f238(kgp_3[57],kgp_3[49],kgp_4[57]);
Carry_KGP f239(kgp_3[58],kgp_3[50],kgp_4[58]);
Carry_KGP f240(kgp_3[59],kgp_3[51],kgp_4[59]);
Carry_KGP f241(kgp_3[60],kgp_3[52],kgp_4[60]);
Carry_KGP f242(kgp_3[61],kgp_3[53],kgp_4[61]);
Carry_KGP f243(kgp_3[62],kgp_3[54],kgp_4[62]);
Carry_KGP f244(kgp_3[63],kgp_3[55],kgp_4[63]);

// Stage 5
Carry_KGP f245(kgp_4[15],Cin,kgp_5[15]);
Carry_KGP f246(kgp_4[16],kgp_4[0],kgp_5[16]);
Carry_KGP f247(kgp_4[17],kgp_4[1],kgp_5[17]);
Carry_KGP f248(kgp_4[18],kgp_4[2],kgp_5[18]);
Carry_KGP f249(kgp_4[19],kgp_4[3],kgp_5[19]);
Carry_KGP f250(kgp_4[20],kgp_4[4],kgp_5[20]);
Carry_KGP f251(kgp_4[21],kgp_4[5],kgp_5[21]);
Carry_KGP f252(kgp_4[22],kgp_4[6],kgp_5[22]);
Carry_KGP f253(kgp_4[23],kgp_4[7],kgp_5[23]);
Carry_KGP f254(kgp_4[24],kgp_4[8],kgp_5[24]);
Carry_KGP f255(kgp_4[25],kgp_4[9],kgp_5[25]);
Carry_KGP f256(kgp_4[26],kgp_4[10],kgp_5[26]);
Carry_KGP f257(kgp_4[27],kgp_4[11],kgp_5[27]);
Carry_KGP f258(kgp_4[28],kgp_4[12],kgp_5[28]);
Carry_KGP f259(kgp_4[29],kgp_4[13],kgp_5[29]);
Carry_KGP f260(kgp_4[30],kgp_4[14],kgp_5[30]);
Carry_KGP f261(kgp_4[31],kgp_4[15],kgp_5[31]);
Carry_KGP f262(kgp_4[32],kgp_4[16],kgp_5[32]);
Carry_KGP f263(kgp_4[33],kgp_4[17],kgp_5[33]);
Carry_KGP f264(kgp_4[34],kgp_4[18],kgp_5[34]);
Carry_KGP f265(kgp_4[35],kgp_4[19],kgp_5[35]);
Carry_KGP f266(kgp_4[36],kgp_4[20],kgp_5[36]);
Carry_KGP f267(kgp_4[37],kgp_4[21],kgp_5[37]);
Carry_KGP f268(kgp_4[38],kgp_4[22],kgp_5[38]);
Carry_KGP f269(kgp_4[39],kgp_4[23],kgp_5[39]);
Carry_KGP f270(kgp_4[40],kgp_4[24],kgp_5[40]);
Carry_KGP f271(kgp_4[41],kgp_4[25],kgp_5[41]);
Carry_KGP f272(kgp_4[42],kgp_4[26],kgp_5[42]);
Carry_KGP f273(kgp_4[43],kgp_4[27],kgp_5[43]);
Carry_KGP f274(kgp_4[44],kgp_4[28],kgp_5[44]);
Carry_KGP f275(kgp_4[45],kgp_4[29],kgp_5[45]);
Carry_KGP f276(kgp_4[46],kgp_4[30],kgp_5[46]);
Carry_KGP f277(kgp_4[47],kgp_4[31],kgp_5[47]);
Carry_KGP f278(kgp_4[48],kgp_4[32],kgp_5[48]);
Carry_KGP f279(kgp_4[49],kgp_4[33],kgp_5[49]);
Carry_KGP f280(kgp_4[50],kgp_4[34],kgp_5[50]);
Carry_KGP f281(kgp_4[51],kgp_4[35],kgp_5[51]);
Carry_KGP f282(kgp_4[52],kgp_4[36],kgp_5[52]);
Carry_KGP f283(kgp_4[53],kgp_4[37],kgp_5[53]);
Carry_KGP f284(kgp_4[54],kgp_4[38],kgp_5[54]);
Carry_KGP f285(kgp_4[55],kgp_4[39],kgp_5[55]);
Carry_KGP f286(kgp_4[56],kgp_4[40],kgp_5[56]);
Carry_KGP f287(kgp_4[57],kgp_4[41],kgp_5[57]);
Carry_KGP f288(kgp_4[58],kgp_4[42],kgp_5[58]);
Carry_KGP f289(kgp_4[59],kgp_4[43],kgp_5[59]);
Carry_KGP f290(kgp_4[60],kgp_4[44],kgp_5[60]);
Carry_KGP f291(kgp_4[61],kgp_4[45],kgp_5[61]);
Carry_KGP f292(kgp_4[62],kgp_4[46],kgp_5[62]);
Carry_KGP f293(kgp_4[63],kgp_4[47],kgp_5[63]);

// Stage 6
Carry_KGP f294(kgp_5[31],Cin,kgp_6[31]);
Carry_KGP f295(kgp_5[32],kgp_5[0],kgp_6[32]);
Carry_KGP f296(kgp_5[33],kgp_5[1],kgp_6[33]);
Carry_KGP f297(kgp_5[34],kgp_5[2],kgp_6[34]);
Carry_KGP f298(kgp_5[35],kgp_5[3],kgp_6[35]);
Carry_KGP f299(kgp_5[36],kgp_5[4],kgp_6[36]);
Carry_KGP f300(kgp_5[37],kgp_5[5],kgp_6[37]);
Carry_KGP f301(kgp_5[38],kgp_5[6],kgp_6[38]);
Carry_KGP f302(kgp_5[39],kgp_5[7],kgp_6[39]);
Carry_KGP f303(kgp_5[40],kgp_5[8],kgp_6[40]);
Carry_KGP f304(kgp_5[41],kgp_5[9],kgp_6[41]);
Carry_KGP f305(kgp_5[42],kgp_5[10],kgp_6[42]);
Carry_KGP f306(kgp_5[43],kgp_5[11],kgp_6[43]);
Carry_KGP f307(kgp_5[44],kgp_5[12],kgp_6[44]);
Carry_KGP f308(kgp_5[45],kgp_5[13],kgp_6[45]);
Carry_KGP f309(kgp_5[46],kgp_5[14],kgp_6[46]);
Carry_KGP f310(kgp_5[47],kgp_5[15],kgp_6[47]);
Carry_KGP f311(kgp_5[48],kgp_5[16],kgp_6[48]);
Carry_KGP f312(kgp_5[49],kgp_5[17],kgp_6[49]);
Carry_KGP f313(kgp_5[50],kgp_5[18],kgp_6[50]);
Carry_KGP f314(kgp_5[51],kgp_5[19],kgp_6[51]);
Carry_KGP f315(kgp_5[52],kgp_5[20],kgp_6[52]);
Carry_KGP f316(kgp_5[53],kgp_5[21],kgp_6[53]);
Carry_KGP f317(kgp_5[54],kgp_5[22],kgp_6[54]);
Carry_KGP f318(kgp_5[55],kgp_5[23],kgp_6[55]);
Carry_KGP f319(kgp_5[56],kgp_5[24],kgp_6[56]);
Carry_KGP f320(kgp_5[57],kgp_5[25],kgp_6[57]);
Carry_KGP f321(kgp_5[58],kgp_5[26],kgp_6[58]);
Carry_KGP f322(kgp_5[59],kgp_5[27],kgp_6[59]);
Carry_KGP f323(kgp_5[60],kgp_5[28],kgp_6[60]);
Carry_KGP f324(kgp_5[61],kgp_5[29],kgp_6[61]);
Carry_KGP f325(kgp_5[62],kgp_5[30],kgp_6[62]);
Carry_KGP f326(kgp_5[63],kgp_5[31],kgp_6[63]);


	assign carry[0] = Cin[0];
	assign carry[1] = kgp_1[0][0];
	assign carry[2] = kgp_2[1][0];
	assign carry[3] = kgp_2[2][0];
	assign carry[4] = kgp_2[3][0];
	assign carry[5] = kgp_3[4][0];
	assign carry[6] = kgp_3[5][0];
	assign carry[7] = kgp_3[6][0];
	assign carry[8] = kgp_3[7][0];
	assign carry[9] = kgp_3[8][0];
	assign carry[10] = kgp_3[9][0];
	assign carry[11] = kgp_3[10][0];
	assign carry[12] = kgp_4[11][0];
	assign carry[13] = kgp_4[12][0];
	assign carry[14] = kgp_4[13][0];
	assign carry[15] = kgp_4[14][0];
	assign carry[16] = kgp_4[15][0];
	assign carry[17] = kgp_4[16][0];
	assign carry[18] = kgp_4[17][0];
	assign carry[19] = kgp_4[18][0];
	assign carry[20] = kgp_4[19][0];
	assign carry[21] = kgp_4[20][0];
	assign carry[22] = kgp_4[21][0];	
	assign carry[23] = kgp_4[22][0];
	assign carry[24] = kgp_4[23][0];
	assign carry[25] = kgp_4[24][0];
	assign carry[26] = kgp_4[25][0];
	assign carry[27] = kgp_5[26][0];
	assign carry[28] = kgp_5[27][0];
	assign carry[29] = kgp_5[28][0];
	assign carry[30] = kgp_5[29][0];
	assign carry[31] = kgp_5[30][0];
	assign carry[32] = kgp_5[31][0];
	assign carry[33] = kgp_5[32][0];
	assign carry[34] = kgp_5[33][0];
	assign carry[35] = kgp_5[34][0];
	assign carry[36] = kgp_5[35][0];
	assign carry[37] = kgp_5[36][0];
	assign carry[38] = kgp_5[37][0];
	assign carry[39] = kgp_5[38][0];
	assign carry[40] = kgp_5[39][0];
	assign carry[41] = kgp_5[40][0];
	assign carry[42] = kgp_5[41][0];
	assign carry[43] = kgp_5[42][0];
	assign carry[44] = kgp_5[43][0];
	assign carry[45] = kgp_5[44][0];
	assign carry[46] = kgp_5[45][0];
	assign carry[47] = kgp_5[46][0];
	assign carry[48] = kgp_5[47][0];
	assign carry[49] = kgp_5[48][0];
	assign carry[50] = kgp_5[49][0];
	assign carry[51] = kgp_5[50][0];
	assign carry[52] = kgp_5[51][0];
	assign carry[53] = kgp_5[52][0];
	assign carry[54] = kgp_5[53][0];
	assign carry[55] = kgp_5[54][0];
	assign carry[56] = kgp_5[55][0];
	assign carry[57] = kgp_5[56][0];
	assign carry[58] = kgp_6[57][0];
	assign carry[59] = kgp_6[58][0];
	assign carry[60] = kgp_6[59][0];
	assign carry[61] = kgp_6[60][0];
	assign carry[62] = kgp_6[61][0];
	assign carry[63] = kgp_6[62][0];
	assign carry[64] = kgp_6[63][0];

	assign Sum[0]= A[0]^B[0] ^carry[0];
	assign Sum[1]= A[1]^B[1] ^carry[1];
	assign Sum[2]= A[2]^B[2] ^carry[2];
	assign Sum[3]= A[3]^B[3] ^carry[3];
	assign Sum[4]= A[4]^B[4] ^carry[4];
	assign Sum[5]= A[5]^B[5] ^carry[5];
	assign Sum[6]= A[6]^B[6] ^carry[6];
	assign Sum[7]= A[7]^B[7] ^carry[7];
	assign Sum[8]= A[8]^B[8] ^carry[8];
	assign Sum[9]= A[9]^B[9] ^carry[9];
	assign Sum[10]= A[10]^B[10] ^carry[10];
	assign Sum[11]= A[11]^B[11] ^carry[11];
	assign Sum[12]= A[12]^B[12] ^carry[12];
	assign Sum[13]= A[13]^B[13] ^carry[13];
	assign Sum[14]= A[14]^B[14] ^carry[14];
	assign Sum[15]= A[15]^B[15] ^carry[15];
	assign Sum[16]= A[16]^B[16] ^carry[16];
	assign Sum[17]= A[17]^B[17] ^carry[17];
	assign Sum[18]= A[18]^B[18] ^carry[18];
	assign Sum[19]= A[19]^B[19] ^carry[19];
	assign Sum[20]= A[20]^B[20] ^carry[20];	
	assign Sum[21]= A[21]^B[21] ^carry[21];
	assign Sum[22]= A[22]^B[22] ^carry[22];
	assign Sum[23]= A[23]^B[23] ^carry[23];
	assign Sum[24]= A[24]^B[24] ^carry[24];
	assign Sum[25]= A[25]^B[25] ^carry[25];
	assign Sum[26]= A[26]^B[26] ^carry[26];
	assign Sum[27]= A[27]^B[27] ^carry[27];
	assign Sum[28]= A[28]^B[28] ^carry[28];
	assign Sum[29]= A[29]^B[29] ^carry[29];
	assign Sum[30]= A[30]^B[30] ^carry[30];
	assign Sum[31]= A[31]^B[31] ^carry[31];
	assign Sum[32]= A[32]^B[32] ^carry[32];
	assign Sum[33]= A[33]^B[33] ^carry[33];
	assign Sum[34]= A[34]^B[34] ^carry[34];
	assign Sum[35]= A[35]^B[35] ^carry[35];
	assign Sum[36]= A[36]^B[36] ^carry[36];
	assign Sum[37]= A[37]^B[37] ^carry[37];
	assign Sum[38]= A[38]^B[38] ^carry[38];
	assign Sum[39]= A[39]^B[39] ^carry[39];
	assign Sum[40]= A[40]^B[40] ^carry[40];
	assign Sum[41]= A[41]^B[41] ^carry[41];
	assign Sum[42]= A[42]^B[42] ^carry[42];
	assign Sum[43]= A[43]^B[43] ^carry[43];
	assign Sum[44]= A[44]^B[44] ^carry[44];
	assign Sum[45]= A[45]^B[45] ^carry[45];
	assign Sum[46]= A[46]^B[46] ^carry[46];
	assign Sum[47]= A[47]^B[47] ^carry[47];
	assign Sum[48]= A[48]^B[48] ^carry[48];
	assign Sum[49]= A[49]^B[49] ^carry[49];
	assign Sum[50]= A[50]^B[50] ^carry[50];
	assign Sum[51]= A[51]^B[51] ^carry[51];
	assign Sum[52]= A[52]^B[52] ^carry[52];
	assign Sum[53]= A[53]^B[53] ^carry[53];
	assign Sum[54]= A[54]^B[54] ^carry[54];
	assign Sum[55]= A[55]^B[55] ^carry[55];
	assign Sum[56]= A[56]^B[56] ^carry[56];
	assign Sum[57]= A[57]^B[57] ^carry[57];
	assign Sum[58]= A[58]^B[58] ^carry[58];
	assign Sum[59]= A[59]^B[59] ^carry[59];
	assign Sum[60]= A[60]^B[60] ^carry[60];
	assign Sum[61]= A[61]^B[61] ^carry[61];
	assign Sum[62]= A[62]^B[62] ^carry[62];
	assign Sum[63]= A[63]^B[63] ^carry[63];
	assign Sum[64]= carry[64];

endmodule