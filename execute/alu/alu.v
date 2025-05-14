// Módulo alu: Unidad Aritmética y Lógica de un bit
module alu(
    input a_i,       // Entrada A
    input b_i,       // Entrada B
    input c_i,       // Carry de entrada
    input [2:0] ope_i,  // Código de operación
    input invert_i,     // Indicador de inversión para B
    output reg res_o,   // Resultado de la operación ALU
    output c_o          // Carry de salida
);

    // Señales para operaciones lógicas básicas
    wire aandb_w; // AND de A y B
    wire aorb_w;  // OR de A y B
    wire axorb_w; // XOR de A y B
    wire fa1_w;   // Salida del sumador completo
    wire nob_w;   // B invertido
    wire b_w;     // Selector entre B y B invertido

    // Inversión de b para operaciones como resta
    assign nob_w = ~b_i;
    assign b_w = (invert_i) ? nob_w : b_i;

    // Operaciones lógicas estructurales
    and and1 (aandb_w, a_i, b_w);
    or or1 (aorb_w, a_i, b_w);
    xor xor1 (axorb_w, a_i, b_w);

    // Sumador completo para operaciones aritméticas
    fulladder fa1(
        .a_i(a_i),
        .b_i(b_w),
        .c_i(c_i),
        .s_o(fa1_w),
        .c_o(c_o)
    );
	 
	 // Implementar multiplicacion
	 
	 // Implementar division

    // Lógica de control para seleccionar la operación ALU según ope_i
    always @(*) begin
        case (ope_i)
            3'b000: res_o = fa1_w; // Suma
            3'b001: res_o = aandb_w; // AND
            3'b010: res_o = aorb_w; // OR
            3'b011: res_o = axorb_w; // XOR
            3'b100: res_o = fa1_w; // Resta
            3'b101: res_o = fa1_w; // SLT
            3'b110: res_o = fa1_w; // SLTU
            default: res_o = 1'b0;
        endcase
    end
endmodule
