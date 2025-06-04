`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 14:56:05
// Design Name: 
// Module Name: full_adder
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

module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

    wire sum1, carry1, carry2;
    
    half_adder HA1 (
        .a(A),
        .b(B),
        .sum(sum1),
        .carry(carry1)
    );

    half_adder HA2 (
        .a(sum1),
        .b(Cin),
        .sum(Sum),
        .carry(carry2)
    );

    assign Cout = carry1 | carry2;

endmodule
