`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2025 14:33:22
// Design Name: 
// Module Name: single_port_bram
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
module single_port_bram(
    input clk,                   
    input we,                    
    input [9:0] addr,            
    input [15:0] din,            
    output reg [15:0] dout       
);

    reg [15:0] mem [0:1023];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;   
        dout <= mem[addr];        
    end

endmodule

