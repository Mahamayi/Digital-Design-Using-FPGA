`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 15:21:21
// Design Name: 
// Module Name: memory_50kbit
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
module memory_50kbit (
    input clk,
    input we,
    input [10:0] addr,          
    input [24:0] din,           
    output [24:0] dout         
);
    reg [24:0] mem [0:1999];
    reg [24:0] dout_reg;

    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= din;
        end else begin
            dout_reg <= mem[addr];
        end
    end

    assign dout = dout_reg;

endmodule

