`timescale 1ns / 1ps
`default_nettype none

module hub75_colormap #(
    parameter integer N_CHANS  = 3,
    parameter integer N_PLANES = 8,
    parameter integer BITDEPTH = 24,
    parameter integer USER_WIDTH = 1
)(
    // Input pixel
    input  wire [BITDEPTH-1:0] in_data,
    input  wire [USER_WIDTH-1:0] in_user,
    input  wire in_valid,
    output reg  in_ready,

    // Output pixel
    output wire [(N_CHANS*N_PLANES)-1:0] out_data,
    output reg  [USER_WIDTH-1:0] out_user,
    output reg  out_valid,

    // Clock / Reset
    input  wire clk,
    input  wire rst
);

    // Color channels
    wire [7:0] c0, c1, c2;
    reg  [7:0] cmux;
    reg  [1:0] cnt;

    // Gamma corrected output and pipeline
    wire [N_PLANES-1:0] do;
    reg  [N_PLANES-1:0] do_r [0:2]; // do_r[0] = most recent (R), [1] = G, [2] = B

    // Channel mapping based on BITDEPTH
    generate
        if (BITDEPTH == 24) begin
            assign c2 = in_data[23:16]; // R
            assign c1 = in_data[15: 8]; // G
            assign c0 = in_data[ 7: 0]; // B
        end else if (BITDEPTH == 16) begin
            assign c2 = { in_data[15:11], in_data[15:13] };
            assign c1 = { in_data[10: 5], in_data[10: 9] };
            assign c0 = { in_data[ 4: 0], in_data[ 4: 2] };
        end else if (BITDEPTH == 8) begin
            assign c2 = { {2{in_data[7:5]}}, in_data[7:6] };
            assign c1 = { {2{in_data[4:2]}}, in_data[4:3] };
            assign c0 = { {4{in_data[1:0]}} };
        end
    endgenerate

    // Multiplexer for channel selection
    always @(*) begin
        case (cnt)
            2'd0: cmux = c0; // Blue
            2'd1: cmux = c1; // Green
            2'd2: cmux = c2; // Red
            default: cmux = 8'h00;
        endcase
    end

    // Gamma correction module
    hub75_gamma #(
        .IW(8),
        .OW(N_PLANES)
    ) gamma_lut_I (
        .in(cmux),
        .out(do),
        .enable(1'b1),
        .clk(clk)
    );

    // Cycle counter
    always @(posedge clk) begin
        if (rst)
            cnt <= 0;
        else if (in_valid)
            cnt <= cnt + 1;
        else
            cnt <= 0;
    end

    // Input ready asserted on Red cycle
    always @(posedge clk)
        in_ready <= (cnt == 2);

    // Pipeline shift for gamma-corrected data
    always @(posedge clk) begin
        if (rst) begin
            do_r[0] <= 0;
            do_r[1] <= 0;
            do_r[2] <= 0;
        end else begin
            do_r[2] <= do_r[1];
            do_r[1] <= do_r[0];
            do_r[0] <= do;
        end
    end

    // Output data assembled from pipeline stages
    assign out_data = { do_r[0], do_r[1], do_r[2] }; // {R, G, B}

    // Output valid signal on Red cycle
    always @(posedge clk)
        out_valid <= (cnt == 2);

    // User metadata passed on Red cycle
    always @(posedge clk)
        if (cnt == 2)
            out_user <= in_user;

endmodule
