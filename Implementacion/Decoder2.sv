//-----------------------------------------------------------------------------
// Module: Decoder2
// Description: Evalúa la condición A0 XOR A1 y enciende un LED cuando aplica.
// Inputs: A0, A1
// Output: desacople_out (conectado a GPIO output para controlar transistor
//-----------------------------------------------------------------------------
module Decoder2 (
    input  logic A0,
    input  logic A1,
    output logic desacople_out // GPIO output 
);

    assign led_out = A0 ^ A1;

endmodule
