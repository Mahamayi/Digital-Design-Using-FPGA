`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 15:36:55
// Design Name: 
// Module Name: tb_pos_edge_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_pos_edge_detector;

    reg clk, rst, signal_in;
    wire pos_edge;

    pos_edge_detector dut (
        .clk(clk),
        .rst(rst),
        .signal_in(signal_in),
        .pos_edge(pos_edge)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        signal_in = 0;
        
        #10 rst = 0;
        
        #10 signal_in = 0;
        #10 signal_in = 1;  
        #10 signal_in = 1;  
        #10 signal_in = 0;  
        #10 signal_in = 1;  
        #10 signal_in = 0;
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0t | signal_in=%b | pos_edge=%b", $time, signal_in, pos_edge);
    end

endmodule

