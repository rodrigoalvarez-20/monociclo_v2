import	lagarto0_pkg::*;


module sign_ext(
	inout 		[ISA_SIZE-1:0]		instr_i,
	output reg	[XLEN-1:0]			se_dato_o
);
	
	//
	
	wire 			[6:0]					op_code_w;
	
	assign 								op_code_w = instr_i[6:0];
	
	always @(*)
	begin
		case (op_code_w)
			7'b0010011: // Tipo I
				se_dato_o = {{SE_IMM{instr_i[ISA_SIZE-1]}}, instr_i[ISA_SIZE-1:(SE_IMM - ISA_SIZE)]}; // 31, 31:20
			7'b0000011: // Tipo L
				se_dato_o = {{SE_IMM{instr_i[ISA_SIZE-1]}}, instr_i[ISA_SIZE-1:(SE_IMM - ISA_SIZE)]}; // 31, 31:20
			7'b0100011: // Tipo S
				se_dato_o = {{SE_IMM{instr_i[ISA_SIZE-1]}}, instr_i[31:25], instr_i[11:7]}; // 31, 31:20
			7'b1100011: // Tipo B
				se_dato_o = { {SE_IMM{instr_i[ISA_SIZE-1]}}, instr_i[31], instr_i[7], instr_i[30:25], instr_i[11:8] };
			7'b1100111: // Tipo JALR
				se_dato_o = {{SE_IMM{instr_i[ISA_SIZE-1]}}, instr_i[ISA_SIZE-1:(SE_IMM - ISA_SIZE)]}; // 31, 31:20
			7'b1101111: // Tipo JAL
				se_dato_o = { {SE_JAL{instr_i[ISA_SIZE-1]}}, instr_i[31], instr_i[19:12], instr_i[20], instr_i[30:21] };
			default:
				se_dato_o = {{XLEN{1'b0}}};
		endcase
	end
	
endmodule 