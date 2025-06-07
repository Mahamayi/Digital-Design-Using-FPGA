`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2025 14:45:10
// Design Name: 
// Module Name: true_port_bram
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
module true_port_bram(
    input wire clk,
    input wire we_a,
    input wire [13:0] addr_a,
    input wire [31:0] din_a,
    output reg [31:0] dout_a,
    input wire we_b,
    input wire [13:0] addr_b,
    input wire [31:0] din_b,
    output reg [31:0] dout_b
);
    (* ram_style = "block" *) reg [31:0] mem [0:16383];
    always @(posedge clk) begin
        if (we_a)
            mem[addr_a] <= din_a;
        dout_a <= mem[addr_a];
    end
    always @(posedge clk) begin
        if (we_b)
            mem[addr_b] <= din_b;
        dout_b <= mem[addr_b];
    end

endmodule
