`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 16:28:27
// Design Name: 
// Module Name: priority_encoder
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

module priority_encoder(
    input  [3:0] in,       
    output reg [1:0] out,  
    output reg valid       
);

always @(*) begin
    valid = 1'b1; 
    casex (in)
        4'b1xxx: out = 2'b11;  
        4'b01xx: out = 2'b10;  
        4'b001x: out = 2'b01;  
        4'b0001: out = 2'b00;  
        4'b0000: begin        
            out = 2'b00;
            valid = 1'b0;
        end
    endcase
end

endmodule


