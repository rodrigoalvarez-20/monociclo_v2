import	lagarto0_pkg::*;

module fetch (
	input													clk_i,
	input													rst_ni,
	input			[ICACHE_LINE_SIZE-1:0]			if_instblock_i,
	input													hit_i,
	output reg	[ADDR_SIZE-1:0]					pc_next_o,
	output		[ISA_SIZE-1:0]						if_inst_o
	// Prueba
	//output wire											iq_full_w,
	//output wire											iq_empty_w
);
	//Sección de declaración de señales
	// Descomentar
	wire								iq_full_w;
	wire								iq_empty_w;
	wire		[ADDR_SIZE-1:0]	pc_w;

	//Inicialización de señales
	//assign			rst_addr_w = 32'b0;
	
	//Definición de un FFD
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			begin
				pc_next_o <= RESET_ADDRESS;
			end
		else
			begin
				if (iq_full_w)
					begin
						pc_next_o <= pc_next_o;
					end
				else
					begin
						pc_next_o <= pc_w;
					end
			end
	end
	
	assign	pc_w	= pc_next_o + 64'h4;
	
	/*icache	icachel1(
		.clk_i			(clk_i),
		.rst_ni			(rst_ni),
		.pc_i				(pc_next_r),
		.we_i				(1'b0),
		.inst_i			({ISA_SIZE{1'b0}}),
		.re_i				(1'b1),
		.inst_o			(if_instblock_o),
		.hit				(hit_o)
	);*/
	
	iqueue IQ_Fetch(
		.clk_i (clk_i),
		.rst_ni (rst_ni),
		.wr_i (hit_i),
		.data_i (if_instblock_i),
		.rd_i (1'b1),
		.data_o (if_inst_o),
		.full_o (iq_full_w),
		.empty_o (iq_empty_w)
	);
	
endmodule 