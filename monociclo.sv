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
		//wire			[6:0]							opcode_w;
		wire			[ADDR_SIZE-1:0]			pc_next_w;
		//  IQueue
		//wire											iq_full_w;
		//wire											iq_empty_w;
		
		// Control
		
		reg											cntrl_inst_branch_w;
		reg											cntrl_mem_read_w;
		reg											cntrl_mem_reg_w;
		reg			[1:0]							cntrl_alu_op_w;
		reg											cntrl_mem_write_w;
		reg											cntrl_alu_src_w;
		reg											cntrl_reg_write_w;
		reg											cntrl_j_type_w;
		reg			[ADDR_SIZE-1:0]			cntrl_pc_dec_w;
		
		//RF - Register File write
		wire						rf_write_w;
		wire			[4:0]		rf_rd_w ;
		wire			[4:0]		rf_rs1_w;
		wire			[4:0]		rf_rs2_w;
		wire			[31:0]	rf_dators1_w;
		wire			[31:0]	rf_dators2_w;
		//Asignación de señales
		assign					opcode_w =	if_inst_w[6:0];
		assign					rf_rd_w 	=	if_inst_w[11:7];
		assign					rf_rs1_w	=	if_inst_w[19:15];
		assign					rf_rs2_w	=	if_inst_w[24:20];
		// Asignacion de la variable monitor para depuracion de datos
		assign					monitor_o	=	if_inst_w;
		
		//Etapa de Fetch
		fetch fetch_stg(
			.clk_i				(clk_i),
			.rst_ni				(rst_ni),
			.if_instblock_i	(if_instblock_w),
			.hit_i				(hit_w),
			.pc_next_o 			(pc_next_w),
			.if_inst_o			(if_inst_w)
		);
		
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
		);
		
		
		control control_stage(
			.inst_i 				(if_inst_w),
			.pc_i					(pc_next_w),
			.Inst_Branch_o		(cntrl_inst_branch_w),
			.MEM_read_o			(cntrl_mem_read_w),
			.MEM_reg_o			(cntrl_mem_reg_w),
			.ALU_Op_o			(cntrl_alu_op_w),
			.MEM_Write_o		(cntrl_mem_write_w),
			.ALU_Src_o			(cntrl_alu_src_w),
			.Reg_Write_o		(cntrl_reg_write_w),
			.J_Type_o			(cntrl_j_type_w),
			.PC_dec_o			(cntrl_pc_dec_w)
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
