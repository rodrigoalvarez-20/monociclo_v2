module decoder (
	input [6:0]	opcode_i,
	output reg	rfwrite_o,
	//output reg	alusrc_o,
	//output reg 	memwrite_o,
	//output reg 	memread_o,
	//output reg	memtoreg_o,
	//output reg	branch_o,
	//output reg	jal_o
);


	always @(*)
	begin
		case (opcode_i)
			7'b0110011: 		// Tipo R
				begin
					rfwrite_o	= 1'b1;
					//alusrc_o		= 1'b0;//Las tipo R no tienen inmediatos
					//memwrite_o	= 1'b0;
					//memread_o	= 1'b0;
					//memtoreg_o	= 1'b0;
					//branch_o		= 1'b0;
					//jal_o			= 1'b0;
				end
			7'b0010011:			// Tipo I
				begin
					rfwrite_o	= 1'b1;
					//alusrc_o		= 1'b1;
					//memwrite_o	= 1'b0;
					//memread_o	= 1'b0;
					//memtoreg_o	= 1'b0;
					//branch_o		= 1'b0;
					//jal_o			= 1'b0;
				end
			7'b0000011:			// Tipo L
				begin
					rfwrite_o	= 1'b1;
					//alusrc_o		= 1'b1;
					//memwrite_o	= 1'b0;
					//memread_o	= 1'b1;
					//memtoreg_o	= 1'b1;
					//branch_o		= 1'b0;
					//jal_o			= 1'b0;
				end
			7'b0100011:			// Tipo S
				begin
					rfwrite_o	= 1'b0;
					//alusrc_o		= 1'b1;
					//memwrite_o	= 1'b1;
					//memread_o	= 1'b0;
					//memtoreg_o	= 1'b0;
					//branch_o		= 1'b0;
					//jal_o			= 1'b0;
				end
			7'b1100011:			// Tipo B
				begin
					rfwrite_o	= 1'b0;
					//alusrc_o		= 1'b0;//Suma 2 registros y el inmediato con extension de signo se usa para sumarse al program counter.
					//memwrite_o	= 1'b0;
					//memread_o	= 1'b0;
					//memtoreg_o	= 1'b0;
					//branch_o		= 1'b1;
					//jal_o			= 1'b0;
				end
			7'b1101111:			// Tipo J
				begin
					rfwrite_o	= 1'b1;
					//alusrc_o		= 1'b0;//No necesita de Execute para funcionar
					//memwrite_o	= 1'b0;
					//memread_o	= 1'b0;
					//memtoreg_o	= 1'b0;
					//branch_o		= 1'b0;
					//jal_o			= 1'b1;
				end
			default:
				begin
					rfwrite_o	= 1'b0;
					//alusrc_o		= 1'b0;
					//memwrite_o	= 1'b0;
					//memread_o	= 1'b0;
					//memtoreg_o	= 1'b0;
					//branch_o		= 1'b0;
					//jal_o			= 1'b1;//Si hay una instruccion llena de 0s, el sign extend dara un 0 como salida, y el program counter hara un salto a la misma linea de codigo, entrando en bucle y "terminando el programa"
				end
		endcase
	end

endmodule
