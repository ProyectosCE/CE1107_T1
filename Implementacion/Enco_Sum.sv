module Enco_Sum(
    input [1:0] A,B,
    output [1:0] C

);

assign C[0]  =  A[0] ^ B[0];

assign C[1] = (A[1] ^ B[1]) ^ (A[0] & B[0]);


endmodule