import	lagarto0_pkg::*;

module muxrs(
	input			[1:0] 		fwd_rs_i,
	input			[XLEN-1:0]	dato1_i,
	input			[XLEN-1:0]	dato2_i,
	input			[XLEN-1:0]	dato3_i,
	output reg	[XLEN-1:0]	dato_o
);

	always @(*)
	begin
		case (fwd_rs_i)
			2'b01:
				dato_o = dato1_i;
			2'b10:
				dato_o = dato2_i;
			2'b00:
				dato_o = dato3_i;
			default:
				dato_o = {XLEN{1'b0}};
		endcase
	end

endmodule 