//-----------------------------------------------------------------------------
// Module: BCDDecoder
// Description: Decodifica un valor BCD de 4 bits en señales de display 7 segmentos
// Inputs: in_bcd (A, B, 0, 0)
// Outputs: seg (g a a) -> Display de 7 segmentos (activo bajo si se desea)
//-----------------------------------------------------------------------------
module BCDDecoder (
    input  logic [3:0] in_bcd,     // {A, B, 0, 0}
    output logic [6:0] seg         // g f e d c b a
);

    always_comb begin
        case (in_bcd)
            4'b0000: seg = 7'b1000000; // 0 
            4'b0001: seg = 7'b1111001; // 1 
            4'b0010: seg = 7'b0100100; // 2 
            4'b0011: seg = 7'b0110000; // 3 
            default: seg = 7'b1111111; // Apagar segmentos
        endcase
    end

endmodule
