import	lagarto0_pkg::*;

module exmem_latch(
	input										clk_i,					
	input										rst_ni,					
	input			[XLEN-1:0]				ex_res_i,				
	input										rfex_MEM_write_i,		
	input										rfex_MEM_read_i,		
	input										rfex_Reg_write_i,	
	input										rfex_MEM_reg_i,
	input			[XLEN-1:0]				rfex_dators2_i,		
	input			[RFADDR_SIZE-1:0]		rfex_rs1_i,				
	input			[RFADDR_SIZE-1:0]		rfex_rs2_i,				
	input			[RFADDR_SIZE-1:0]		rfex_rd_i,				
	input			[ADDR_SIZE-1:0]		pc_i,						
	output reg	[XLEN-1:0]				exmem_res_o,			
	output reg								exmem_MEM_Write_o,	
	output reg								exmem_MEM_Read_o,		
	output reg								exmem_MEM_Reg_o,		
	output reg								exmem_Reg_Write_o,	
	output reg	[XLEN-1:0]				exmem_dators2_o,		
	output reg	[RFADDR_SIZE-1:0]		exmem_rs1_o,			
	output reg	[RFADDR_SIZE-1:0]		exmem_rs2_o,			
	output reg	[RFADDR_SIZE-1:0]		exmem_rd_o,				
	output reg	[ADDR_SIZE-1:0]		exmem_PC_o		
);

	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			begin
				exmem_res_o				<=	{XLEN{1'b0}};
				exmem_MEM_Write_o		<= 1'b0;
				exmem_MEM_Read_o		<= 1'b0;
				exmem_MEM_Reg_o		<= 1'b0;
				exmem_Reg_Write_o		<= 1'b0;
				exmem_dators2_o		<= {XLEN{1'b0}};
				exmem_rs1_o				<= {RFADDR_SIZE{1'b0}};
				exmem_rs2_o				<= {RFADDR_SIZE{1'b0}};
				exmem_rd_o				<= {RFADDR_SIZE{1'b0}};
				exmem_PC_o				<= {ADDR_SIZE{1'b0}};
			end
		else
			begin
				exmem_res_o				<=	ex_res_i;
				exmem_MEM_Write_o		<= rfex_MEM_write_i;
				exmem_MEM_Read_o		<= rfex_MEM_read_i;	
				exmem_MEM_Reg_o		<= rfex_MEM_reg_i;
				exmem_Reg_Write_o		<= rfex_Reg_write_i;
				exmem_dators2_o		<= rfex_dators2_i;
				exmem_rs1_o				<= rfex_rs1_i;
				exmem_rs2_o				<= rfex_rs2_i;
				exmem_rd_o				<= rfex_rd_i;
				exmem_PC_o				<= pc_i;	
			end
	
	end
	
endmodule 