import	lagarto0_pkg::*;

module memwb_latch(
	input											clk_i,
	input											rst_ni,
	input											exmem_Reg_Write_i,
	input											exmem_MEM_Reg_i,
	input				[XLEN-1:0]				mem_dato_i,
	input				[XLEN-1:0]				exmem_res_i,
	input				[RFADDR_SIZE-1:0]		exmem_rd_i,
	input				[ADDR_SIZE-1:0]		pc_i,
	output reg 									memwb_Reg_Write_o,
	output reg 									memwb_MEM_reg_o,
	output reg 		[XLEN-1:0]				memwb_dato_o,
	output reg 		[XLEN-1:0]				memwb_res_o,
	output reg 		[RFADDR_SIZE-1:0]		memwb_rd_o,
	output reg 		[ADDR_SIZE-1:0]		memwb_PC_o
);

	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			begin
				memwb_Reg_Write_o		<=	1'b0;
				memwb_MEM_reg_o		<=	1'b0;
				memwb_dato_o			<=	{XLEN{1'b0}};
				memwb_res_o				<=	{XLEN{1'b0}};
				memwb_rd_o				<=	{RFADDR_SIZE{1'b0}};
				memwb_PC_o				<=	{ADDR_SIZE{1'b0}};
			end
		else
			begin
				memwb_Reg_Write_o		<=	exmem_Reg_Write_i;
				memwb_MEM_reg_o		<=	exmem_MEM_Reg_i;
				memwb_dato_o			<=	mem_dato_i;
				memwb_res_o				<=	exmem_res_i;
				memwb_rd_o				<=	exmem_rd_i;
				memwb_PC_o				<=	pc_i;
			end	
	end
endmodule
