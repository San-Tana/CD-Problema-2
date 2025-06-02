module entre_intervalo_10bit(
    input [9:0] x,
    input [9:0] inicio,
    input [9:0] fim,
    output dentro
);
    wire maior_igual_inicio;
    wire menor_que_fim;

    // x >= inicio
    maior_igual_10bit comp1(
        .x(x),
        .y(inicio),
        .saida(maior_igual_inicio)
    );

    // x < fim
    menor_10bit comp2(
        .a(x),
        .b(fim),
        .menor(menor_que_fim)
    );

    // dentro = maior_igual_inicio AND menor_que_fim
    and(dentro, maior_igual_inicio, menor_que_fim);
endmodule
