module vga_sync_structural(
    input clk,
    output hsync,
    output vsync,
    output video_on,
    output [9:0] x,
    output [9:0] y
);

    wire hreset, vreset;
    wire [9:0] hcount, vcount;

    // Contador horizontal (0 a 799)
    contador_10bit contador_horizontal (
        .clk(clk),
        .reset(hreset),
        .q(hcount)
    );

    // Reset horizontal ao atingir 799
    wire igual_799;
    igual_10bit eh799 (.a(hcount), .b(10'd799), .igual(igual_799));
    assign hreset = igual_799;

    // Contador vertical (0 a 524), incrementa quando hreset
    contador_10bit contador_vertical (
        .clk(hreset),
        .reset(vreset),
        .q(vcount)
    );

    // Reset vertical ao atingir 524
    wire igual_524;
    igual_10bit eh524 (.a(vcount), .b(10'd524), .igual(igual_524));
    assign vreset = igual_524;

    // Geração do sinal hsync (ativo em 656 a 751)
    wire maior_igual_656, menor_igual_751, faixa_hsync;
    maior_ou_igual_10bit ge656 (.a(hcount), .b(10'd656), .maior_igual(maior_igual_656));
    menor_10bit lt752 (.a(hcount), .b(10'd752), .menor(menor_igual_751));
    and (faixa_hsync, maior_igual_656, menor_igual_751);
    not (hsync, faixa_hsync); // sinal ativo baixo

    // Geração do sinal vsync (ativo em 490 a 491)
    wire maior_igual_490, menor_igual_491, faixa_vsync;
    maior_ou_igual_10bit ge490 (.a(vcount), .b(10'd490), .maior_igual(maior_igual_490));
    menor_10bit lt492 (.a(vcount), .b(10'd492), .menor(menor_igual_491));
    and (faixa_vsync, maior_igual_490, menor_igual_491);
    not (vsync, faixa_vsync); // sinal ativo baixo

    // video_on = (hcount < 640) && (vcount < 480)
    wire dentro_x, dentro_y;
    menor_10bit menor_640 (.a(hcount), .b(10'd640), .menor(dentro_x));
    menor_10bit menor_480 (.a(vcount), .b(10'd480), .menor(dentro_y));
    and (video_on, dentro_x, dentro_y);

    // Saídas de posição de pixel
    assign x = hcount;
    assign y = vcount;

endmodule
