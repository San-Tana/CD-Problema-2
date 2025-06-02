module PosicoesXY(A, B, C, D, E, F, Y);
	input A, B, C, D, E, F;
	output [9:0] Y;
	
	// NEGADOS
	wire nA, nB, nC, nD, nE, nF;
	not (nA, A);
	not (nB, B);
	not (nC, C);
	not (nD, D);
	not (nE, E);	
	not (nF, F);
	
	
	// y0
	and (Y[0], 1'b0, 1'b0);
	
	// y1
	and (Y[1], 1'b0, 1'b0);
	
	// y2
	or (Y[2], 1'b0, A);
	
	//y3
	or (Y[3], 1'b0, B);
	
	//y4
	or (Y[4], 1'b0, C);
	
	//y5
	or (Y[5], 1'b0, D);
	
	//y6
	or (Y[6], 1'b0, E);
	
	//y7
	or (Y[7], 1'b0, F);
	
	//y8
	and (Y[8], 1'b0, 1'b0);
	
	//y9
	and (Y[9], 1'b0, 1'b0);

endmodule