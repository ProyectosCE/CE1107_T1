module BCD_seven_seg(
	input logic [3:0] a,
	output logic [6:0] seg0

);
	/* Segmentos del primer dígito */
	/* Segmentos del primer dígito */
    logic [6:0] seg0_internal;
    assign seg0_internal[6] = a[1] | a[3] | (~a[2] & ~a[0]) | (a[2] & a[0]);
    assign seg0_internal[5] = ~a[2] | (a[1] & a[0]) | (~a[1] & ~a[0]);
    assign seg0_internal[4] = ~a[1] | a[2] | a[0];
    assign seg0_internal[3] = a[3] | (~a[2] & ~a[0]) | (~a[2] & a[1]) | (a[1] & ~a[0]) | (a[2] & ~a[1] & a[0]);
    assign seg0_internal[2] = (~a[2] & ~a[0]) | (a[1] & ~a[0]);
    assign seg0_internal[1] = a[3] | (a[2] & ~a[0]) | (~a[1] & ~a[0]) | (a[2] & ~a[1]);
    assign seg0_internal[0] = a[3] | (~a[2] & a[1]) | (a[2] & ~a[0]) | (a[2] & ~a[1]);

  
    assign seg0 = ~seg0_internal;





endmodule