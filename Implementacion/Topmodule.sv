//-----------------------------------------------------------------------------
// Topmodule.sv
// Descripción: Módulo superior que integra todos los componentes del sistema.
//-----------------------------------------------------------------------------

module Topmodule (
input [3:0] A,
input inrst,clk,
output logic Out_M,
output [6:0] seg

);

logic rst;

assign rst = ~inrst;


logic [1:0] enco_for_two_out;

Enco_Four_Two enco_ins(
.A(A),
.B(enco_for_two_out)

);

logic [1:0] Out_Sum;

Enco_Sum inst_Enco_sum(
    .A(enco_for_two_out),
    .B({z1,z0}),
    .C(Out_Sum)

);

logic z1,z0;

Flip_Flop_D flip_flop0 (
    .D(Out_Sum[0]),
    .clk(clk),
    .rst(rst), 
    .Q(z0)
);

Flip_Flop_D  flip_flop1(
    .D(Out_Sum[1]),
    .clk(clk),
    .rst(rst), 
    .Q(z1)
);

BCD_seven_seg seven_seg_inst(
	.a({2'b00,z1,z0}),
	.seg0(seg)

);

desacople desa_inst(
	.a({z1, z0}),
	.y(Out_M)
);

endmodule

   
