import	lagarto0_pkg::*;

module regfile (
	input						clk_i,
	//Escritura
	input			[4:0]		rd_i,
	input			[31:0]	datord_i,
	input						wren_i,
	//Lectura 1
	input			[4:0]		rs1_i,
	output		[31:0]	dators1_o,
	//Lectura 2
	input			[4:0]		rs2_i,
	output		[31:0]	dators2_o
);
	
	//Definición del banco
	reg			[31:0]	GPR	[0:31];
	
	//Asignar un valor al registo 0 (zero, x0)
	initial
	begin
		GPR[0]	=	32'b0;
	end
	
	//Puerto de escritura
	always @(posedge clk_i)
	begin
		if (wren_i && rd_i > 5'b0)
			GPR[rd_i]	<= 	datord_i;
	end
	
	//Primer puerto de lectura
	assign	dators1_o	=	GPR[rs1_i];
	//assign	dators1_o	=	(rs1_i == 5'b0) ? 32'b0 : GPR[rs1_i];
	//Segundo puerto de lectura
	assign	dators2_o	=	GPR[rs2_i];

endmodule 