`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 15:26:31
// Design Name: 
// Module Name: pos_edge_detector
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
module pos_edge_detector (
    input wire clk,
    input wire rst,
    input wire signal_in,
    output reg pos_edge
);

    reg signal_d; 

    always @(posedge clk or posedge rst)
     begin
        if (rst) begin
            signal_d <= 0;
            pos_edge <= 0;
        end else begin
            pos_edge <= (~signal_d) & signal_in;
            signal_d <= signal_in;
        end
    end
endmodule

