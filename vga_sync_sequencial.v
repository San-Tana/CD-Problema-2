module vga_sync_sequencial (
    input wire clk,
    output reg [9:0] x = 0,
    output reg [9:0] y = 0
);

    localparam H_TOTAL = 800;
    localparam V_TOTAL = 525;
    always @(posedge clk) begin
        if (x < H_TOTAL - 1)
            x <= x + 1;
        else begin
            x <= 0;
            y <= (y < V_TOTAL - 1) ? y + 1 : 0;
        end
    end
endmodule