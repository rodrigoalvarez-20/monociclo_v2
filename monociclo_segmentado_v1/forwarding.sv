import	lagarto0_pkg::*;


module forwarding (
	input 		[RFADDR_SIZE-1:0] exmemrd_i,
	input 		[RFADDR_SIZE-1:0] memwb_rd_i,
	input 		[RFADDR_SIZE-1:0] rfex_rs1_i,
	input 		[RFADDR_SIZE-1:0] rfex_rs2_i,
	output reg 	[1:0]					fwd_rs1_o,
	output reg 	[1:0]					fwd_rs2_o
);

	always @(*)
	begin
	
		// Forwarding Mem-WB
		if (memwb_rd_i == rfex_rs1_i)
			begin
				fwd_rs1_o = 2'b10;
			end
		else
			begin
				fwd_rs1_o = 2'b00;
			end
		if (memwb_rd_i == rfex_rs2_i)
			begin
				fwd_rs2_o = 2'b10;
			end
		else
			begin
				fwd_rs2_o = 2'b00;
			end
	
	
		// Forwarding Ex-Mem
		if (exmemrd_i == rfex_rs1_i)
			begin
				fwd_rs1_o = 2'b01;
			end
		else
			begin
				fwd_rs1_o = 2'b00;
			end
		if (exmemrd_i == rfex_rs2_i)
			begin
				fwd_rs2_o = 2'b01;
			end
		else
			begin
				fwd_rs2_o = 2'b00;
			end
	end
endmodule 