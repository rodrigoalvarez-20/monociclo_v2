package lagarto0_pkg;

// Definiciones etapa IF
localparam		XLEN 					= 64;
localparam		ISA_SIZE 			= 32;
localparam		ADDR_SIZE 			= 64;
localparam		VADD_SIZE			= 40;
localparam		ICACHE_LINE_SIZE 	= 64;
localparam		IBLOCK_BYTE			= ICACHE_LINE_SIZE / 8;
localparam		ILINE_BYTE_OFFSET	= $clog2(IBLOCK_BYTE);
localparam		ICACHE_SIZE			= 1024*2;
localparam		ICACHE_MEM_DEPTH	= ICACHE_SIZE / IBLOCK_BYTE;
localparam		ICACHE_IDX_SIZE	= $clog2(ICACHE_MEM_DEPTH);
localparam		ICACHE_VPN_SIZE	= VADD_SIZE - ICACHE_IDX_SIZE - ILINE_BYTE_OFFSET;
localparam		FETCH_WIDTH			= ICACHE_LINE_SIZE / ISA_SIZE;
localparam		ISSUE_WIDTH			= 1;
localparam		RESET_ADDRESS		= 64'h0000_0000_0000_0000;


// Instruction Queue Parameters

localparam		IQUEUE_DEPTH		= 4;
localparam		IQUEUE_ADDR_SIZE	= $clog2(IQUEUE_DEPTH);


endpackage 