`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2025 15:03:02
// Design Name: 
// Module Name: logic_function_8bit
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
module logic_function_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [7:0] C,
    input  [7:0] D,
    input  [7:0] E,
    input  [7:0] F,
    input  [7:0] G,
    input  [7:0] H,
    output [7:0] Y
);

    reg [7:0] temp1, temp2, temp3; 

    always @(*) begin
        temp1 = (A & B);                  
        temp2 = (C ^ D) & E;            
        temp3 = (F ^ G) & H;          
    end

    assign Y = temp1 | temp2 | temp3;  

endmodule
