`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 16:09:37
// Design Name: 
// Module Name: both_egde_detector
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
module both_edge_detector (
    input wire clk,
    input wire rst,
    input wire signal_in,
    output reg edge_out
);

    reg signal_d;

    always @(posedge clk) begin
        if (rst) begin
            signal_d <= 0;
            edge_out <= 0;
        end else begin
            signal_d <= signal_in;                
            edge_out <= signal_in ^ signal_d;     
        end
    end

endmodule


