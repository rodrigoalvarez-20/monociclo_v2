	import	lagarto0_pkg::*;
	
	module segmentado (
		input						clk_i, 
		input						rst_ni,
		output 		[XLEN-1:0]	monitor_o
	);
		// Seccion de declaracion de señales
		wire			[ISA_SIZE-1:0]				if_inst_w;
		wire			[63:0] 						if_instblock_w;
		wire											hit_w;
		wire			[ADDR_SIZE-1:0]			pc_next_w;
		wire			[ADDR_SIZE-1:0]			icachepc_w;
		//  IQueue
		//wire											iq_full_w;
		//wire											iq_empty_w;
		
		// IFID
		wire			[ISA_SIZE-1:0]				ifid_inst_w;
		wire			[ADDR_SIZE-1:0]			ifid_pc_w;
		
		// Hazard
		
		wire			[1:0]							hzd_w;
		wire											lock_w;
		
		// Control
		
		wire											Inst_Branch;
		wire											MEM_Read;
		wire											MEM_Reg;
		wire			[2:0]							ALU_Op;
		wire											MEM_Write;
		wire											ALU_Src;
		wire											Reg_Write;
		wire											J_Type;
		wire			[ADDR_SIZE-1:0]			PC_dec;
		
		// IDRF
		
		wire			[ISA_SIZE-1:0]				idrf_inst_w;
		wire 											idrf_Inst_Branch_w;
		wire 											idrf_MEM_Read_w;
		wire 											idrf_MEM_Reg_w;
		wire 			[2:0] 						idrf_ALU_Op_w;
		wire 											idrf_MEM_Write_w;
		wire 											idrf_ALU_Src_w;
		wire 											idrf_Reg_Write_w;
		wire 											idrf_J_Type_w;
		wire 			[ADDR_SIZE-1:0] 			idrf_PC_dec_w;
		
		
		
		//RF - Register File write
		
		wire			[XLEN-1:0]					muxrf_dato_w;
		wire											rf_write_w;
		wire			[4:0]							rf_rd_w;
		wire			[4:0]							rf_rs1_w;
		wire			[4:0]							rf_rs2_w;
		wire			[31:0]						rf_dators1_w;
		wire			[31:0]						rf_dators2_w;
		
		// Latch RFEX
		
		wire									rfex_Reg_write_w	;	
		wire									rfex_MEM_read_w	;	
		wire									rfex_MEM_write_w	;	
		wire			[2:0]					rfex_ALU_Op_w		;	
		wire			[2:0]					rfex_f3_w			;	
		wire									rfex_f7_w			;	
		wire									rfex_MEM_reg_w		;
		wire									rfex_Inst_Branch_w;	
		wire									rfex_J_Type_w		;	
		wire									rfex_ALU_Src_w		;
		wire			[XLEN-1:0]			rfex_sedato_w		;	
		wire			[XLEN-1:0]			rfex_dators1_w		;
		wire			[XLEN-1:0]			rfex_dators2_w		;		
		wire			[RFADDR_SIZE-1:0]	rfex_rs1_w			;
		wire			[RFADDR_SIZE-1:0]	rfex_rs2_w			;	
		wire			[RFADDR_SIZE-1:0]	rfex_rd_w			;
		wire			[ISA_SIZE-1:0]		rfex_inst_w			;
		
		
		// ALU Control
		wire											f7_w;
		wire			[2:0]							f3_w;
		wire			[3:0]							ex_ope_w;
		// ALU
		wire			[XLEN-1:0]					ex_res_w;
		wire											zeroflag_w;
		wire											co_w;
		// Extension de signo
		wire			[XLEN-1:0]					se_dato_w;
		wire			[XLEN-1:0]					exse_dato_w;
		
		// Shift para address calc
		wire			[XLEN-1:0]					slacu2_dato_w;
		// Branch target
		wire 											br_taken;
		wire			[XLEN-1:0]					BT_address;
		wire			[XLEN-1:0]					BTPC_address;
		// Memoria de datos
		wire			[XLEN-1:0]					mem_dato_w;
		wire											dhit_w;
		
		// Forward signals
		
		wire 			[1:0]							fwd_rs1_w;
		wire 			[1:0]							fwd_rs2_w;
		wire			[XLEN-1:0]					fwd_dators1_w;
		wire			[XLEN-1:0]					fwd_dators2_w;
		
		// Latch Inter MemWB
		
		wire 											memwb_Reg_Write_w;
		wire 											memwb_MEM_reg_w;
		wire 			[XLEN-1:0] 					memwb_exres_w;
		wire 			[XLEN-1:0] 					memwb_memdato_w;
		wire 			[RFADDR_SIZE-1:0] 		memwb_rs1_w;
		wire 			[RFADDR_SIZE-1:0] 		memwb_rs2_w;
		wire 			[RFADDR_SIZE-1:0] 		memwb_rd_w;
		
		//
		wire			[XLEN-1:0]					exmem_exres_w;
		wire			[RFADDR_SIZE-1:0]			exmem_rd_w;
		
		wire											exmem_MEM_reg_w;
		wire											exmem_Reg_Write_w;
		wire											exmem_MEM_Read_w;
		wire			[2:0]							exmem_ALU_Op_w;
		wire											exmem_Inst_Branch_w;
		wire											exmem_MEM_Write_w;
		wire			[1:0]							exmem_rs1_w;
		wire			[1:0]							exmem_rs2_w;
		wire											exmem_MEM_read_w;
		wire			[XLEN-1:0]					exmem_dators2_w;
		
		//wire			[1:0]							rfex_rs1_w;
		//wire			[1:0]							rfex_rs2_w;
		
		// Write Back
		wire			[XLEN-1:0]					wb_dato_w;
		
		//Asignación de señales
		//assign					opcode_w =	if_inst_w[6:0];
		assign					rf_rd_w 	=	idrf_inst_w[11:7];
		assign					rf_rs1_w	=	idrf_inst_w[19:15];
		assign					rf_rs2_w	=	idrf_inst_w[24:20];
		// Asignacion de la variable monitor para depuracion de datos
		assign					monitor_o	=	wb_dato_w;
		
		assign					rfex_f3_w = idrf_inst_w[14:12];
		assign					rfex_f7_w = idrf_inst_w[30];
		
		
		fetch fetch_stg(
			.clk_i				(clk_i),
			.rst_ni				(rst_ni),
			.lock_i				(lock_w),
			.if_instblock_i	(if_instblock_w),
			.hit_i				(hit_w),
			.pcbr_i				(BT_address),//(BTPC_address),
			.branch_i			(br_taken),
			.pc_next_o 			(pc_next_w),
			.if_inst_o			(if_inst_w),
			.icachepc_i			(icachepc_w)
		);
		
		//iCache
		icache	icachel1(
			.clk_i			(clk_i),
			.rst_ni			(rst_ni),
			.pc_i				(pc_next_w),
			.we_i				(1'b0),
			.inst_i			({ICACHE_LINE_SIZE{1'b0}}),
			.re_i				(1'b1),
			.inst_o			(if_instblock_w),
			.hit_o			(hit_w),
			.pc_o				(icachepc_w)
		); // Salen 64, hay que dividirlos
		
		// Latch IF/ID
		
		IFID_Latch ifid_latch1 (
			.clk_i(clk_i),
			.rst_ni(rst_ni),
			.lock_i(lock_w),
			.inst_i(if_inst_w),
			.pc_i(pc_next_w),
			.inst_o(ifid_inst_w),
			.pc_o(ifid_pc_w)
		);
		
		// Hazard
		
		hazard hzd_stg (
			.load_i (rfex_MEM_read_w),
			.exrd_i (rfex_rd_w),
			.rfrs1_i (rf_rs1_w),
			.rfrs2_i (rf_rs2_w),
			.hzd_o (hzd_w)
		);
		
		assign lock_w = hzd_w[0] | hzd_w[1];
		
		// Decodificacion
		control control_stage(
			.inst_i 				(ifid_inst_w),
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
		
		// Latch IDRF
		
		IDRF_Latch idrf_latch1 (
			.clk_i				(clk_i),
			.rst_ni				(rst_ni),
			.lock_i				(lock_w),
			.ifid_inst_i		(ifid_inst_w),
			.pc_next_i			(),
			.Inst_Branch_i		(Inst_Branch),
			.MEM_Read_i			(MEM_Read),
			.MEM_Reg_i			(MEM_Reg),
			.ALU_Op_i			(ALU_Op),
			.MEM_Write_i		(MEM_Write),
			.ALU_Src_i			(ALU_Src),
			.Reg_Write_i		(Reg_Write),
			.J_Type_i			(J_Type),
			.PC_dec_i			(PC_dec),
			.ifid_inst_o		(idrf_inst_w),
			.pc_next_o			(),
			.Inst_Branch_o		(idrf_Inst_Branch_w),
			.MEM_Read_o			(idrf_MEM_Read_w),
			.MEM_Reg_o			(idrf_MEM_Reg_w),
			.ALU_Op_o			(idrf_ALU_Op_w),
			.MEM_Write_o		(idrf_MEM_Write_w),
			.ALU_Src_o			(idrf_ALU_Src_w),
			.Reg_Write_o		(idrf_Reg_Write_w),
			.J_Type_o			(idrf_J_Type_w),
			.PC_dec_o			(idrf_PC_dec_w)
		);
		
		// Multiplexor de Banco de registros
		
		assign muxrf_dato_w = (rfex_J_Type_w) ? pc_next_w : wb_dato_w;
		
		//Etapa de lectura al Banco de Registros
		// Verificar conexion cuando se implementen PC de salto
		regfile register_read_stg(
			.clk_i		(clk_i),
			.rd_i			(memwb_rd_w),
			.datord_i	(muxrf_dato_w),
			.wren_i		(memwb_Reg_Write_w),
			.rs1_i		(rf_rs1_w),
			.dators1_o	(rf_dators1_w),
			.rs2_i		(rf_rs2_w),
			.dators2_o	(rf_dators2_w)
		);
		
		// Extension de signo
		sign_ext sign_ext_stage(
			.instr_i(idrf_inst_w),
			.se_dato_o(se_dato_w)
		);
		
		//Latch Interetapa Register Read - Execution
		rfex_latch rfex_latch1(
			.clk_i					(clk_i					),
			.rst_ni					(rst_ni					),
			.lock_i					(lock_w					),
			.rf_rs1_i				(rf_rs1_w				),				
			.rf_rs2_i				(rf_rs2_w				),
			.rf_rd_i					(rf_rd_w					),
			.rf_dators1_i			(rf_dators1_w			),		
			.rf_dators2_i			(rf_dators2_w			),		
			.se_dato_i				(se_dato_w				),			
			.idrf_inst_i			(idrf_inst_w			),
			.idrf_Reg_Write_i		(idrf_Reg_Write_w		),
			.idrf_ALU_Src_i		(idrf_ALU_Src_w		),
			.idrf_ALU_Op_i			(idrf_ALU_Op_w			),
			.idrf_Inst_Branch_i	(idrf_Inst_Branch_w	),		
			.idrf_MEM_Read_i		(idrf_MEM_Read_w		),		
			.idrf_MEM_Write_i		(idrf_MEM_Write_w		),	
			.idrf_MEM_Reg_i		(idrf_MEM_Reg_w		),		
			.idrf_J_Type_i			(idrf_J_Type_w			),		
			.idrf_PC_dec_i			(idrf_PC_dec_w			),					
			.rfex_rs1_o				(rfex_rs1_w				),				
			.rfex_rs2_o				(rfex_rs2_w				),
			.rfex_rd_o				(rfex_rd_w				),
			.rfex_dators1_o		(rfex_dators1_w		),			
			.rfex_dators2_o		(rfex_dators2_w		),			
			.rfex_se_dato_o		(rfex_sedato_w			),				
			.rfex_inst_o			(rfex_inst_w			),
			.rfex_Reg_Write_o		(rfex_Reg_write_w		),
			.rfex_ALU_Src_o		(rfex_ALU_Src_w		),	
			.rfex_ALU_Op_o			(rfex_ALU_Op_w			),				
			.rfex_Inst_Branch_o	(rfex_Inst_Branch_w	),			
			.rfex_MEM_Read_o		(rfex_MEM_read_w		),	
			.rfex_MEM_Write_o		(rfex_MEM_write_w		),		
			.rfex_MEM_Reg_o		(rfex_MEM_reg_w		),		
			.rfex_J_Type_o			(rfex_J_Type_w			),	
			.rfex_PC_o				(							)
		);
		
		assign exse_dato_w = (rfex_ALU_Src_w) ? rfex_sedato_w : rfex_dators2_w;
		
		shift_left shifter_stage  (
			.dato_i (rfex_sedato_w),
			.dato_o (slacu2_dato_w)
		);
		
		// Ejecucion
		
		alu_ctrl exec_ctrl_stage(
			.aluop_i (rfex_ALU_Op_w),
			.f7_i (rfex_f7_w), 
			.f3_i (rfex_f3_w),
			.ex_ope_o (ex_ope_w)
		);
		
		// Forwarding - Bypass
		//assign fwd_dators1_w = (fwd_rs1_w) ? exmem_exres_w : rfex_dators1_w ;
		//assign fwd_dators2_w = (fwd_rs2_w) ? exmem_exres_w : exse_dato_w;
		
		muxrs muxrs1(
			.fwd_rs_i(fwd_rs1_w),
			.dato1_i(exmem_exres_w),
			.dato2_i(memwb_exres_w),
			.dato3_i(rfex_dators1_w),
			.dato_o(fwd_dators1_w)
		);
		
		muxrs muxrs2(
			.fwd_rs_i(fwd_rs2_w),
			.dato1_i(exmem_exres_w),
			.dato2_i(memwb_exres_w),
			.dato3_i(exse_dato_w),
			.dato_o(fwd_dators2_w)
		);
		
		// ALU STAGE
		
		ALU exec_alu_stage (
			.opea_i (fwd_dators1_w),
			.opeb_i (fwd_dators2_w),
			.ex_ope_i (ex_ope_w),
			.res_o (ex_res_w),
			.zeroflag_o (zeroflag_w),
			.c_o (co_w),
			.branch_i (idrf_Inst_Branch_w),
			.f3_i (rfex_f3_w)
		);
		
		// Deteccion de saltos
		assign br_taken = (rfex_Inst_Branch_w & zeroflag_w) | rfex_J_Type_w;
		//assign br_taken = br_taken | J_Type;
		
		//and andbranch(br_taken, Inst_Branch, zeroflag_w);
		
		// Address Calc Unit 2
		
		assign BT_address = pc_next_w + slacu2_dato_w;
		//assign BTPC_address =  (br_taken) ? BT_address : pc_next_w;
		
		// Forwarding
		
		forwarding fwdstage(
			.exmemrd_i		(exmem_rd_w),
			.rfex_rs1_i		(rfex_rs1_w),
			.rfex_rs2_i		(rfex_rs2_w),
			.fwd_rs1_o		(fwd_rs1_w),
			.fwd_rs2_o		(fwd_rs2_w)
		);
		
		
		// Latch inter EXMEM
		exmem_latch exmem_latch1(
			.clk_i					(clk_i					),
			.rst_ni					(rst_ni					),
			.ex_res_i				(ex_res_w				),
			.rfex_MEM_write_i		(rfex_Reg_write_w		),
			.rfex_MEM_read_i		(rfex_MEM_read_w		),	
			.rfex_MEM_reg_i		(rfex_MEM_reg_w		),
			.rfex_Reg_write_i		(rfex_MEM_write_w		),	
			.rfex_dators2_i		(rfex_dators2_w		),
			.rfex_rs1_i				(rfex_rs1_w				),				
			.rfex_rs2_i				(rfex_rs2_w				),				
			.rfex_rd_i				(rfex_rd_w				),				
			.pc_i						(							),					
			.exmem_res_o			(exmem_exres_w			),
			.exmem_MEM_Write_o	(exmem_MEM_Write_w	),	
			.exmem_MEM_Read_o		(exmem_MEM_Read_w		),		
			.exmem_MEM_Reg_o		(exmem_MEM_reg_w		),	
			.exmem_Reg_Write_o	(exmem_Reg_Write_w	),	
			.exmem_dators2_o		(exmem_dators2_w		),
			.exmem_rs1_o			(exmem_rs1_w			),				
			.exmem_rs2_o			(exmem_rs2_w			),				
			.exmem_rd_o				(exmem_rd_w				),				
			.exmem_PC_o				(							)					
				
		);	
		
		// Memoria de datos
		dcache memaccess_stage(
			.clk_i (clk_i),
			.rst_ni (rst_ni),
			.addr_i (exmem_exres_w),
			.we_i (exmem_MEM_Write_w),
			.dato_i (exmem_dators2_w),
			.re_i (exmem_MEM_read_w),
			.dato_o (mem_dato_w),
			.hit_o (dhit_w)
		);
		
		// Latch Interetapa MEMWB
		
		memwb_latch memwb_latch1(
			.clk_i 							(clk_i),
			.rst_ni 							(rst_ni),
			.exmem_Reg_Write_i			(exmem_Reg_Write_w),
			.exmem_MEM_Reg_i				(exmem_MEM_reg_w),
			.mem_dato_i						(mem_dato_w),
			.exmem_res_i					(exmem_exres_w),
			.exmem_rd_i						(exmem_rd_w),
			.pc_i								(				),
			.memwb_Reg_Write_o			(memwb_Reg_Write_w),
			.memwb_MEM_reg_o				(memwb_MEM_reg_w),
			.memwb_dato_o					(memwb_memdato_w),
			.memwb_res_o					(memwb_exres_w),
			.memwb_rd_o						(memwb_rd_w),
			.memwb_PC_o						(				)
			
		);
		
		// Write Back
		
		assign wb_dato_w = (memwb_MEM_reg_w) ? memwb_memdato_w : memwb_exres_w;
		
endmodule


module segmentado_tb ();
	reg						clk_i		;
	reg						rst_ni	;
	wire			[63:0]	monitor_o;
	
	initial
	begin
		clk_i		=	1'b1;
		rst_ni	=	1'b0;
		#200
			rst_ni	= 1'b1;
	end
	
	segmentado DUT(
		.clk_i		(clk_i		),
		.rst_ni		(rst_ni		),
		.monitor_o	(monitor_o	)
	);
	
	always 
	begin
		#50
			clk_i = ~clk_i;
	end
	
endmodule 
