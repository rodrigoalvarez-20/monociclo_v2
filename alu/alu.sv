import	lagarto0_pkg::*;


module ALU (
	input			[XLEN-1:0]		opea_i,
	input			[XLEN-1:0]		opeb_i,
	input			[4:0]				ex_ope_i,
	output reg	[XLEN-1:0]		res_o,
	output 		[XLEN-1:0]		zeroflag_o,
	output 							c_o
);


	always @(*)
	begin
		case(ex_ope_i)
				4'b0000: // Suma
					{c_o, res_o} = opea_i + opeb_i + ex_ope_i[2];
				4'b0100: // Resta
					{c_o, res_o} = opea_i + ~opeb_i + ex_ope_i[2];
				4'b1000: // SLL
					res_o = opea_i << opeb_i[5:0];
				4'b0111: // SLT
					if ($signed(opea_i) < $signed(opeb_i))
						res_o = {{(XLEN-1){1'b0}}, 1'b1}; // Cambiar por parametro
					else
						res_o = {XLEN{1'b0}}; // Cambiar por parametro
				4'b0110: // SLTU
					if (opea_i < opeb_i)
						res_o =  {{(XLEN-1){1'b0}}, 1'b1}; // Cambiar por parametro
					else
						res_o = {XLEN{1'b0}}; // Cambiar por parametro
				4'b0011: // XOR
					res_o = opea_i ^ opeb_i;
				4'b1010: // SRL
					res_o = opea_i >> opeb_i[5:0];
				4'b1011: // SRA
					res_o = opea_i >>> opeb_i[5:0];
				4'b0010: // OR
					res_o = opea_i | opeb_i;
				4'b0001: // AND
					res_o = opea_i & opeb_i;
				default:
					res_o = {XLEN{1'b0}};
			endcase
	end
	// Calcular zeroflag
	
	assign zeroflag_o = ~(|(res_o));
	
endmodule 