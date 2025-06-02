module menor_10bit(
    input [9:0] a,
    input [9:0] b,
    output menor
);
    // FIOS
    wire igual9, igual8, igual7, igual6, igual5, igual4, igual3, igual2, igual1, igual0;
    wire menor9, menor8, menor7, menor6, menor5, menor4, menor3, menor2, menor1, menor0;
    wire nivel8, nivel7, nivel6, nivel5, nivel4, nivel3, nivel2, nivel1, nivel0;

    // COMPARAÇÃO DE IGUALDADE
    igual_1bit EQ9(.a(a[9]), .b(b[9]), .saida(igual9));
    igual_1bit EQ8(.a(a[8]), .b(b[8]), .saida(igual8));
    igual_1bit EQ7(.a(a[7]), .b(b[7]), .saida(igual7));
    igual_1bit EQ6(.a(a[6]), .b(b[6]), .saida(igual6));
    igual_1bit EQ5(.a(a[5]), .b(b[5]), .saida(igual5));
    igual_1bit EQ4(.a(a[4]), .b(b[4]), .saida(igual4));
    igual_1bit EQ3(.a(a[3]), .b(b[3]), .saida(igual3));
    igual_1bit EQ2(.a(a[2]), .b(b[2]), .saida(igual2));
    igual_1bit EQ1(.a(a[1]), .b(b[1]), .saida(igual1));
    igual_1bit EQ0(.a(a[0]), .b(b[0]), .saida(igual0));

    // COMPARAÇÃO DE MENOR
    menor_1bit M9(.a(a[9]), .b(b[9]), .saida(menor9));
    menor_1bit M8(.a(a[8]), .b(b[8]), .saida(menor8));
    menor_1bit M7(.a(a[7]), .b(b[7]), .saida(menor7));
    menor_1bit M6(.a(a[6]), .b(b[6]), .saida(menor6));
    menor_1bit M5(.a(a[5]), .b(b[5]), .saida(menor5));
    menor_1bit M4(.a(a[4]), .b(b[4]), .saida(menor4));
    menor_1bit M3(.a(a[3]), .b(b[3]), .saida(menor3));
    menor_1bit M2(.a(a[2]), .b(b[2]), .saida(menor2));
    menor_1bit M1(.a(a[1]), .b(b[1]), .saida(menor1));
    menor_1bit M0(.a(a[0]), .b(b[0]), .saida(menor0));

    // VERIFICAÇÃO DE CADA NÍVEL
    and (nivel8, igual9, menor8);
    and (nivel7, igual9, igual8, menor7);
    and (nivel6, igual9, igual8, igual7, menor6);
    and (nivel5, igual9, igual8, igual7, igual6, menor5);
    and (nivel4, igual9, igual8, igual7, igual6, igual5, menor4);
    and (nivel3, igual9, igual8, igual7, igual6, igual5, igual4, menor3);
    and (nivel2, igual9, igual8, igual7, igual6, igual5, igual4, igual3, menor2);
    and (nivel1, igual9, igual8, igual7, igual6, igual5, igual4, igual3, igual2, menor1);
    and (nivel0, igual9, igual8, igual7, igual6, igual5, igual4, igual3, igual2, igual1, menor0);

    // SAÍDA FINAL
    or (menor, menor9, nivel8, nivel7, nivel6, nivel5, nivel4, nivel3, nivel2, nivel1, nivel0);
endmodule
