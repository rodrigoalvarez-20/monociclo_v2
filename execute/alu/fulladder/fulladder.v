module fulladder(
    input   a_i,    // Entrada A
    input   b_i,    // Entrada B
    input   c_i,    // Carry de entrada
    output  s_o,    // Suma de salida
    output  c_o     // Carry de salida
);

    // Variables internas para las operaciones lógicas
    wire and1_w, and2_w, and3_w, xor1_w;

    // Operaciones lógicas para calcular el carry de salida
    assign and1_w = a_i & c_i;
    assign and2_w = b_i & c_i;
    assign and3_w = a_i & b_i;

    // Operación XOR para calcular la suma
    assign xor1_w = a_i ^ b_i;
    assign s_o = xor1_w ^ c_i;

    // Calcula el carry de salida
    assign c_o = (and1_w | and2_w) | and3_w;

endmodule
