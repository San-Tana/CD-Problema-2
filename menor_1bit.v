module menor_1bit(input a, b, output saida);
	wire nA;
	not (nA,a);
	and (saida,nA,b);
	
endmodule