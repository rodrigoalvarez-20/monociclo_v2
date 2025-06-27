import	lagarto0_pkg::*;

module flagdetector (
	input							branch_i,
	input			[2:0]			f3_i,
	input			[XLEN-1:0]	res_i,
	output reg					brflag_o
);
	
	wire beq_w;
	wire bne_w;
	wire blt_w;
	wire bge_w;
	
	always @(*)
	begin
		if (branch_i)
			begin
				case (f3_i)
					3'b000: // BEQ
						begin
							beq_w = (res_i == 64'b0);
							bne_w = 1'b0;
							blt_w = 1'b0;
							bge_w = 1'b0;
						end
					3'b001: // BNEQ
						begin
							beq_w = 1'b0;
							bne_w = ~(res_i == 64'b0);
							blt_w = 1'b0;
							bge_w = 1'b0;
						end
					3'b100: // BLT
						begin
							beq_w = 1'b0;
							bne_w = 1'b0;
							blt_w = (res_i == 64'b1);
							bge_w = 1'b0;
						end
					3'b101: // BGE
						begin
							beq_w = 1'b0;
							bne_w = 1'b0;
							blt_w = 1'b0;
							bge_w = ~(res_i == 64'b1);
						end
					default:
						begin
							beq_w = 1'b0;
							bne_w = 1'b0;
							blt_w = 1'b0;
							bge_w = 1'b0;
						end
				endcase
			end
		else
			begin
				beq_w = 1'b0;
				bne_w = 1'b0;
				blt_w = 1'b0;
			   bge_w = 1'b0;
				//brflag_o = 1'b0;
			end
	end
	
	assign brflag_o = beq_w | bne_w | blt_w | bge_w;
	
endmodule 