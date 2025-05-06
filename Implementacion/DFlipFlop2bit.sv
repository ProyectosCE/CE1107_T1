//-----------------------------------------------------------------------------
// Module: DFlipFlop2bit
// Description: Registro tipo D de 2 bits con clock y reset
// Inputs: clk (botón izquierdo), rst (botón derecho), D (2 bits desde switches)
// Output: Q (2 bits registrados)
//-----------------------------------------------------------------------------
module DFlipFlop2bit (
    input logic clk,           // Botón izquierdo (primer botón)
    input logic rst,           // Botón derecho (segundo botón)
    input logic [1:0] D,       // Entradas B1 y B0
    output logic [1:0] Q       // Salida registrada
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 2'b00;        // Reset: establecer a 0
        else
            Q <= D;            // Captura en flanco de subida
    end

endmodule
