//-----------------------------------------------------------------------------
// Module: DisplayDriver
// Description: Conecta los segmentos calculados a un display de 7 segmentos
// Inputs: seg (g a a) desde el módulo BCDDecoder
// Outputs: HEX0 (display de 7 segmentos más a la derecha en la FPGA)
//-----------------------------------------------------------------------------
module DisplayDriver (
    input  logic [6:0] seg,     // Segmentos (g to a)
    output logic [6:0] HEX0     // Salida hacia display HEX0
);

    // En caso de display activo bajo:
    assign HEX0 = seg;

endmodule
