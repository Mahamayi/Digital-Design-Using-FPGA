`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 10:42:23
// Design Name: 
// Module Name: counter_2bit_lut
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


module counter_2bit_lut (
    input wire clk,
    input wire reset,
    output reg [1:0] count
);
    reg [1:0] lut [3:0];
    initial begin
        lut[2'b00] = 2'b01;
        lut[2'b01] = 2'b10;
        lut[2'b10] = 2'b11;
        lut[2'b11] = 2'b00;
    end
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 2'b00;  
        else
            count <= lut[count];
    end

endmodule

