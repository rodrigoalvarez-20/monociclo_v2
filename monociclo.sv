	import	lagarto0_pkg::*;
	
	module monociclo (
		input						clk_i, 
		input						rst_ni,
		output 		[31:0]	monitor_o
	);
		// Seccion de declaracion de señales
		wire			[ISA_SIZE-1:0]				if_inst_w;
		wire			[63:0] 						if_instblock_w;
		wire											hit_w;
		wire			[ADDR_SIZE-1:0]			pc_next_w;
		//  IQueue
		//wire											iq_full_w;
		//wire											iq_empty_w;
		
		// Control
		
		wire											Inst_Branch;
		wire											MEM_Read;
		wire											MEM_Reg;
		wire			[1:0]							ALU_Op;
		wire											MEM_Write;
		wire											ALU_Src;
		wire											Reg_Write;
		wire											J_Type;
		wire			[ADDR_SIZE-1:0]			PC_dec;
		
		//RF - Register File write
		
		wire			[XLEN-1:0]					muxrf_dato_w;
		wire											rf_write_w;
		wire			[4:0]							rf_rd_w;
		wire			[4:0]							rf_rs1_w;
		wire			[4:0]							rf_rs2_w;
		wire			[31:0]						rf_dators1_w;
		wire			[31:0]						rf_dators2_w;
		
		// ALU Control
		wire											f7_w;
		wire			[2:0]							f3_w;
		wire			[3:0]							ex_ope_w;
		// ALU
		wire			[XLEN-1:0]					ex_res_w;
		wire											zeroflag_w;
		wire											co_w;
		
		
		//Asignación de señales
		assign					opcode_w =	if_inst_w[6:0];
		assign					rf_rd_w 	=	if_inst_w[11:7];
		assign					rf_rs1_w	=	if_inst_w[19:15];
		assign					rf_rs2_w	=	if_inst_w[24:20];
		// Asignacion de la variable monitor para depuracion de datos
		assign					monitor_o	=	if_inst_w;
		
		assign					f3_w = if_inst_w[15:12];
		assign					f7_w = if_inst_w[30];
		
		
		
		//iCache
		icache	icachel1(
			.clk_i			(clk_i),
			.rst_ni			(rst_ni),
			.pc_i				(pc_next_w), // Se va a modificar
			.we_i				(1'b0),
			.inst_i			({ISA_SIZE{1'b0}}),
			.re_i				(1'b1),
			.inst_o			(if_instblock_w),
			.hit				(hit_w)
		); // Salen 64, hay que dividirlos
		
		//Etapa de Fetch --> Aqui es donde hay que recibir la instruccion (32 bits)
		fetch fetch_stg(
			.clk_i				(clk_i),
			.rst_ni				(rst_ni),
			.if_instblock_i	(if_instblock_w),
			.hit_i				(hit_w),
			.pc_next_o 			(pc_next_w),
			.if_inst_o			(if_inst_w)
		);
		
		control control_stage(
			.inst_i 				(if_inst_w),
			.pc_i					(pc_next_w),
			.Inst_Branch_o		(Inst_Branch),
			.MEM_read_o			(MEM_Read),
			.MEM_reg_o			(MEM_Reg),
			.ALU_Op_o			(ALU_Op),
			.MEM_Write_o		(MEM_Write),
			.ALU_Src_o			(ALU_Src),
			.Reg_Write_o		(Reg_Write),
			.J_Type_o			(J_Type),
			.PC_dec_o			(PC_dec)
		);
		
		// Multiplexor de Banco de registros
		
		assign muxrf_dato_w = (J_Type) ? pc_next_w : 32'b0;
		
		//Etapa de lectura al Banco de Registros
		// Verificar conexion cuando se implementen PC de salto
		regfile register_read_stg(
			.clk_i		(clk_i),
			.rd_i			(rf_rd_w),
			.datord_i	(muxrf_dato_w),
			.wren_i		(Reg_Write),
			.rs1_i		(rf_rs1_w),
			.dators1_o	(rf_dators1_w),
			.rs2_i		(rf_rs2_w),
			.dators2_o	(rf_dators2_w)
		);
		
		// Ejecucion
		
		alu_ctrl exec_ctrl_stage(
			.aluop_i (ALU_Op),
			.f7_i (f7_w), 
			.f3_i (f3_w),
			.ex_ope_o (ex_ope_w)
		);
		
		ALU exec_alu_stage (
			.opea_i (rf_dators1_w),
			.opeb_i (rf_dators2_w),
			.ex_ope_i (ex_ope_w),
			.res_o (ex_res_w),
			.zeroflag_o (zeroflag_w),
			.c_o (co_w)
		);
		

endmodule
