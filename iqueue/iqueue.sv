import	lagarto0_pkg::*;
//Implementación de la FIFO usando bits de válido para cada elemento
module iqueue (
	input												clk_i,
	input												rst_ni,
	input												wr_i,
	input				[ICACHE_LINE_SIZE-1:0]	data_i,
	input												rd_i,
	output reg		[ISA_SIZE-1:0]				data_o,
	output wire										full_o,
	output wire										empty_o
);
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

endmodule 
module fifocircular_tb();
	reg 					clk_i;
	reg 					rst_ni;
	reg 					wr_i;
	reg 					rd_i;
	reg		[7:0]		data_i;
	wire		[7:0]		data_o;
	wire		 			empty_o;      // Flag FIFO empty_o
	wire		 			full_o;

	initial
	begin
		clk_i	= 1'b1;
		rst_ni	= 1'b0;
		wr_i		= 1'b0;
		rd_i		= 1'b0;
		data_i	= 1'b0;
		#200
			rst_ni = 1'b1;
	end
	
	fifo_circular	DUT (
		.clk_i		(clk_i	),
		.rst_ni		(rst_ni	),
		.wr_i		(wr_i	),	
		.rd_i		(rd_i	),	
		.data_i		(data_i	),
		.data_o		(data_o	),
		.empty_o	(empty_o),	
		.full_o		(full_o	)
	);
	
	always
	begin
		#50
			clk_i = ~clk_i;
	end
	
	always
	begin
		//Escrituras
		#300
			wr_i		=	1'b1;
			data_i	= 	8'hF;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'hE;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'hD;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'hC;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'hB;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'hA;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h9;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h8;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h7;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h6;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h5;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h4;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h3;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h2;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h1;
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'h0;
		//Hasta aquí debe estar llena, y si intentamos escribir
		//No debería dejar
		#100
			wr_i		=	1'b0;
		#100
			wr_i		=	1'b1;
			data_i	= 	8'hFF;
		#100
			wr_i		=	1'b0;
		//Aquí leemos
		#300
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		//Terminamos de leer, ya no debería dejar
		#100
			rd_i		=	1'b0;
		#100
			rd_i		=	1'b1;
		#100
			rd_i		=	1'b0;
	end
endmodule 