module maior_igual_10bit(
    input [9:0] x,
    input [9:0] y,
    output saida
);
    wire menor_xy;

    menor_10bit comp_menor(
        .a(x),
        .b(y),
        .menor(menor_xy)
    );

    not(saida, menor_xy);
endmodule
