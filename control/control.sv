import	lagarto0_pkg::*;

module control (
	// Entradas
	input 		[ISA_SIZE-1:0]		inst_i,
	input			[ADDR_SIZE-1:0]	pc_i,
	//Salidas
	output reg							Inst_Branch_o,
	output reg							MEM_read_o,
	output reg							MEM_reg_o,
	output reg 	[1:0]					ALU_Op_o,
	output reg							MEM_Write_o,
	output reg							ALU_Src_o,
	output reg							Reg_Write_o,
	output reg							J_Type_o,
	output reg	[ADDR_SIZE-1:0]	PC_dec_o
);

	wire			[6:0]					opcode_w;
	
	assign opcode_w = inst_i[6:0];
	
	always @(*)
	begin
		case (opcode_w)
			7'b0110011: 		// Tipo R
				begin
					Inst_Branch_o 	= 1'b0;
					MEM_read_o		= 1'b0;
					MEM_reg_o		= 1'b0;
					ALU_Op_o			= 2'b10;
					MEM_Write_o		= 1'b0;
					ALU_Src_o		= 1'b0;
					Reg_Write_o		= 1'b1;
					J_Type_o			= 1'b0;
					PC_dec_o			= pc_i;
				end
			7'b0010011:			// Tipo I
				begin
					Inst_Branch_o 	= 1'b0;
					MEM_read_o		= 1'b0;
					MEM_reg_o		= 1'b0;
					ALU_Op_o			= 2'b11;
					MEM_Write_o		= 1'b0;
					ALU_Src_o		= 1'b1;
					Reg_Write_o		= 1'b1;
					J_Type_o			= 1'b0;
					PC_dec_o			= pc_i;
				end
			7'b0000011:			// Tipo L
				begin
					Inst_Branch_o 	= 1'b0;
					MEM_read_o		= 1'b1;
					MEM_reg_o		= 1'b1;
					ALU_Op_o			= 2'b11;
					MEM_Write_o		= 1'b0;
					ALU_Src_o		= 1'b1;
					Reg_Write_o		= 1'b1;
					J_Type_o			= 1'b0;
					PC_dec_o			= pc_i;
				end
			7'b0100011:			// Tipo S
				begin
					Inst_Branch_o 	= 1'b0;
					MEM_read_o		= 1'b0;
					MEM_reg_o		= 1'b0;
					ALU_Op_o			= 2'b00;
					MEM_Write_o		= 1'b1;
					ALU_Src_o		= 1'b1;
					Reg_Write_o		= 1'b0;
					J_Type_o			= 1'b0;
					PC_dec_o			= pc_i;
				end
			7'b1100011:			// Tipo B
				begin
					Inst_Branch_o 	= 1'b1;
					MEM_read_o		= 1'b0;
					MEM_reg_o		= 1'b0;
					ALU_Op_o			= 2'b01;
					MEM_Write_o		= 1'b0;
					ALU_Src_o		= 1'b0;
					Reg_Write_o		= 1'b0;
					J_Type_o			= 1'b0;
					PC_dec_o			= pc_i;
				end
			7'b1101111:			// Tipo J
				begin
					Inst_Branch_o 	= 1'b0;
					MEM_read_o		= 1'b0;
					MEM_reg_o		= 1'b0;
					ALU_Op_o			= 2'b00;
					MEM_Write_o		= 1'b0;
					ALU_Src_o		= 1'b0;
					Reg_Write_o		= 1'b1;
					J_Type_o			= 1'b1;
					PC_dec_o			= pc_i;
				end
			default:
				begin
					Inst_Branch_o 	= 1'b0;
					MEM_read_o		= 1'b0;
					MEM_reg_o		= 1'b0;
					ALU_Op_o			= 2'b00;
					MEM_Write_o		= 1'b0;
					ALU_Src_o		= 1'b0;
					Reg_Write_o		= 1'b0;
					J_Type_o			= 1'b0;
					PC_dec_o			= pc_i;
				end
		endcase
	end

endmodule
