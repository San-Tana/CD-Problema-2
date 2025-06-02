module menor_640(x,menor);
	input [9:0]x;
	output menor;
	
	// FIOS
	wire nivel8, nivel7, nivel6, nivel5, nivel4, nivel3, nivel2, nivel1, nivel0;
	wire igual9, igual8, igual7, igual6, igual5, igual4, igual3, igual2, igual1, igual0;
	wire menor9, menor8, menor7, menor6, menor5, menor4, menor3, menor2, menor1, menor0; 
	
	//COMPARANDO BIT A BIT IGUALDADE
	igual_1bit EQ9(.a(x[9]), .b(1'b1), .saida(igual9));
	igual_1bit EQ8(.a(x[8]), .b(1'b0), .saida(igual8));
	igual_1bit EQ7(.a(x[7]), .b(1'b1), .saida(igual7));
	igual_1bit EQ6(.a(x[6]), .b(1'b0), .saida(igual6));
	igual_1bit EQ5(.a(x[5]), .b(1'b0), .saida(igual5));
	igual_1bit EQ4(.a(x[4]), .b(1'b0), .saida(igual4));
	igual_1bit EQ3(.a(x[3]), .b(1'b0), .saida(igual3));
	igual_1bit EQ2(.a(x[2]), .b(1'b0), .saida(igual2));
	igual_1bit EQ1(.a(x[1]), .b(1'b0), .saida(igual1));
	igual_1bit EQ0(.a(x[0]), .b(1'b0), .saida(igual0));

	//COMPARANDO BIT A BIT MENORES
	menor_1bit M9(.a(x[9]), .b(1'b1), .saida(menor9));
	menor_1bit M8(.a(x[8]), .b(1'b0), .saida(menor8));
	menor_1bit M7(.a(x[7]), .b(1'b1), .saida(menor7));
	menor_1bit M6(.a(x[6]), .b(1'b0), .saida(menor6));
	menor_1bit M5(.a(x[5]), .b(1'b0), .saida(menor5));
	menor_1bit M4(.a(x[4]), .b(1'b0), .saida(menor4));
	menor_1bit M3(.a(x[3]), .b(1'b0), .saida(menor3));
	menor_1bit M2(.a(x[2]), .b(1'b0), .saida(menor2));
	menor_1bit M1(.a(x[1]), .b(1'b0), .saida(menor1));
	menor_1bit M0(.a(x[0]), .b(1'b0), .saida(menor0));
	
	// DEFINIR QUANDO E MENOR POR NIVEL (Cada nível verifica se todos os bits mais significativos são iguais até certo ponto, e o bit corrente é menor.)
	and (nivel8, igual9, menor8);
	and (nivel7, igual9, igual8, menor7);
	and (nivel6, igual9, igual8, igual7, menor6);
	and (nivel5, igual9, igual8, igual7, igual6, menor5);
	and (nivel4, igual9, igual8, igual7, igual6, igual5, menor4);
	and (nivel3, igual9, igual8, igual7, igual6, igual5, igual4, menor3);
	and (nivel2, igual9, igual8, igual7, igual6, igual5, igual4, igual3, menor2);
	and (nivel1, igual9, igual8, igual7, igual6, igual5, igual4, igual3, igual2, menor1);
	and (nivel0, igual9, igual8, igual7, igual6, igual5, igual4, igual3, igual2, igual1, menor0);
	or (menor, menor9, nivel8, nivel7, nivel6, nivel5, nivel4, nivel3, nivel2, nivel1, nivel0);

endmodule