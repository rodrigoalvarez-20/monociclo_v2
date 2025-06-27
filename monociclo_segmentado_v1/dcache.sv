import	lagarto0_pkg::*;

module dcache(
	//Señales generales
	input											clk_i,
	input											rst_ni,
	//bus de direcciones
	input			[ADDR_SIZE-1:0]			addr_i,
	//Bus de datos de entrada
	input											we_i,
	input			[DCACHE_LINE_SIZE-1:0]	dato_i,
	//Bus de datos de salida
	input											re_i,
	output		[DCACHE_LINE_SIZE-1:0]	dato_o,
	//Señales de memoria
	output										hit_o
);

	//Definición de la memoria
	reg			[DCACHE_LINE_SIZE-1:0]	memoria	[0:DCACHE_MEM_DEPTH-1];
	reg			[DCACHE_MEM_DEPTH-1:0]	valid;
	reg			[DCACHE_VPN_SIZE-1:0]	tag		[0:DCACHE_MEM_DEPTH-1];
	wire			[DCACHE_IDX_SIZE-1:0]	idx_w;
	wire			[DCACHE_VPN_SIZE-1:0]	tag_iw;
	reg			[DCACHE_IDX_SIZE-1:0]	idx_r;
	wire			[DCACHE_VPN_SIZE-1:0]	tag_mw;
	wire											valid_w;
	wire											hit_w;
	
	
	assign		idx_w 	= addr_i[DCACHE_IDX_SIZE+DLINE_BYTE_OFFSET:DLINE_BYTE_OFFSET];
	assign		tag_iw	= addr_i[VADD_SIZE:DCACHE_IDX_SIZE+DLINE_BYTE_OFFSET+1];
	

	//Puerto de Escritura
	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			valid = {DCACHE_MEM_DEPTH{1'b0}};
		else
			begin
				if (we_i)
				begin
					memoria[idx_w] <= dato_i;
					valid[idx_w]	<=	1'b1;
					tag[idx_w]		<=	tag_iw;
				end
			end
		idx_r <= idx_w;
	end
	
	assign	tag_mw 	= tag[idx_r];
	assign	valid_w	= valid[idx_r];
	
	assign 	hit_w = ((tag_mw == tag_iw) && valid_w) ? 1'b1 : 1'b0;
	assign 	hit_o = (hit_w && re_i);
	assign	dato_o 	= (hit_w) ? memoria[idx_r] : {DCACHE_LINE_SIZE{1'b0}};

	

endmodule 