module COR(A, B, C, D, red, green, blue);
	
	input A, B, C, D;
	output [3:0] red, green, blue;
	
	// NEGADOS
	wire nA, nB, nC, nD;
	not notA (nA, A);
	not notB (nB, B);
	not notC (nC, C);
	not notD (nD, D);
	
	// VERMELHO 0
	wire f1, f2, f3, f4, f5;
	and andr00(f1, nB, C, D);
	and andr01(f2, nA, B, nC);
	and andr02(f3, A, C);
	and andr03(f4, nB, nC, nD);
	and andr04(f5, nA, B, nD);
	or orr0(red[3], f1, f2, f3, f4, f5);
	
	// VERMELHO 1
	wire f6, f7, f8, f9, f10;
	and andr10(f6, nA, nB, nC, nD);
	and andr11(f7, nB, C, D);
	and andr12(f8, B, nC, D);
	and andr13(f9, A, D);
	and andr14(f10, A, B ,C);
	or orr1(red[2], f6, f7, f8, f9, f10);
	
	// VERMELHO 2
	wire f11, f12, f13, f14;
	and andr20(f11, nA, nC, nD);
	and andr21(f12, C, D);
	and andr22(f13, nA, B);
	and andr23(f14, B, nD);
	or orr2(red[1], f11, f12, f13, f14);
	
	// VERMELHO 3
	wire f16, f17, f18, f19;
	and andr30(f16, nB, nC, nD );
	and andr31(f17, nA, nB, C, D);
	and andr32(f18, B, nC, D);
	and andr33(f19, A, nD);
	or orr3(red[0],f16, f17, f18, f19);
	
	
	// VERDE O
	wire f20, f21, f22, f23;
	and andg00(f20, nA, D);
	and andg01(f21, A, nB, nC, nD);
	and andg02(f22, C, D);
	and andg03(f23, A, B, C);
	or org0(green[3], f20, f21, f22, f23);
	
	// VERDE 1
	wire f24, f25, f26, f27;
	and andg10(f24, nA, nB, D);
	and andg11(f25, B, C, nD);
	and andg12(f26, A, nD);
	and andg13(f27, nB, C, D);
	or org1(green[2], f24, f25, f26, f27);
	
	// VERDE 2
	wire f28, f29, f30, f31;
	and andg20(f28, nA, B, nC);
	and andg21(f29, A, C, nD);
	and andg22(f30, nA, nB, D);
	and andg23(f31, nB, C, D);
	or org2(green[1], f28, f29, f30, f31);
	
	// VERDE 3
	wire f32, f33, f34, f35, f36, f37;
	and andg30(f32, nA, nB, D);
	and andg31(f33, nA, B, nC, nD);
	and andg32(f34, A, nB, nC, nD);
	and andg33(f35, A, B, D);
	and andg34(f36, A, B, C);
	and andg35(f37, nB, C, D);
	or org3(green[0], f32, f33, f34, f35, f36, f37);
	
	
	// AZUL 0
	wire f38, f39, f40, f41, f42;
	and andb00(f38, nA, nB, C, nD);
	and andb01(f39, nA, B, nC, nD);
	and andb02(f40, B, C, D);
	and andb03(f41, A, nB, nC);
	and andb04(f42, A, B, C);
	or orb0(blue[3], f38, f39, f40, f41, f42);
	
	// AZUL 1
	wire f43, f44;
	and andb10(f43, C, nD);
	and andb11(f44, A, nB);
	or orb1(blue[2], f43, f44);
	
	// AZUL 2
	wire f45, f46, f47, f48;
	and andb20(f45, nA, C, nD);
	and andb21(f46, B, nD);
	and andb22(f47, nA, B, C);
	and andb23(f48, A, nC);
	or orb2(blue[1], f45, f46, f47, f48);
	
	// AZUL 3
	wire f49, f50, f51;
	and andb30(f49, nA, nB, C, nD);
	and andb31(f50, A, nB, D);
	and andb32(f51, A, B, nC, nD);
	or orb3(blue[0], f49, f50, f51);

endmodule