module top_vga_structural(
    input clk,
    input [3:0] sw, // switches SW[3:0] conectados a A, B, C, D
	 input [5:0] sw_res, // switches para troca de posição x e y, e resolução do quadrado
    output hsync,
    output vsync,
    output [3:0] red,
    output [3:0] green,
    output [3:0] blue
);

    wire clk25; // clock de 25 MHz
    wire video_on;
    wire [9:0] x, y;
    wire [3:0] red_pixel, green_pixel, blue_pixel;

    // Clock divider para gerar 25 MHz (já criado)
    clock_divider clk_div (
        .clk_in(clk),
        .clk_out(clk25)
    );

	 // ALTERADOOO
	 // ALTERADOOO
	 // ALTERADOOO
	 // ALTERADOOO
    // Módulo VGA estrutural
    vga_sync_sequencial pos_xy (
        .clk(clk25),
        .x(x),
        .y(y)
    );
	 
	  vga_sync_estrutural sinais_vga (
        .x(x),
        .y(y),
        .hsync(hsync),
        .vsync(vsync),
        .video_on(video_on)
    );
	 
	 // ALTERADOOO
	 // ALTERADOOO
	 // ALTERADOOO
	 // ALTERADOOO

    // Módulo do quadrado colorido com base nos switches
    quadrado_colorido_structural quadrado (
        .x(x),
        .y(y),
        .A(sw[0]),
        .B(sw[1]),
        .C(sw[2]),
        .D(sw[3]),
		  .sw_tamanhos(sw_res),
        .red(red_pixel),
        .green(green_pixel),
        .blue(blue_pixel)
    );

    // Ativa RGB somente se video_on = 1
    and and_r0(red[0], red_pixel[0], video_on);
    and and_r1(red[1], red_pixel[1], video_on);
    and and_r2(red[2], red_pixel[2], video_on);
    and and_r3(red[3], red_pixel[3], video_on);

    and and_g0(green[0], green_pixel[0], video_on);
    and and_g1(green[1], green_pixel[1], video_on);
    and and_g2(green[2], green_pixel[2], video_on);
    and and_g3(green[3], green_pixel[3], video_on);

    and and_b0(blue[0], blue_pixel[0], video_on);
    and and_b1(blue[1], blue_pixel[1], video_on);
    and and_b2(blue[2], blue_pixel[2], video_on);
    and and_b3(blue[3], blue_pixel[3], video_on);

endmodule
