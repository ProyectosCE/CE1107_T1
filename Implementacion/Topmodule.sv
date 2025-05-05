//-----------------------------------------------------------------------------
// Topmodule.sv
// Descripción: Módulo superior que integra todos los componentes del sistema.
//-----------------------------------------------------------------------------

module Topmodule (
    input  logic        CLOCK_50,
    input  logic [6:0]  GPIO_1,        // GPIOs para entradas y salidas externas
    output logic [6:0]  HEX0,          // Display de 7 segmentos más a la derecha
    output logic        GPIO_1_OUT     // GPIO de salida para el desacople
);

    // Entradas A desde sensores fotoresistivos conectados a GPIOs
    logic [1:0] A;
    assign A[0] = GPIO_1[0]; // A0 desde GPIO_1[0]
    assign A[1] = GPIO_1[1]; // A1 desde GPIO_1[1]

    // Entradas B desde sensores fotoresistivos conectados a GPIOs
    logic [1:0] B_input;
    assign B_input[0] = GPIO_1[2]; // B0 desde GPIO_1[2]
    assign B_input[1] = GPIO_1[3]; // B1 desde GPIO_1[3]

    // Entradas para reloj y reset desde botones conectados a GPIOs con pull-down
    logic clk_gpio, rst_gpio;
    assign clk_gpio = GPIO_1[4]; // CLK desde GPIO_1[4]
    assign rst_gpio = GPIO_1[5]; // RESET desde GPIO_1[5]

    // Salida del registro (Q)
    logic [1:0] B_reg;

    // Salida de decodificador 1 (A y B para BCD)
    logic [1:0] AB_out;

    // Entrada para el display BCD (A, B, 0, 0)
    logic [3:0] bcd_input;
    assign bcd_input = {AB_out, 2'b00};

    // Salida a segmentos
    logic [6:0] seg;

    // Señal para el desacople (GPIO de salida)
    logic desacople_out;

    // Registro tipo D
    DFlipFlop2bit reg_b (
        .clk(clk_gpio),
        .rst(rst_gpio),
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
        .desacople_out(desacople_out)
    );

    // Salida hacia transistor de desacople (GPIO de salida)
    assign GPIO_1_OUT = desacople_out; // GPIO de salida para activar motor o LED externo

endmodule
