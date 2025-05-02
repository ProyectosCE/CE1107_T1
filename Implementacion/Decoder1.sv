//-----------------------------------------------------------------------------
// Module: Decoder1
// Description: Decodificador 1 calcula señales A y B
// Inputs: A_input (A0 y A1), B_input (B0 y B1 desde registro tipo D)
// Outputs: AB_out (2 bits: A y B, para BCD)
//-----------------------------------------------------------------------------
module Decoder1 (
    input logic [1:0] A_input,     // A0 y A1
    input logic [1:0] B_input,     // B0 y B1 desde registro
    output logic [1:0] AB_out      // AB_out[1] = A, AB_out[0] = B
);

    logic A0, A1, B0, B1;
    assign {A1, A0} = A_input;
    assign {B1, B0} = B_input;

    always_comb begin
        AB_out[1] = A0 ^ B0;                        
        AB_out[0] = (B1 ^ A1) ^ (A0 & B0);           
    end

endmodule
