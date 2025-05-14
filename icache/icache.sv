import	lagarto0_pkg::*;

module icache(
	//Señales generales
	input											clk_i,
	input											rst_ni,
	//bus de direcciones
	input			[ADDR_SIZE-1:0]			pc_i,
	//Bus de datos de entrada
	input											we_i,
	input			[ICACHE_LINE_SIZE-1:0]	inst_i,
	//Bus de datos de salida
	input											re_i,
	output		[ICACHE_LINE_SIZE-1:0]	inst_o,
	//Señales de memoria
	output										hit
);

	//Definición de la memoria
	reg			[ICACHE_LINE_SIZE-1:0]	memoria	[0:ICACHE_MEM_DEPTH-1];
	reg			[ICACHE_MEM_DEPTH-1:0]	valid;
	reg			[ICACHE_VPN_SIZE-1:0]	tag		[0:ICACHE_MEM_DEPTH-1];
	wire			[ICACHE_IDX_SIZE-1:0]	idx_w;
	wire			[ICACHE_VPN_SIZE-1:0]	tag_iw;
	reg			[ICACHE_IDX_SIZE-1:0]	idx_r;
	wire			[ICACHE_VPN_SIZE-1:0]	tag_mw;
	wire											valid_w;
	
	//Inicializiar memorias
	initial
	begin
		$readmemh("suma.hex",	memoria);
		//$readmemh("valid.bin",	valid);
		$readmemh("tag.hex", 	tag);
	end
	
	//Bus de direcciones
	/*
	  31 - 10		9 - 2			 1- 0
	----------------------------------
	|  TAG		| IDX				| BOff|
	----------------------------------
	000000000000
	000000000100
	000000001000
	000000001100
	000000010000
	
	*/
	assign		idx_w 	= pc_i[ICACHE_IDX_SIZE+ILINE_BYTE_OFFSET:ILINE_BYTE_OFFSET];
	assign		tag_iw	= pc_i[VADD_SIZE:ICACHE_IDX_SIZE+ILINE_BYTE_OFFSET+1];
	

	//Puerto de Escritura
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			valid = 256'h3;
		else
			begin
				if (we_i)
				begin
					memoria[idx_w] <= inst_i;
					valid[idx_w]	<=	1'b1;
					tag[idx_w]		<=	tag_iw;
				end
			end
		idx_r <= idx_w;
	end
	
	assign	tag_mw 	= tag[idx_r];
	assign	valid_w	= valid[idx_r];
	
	assign 	hit = ((tag_mw == tag_iw) && valid_w) ? 1'b1 : 1'b0;
	assign	inst_o 	= (hit) ? memoria[idx_r] : 32'b0;

	

endmodule 