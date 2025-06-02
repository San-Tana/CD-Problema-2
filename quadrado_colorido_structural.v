module quadrado_colorido_structural(
    input [9:0] x, y,
    input A, B, C, D,
	 input [5:0] sw_tamanhos,
    output [3:0] red, green, blue
);

// Declarações
wire dentro_x, dentro_y, dentro_quadrado;
wire [3:0] red_interno, green_interno, blue_interno;

// Instancia a cor com base nos switches
COR cor_inst (
    .A(A), .B(B), .C(C), .D(D),
    .red(red_interno),
    .green(green_interno),
    .blue(blue_interno)
);

wire [9:0] fio_tamanhos, fio_posXY;
PosicoesXY tamanho_inst(
	.A(sw_tamanhos[0]),
	.B(sw_tamanhos[1]),
	.C(sw_tamanhos[2]),
	.D(sw_tamanhos[3]),
	.E(sw_tamanhos[4]),
	.F(sw_tamanhos[5]),
	.Y(fio_tamanhos)
	);
	
	PosicoesXY pos_xy(
	.A(sw_tamanhos[0]),
	.B(sw_tamanhos[1]),
	.C(sw_tamanhos[2]),
	.D(sw_tamanhos[3]),
	.E(sw_tamanhos[4]),
	.F(sw_tamanhos[5]),
	.Y(fio_posXY)
	);

// Para a posicao final somar a posicao inicial (10'd0) com tamanho do quadrado
wire [9:0] limite_x;

soma_10bit sumPosTamanho(
	.a(fio_posXY),
	.b(fio_tamanhos),
	.s(limite_x)
);
	
	
// Verifica se x está entre 100 e 299
// 100 = 0001100100 (binário), 299 = 100101011 (binário)
wire x_maior_igual_100, x_menor_300;
maior_igual_10bit maior100 (.x(x), .y(fio_posXY), .saida(x_maior_igual_100));
menor_10bit menor300 (.a(x), .b(limite_x), .menor(x_menor_300));
and (dentro_x, x_maior_igual_100, x_menor_300);

// Verifica se y está entre 100 e 299
wire y_maior_igual_100, y_menor_300;
maior_igual_10bit maior100y (.x(y), .y(fio_posXY), .saida(y_maior_igual_100));
menor_10bit menor300y (.a(y), .b(limite_x), .menor(y_menor_300));
and (dentro_y, y_maior_igual_100, y_menor_300);

// Ativa somente se estiver dentro do quadrado
and (dentro_quadrado, dentro_x, dentro_y);
wire Ndentro_quadrado;
not (Ndentro_quadrado,dentro_quadrado);
// Gera RGB somente se estiver dentro do quadrado
and and_red0(red[0], red_interno[0], Ndentro_quadrado);
and and_red1(red[1], red_interno[1], Ndentro_quadrado);
and and_red2(red[2], red_interno[2], Ndentro_quadrado);
and and_red3(red[3], red_interno[3], Ndentro_quadrado);

and and_green0(green[0], green_interno[0], Ndentro_quadrado);
and and_green1(green[1], green_interno[1], Ndentro_quadrado);
and and_green2(green[2], green_interno[2], Ndentro_quadrado);
and and_green3(green[3], green_interno[3], Ndentro_quadrado);

and and_blue0(blue[0], blue_interno[0], Ndentro_quadrado);
and and_blue1(blue[1], blue_interno[1], Ndentro_quadrado);
and and_blue2(blue[2], blue_interno[2], Ndentro_quadrado);
and and_blue3(blue[3], blue_interno[3], Ndentro_quadrado);

endmodule

