	import	lagarto0_pkg::*;
	
	
	module monociclo (
		input						clk_i, 
		input						rst_ni,
		output 		[31:0]	monitor_o
	);
		// Asignacion de la variable monitor para depuracion de datos
		assign					monitor_o	=	rf_dators1_w;
		// Seccion de declaracion de señales
		//wire			[31:0]	if_inst_w;
		//wire			[31:0]	if_inst_o;
		wire			[ICACHE_LINE_SIZE-1:0] 	if_instblock_w;
		wire											hit_w;
		wire			[6:0]							opcode_w;
		//RF - Register File write
		wire						rf_write_w;
		wire			[4:0]		rf_rd_w ;
		wire			[4:0]		rf_rs1_w;
		wire			[4:0]		rf_rs2_w;
		wire			[31:0]	rf_dators1_w;
		wire			[31:0]	rf_dators2_w;
		//Asignación de señales
		assign					opcode_w =	if_instblock_w[6:0];
		assign					rf_rd_w 	=	if_instblock_w[11:7];
		assign					rf_rs1_w	=	if_instblock_w[19:15];
		assign					rf_rs2_w	=	if_instblock_w[24:20];
		
		
		//Etapa de Fetch
		fetch fetch_stg(
			.clk_i		(clk_i),
			.rst_ni		(rst_ni),
			.if_inst_o	(if_instblock_w),
			.hit_o		(hit_w)
		);
		
		// Cola de instrucciones
		iqueue IQ_Fetch(
				.clk_i (clk_i),
				.rst_ni (rst_ni),
				.wr_i (hit_w),
				.data_i (if_instblock_w),
				.rd_i (),
				.data_o (),
				.full_o (),
				.empty_o ()
		);
		
		
		//Etapa de Decodificación
		decoder decoder_stg(
			.opcode_i	(opcode_w),
			.rfwrite_o	(rf_write_w)
		);
		
		//Etapa de lectura al Banco de Registros
		regfile register_read_stg(
			.clk_i		(clk_i),
			.rd_i			(rf_rd_w),
			.datord_i	(32'b0),
			.wren_i		(rf_write_w),
			.rs1_i		(rf_rs1_w),
			.dators1_o	(rf_dators1_w),
			.rs2_i		(rf_rs2_w),
			.dators2_o	(rf_dators2_w)
		);
		

endmodule
