import	lagarto0_pkg::*;

module IFID_Latch (
	input									clk_i,
	input									rst_ni,
	input									lock_i,
	input			[ISA_SIZE-1:0]		inst_i,
	input			[ADDR_SIZE-1:0]	pc_i,
	output reg	[ISA_SIZE-1:0]		inst_o,
	output reg	[ADDR_SIZE-1:0]	pc_o
	
);

	always @(posedge clk_i, negedge rst_ni)
	begin
		if (!rst_ni)
			begin
				inst_o <= {ISA_SIZE{1'b0}};
				pc_o <= {ADDR_SIZE{1'b0}};
			end
		else if (lock_i)
			begin
				inst_o <= inst_o;
				pc_o <= pc_o;
			end
		else
			begin
				inst_o <= inst_i;
				pc_o <= pc_i;
			end
	end
endmodule
