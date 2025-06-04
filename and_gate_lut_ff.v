`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 12:12:33
// Design Name: 
// Module Name: and_gate_lut_ff
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

module and_gate_lut_ff (
    input wire clk,
    input wire a,
    input wire b,
    output reg y
);
    wire [3:0] lut = 4'b0001;
    wire lut_out = lut[{a, b}];
    always @(posedge clk) begin
        y <= lut_out;
    end

endmodule
