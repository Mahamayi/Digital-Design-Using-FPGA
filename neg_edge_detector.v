`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 15:49:50
// Design Name: 
// Module Name: neg_edge_detector
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
module neg_edge_detector (
    input wire clk,        
    input wire signal,     
    output reg neg_edge   
);
    reg signal_d;          

    always @(posedge clk) begin
        signal_d <= signal;                     
        neg_edge <= (signal_d == 1 && signal == 0); 
    end
endmodule

