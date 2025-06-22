module hub75_gamma #(
    parameter integer IW = 8,
    parameter integer OW = 8
)(
    input  wire [IW-1:0] in,
    output reg  [OW-1:0] out,
    input  wire enable,
    input  wire clk
);

    always @(posedge clk) begin
        if (enable)
            out <= in[IW-1 -: OW];
    end

endmodule
