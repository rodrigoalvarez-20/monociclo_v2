import	lagarto0_pkg::*;

module IDRF_Latch (
	input									clk_i				,
	input									rst_ni			,
	input									lock_i,
	input			[ISA_SIZE-1:0] 	ifid_inst_i		,
	input			[ADDR_SIZE-1:0] 	pc_next_i		,
	input									Inst_Branch_i	,
	input									MEM_Read_i		,
	input									MEM_Reg_i		,
	input			[2:0] 				ALU_Op_i			,
	input									MEM_Write_i		,
	input									ALU_Src_i		,
	input									Reg_Write_i		,
	input									J_Type_i			,
	input			[ADDR_SIZE-1:0]	PC_dec_i			,
	output reg	[ISA_SIZE-1:0] 	ifid_inst_o		,
	output reg	[ADDR_SIZE-1:0] 	pc_next_o		,
	output reg							Inst_Branch_o	,
	output reg							MEM_Read_o		,
	output reg							MEM_Reg_o		,
	output reg		[2:0] 			ALU_Op_o			,
	output reg							MEM_Write_o		,
	output reg							ALU_Src_o		,
	output reg							Reg_Write_o		,
	output reg							J_Type_o			,
	output reg	[ADDR_SIZE-1:0]	PC_dec_o			
	
);

	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			begin
				ifid_inst_o		<= {ISA_SIZE{1'b0}}; 
				pc_next_o		<= {ADDR_SIZE{1'b0}};
				Inst_Branch_o	<= 1'b0;
				MEM_Read_o		<= 1'b0;
				MEM_Reg_o		<= 1'b0;
				ALU_Op_o			<= 3'b0;
				MEM_Write_o		<= 1'b0;
				ALU_Src_o		<= 1'b0;
				Reg_Write_o		<= 1'b0;
				J_Type_o			<= 1'b0;
				PC_dec_o			<= {ADDR_SIZE{1'b0}};
			end
		else if(lock_i)
			begin
				ifid_inst_o		<= ifid_inst_o;
				pc_next_o		<= pc_next_o;	
				Inst_Branch_o	<= Inst_Branch_o;
				MEM_Read_o		<= MEM_Read_o;
				MEM_Reg_o		<= MEM_Reg_o;	
				ALU_Op_o			<= ALU_Op_o;		
				MEM_Write_o		<= MEM_Write_o;
				ALU_Src_o		<= ALU_Src_o;	
				Reg_Write_o		<= Reg_Write_o;
				J_Type_o			<= J_Type_o;	
				PC_dec_o			<= PC_dec_o;		
			end
		else
			begin
				ifid_inst_o		<= ifid_inst_i;
				pc_next_o		<= pc_next_i;	
				Inst_Branch_o	<= Inst_Branch_i;
				MEM_Read_o		<= MEM_Read_i;
				MEM_Reg_o		<= MEM_Reg_i;	
				ALU_Op_o			<= ALU_Op_i;		
				MEM_Write_o		<= MEM_Write_i;
				ALU_Src_o		<= ALU_Src_i;	
				Reg_Write_o		<= Reg_Write_i;
				J_Type_o			<= J_Type_i;	
				PC_dec_o			<= PC_dec_i;		
			end
	end
endmodule
