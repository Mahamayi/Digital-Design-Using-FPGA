`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 15:56:29
// Design Name: 
// Module Name: tb_neg_edge_detector
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
module tb_neg_edge_detector;
    reg clk;
    reg signal;
    wire neg_edge;
    
    neg_edge_detector uut (
        .clk(clk),
        .signal(signal),
        .neg_edge(neg_edge)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    initial begin
        signal = 0;
        #12 signal = 1;
        #10 signal = 0;
        #10 signal = 1;
        #10 signal = 0; 
        #10 signal = 0;
        #10 signal = 1;
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0t | signal=%b | neg_edge=%b", $time, signal, neg_edge);
    end
endmodule

