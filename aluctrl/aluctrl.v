module aluctrl(
    input [6:0] aluop_i,
    input func7_i,  // Asumimos que es el segundo bit más significativo de func7 original
    input [2:0] func3_i,
    output reg [3:0] aluoperacion_o,
    output reg negzero_o
);

	always @(*) begin
		case (aluop_i)
			7'b0110011: begin // Tipo R
				 case ({func7_i, func3_i})
					  4'b0000: aluoperacion_o = 4'b0000; // Suma (ADD)
					  4'b1000: aluoperacion_o = 4'b0100; // Resta (SUB)
					  4'b0010: aluoperacion_o = 4'b0101; // SLT
					  4'b0011: aluoperacion_o = 4'b0110; // SLTU
					  4'b0111: aluoperacion_o = 4'b0001; // AND
					  4'b0110: aluoperacion_o = 4'b0010; // OR
					  4'b0100: aluoperacion_o = 4'b0011; // XOR
					  4'b0001: aluoperacion_o = 4'b1000; // SLL
					  4'b0101: aluoperacion_o = 4'b1001; // SRL
					  4'b1101: aluoperacion_o = 4'b1010; // SRA
					  default: aluoperacion_o = 4'b1111;
				 endcase
				 negzero_o = 0;
			end	
			7'b0010011: begin // Tipo I (Inmediato)
				 case (func3_i)
					  3'b000: aluoperacion_o = 4'b0000; // ADDI
					  3'b010: aluoperacion_o = 4'b0101; // SLTI
					  3'b011: aluoperacion_o = 4'b0110; // SLTIU
					  3'b100: aluoperacion_o = 4'b0011; // XORI
					  3'b110: aluoperacion_o = 4'b0010; // ORI
					  3'b111: aluoperacion_o = 4'b0001; // ANDI
					  3'b001: aluoperacion_o = 4'b1000; // SLLI
					  3'b101: aluoperacion_o = (func7_i == 1'b0) ? 4'b1001 : 4'b1010; // SRLI, SRAI
					  default: aluoperacion_o = 4'b1111;
				endcase
				 negzero_o = 0;
			end
			7'b0000011: begin // Tipo I (Load)
				 aluoperacion_o = 4'b0000; // Operaciones de carga utilizan Suma
				 negzero_o = 0;
			end
			7'b0100011: begin // Tipo S (Store)
				 aluoperacion_o = 4'b0000; // Operaciones de almacenamiento utilizan Suma
				 negzero_o = 0;
			end
				
			7'b1100011: // Tipo B (Branches)
				 case (func3_i)
					  3'b000: begin // BEQ utiliza la resta
							aluoperacion_o = 4'b0100;
							negzero_o = 1'b0;
					  end
					  3'b001: begin // BNE utiliza la resta
							aluoperacion_o = 4'b0100;
							negzero_o = 1'b1;
					  end
					  3'b100: begin // BLT utiliza SLT
							aluoperacion_o = 4'b0101;
							negzero_o = 1'b1;
					  end
					  3'b101: begin // BGE utiliza SLT
							aluoperacion_o = 4'b0101;
							negzero_o = 1'b0;
					  end
					  3'b110: begin // BLTU utiliza SLTU
							aluoperacion_o = 4'b0110;
							negzero_o = 1'b1;
					  end
					  3'b111: begin // BGEU utiliza SLTU
							aluoperacion_o = 4'b0110;
							negzero_o = 1'b0;
					  end
					  default: begin
							aluoperacion_o = 4'b1111;
							negzero_o = 1'b0;
					  end
				 endcase
			default: begin
				aluoperacion_o = 4'b1111;
				negzero_o = 1'b0;
			end
		endcase
	end
endmodule
