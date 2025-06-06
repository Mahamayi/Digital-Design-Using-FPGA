`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 14:57:36
// Design Name: 
// Module Name: memory
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
module memory (
    input clk,
    input we,
    input [9:0] addr,
    input [31:0] din,
    output [31:0] dout
);

    reg [31:0] mem [0:1023]; 
    reg [31:0] dout_reg;      

    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= din;  
        end else begin
            dout_reg <= mem[addr]; 
        end
    end

    assign dout = dout_reg; 

endmodule

