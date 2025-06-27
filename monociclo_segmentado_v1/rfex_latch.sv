import	lagarto0_pkg::*;

module rfex_latch(
	input										clk_i,					
   input										rst_ni,					
	input										lock_i,					
	input				[4:0]					rf_rs1_i,				
	input				[4:0]					rf_rs2_i,
	input				[RFADDR_SIZE-1:0]	rf_rd_i,
	input				[XLEN-1:0]			rf_dators1_i,
	input				[XLEN-1:0]			rf_dators2_i,
	input				[XLEN-1:0]			se_dato_i,
	input				[ISA_SIZE-1:0]		idrf_inst_i,
	input										idrf_Reg_Write_i,
   input										idrf_ALU_Src_i,
   input				[2:0]					idrf_ALU_Op_i,
   input										idrf_Inst_Branch_i,
   input										idrf_MEM_Read_i,
   input										idrf_MEM_Write_i,
   input										idrf_MEM_Reg_i,
   input										idrf_J_Type_i,
   input				[ADDR_SIZE-1:0]	idrf_PC_dec_i,
   output reg		[4:0]					rfex_rs1_o,
   output reg		[4:0]					rfex_rs2_o,
	output reg		[RFADDR_SIZE-1:0]	rfex_rd_o,
   output reg		[XLEN-1:0]			rfex_dators1_o,
   output reg		[XLEN-1:0]			rfex_dators2_o,
   output reg		[XLEN-1:0]			rfex_se_dato_o,
   output reg		[ISA_SIZE-1:0]		rfex_inst_o,
   output reg								rfex_Reg_Write_o,
   output reg								rfex_ALU_Src_o,
   output reg		[2:0]					rfex_ALU_Op_o,
   output reg								rfex_Inst_Branch_o,
   output reg								rfex_MEM_Read_o,
   output reg								rfex_MEM_Write_o,
   output reg								rfex_MEM_Reg_o,
   output reg								rfex_J_Type_o,
	output reg		[ADDR_SIZE-1:0]	rfex_PC_o
);

	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			begin
				rfex_rs1_o 				<=	4'b000;
				rfex_rs2_o				<=	4'b000;
				rfex_rd_o				<=	{RFADDR_SIZE{1'b0}};
				rfex_dators1_o			<= {XLEN{1'b0}};
				rfex_dators2_o			<=	{XLEN{1'b0}};
				rfex_se_dato_o			<=	{XLEN{1'b0}};
				rfex_inst_o				<=	{ISA_SIZE{1'b0}};
				rfex_Reg_Write_o		<=	1'b0;
				rfex_ALU_Src_o			<=	1'b0;
				rfex_ALU_Op_o			<=	3'b000;
				rfex_Inst_Branch_o	<=	1'b0;
				rfex_MEM_Read_o		<= 1'b0;
				rfex_MEM_Write_o		<= 1'b0;
				rfex_MEM_Reg_o			<= 1'b0;
				rfex_J_Type_o			<= 1'b0;
				rfex_PC_o			<= {ADDR_SIZE{1'b0}};
			end
		else if (lock_i)
			begin
				rfex_rs1_o 				<=	rfex_rs1_o;	
				rfex_rs2_o				<= rfex_rs2_o;
				rfex_rd_o				<= rfex_rd_o;
				rfex_dators1_o			<= rfex_dators1_o;
				rfex_dators2_o			<= rfex_dators2_o;
				rfex_se_dato_o			<= rfex_se_dato_o;
				rfex_inst_o				<= rfex_inst_o;
				rfex_Reg_Write_o		<= rfex_Reg_Write_o;
				rfex_ALU_Src_o			<= rfex_ALU_Src_o;
				rfex_ALU_Op_o			<= rfex_ALU_Op_o;
				rfex_Inst_Branch_o	<= rfex_Inst_Branch_o;
				rfex_MEM_Read_o		<= rfex_MEM_Read_o;
				rfex_MEM_Write_o		<= rfex_MEM_Write_o;
				rfex_MEM_Reg_o			<= rfex_MEM_Reg_o;
				rfex_J_Type_o			<= rfex_J_Type_o;
				rfex_PC_o				<= rfex_PC_o;
			end
		else
			begin
				rfex_rs1_o 				<=	rf_rs1_i;	
				rfex_rs2_o				<= rf_rs2_i;
				rfex_rd_o				<= rf_rd_i;
				rfex_dators1_o			<= rf_dators1_i;
				rfex_dators2_o			<= rf_dators2_i;
				rfex_se_dato_o			<=	se_dato_i;
				rfex_inst_o				<= idrf_inst_i;
				rfex_Reg_Write_o		<= idrf_Reg_Write_i;
				rfex_ALU_Src_o			<= idrf_ALU_Src_i;
				rfex_ALU_Op_o			<= idrf_ALU_Op_i;
				rfex_Inst_Branch_o	<= idrf_Inst_Branch_i;
				rfex_MEM_Read_o		<= idrf_MEM_Read_i;
				rfex_MEM_Write_o		<= idrf_MEM_Write_i;
				rfex_MEM_Reg_o			<= idrf_MEM_Reg_i;
				rfex_J_Type_o			<= idrf_J_Type_i;
				rfex_PC_o			<= idrf_PC_dec_i;
			end
	end
endmodule 