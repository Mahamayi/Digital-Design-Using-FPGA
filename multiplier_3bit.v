`timescale 1ns/1ps
module multiplier_3bit (
    input [2:0] A, B,
    output [5:0] P
);
    wire pp00, pp01, pp02;
    wire pp10, pp11, pp12;
    wire pp20, pp21, pp22;

    wire s1, c1;
    wire s2a, c2a, s2, c2;
    wire s3a, c3a, s3b, c3b, s3, c3;
    wire s4, c4;

    assign pp00 = A[0] & B[0]; 
    assign pp01 = A[1] & B[0];
    assign pp02 = A[2] & B[0];

    assign pp10 = A[0] & B[1];
    assign pp11 = A[1] & B[1];
    assign pp12 = A[2] & B[1];

    assign pp20 = A[0] & B[2];
    assign pp21 = A[1] & B[2];
    assign pp22 = A[2] & B[2];

   
    assign P[0] = pp00;

  
    half_adder ha1 (.a(pp01), .b(pp10), .sum(P[1]), .carry(c1));

    half_adder ha2a (.a(pp02), .b(pp11), .sum(s2a), .carry(c2a));
    half_adder ha2b (.a(s2a), .b(pp20), .sum(P[2]), .carry(c2));
    wire carry2 = c2a | c2;

   
    half_adder ha3a (.a(pp12), .b(pp21), .sum(s3a), .carry(c3a));
    half_adder ha3b (.a(s3a), .b(carry2), .sum(P[3]), .carry(c3b));
    wire carry3 = c3a | c3b;

    half_adder ha4 (.a(pp22), .b(carry3), .sum(P[4]), .carry(c4));

    assign P[5] = c4;

endmodule
