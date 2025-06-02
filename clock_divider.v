module clock_divider(
    input wire clk_in,       // 50 MHz
    output reg clk_out = 0   // 25 MHz
);
    always @(posedge clk_in)
        clk_out <= ~clk_out;
endmodule