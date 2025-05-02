//-----------------------------------------------------------------------------
// Topmodule.sv
// Descripción: Módulo superior que integra todos los componentes del sistema.
//-----------------------------------------------------------------------------

module Topmodule (
    input  logic        CLOCK_50,
    input  logic [9:0]  SW,
    input  logic [1:0]  KEY,
    output logic [6:0]  HEX0,
    output logic [9:0]  LED
);
    // Entradas A (izquierda a derecha)
    logic [1:0] A;
    assign A[0] = SW[1]; // A0
    assign A[1] = SW[0]; // A1

    // Entradas B (derecha a izquierda)
    logic [1:0] B_input;
    assign B_input[0] = SW[9]; // B0
    assign B_input[1] = SW[8]; // B1

    // Salida del registro (Q)
    logic [1:0] B_reg;

    // Salida de decodificador 1 (A y B para BCD)
    logic [1:0] AB_out;

    // Entrada para el display BCD (A, B, 0, 0)
    logic [3:0] bcd_input;
    assign bcd_input = {AB_out, 2'b00};

    // Salida a segmentos
    logic [6:0] seg;

    // LED del decodificador 2
    logic led_dec2;

    // Registro tipo D
    DFlipFlop2bit reg_b (
        .clk(~KEY[0]),
        .rst(~KEY[1]),
        .D(B_input),
        .Q(B_reg)
    );

    // Decodificador 1
    Decoder1 dec1_inst (
        .A_input(A),
        .B_input(B_reg),
        .AB_out(AB_out)
    );

    // BCD Decoder
    BCDDecoder bcd_inst (
        .in_bcd(bcd_input),
        .seg(seg)
    );

    // Display Driver
    DisplayDriver display_inst (
        .seg(seg),
        .HEX0(HEX0)
    );

    // Decodificador 2
    Decoder2 dec2_inst (
        .A0(A[0]),
        .A1(A[1]),
        .led_out(led_dec2)
    );

    // LED0 activo según Decoder2
    assign LED[0] = led_dec2;


endmodule
