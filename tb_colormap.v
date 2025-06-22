`timescale 1ns / 1ps

module tb_colormap;

    reg clk = 0;
    reg rst = 1;
    always #5 clk = ~clk;

    reg [23:0] in_data;
    reg [0:0]  in_user;
    reg        in_valid;
    wire       in_ready;

    wire [23:0] out_data;
    wire [0:0]  out_user;
    wire        out_valid;

    hub75_colormap #(
        .N_CHANS(3),
        .N_PLANES(8),
        .BITDEPTH(24),
        .USER_WIDTH(1)
    ) uut (
        .in_data(in_data),
        .in_user(in_user),
        .in_valid(in_valid),
        .in_ready(in_ready),
        .out_data(out_data),
        .out_user(out_user),
        .out_valid(out_valid),
        .clk(clk),
        .rst(rst)
    );

    integer cycle = 0;
    always @(posedge clk) begin
        cycle <= cycle + 1;
        $display("[Cycle %0d] in_valid=%b in_data=0x%06X in_ready=%b | out_valid=%b out_data=0x%06X {R=0x%02X, G=0x%02X, B=0x%02X} out_user=%b",
            cycle, in_valid, in_data, in_ready, out_valid, out_data,
            out_data[23:16], out_data[15:8], out_data[7:0], out_user);
    end

    initial begin
        $dumpfile("colormap_tb.vcd");
        $dumpvars(0, tb_colormap);

        #20;
        rst = 0;
        in_valid = 0;

        // First pixel
        @(posedge clk); in_valid = 1; in_data = 24'hFF8040; in_user = 0;
        @(posedge clk);              in_data = 24'hFF8040; in_user = 0;
        @(posedge clk);              in_data = 24'hFF8040; in_user = 1;
        @(posedge clk); in_valid = 0; in_user = 0;

        #20;

        // Second pixel
        @(posedge clk); in_valid = 1; in_data = 24'h40FF20; in_user = 0;
        @(posedge clk);              in_data = 24'h40FF20; in_user = 0;
        @(posedge clk);              in_data = 24'h40FF20; in_user = 1;
        @(posedge clk); in_valid = 0; in_user = 0;

        #20;

        // Third pixel
        @(posedge clk); in_valid = 1; in_data = 24'h204080; in_user = 0;
        @(posedge clk);              in_data = 24'h204080; in_user = 0;
        @(posedge clk);              in_data = 24'h204080; in_user = 1;
        @(posedge clk); in_valid = 0; in_user = 0;

        repeat (20) @(posedge clk);
        $finish;
    end

endmodule
