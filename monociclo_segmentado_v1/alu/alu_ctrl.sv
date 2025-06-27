import	lagarto0_pkg::*;


module alu_ctrl(
    input 		[2:0] aluop_i,
    input 				f7_i,
    input 		[2:0] f3_i,
    output reg [3:0] ex_ope_o
);
	
	always @(*) begin
		case (aluop_i)
			3'b001: begin // Tipo R
				 case (f3_i)
					  3'b000: 
						begin
							if (f7_i)
								begin
									ex_ope_o = 4'b0100; // Resta
								end
							else
								begin
									ex_ope_o = 4'b0000; // Suma
								end
						end
						3'b001:
							ex_ope_o = 4'b1000; // sll
						3'b010:
							ex_ope_o = 4'b0111; // slt
						3'b011:
							ex_ope_o = 4'b0110; // sltu
						3'b100:
							ex_ope_o = 4'b0011;  //xor
						3'b101:
							ex_ope_o = ~(f7_i) ? 4'b1010 : 4'b1011; // SRL, SRA
						3'b110:
							ex_ope_o = 4'b0010; //or
						3'b111:
							ex_ope_o = 4'b0001; //and
						default:
							ex_ope_o = 4'b1111; //default
				 endcase
				 //negzero_o = 0;
			end
			3'b010: // Tipo I
				case (f3_i)
					3'b000: 
						ex_ope_o = 4'b0000; //Suma
					3'b010:
						ex_ope_o = 4'b0111; // SLTI
					3'b011:
						ex_ope_o = 4'b0110; // SLTU
					3'b100:
						ex_ope_o = 4'b0011; // XOR
					3'b110:
						ex_ope_o = 4'b0010; // OR
					3'b111:
						ex_ope_o = 4'b0001; // AND
					3'b001:
						ex_ope_o = 4'b1000; // SLL
					3'b101:
						ex_ope_o = ~(f7_i) ? 4'b1010 : 4'b1011; // SRL, SRA
					default:
						ex_ope_o = 4'b1111; //default
				endcase
			3'b011: // Tipo L
				ex_ope_o = 4'b0000; //Suma
			3'b100: // Store (Tipo S)
				ex_ope_o = 4'b0000; //Suma
			3'b101: // Tipo B
				begin
					case (f3_i)
						3'b000:
							ex_ope_o = 4'b0011;
						3'b001:
							ex_ope_o	= 4'b0011;
						3'b100:
							ex_ope_o = 4'b0111;
						3'b101:
							ex_ope_o	= 4'b0111;
						default:
							ex_ope_o	= 4'b1111;
					endcase
				end
			default:
				ex_ope_o = 4'b1111;
		endcase
	end
endmodule
