// Módulo superalu: ALU extendida para N bits
module superalu #(parameter N = 32)(
    input [N-1:0] a_i,       // Entrada A de N bits
    input [N-1:0] b_i,       // Entrada B de N bits
    input [3:0] ope_i,       // Código de operación de 4 bits
    input negzero_i,
    output reg [N-1:0] res_o,// Resultado de N bits
    output c_o,              // Carry de salida
    output zeroflag_o        // Indicador de resultado cero
);

    wire [N-1:0] alu_res;     // Resultado intermedio de la ALU
    wire [N-1:0] shift_res;   // Resultado de operaciones de desplazamiento
    wire [N:0] carryint_w;    // Acarreos internos de N+1 bits
    wire zeroflag_w;

    // Inicializa el primer acarreo según ope_i[2]
    assign carryint_w[0] = ope_i[2];

    // Generación de N instancias del módulo ALU
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin: alu_block
            alu alu_N(
                .a_i(a_i[i]),
                .b_i(b_i[i]),
                .c_i(carryint_w[i]),
                .ope_i(ope_i[2:0]),
                .invert_i(ope_i[2]),
                .res_o(alu_res[i]),
                .c_o(carryint_w[i+1])
            );
        end
    endgenerate
	 
	// Instancia del módulo shift
	shift #(.N(N)) shift_unit(
		 .a_i(a_i),
		 .b_i(b_i),
		 .ope_i(ope_i[1:0]),
		 .res_o(shift_res)
	);

    // Asignación de la señal de carry de salida
    assign c_o = carryint_w[N];

    // Selección entre operaciones de desplazamiento y ALU normal
    always @(*) begin
		 if (ope_i[3] == 1'b1) begin
			  res_o = shift_res;  // Resultado del módulo shift
		 end 
		 else begin
            case (ope_i[1:0])
                2'b01: res_o = {{N-1{1'b0}}, alu_res[N-1]}; // SLT
                2'b10: res_o = {{N-1{1'b0}}, ~c_o}; // SLTU
                default: res_o = alu_res;
            endcase
		 end
    end

    // Indicador de resultado cero
    assign zeroflag_w = ~(|res_o);
    assign zeroflag_o = (negzero_i) ? ~zeroflag_w : zeroflag_w;

endmodule
