module signextend (
    input [31:0] instr_i,
    output reg [31:0] dato_o
);

    always @(*)
    begin
        case (instr_i[6:0])
            7'b0010011: // Tipo I (ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI)
					// Identifica instrucciones de desplazamiento
                if (instr_i[14:12] == 3'b001 || // SLLI
                    instr_i[14:12] == 3'b101) begin // SRLI, SRAI
                    // Usa solo los 5 bits de shift amount para desplazamiento
                    dato_o = {27'b0, instr_i[24:20]};
                end else if (instr_i[14:12] == 3'b011) begin // SLTIU
                    // Extensión con ceros para SLTIU
                    dato_o = {20'b0, instr_i[31:20]};
                end else begin
                    // Extensión de signo para las demás instrucciones tipo I
                    dato_o = {{20{instr_i[31]}}, instr_i[31:20]};
                end
            7'b0000011: // Tipo L (I Cargas - Load)
                dato_o = {{20{instr_i[31]}}, instr_i[31:20]};
            7'b0100011: // Tipo S (Almacenamiento - Store)
                dato_o = {{20{instr_i[31]}}, instr_i[31:25], instr_i[11:7]};
            7'b1100011: // Tipo B (Branches)
                dato_o = {{20{instr_i[31]}}, instr_i[31], instr_i[7], instr_i[30:25], instr_i[11:8]};
            7'b1101111: // Tipo J (JAL)
                dato_o = {{12{instr_i[31]}}, instr_i[31], instr_i[19:12], instr_i[20], instr_i[30:21]};
            7'b1100111: // Tipo J (I JALR)
                dato_o = {{20{instr_i[31]}}, instr_i[31:20]};
            default:
                dato_o = 32'b0;
        endcase
    end

endmodule
