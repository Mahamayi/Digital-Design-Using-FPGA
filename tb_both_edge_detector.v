`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 16:18:14
// Design Name: 
// Module Name: tb_both_edge_detector
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
module tb_both_edge_detector;

    reg clk;
    reg rst;
    reg signal_in;
    wire edge_out;

    both_edge_detector uut (
        .clk(clk),
        .rst(rst),
        .signal_in(signal_in),
        .edge_out(edge_out)
    );
    always #5 clk = ~clk;

    initial begin
    clk = 0; rst = 1; signal_in = 0;
    #10 rst = 0;
    
    #20 signal_in = 1;  
    #20 signal_in = 0;  
    #20 signal_in = 1;  
    #20 signal_in = 0;  
    #20 signal_in = 1;  

    #20 $finish;
end
    initial begin
    $monitor("Time=%0t | signal_in=%b | edge_out=%b", 
             $time, signal_in, edge_out);
end
endmodule

