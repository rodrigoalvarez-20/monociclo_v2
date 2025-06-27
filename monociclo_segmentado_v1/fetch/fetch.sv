import	lagarto0_pkg::*;

module fetch (
	input													clk_i,
	input													rst_ni,
	input													lock_i,
	input			[ICACHE_LINE_SIZE-1:0]			if_instblock_i,
	input													hit_i,
	input			[ADDR_SIZE-1:0]					pcbr_i,
	input													branch_i,
	input			[ADDR_SIZE-1:0]					icachepc_i,
	output reg	[ADDR_SIZE-1:0]					pc_next_o,
	output		[ISA_SIZE-1:0]						if_inst_o
);
	//Sección de declaración de señales
	// Descomentar
	wire								iq_full_w;
	wire								iq_empty_w;
	wire		[ADDR_SIZE-1:0]	pc_w;
	wire		[ADDR_SIZE-1:0]	BTPC_address;
	
	
	//Definición de un FFD
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			begin
				pc_next_o <= RESET_ADDRESS;
			end
		else
			begin
				if (iq_full_w || lock_i)
					begin
						pc_next_o <= pc_next_o;
					end
				else
					begin
						pc_next_o <= BTPC_address; //pc_w;
					end
			end
	end
	
	assign	pc_w	= pc_next_o + 64'h4;
	assign	BTPC_address	= (branch_i) ? pcbr_i : pc_w;
	
	iqueue IQ_Fetch(
		.clk_i (clk_i),
		.rst_ni (rst_ni),
		.wr_i (hit_i),
		.data_i (if_instblock_i),
		.rd_i (1'b1),
		.data_o (if_inst_o),
		.full_o (iq_full_w),
		.empty_o (iq_empty_w),
		.pc_i		(icachepc_i)
	);
	
endmodule 