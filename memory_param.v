`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.06.2025 15:11:01
// Design Name: 
// Module Name: memory_param
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
module memory_param #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10
)(
    input clk,
    input we,
    input [ADDR_WIDTH-1:0] addr,
    input [DATA_WIDTH-1:0] din,
    output [DATA_WIDTH-1:0] dout
);
    reg [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH)-1];
    reg [DATA_WIDTH-1:0] dout_reg;
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= din;
        end else begin
            dout_reg <= mem[addr];
        end
    end
    assign dout = dout_reg;

endmodule

