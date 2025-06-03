module Twobitmul (
    input [1:0] A,
    input [1:0] B,
    output [3:0] P
);
    wire t1, t2, t3;
    wire sum1, carry1;
    wire sum2, carry2;

    // Step 1: Generate partial products
    assign P[0] = A[0] & B[0]; // Least significant bit

    assign t1 = A[1] & B[0];
    assign t2 = A[0] & B[1];
    assign t3 = A[1] & B[1];

    // Step 2: First Half Adder (t1 + t2)
    assign sum1 = t1 ^ t2;     // P[1]
    assign carry1 = t1 & t2;

    assign P[1] = sum1;

    // Step 3: Second Half Adder (t3 + carry1)
    assign sum2 = t3 ^ carry1; // P[2]
    assign carry2 = t3 & carry1;

    assign P[2] = sum2;
    assign P[3] = carry2;      // Most significant bit
endmodule
