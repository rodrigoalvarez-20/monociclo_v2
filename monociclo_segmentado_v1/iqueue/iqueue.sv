import	lagarto0_pkg::*;
//Implementación de la FIFO usando bits de válido para cada elemento
module iqueue (
	input												clk_i,
	input												rst_ni,
	input												wr_i,
	input				[ISA_SIZE-1:0]	data_i,
	input												rd_i,
	input				[ADDR_SIZE-1:0]			pc_i,
	output reg		[ISA_SIZE-1:0]				data_o,
	output wire										full_o,
	output wire										empty_o
);
	
	always @(*)
	begin
		data_o = data_i;
	end

endmodule 

/*
// Seccion de declaracion de signals
	reg				[IQUEUE_ADDR_SIZE-1:0]	addr_rd;
	reg				[IQUEUE_ADDR_SIZE-1:0]	addr_wr;
	wire 				[ISA_SIZE-1:0] 			inst1_w;
	wire 				[ISA_SIZE-1:0] 			inst2_w;
	
	assign			inst1_w = data_i[ISA_SIZE-1:0];
	assign			inst2_w = data_i[XLEN-1:ISA_SIZE];
	
	// Memorias
	reg				[ISA_SIZE-1:0]	mem	[0:IQUEUE_DEPTH-1];
	reg				[0:IQUEUE_DEPTH-1]	valid;
	
	// Debug
	//reg											mem_init_dbg;
	//reg											mem_rd_dbg;
	
	always @(posedge clk_i)
	begin
		if (!rst_ni)
		begin
			valid		<=	{IQUEUE_DEPTH{1'b0}};
			addr_rd	<=	{IQUEUE_ADDR_SIZE{1'b0}};
			addr_wr	<=	{IQUEUE_ADDR_SIZE{1'b0}};
		end
		else if (wr_i && !full_o)
		begin
			mem[addr_wr]		<=	inst1_w;
			mem[addr_wr+1]		<=	inst2_w;
			valid[addr_wr]		<=	1'b1;
			valid[addr_wr+1]	<=	1'b1;
			addr_wr				<=	addr_wr + 2'b10;
		end
		else if (rd_i && !empty_o)
		begin
			data_o			<=	mem[addr_rd];
			valid[addr_rd]	<=	1'b0;
			addr_rd 			<=	addr_rd + 1'b1;
		end
	end
	
	assign	empty_o = ~(|(valid));
	assign	full_o	= &(valid);

*/