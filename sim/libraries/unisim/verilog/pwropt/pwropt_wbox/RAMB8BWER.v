
`timescale 1 ps / 1 ps
module RAMB8BWER(DOADO, DOBDO, DOPADOP, DOPBDOP, ADDRAWRADDR, ADDRBRDADDR, 
	CLKAWRCLK, CLKBRDCLK, DIADI, DIBDI, DIPADIP, DIPBDIP, ENAWREN, ENBRDEN, 
	REGCEA, REGCEBREGCE, RSTA, RSTBRST, WEAWEL, WEBWEU);

	parameter integer	DATA_WIDTH_A	= 0;
	parameter integer	DATA_WIDTH_B	= 0;
	parameter integer	DOA_REG		= 0;
	parameter integer	DOB_REG		= 0;
	parameter		EN_RSTRAM_A	= "TRUE";
	parameter		EN_RSTRAM_B	= "TRUE";
	parameter		INITP_00	= 256'b0;
	parameter		INITP_01	= 256'b0;
	parameter		INITP_02	= 256'b0;
	parameter		INITP_03	= 256'b0;
	parameter		INIT_00		= 256'b0;
	parameter		INIT_01		= 256'b0;
	parameter		INIT_02		= 256'b0;
	parameter		INIT_03		= 256'b0;
	parameter		INIT_04		= 256'b0;
	parameter		INIT_05		= 256'b0;
	parameter		INIT_06		= 256'b0;
	parameter		INIT_07		= 256'b0;
	parameter		INIT_08		= 256'b0;
	parameter		INIT_09		= 256'b0;
	parameter		INIT_0A		= 256'b0;
	parameter		INIT_0B		= 256'b0;
	parameter		INIT_0C		= 256'b0;
	parameter		INIT_0D		= 256'b0;
	parameter		INIT_0E		= 256'b0;
	parameter		INIT_0F		= 256'b0;
	parameter		INIT_10		= 256'b0;
	parameter		INIT_11		= 256'b0;
	parameter		INIT_12		= 256'b0;
	parameter		INIT_13		= 256'b0;
	parameter		INIT_14		= 256'b0;
	parameter		INIT_15		= 256'b0;
	parameter		INIT_16		= 256'b0;
	parameter		INIT_17		= 256'b0;
	parameter		INIT_18		= 256'b0;
	parameter		INIT_19		= 256'b0;
	parameter		INIT_1A		= 256'b0;
	parameter		INIT_1B		= 256'b0;
	parameter		INIT_1C		= 256'b0;
	parameter		INIT_1D		= 256'b0;
	parameter		INIT_1E		= 256'b0;
	parameter		INIT_1F		= 256'b0;
	parameter		INIT_A		= 18'b0;
	parameter		INIT_B		= 18'b0;
	parameter		INIT_FILE	= "NONE";
	parameter		RAM_MODE	= "TDP";
	parameter		RSTTYPE		= "SYNC";
	parameter		RST_PRIORITY_A	= "SR";
	parameter		RST_PRIORITY_B	= "SR";
	parameter		SETUP_ALL	= 1000;
	parameter		SETUP_READ_FIRST
						= 3000;
	parameter		SIM_COLLISION_CHECK
						= "ALL";
	parameter		SRVAL_A		= 18'b0;
	parameter		SRVAL_B		= 18'b0;
	parameter		WRITE_MODE_A	= "WRITE_FIRST";
	parameter		WRITE_MODE_B	= "WRITE_FIRST";

	output	[15:0]		DOADO;
	output	[15:0]		DOBDO;
	output	[1:0]		DOPADOP;
	output	[1:0]		DOPBDOP;
	input	[12:0]		ADDRAWRADDR;
	input	[12:0]		ADDRBRDADDR;
	input			CLKAWRCLK;
	input			CLKBRDCLK;
	input	[15:0]		DIADI;
	input	[15:0]		DIBDI;
	input	[1:0]		DIPADIP;
	input	[1:0]		DIPBDIP;
	input			ENAWREN;
	input			ENBRDEN;
	input			REGCEA;
	input			REGCEBREGCE;
	input			RSTA;
	input			RSTBRST;
	input	[1:0]		WEAWEL;
	input	[1:0]		WEBWEU;

	wire			cg_one = 1'b1;
	wire	[12:0]		ADDRA_BUS;
	wire	[12:0]		ADDRB_BUS;

	assign ADDRA_BUS = (cg_one ? {ADDRAWRADDR} : 13'bzzzzzzzzzzzzz);
	assign ADDRB_BUS = (cg_one ? {ADDRBRDADDR} : 13'bzzzzzzzzzzzzz);

	RAMB8BWER_INT #(.DATA_WIDTH_A(DATA_WIDTH_A), .DATA_WIDTH_B(DATA_WIDTH_B)
		, .DOA_REG(DOA_REG), .DOB_REG(DOB_REG), .EN_RSTRAM_A(
		EN_RSTRAM_A), .EN_RSTRAM_B(EN_RSTRAM_B), .INITP_00(INITP_00), .
		INITP_01(INITP_01), .INITP_02(INITP_02), .INITP_03(INITP_03), .
		INIT_00(INIT_00), .INIT_01(INIT_01), .INIT_02(INIT_02), .INIT_03
		(INIT_03), .INIT_04(INIT_04), .INIT_05(INIT_05), .INIT_06(
		INIT_06), .INIT_07(INIT_07), .INIT_08(INIT_08), .INIT_09(
		INIT_09), .INIT_0A(INIT_0A), .INIT_0B(INIT_0B), .INIT_0C(
		INIT_0C), .INIT_0D(INIT_0D), .INIT_0E(INIT_0E), .INIT_0F(
		INIT_0F), .INIT_10(INIT_10), .INIT_11(INIT_11), .INIT_12(
		INIT_12), .INIT_13(INIT_13), .INIT_14(INIT_14), .INIT_15(
		INIT_15), .INIT_16(INIT_16), .INIT_17(INIT_17), .INIT_18(
		INIT_18), .INIT_19(INIT_19), .INIT_1A(INIT_1A), .INIT_1B(
		INIT_1B), .INIT_1C(INIT_1C), .INIT_1D(INIT_1D), .INIT_1E(
		INIT_1E), .INIT_1F(INIT_1F), .INIT_A(INIT_A), .INIT_B(INIT_B), .
		INIT_FILE(INIT_FILE), .RAM_MODE(RAM_MODE), .RSTTYPE(RSTTYPE), .
		RST_PRIORITY_A(RST_PRIORITY_A), .RST_PRIORITY_B(RST_PRIORITY_B),
		.SETUP_ALL(SETUP_ALL), .SETUP_READ_FIRST(SETUP_READ_FIRST), .
		SIM_COLLISION_CHECK(SIM_COLLISION_CHECK), .SRVAL_A(SRVAL_A), .
		SRVAL_B(SRVAL_B), .WRITE_MODE_A(WRITE_MODE_A), .WRITE_MODE_B(
		WRITE_MODE_B)) _i(
		.REGCEA				(REGCEA), 
		.DIADI				(DIADI), 
		.DIPBDIP			(DIPBDIP), 
		.DIBDI				(DIBDI), 
		.ADDRBRDADDR			(ADDRB_BUS), 
		.DOPADOP			(DOPADOP), 
		.RSTA				(RSTA), 
		.REGCEBREGCE			(REGCEBREGCE), 
		.WEAWEL				(WEAWEL), 
		.RSTBRST			(RSTBRST), 
		.CLKBRDCLK			(CLKBRDCLK), 
		.DOADO				(DOADO), 
		.ADDRAWRADDR			(ADDRA_BUS), 
		.DOBDO				(DOBDO), 
		.WEBWEU				(WEBWEU), 
		.CLKAWRCLK			(CLKAWRCLK), 
		.DOPBDOP			(DOPBDOP), 
		.ENBRDEN			(ENBRDEN), 
		.ENAWREN			(ENAWREN), 
		.DIPADIP			(DIPADIP));
endmodule

`timescale 1 ps / 1 ps
module RAMB8BWER_INT(DOADO, DOBDO, DOPADOP, DOPBDOP, ADDRAWRADDR, ADDRBRDADDR, 
	CLKAWRCLK, CLKBRDCLK, DIADI, DIBDI, DIPADIP, DIPBDIP, ENAWREN, ENBRDEN, 
	REGCEA, REGCEBREGCE, RSTA, RSTBRST, WEAWEL, WEBWEU);

	parameter integer	DATA_WIDTH_A	= 0;
	parameter integer	DATA_WIDTH_B	= 0;
	parameter integer	DOA_REG		= 0;
	parameter integer	DOB_REG		= 0;
	parameter		EN_RSTRAM_A	= "TRUE";
	parameter		EN_RSTRAM_B	= "TRUE";
	parameter		INITP_00	= 256'b0;
	parameter		INITP_01	= 256'b0;
	parameter		INITP_02	= 256'b0;
	parameter		INITP_03	= 256'b0;
	parameter		INIT_00		= 256'b0;
	parameter		INIT_01		= 256'b0;
	parameter		INIT_02		= 256'b0;
	parameter		INIT_03		= 256'b0;
	parameter		INIT_04		= 256'b0;
	parameter		INIT_05		= 256'b0;
	parameter		INIT_06		= 256'b0;
	parameter		INIT_07		= 256'b0;
	parameter		INIT_08		= 256'b0;
	parameter		INIT_09		= 256'b0;
	parameter		INIT_0A		= 256'b0;
	parameter		INIT_0B		= 256'b0;
	parameter		INIT_0C		= 256'b0;
	parameter		INIT_0D		= 256'b0;
	parameter		INIT_0E		= 256'b0;
	parameter		INIT_0F		= 256'b0;
	parameter		INIT_10		= 256'b0;
	parameter		INIT_11		= 256'b0;
	parameter		INIT_12		= 256'b0;
	parameter		INIT_13		= 256'b0;
	parameter		INIT_14		= 256'b0;
	parameter		INIT_15		= 256'b0;
	parameter		INIT_16		= 256'b0;
	parameter		INIT_17		= 256'b0;
	parameter		INIT_18		= 256'b0;
	parameter		INIT_19		= 256'b0;
	parameter		INIT_1A		= 256'b0;
	parameter		INIT_1B		= 256'b0;
	parameter		INIT_1C		= 256'b0;
	parameter		INIT_1D		= 256'b0;
	parameter		INIT_1E		= 256'b0;
	parameter		INIT_1F		= 256'b0;
	parameter		INIT_A		= 18'b0;
	parameter		INIT_B		= 18'b0;
	parameter		INIT_FILE	= "NONE";
	parameter		RAM_MODE	= "TDP";
	parameter		RSTTYPE		= "SYNC";
	parameter		RST_PRIORITY_A	= "SR";
	parameter		RST_PRIORITY_B	= "SR";
	parameter		SETUP_ALL	= 1000;
	parameter		SETUP_READ_FIRST
						= 3000;
	parameter		SIM_COLLISION_CHECK
						= "ALL";
	parameter		SRVAL_A		= 18'b0;
	parameter		SRVAL_B		= 18'b0;
	parameter		WRITE_MODE_A	= "WRITE_FIRST";
	parameter		WRITE_MODE_B	= "WRITE_FIRST";
	parameter		widest_width	= ((DATA_WIDTH_A >= DATA_WIDTH_B
		) ? DATA_WIDTH_A : DATA_WIDTH_B);
	parameter		a_width		= ((DATA_WIDTH_A == 1) ? 1 : ((
		DATA_WIDTH_A == 2) ? 2 : ((DATA_WIDTH_A == 4) ? 4 : ((
		DATA_WIDTH_A == 9) ? 8 : ((DATA_WIDTH_A == 18) ? 16 : ((
		DATA_WIDTH_A == 36) ? 32 : 32))))));
	parameter		b_width		= ((DATA_WIDTH_B == 1) ? 1 : ((
		DATA_WIDTH_B == 2) ? 2 : ((DATA_WIDTH_B == 4) ? 4 : ((
		DATA_WIDTH_B == 9) ? 8 : ((DATA_WIDTH_B == 18) ? 16 : ((
		DATA_WIDTH_B == 36) ? 32 : 32))))));
	parameter		a_widthp	= ((DATA_WIDTH_A == 9) ? 1 : ((
		DATA_WIDTH_A == 18) ? 2 : ((DATA_WIDTH_A == 36) ? 4 : 4)));
	parameter		b_widthp	= ((DATA_WIDTH_B == 9) ? 1 : ((
		DATA_WIDTH_B == 18) ? 2 : ((DATA_WIDTH_B == 36) ? 4 : 4)));
	parameter		col_addr_lsb	= ((widest_width == 1) ? 0 : ((
		widest_width == 2) ? 1 : ((widest_width == 4) ? 2 : ((
		widest_width == 9) ? 3 : ((widest_width == 18) ? 4 : ((
		widest_width == 36) ? 5 : 0))))));
	parameter		width		= ((widest_width == 1) ? 1 : ((
		widest_width == 2) ? 2 : ((widest_width == 4) ? 4 : ((
		widest_width == 9) ? 8 : ((widest_width == 18) ? 16 : ((
		widest_width == 36) ? 32 : 32))))));
	parameter		widthp		= ((widest_width == 9) ? 1 : ((
		widest_width == 18) ? 2 : ((widest_width == 36) ? 4 : 4)));
	parameter		addrawraddr_lbit_124
						= ((DATA_WIDTH_A == 1) ? 0 : ((
		DATA_WIDTH_A == 2) ? 1 : ((DATA_WIDTH_A == 4) ? 2 : ((
		DATA_WIDTH_A == 9) ? 3 : ((DATA_WIDTH_A == 18) ? 4 : ((
		DATA_WIDTH_A == 36) ? 5 : 5))))));
	parameter		addrbrdaddr_lbit_124
						= ((DATA_WIDTH_B == 1) ? 0 : ((
		DATA_WIDTH_B == 2) ? 1 : ((DATA_WIDTH_B == 4) ? 2 : ((
		DATA_WIDTH_B == 9) ? 3 : ((DATA_WIDTH_B == 18) ? 4 : ((
		DATA_WIDTH_B == 36) ? 5 : 5))))));
	parameter		addrawraddr_bit_124
						= (((DATA_WIDTH_A == 1) && (
		widest_width == 2)) ? 0 : (((DATA_WIDTH_A == 1) && (widest_width
		== 4)) ? 1 : (((DATA_WIDTH_A == 1) && (widest_width == 9)) ? 2 :
		(((DATA_WIDTH_A == 1) && (widest_width == 18)) ? 3 : (((
		DATA_WIDTH_A == 1) && (widest_width == 36)) ? 4 : (((
		DATA_WIDTH_A == 2) && (widest_width == 4)) ? 1 : (((DATA_WIDTH_A
		== 2) && (widest_width == 9)) ? 2 : (((DATA_WIDTH_A == 2) && (
		widest_width == 18)) ? 3 : (((DATA_WIDTH_A == 2) && (
		widest_width == 36)) ? 4 : (((DATA_WIDTH_A == 4) && (
		widest_width == 9)) ? 2 : (((DATA_WIDTH_A == 4) && (widest_width
		== 18)) ? 3 : (((DATA_WIDTH_A == 4) && (widest_width == 36)) ? 4
		: 5))))))))))));
	parameter		addrbrdaddr_bit_124
						= (((DATA_WIDTH_B == 1) && (
		widest_width == 2)) ? 0 : (((DATA_WIDTH_B == 1) && (widest_width
		== 4)) ? 1 : (((DATA_WIDTH_B == 1) && (widest_width == 9)) ? 2 :
		(((DATA_WIDTH_B == 1) && (widest_width == 18)) ? 3 : (((
		DATA_WIDTH_B == 1) && (widest_width == 36)) ? 4 : (((
		DATA_WIDTH_B == 2) && (widest_width == 4)) ? 1 : (((DATA_WIDTH_B
		== 2) && (widest_width == 9)) ? 2 : (((DATA_WIDTH_B == 2) && (
		widest_width == 18)) ? 3 : (((DATA_WIDTH_B == 2) && (
		widest_width == 36)) ? 4 : (((DATA_WIDTH_B == 4) && (
		widest_width == 9)) ? 2 : (((DATA_WIDTH_B == 4) && (widest_width
		== 18)) ? 3 : (((DATA_WIDTH_B == 4) && (widest_width == 36)) ? 4
		: 5))))))))))));
	parameter		addrawraddr_bit_8
						= (((DATA_WIDTH_A == 9) && (
		widest_width == 18)) ? 3 : (((DATA_WIDTH_A == 9) && (
		widest_width == 36)) ? 4 : 4));
	parameter		addrawraddr_bit_16
						= 4;
	parameter		addrbrdaddr_bit_8
						= (((DATA_WIDTH_B == 9) && (
		widest_width == 18)) ? 3 : (((DATA_WIDTH_B == 9) && (
		widest_width == 36)) ? 4 : 4));
	parameter		addrbrdaddr_bit_16
						= 4;
	parameter		mem_depth	= ((widest_width == 1) ? 8192 : 
		((widest_width == 2) ? 4096 : ((widest_width == 4) ? 2048 : ((
		widest_width == 9) ? 1024 : ((widest_width == 18) ? 512 : ((
		widest_width == 36) ? 256 : 8192))))));
	parameter		memp_depth	= ((widest_width == 9) ? 1024 : 
		((widest_width == 18) ? 512 : ((widest_width == 36) ? 256 : 1024
		)));
	parameter		INIT_A_int	= (((RAM_MODE == "SDP") && (
		DATA_WIDTH_A == 36)) ? {INIT_B[17:16], INIT_A[17:16], 
		INIT_B[15:0], INIT_A[15:0]} : INIT_A);
	parameter		INIT_B_int	= (((RAM_MODE == "SDP") && (
		DATA_WIDTH_B == 36)) ? {INIT_B[17:16], INIT_A[17:16], 
		INIT_B[15:0], INIT_A[15:0]} : INIT_B);
	parameter		SRVAL_A_int	= (((RAM_MODE == "SDP") && (
		DATA_WIDTH_A == 36)) ? {SRVAL_B[17:16], SRVAL_A[17:16], 
		SRVAL_B[15:0], SRVAL_A[15:0]} : SRVAL_A);
	parameter		SRVAL_B_int	= (((RAM_MODE == "SDP") && (
		DATA_WIDTH_B == 36)) ? {SRVAL_B[17:16], SRVAL_A[17:16], 
		SRVAL_B[15:0], SRVAL_A[15:0]} : SRVAL_B);
	parameter		wr_mode_a	= ((WRITE_MODE_A == 
		"WRITE_FIRST") ? 2'b0 : ((WRITE_MODE_A == "READ_FIRST") ? 2'b1 :
		2'b10));
	parameter		wr_mode_b	= ((WRITE_MODE_B == 
		"WRITE_FIRST") ? 2'b0 : ((WRITE_MODE_B == "READ_FIRST") ? 2'b1 :
		2'b10));
	parameter		ram_mode_int	= ((RAM_MODE == "TDP") ? 1 : 0);
	parameter		rsttype_int	= ((RSTTYPE == "ASYNC") ? 1 : 0)
		;

	output	[15:0]		DOADO;
	output	[15:0]		DOBDO;
	output	[1:0]		DOPADOP;
	output	[1:0]		DOPBDOP;
	input	[12:0]		ADDRAWRADDR;
	input	[12:0]		ADDRBRDADDR;
	input			CLKAWRCLK;
	input			CLKBRDCLK;
	input	[15:0]		DIADI;
	input	[15:0]		DIBDI;
	input	[1:0]		DIPADIP;
	input	[1:0]		DIPBDIP;
	input			ENAWREN;
	input			ENBRDEN;
	input			REGCEA;
	input			REGCEBREGCE;
	input			RSTA;
	input			RSTBRST;
	input	[1:0]		WEAWEL;
	input	[1:0]		WEBWEU;

	wire	[15:0]		addrawraddr_in;
	wire	[15:0]		addrbrdaddr_in;
	wire	[12:0]		col_addra_reconstruct;
	wire	[12:0]		col_addrb_reconstruct;
	reg	[12:0]		col_addra_reconstruct_reg;
	reg	[12:0]		col_addrb_reconstruct_reg;

	reg	[(widest_width - 1):0]
				tmp_mem[(mem_depth - 1):0];
	reg	[(width - 1):0]	mem[(mem_depth - 1):0];
	reg	[(widthp - 1):0]
				memp[(memp_depth - 1):0];
	integer			count;
	integer			countp;
	integer			init_mult;
	integer			initp_mult;
	integer			large_width;
	integer			count1;
	integer			countp1;
	integer			i;
	integer			i1;
	integer			i_p;
	integer			i_mem;
	integer			init_offset;
	integer			initp_offset;
	reg			tmp1;
	reg	[31:0]		doado_out;
	reg	[31:0]		doado_buf;
	reg	[31:0]		doado_outreg;
	reg	[31:0]		doado_out_out;
	reg	[31:0]		dobdo_out;
	reg	[31:0]		dobdo_buf;
	reg	[31:0]		dobdo_outreg;
	reg	[31:0]		dobdo_out_out;
	reg	[3:0]		dopbdop_out;
	reg	[3:0]		dopbdop_buf;
	reg	[3:0]		dopbdop_outreg;
	reg	[3:0]		dopbdop_out_out;
	reg	[3:0]		dopadop_out;
	reg	[3:0]		dopadop_buf;
	reg	[3:0]		dopadop_outreg;
	reg	[3:0]		dopadop_out_out;
	reg	[63:0]		di_x = 
		64'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
		;
	reg	[7:0]		weawel_reg;
	reg			enbrden_reg;
	reg	[7:0]		webweu_reg;
	reg	[7:0]		webweu_tmp;
	reg	[15:0]		addrawraddr_reg;
	reg	[15:0]		addrbrdaddr_reg;
	reg	[15:0]		addrawraddr_tmp;
	reg	[15:0]		addrbrdaddr_tmp;
	reg	[63:0]		diadi_reg;
	reg	[63:0]		dibdi_reg;
	reg	[3:0]		dipadip_reg;
	reg	[7:0]		dipbdip_reg;
	reg	[15:0]		addr_tmp;
	reg	[7:0]		we_tmp;
	reg			col_wr_wr_msg = 1;
	reg			col_wra_rdb_msg = 1;
	reg			col_wrb_rda_msg = 1;
	wire	[15:0]		dibdi_in;
	wire	[15:0]		diadi_in;
	wire			clkawrclk_in;
	wire			clkbrdclk_in;
	wire	[1:0]		dipbdip_in;
	wire	[1:0]		dipadip_in;
	wire			enawren_in;
	wire			enbrden_in;
	wire			regcea_in;
	wire			regcebregce_in;
	wire			rsta_in;
	wire			rstbrst_in;
	wire	[1:0]		weawel_in;
	wire	[1:0]		webweu_in;
	wire	[(a_width - 1):0]
				diadi_int;
	wire	[(b_width - 1):0]
				dibdi_int;
	wire	[(a_widthp - 1):0]
				dipadip_int;
	wire	[(b_widthp - 1):0]
				dipbdip_int;
	wire	[3:0]		weawel_int;
	wire	[3:0]		webweu_int;
	wire	[15:0]		doado_out_port;
	wire	[15:0]		dobdo_out_port;
	wire	[1:0]		dopadop_out_port;
	wire	[1:0]		dopbdop_out_port;

	assign col_addra_reconstruct[12:0] = (((WRITE_MODE_A == "READ_FIRST") ||
		(WRITE_MODE_B == "READ_FIRST")) ? {addrawraddr_in[12:6], 1'b0, 
		addrawraddr_in[4], 4'b0} : addrawraddr_in[12:0]);
	assign col_addrb_reconstruct[12:0] = (((WRITE_MODE_A == "READ_FIRST") ||
		(WRITE_MODE_B == "READ_FIRST")) ? {addrbrdaddr_in[12:6], 1'b0, 
		addrbrdaddr_in[4], 4'b0} : addrbrdaddr_in[12:0]);
	assign addrawraddr_in = {3'b0, ADDRAWRADDR};
	assign addrbrdaddr_in = {3'b0, ADDRBRDADDR};
	assign clkawrclk_in = CLKAWRCLK;
	assign clkbrdclk_in = CLKBRDCLK;
	assign diadi_in = DIADI;
	assign dibdi_in = DIBDI;
	assign dipadip_in = DIPADIP;
	assign dipbdip_in = DIPBDIP;
	assign DOADO = doado_out_port;
	assign DOPADOP = dopadop_out_port;
	assign DOBDO = dobdo_out_port;
	assign DOPBDOP = dopbdop_out_port;
	assign enawren_in = ENAWREN;
	assign enbrden_in = ENBRDEN;
	assign regcea_in = REGCEA;
	assign regcebregce_in = REGCEBREGCE;
	assign rsta_in = RSTA;
	assign rstbrst_in = RSTBRST;
	assign weawel_in = WEAWEL;
	assign webweu_in = WEBWEU;

	always @(rsta_in or enawren_in or regcea_in) begin
	  if ((rsttype_int == 1) && (rsta_in === 1'b1)) begin
	    if ((((enawren_in == 1'b1) && (RST_PRIORITY_A == "CE")) || (
		    RST_PRIORITY_A == "SR")) && (EN_RSTRAM_A == "TRUE")) begin
	      doado_buf = SRVAL_A_int[0+:a_width];
	      doado_out = SRVAL_A_int[0+:a_width];
	      if (a_width >= 8) begin
		dopadop_buf = SRVAL_A_int[a_width+:a_widthp];
		dopadop_out = SRVAL_A_int[a_width+:a_widthp];
	      end
	    end
	    if (DOA_REG == 1) begin
	      if (((regcea_in == 1'b1) && (RST_PRIORITY_A == "CE")) || (
		      RST_PRIORITY_A == "SR")) begin
		doado_outreg = SRVAL_A_int[0+:a_width];
		if (a_width >= 8) begin
		  dopadop_outreg = SRVAL_A_int[a_width+:a_widthp];
		end
	      end
	    end
	  end
	end
	always @(rstbrst_in or enbrden_in or regcebregce_in) begin
	  if ((rsttype_int == 1) && (rstbrst_in === 1'b1)) begin
	    if ((((enbrden_in == 1'b1) && (RST_PRIORITY_B == "CE")) || (
		    RST_PRIORITY_B == "SR")) && (EN_RSTRAM_B == "TRUE")) begin
	      dobdo_buf = SRVAL_B_int[0+:b_width];
	      dobdo_out = SRVAL_B_int[0+:b_width];
	      if (b_width >= 8) begin
		dopbdop_buf = SRVAL_B_int[b_width+:b_widthp];
		dopbdop_out = SRVAL_B_int[b_width+:b_widthp];
	      end
	    end
	    if (DOB_REG == 1) begin
	      if (((regcebregce_in == 1'b1) && (RST_PRIORITY_B == "CE")) || (
		      RST_PRIORITY_B == "SR")) begin
		dobdo_outreg = SRVAL_B_int[0+:b_width];
		if (b_width >= 8) begin
		  dopbdop_outreg = SRVAL_B_int[b_width+:b_widthp];
		end
	      end
	    end
	  end
	end
	always @(posedge clkawrclk_in) begin
	  if (enawren_in === 1'b1) begin
	    addrawraddr_reg = addrawraddr_in;
	    weawel_reg = weawel_int;
	    diadi_reg = diadi_int;
	    dipadip_reg = dipadip_int;
	    col_addra_reconstruct_reg = col_addra_reconstruct;
	  end
	end
	always @(posedge clkbrdclk_in) begin
	  if (enbrden_in === 1'b1) begin
	    addrbrdaddr_reg = addrbrdaddr_in;
	    webweu_reg = webweu_int;
	    enbrden_reg = enbrden_in;
	    dibdi_reg = dibdi_int;
	    dipbdip_reg = dipbdip_int;
	    col_addrb_reconstruct_reg = col_addrb_reconstruct;
	  end
	end
	always @(posedge clkawrclk_in) begin
	  begin
	    if (((enawren_in == 1'b1) && (RST_PRIORITY_A == "CE")) || (
		    RST_PRIORITY_A == "SR")) begin
	      if ((rsta_in == 1'b1) && (EN_RSTRAM_A == "TRUE")) begin
		doado_buf = SRVAL_A_int[0+:a_width];
		doado_out = SRVAL_A_int[0+:a_width];
		if (a_width >= 8) begin
		  dopadop_buf = SRVAL_A_int[a_width+:a_widthp];
		  dopadop_out = SRVAL_A_int[a_width+:a_widthp];
		end
	      end
	      if ((wr_mode_a == 2'b1) && ((rsta_in === 1'b0) || (EN_RSTRAM_A == 
		      "FALSE"))) begin
		case (a_width)
		  1, 2, 4: begin
		    if (a_width >= width) begin
		      doado_buf = mem[addrawraddr_in[14:addrawraddr_lbit_124]];
		    end
		    else begin
		      doado_buf = mem[addrawraddr_in[14:(addrawraddr_bit_124 +
			      1)]][(addrawraddr_in[addrawraddr_bit_124:addrawraddr_lbit_124]
			      * a_width)+:a_width];
		    end
		  end
		  8: begin
		    if (a_width >= width) begin
		      doado_buf = mem[addrawraddr_in[14:3]];
		      dopadop_buf = memp[addrawraddr_in[14:3]];
		    end
		    else
		      begin
			doado_buf = mem[addrawraddr_in[14:(addrawraddr_bit_8 +
				1)]][(addrawraddr_in[addrawraddr_bit_8:3] *
				8)+:8];
			dopadop_buf = memp[addrawraddr_in[14:(addrawraddr_bit_8
				+ 1)]][(addrawraddr_in[addrawraddr_bit_8:3] *
				1)+:1];
		      end
		  end
		  16: begin
		    if (a_width >= width) begin
		      doado_buf = mem[addrawraddr_in[14:4]];
		      dopadop_buf = memp[addrawraddr_in[14:4]];
		    end
		    else
		      begin
			doado_buf = mem[addrawraddr_in[14:(addrawraddr_bit_16 +
				1)]][(addrawraddr_in[addrawraddr_bit_16:4] *
				16)+:16];
			dopadop_buf = memp[addrawraddr_in[14:(addrawraddr_bit_16
				+ 1)]][(addrawraddr_in[addrawraddr_bit_16:4] *
				2)+:2];
		      end
		  end
		  32: begin
		    if (a_width >= width) begin
		      doado_buf = mem[addrawraddr_in[14:5]];
		      dopadop_buf = memp[addrawraddr_in[14:5]];
		    end
		  end
		endcase
	      end
	      if (enawren_in == 1'b1) begin
		case (a_width)
		  1, 2, 4: begin
		    if (a_width >= width) begin
		      if (weawel_int[0] == 1'b1) begin
			mem[addrawraddr_in[14:addrawraddr_lbit_124]] = 
				diadi_int[(a_width - 1):0];
			if (width >= 8) begin
			  tmp1 = 1'b0;
			end
		      end
		    end
		    else
		      begin
			if (weawel_int[0] == 1'b1) begin
			  mem[addrawraddr_in[14:(addrawraddr_bit_124 +
				  1)]][(addrawraddr_in[addrawraddr_bit_124:addrawraddr_lbit_124]
				  * a_width)+:a_width] = diadi_int[(a_width -
				  1):0];
			  if (width >= 8) begin
			    tmp1 = 1'b0;
			  end
			end
		      end
		  end
		  8: begin
		    if (a_width >= width) begin
		      if (weawel_int[0] == 1'b1) begin
			mem[addrawraddr_in[14:3]] = diadi_int[7:0];
			if (width >= 8) begin
			  memp[addrawraddr_in[14:3]] = dipadip_int[0];
			end
		      end
		    end
		    else
		      begin
			if (weawel_int[0] == 1'b1) begin
			  mem[addrawraddr_in[14:(addrawraddr_bit_8 +
				  1)]][(addrawraddr_in[addrawraddr_bit_8:3] *
				  8)+:8] = diadi_int[7:0];
			  if (width >= 8) begin
			    memp[addrawraddr_in[14:(addrawraddr_bit_8 +
				    1)]][(addrawraddr_in[addrawraddr_bit_8:3] *
				    1)+:1] = dipadip_int[0];
			  end
			end
		      end
		  end
		  16: begin
		    if (a_width >= width) begin
		      begin
			if (weawel_int[0] == 1'b1) begin
			  mem[addrawraddr_in[14:4]][0+:8] = diadi_int[7:0];
			  if (width >= 8) begin
			    memp[addrawraddr_in[14:4]][0] = dipadip_int[0];
			  end
			end
		      end
		      begin
			if (weawel_int[1] == 1'b1) begin
			  mem[addrawraddr_in[14:4]][8+:8] = diadi_int[15:8];
			  if (width >= 8) begin
			    memp[addrawraddr_in[14:4]][1] = dipadip_int[1];
			  end
			end
		      end
		    end
		    else
		      begin
			begin
			  if (weawel_int[0] == 1'b1) begin
			    mem[addrawraddr_in[14:(addrawraddr_bit_16 +
				    1)]][(addrawraddr_in[addrawraddr_bit_16:4] *
				    16)+:8] = diadi_int[7:0];
			    if (width >= 8) begin
			      memp[addrawraddr_in[14:(addrawraddr_bit_16 +
				      1)]][(addrawraddr_in[addrawraddr_bit_16:4]
				      * 2)+:1] = dipadip_int[0];
			    end
			  end
			end
			begin
			  if (weawel_int[1] == 1'b1) begin
			    mem[addrawraddr_in[14:(addrawraddr_bit_16 +
				    1)]][((addrawraddr_in[addrawraddr_bit_16:4]
				    * 16) + 8)+:8] = diadi_int[15:8];
			    if (width >= 8) begin
			      memp[addrawraddr_in[14:(addrawraddr_bit_16 +
				      1)]][((addrawraddr_in[addrawraddr_bit_16:4]
				      * 2) + 1)+:1] = dipadip_int[1];
			    end
			  end
			end
		      end
		  end
		  32: begin
		    begin
		      if (weawel_int[0] == 1'b1) begin
			mem[addrawraddr_in[14:5]][0+:8] = diadi_int[7:0];
			if (width >= 8) begin
			  memp[addrawraddr_in[14:5]][0] = dipadip_int[0];
			end
		      end
		    end
		    begin
		      if (weawel_int[1] == 1'b1) begin
			mem[addrawraddr_in[14:5]][8+:8] = diadi_int[15:8];
			if (width >= 8) begin
			  memp[addrawraddr_in[14:5]][1] = dipadip_int[1];
			end
		      end
		    end
		    begin
		      if (weawel_int[2] == 1'b1) begin
			mem[addrawraddr_in[14:5]][16+:8] = diadi_int[23:16];
			if (width >= 8) begin
			  memp[addrawraddr_in[14:5]][2] = dipadip_int[2];
			end
		      end
		    end
		    begin
		      if (weawel_int[3] == 1'b1) begin
			mem[addrawraddr_in[14:5]][24+:8] = diadi_int[31:24];
			if (width >= 8) begin
			  memp[addrawraddr_in[14:5]][3] = dipadip_int[3];
			end
		      end
		    end
		  end
		endcase
	      end
	      if ((wr_mode_a != 2'b1) && ((rsta_in === 1'b0) || (EN_RSTRAM_A == 
		      "FALSE"))) begin
		case (a_width)
		  1, 2, 4: begin
		    if (a_width >= width) begin
		      doado_buf = mem[addrawraddr_in[14:addrawraddr_lbit_124]];
		    end
		    else begin
		      doado_buf = mem[addrawraddr_in[14:(addrawraddr_bit_124 +
			      1)]][(addrawraddr_in[addrawraddr_bit_124:addrawraddr_lbit_124]
			      * a_width)+:a_width];
		    end
		  end
		  8: begin
		    if (a_width >= width) begin
		      doado_buf = mem[addrawraddr_in[14:3]];
		      dopadop_buf = memp[addrawraddr_in[14:3]];
		    end
		    else
		      begin
			doado_buf = mem[addrawraddr_in[14:(addrawraddr_bit_8 +
				1)]][(addrawraddr_in[addrawraddr_bit_8:3] *
				8)+:8];
			dopadop_buf = memp[addrawraddr_in[14:(addrawraddr_bit_8
				+ 1)]][(addrawraddr_in[addrawraddr_bit_8:3] *
				1)+:1];
		      end
		  end
		  16: begin
		    if (a_width >= width) begin
		      doado_buf = mem[addrawraddr_in[14:4]];
		      dopadop_buf = memp[addrawraddr_in[14:4]];
		    end
		    else
		      begin
			doado_buf = mem[addrawraddr_in[14:(addrawraddr_bit_16 +
				1)]][(addrawraddr_in[addrawraddr_bit_16:4] *
				16)+:16];
			dopadop_buf = memp[addrawraddr_in[14:(addrawraddr_bit_16
				+ 1)]][(addrawraddr_in[addrawraddr_bit_16:4] *
				2)+:2];
		      end
		  end
		  32: begin
		    if (a_width >= width) begin
		      doado_buf = mem[addrawraddr_in[14:5]];
		      dopadop_buf = memp[addrawraddr_in[14:5]];
		    end
		  end
		endcase
	      end
	    end
	  end
	  if (enawren_in) begin
	    if (((rsta_in === 1'b0) || (EN_RSTRAM_A == "FALSE")) && ((((
		    wr_mode_a != 2'b10) || ((DATA_WIDTH_A <= 9) && (
		    weawel_int[0] === 1'b0))) || ((DATA_WIDTH_A == 18) && (
		    weawel_int[1:0] === 2'b0))) || ((DATA_WIDTH_A == 36) && (
		    weawel_int[3:0] === 4'b0)))) begin
	      doado_out <= doado_buf;
	      if (a_width >= 8) begin
		dopadop_out <= dopadop_buf;
	      end
	    end
	  end
	end
	always @(posedge clkbrdclk_in) begin
	  begin
	    if (((enbrden_in == 1'b1) && (RST_PRIORITY_B == "CE")) || (
		    RST_PRIORITY_B == "SR")) begin
	      if ((rstbrst_in == 1'b1) && (EN_RSTRAM_B == "TRUE")) begin
		dobdo_buf = SRVAL_B_int[0+:b_width];
		dobdo_out = SRVAL_B_int[0+:b_width];
		if (b_width >= 8) begin
		  dopbdop_buf = SRVAL_B_int[b_width+:b_widthp];
		  dopbdop_out = SRVAL_B_int[b_width+:b_widthp];
		end
	      end
	      if ((wr_mode_b == 2'b1) && ((rstbrst_in === 1'b0) || (EN_RSTRAM_B 
		      == "FALSE"))) begin
		case (b_width)
		  1, 2, 4: begin
		    if (b_width >= width) begin
		      dobdo_buf = mem[addrbrdaddr_in[14:addrbrdaddr_lbit_124]];
		    end
		    else begin
		      dobdo_buf = mem[addrbrdaddr_in[14:(addrbrdaddr_bit_124 +
			      1)]][(addrbrdaddr_in[addrbrdaddr_bit_124:addrbrdaddr_lbit_124]
			      * b_width)+:b_width];
		    end
		  end
		  8: begin
		    if (b_width >= width) begin
		      dobdo_buf = mem[addrbrdaddr_in[14:3]];
		      dopbdop_buf = memp[addrbrdaddr_in[14:3]];
		    end
		    else
		      begin
			dobdo_buf = mem[addrbrdaddr_in[14:(addrbrdaddr_bit_8 +
				1)]][(addrbrdaddr_in[addrbrdaddr_bit_8:3] *
				8)+:8];
			dopbdop_buf = memp[addrbrdaddr_in[14:(addrbrdaddr_bit_8
				+ 1)]][(addrbrdaddr_in[addrbrdaddr_bit_8:3] *
				1)+:1];
		      end
		  end
		  16: begin
		    if (b_width >= width) begin
		      dobdo_buf = mem[addrbrdaddr_in[14:4]];
		      dopbdop_buf = memp[addrbrdaddr_in[14:4]];
		    end
		    else
		      begin
			dobdo_buf = mem[addrbrdaddr_in[14:(addrbrdaddr_bit_16 +
				1)]][(addrbrdaddr_in[addrbrdaddr_bit_16:4] *
				16)+:16];
			dopbdop_buf = memp[addrbrdaddr_in[14:(addrbrdaddr_bit_16
				+ 1)]][(addrbrdaddr_in[addrbrdaddr_bit_16:4] *
				2)+:2];
		      end
		  end
		  32: begin
		    dobdo_buf = mem[addrbrdaddr_in[14:5]];
		    dopbdop_buf = memp[addrbrdaddr_in[14:5]];
		  end
		endcase
	      end
	      if (enbrden_in == 1'b1) begin
		case (b_width)
		  1, 2, 4: begin
		    if (b_width >= width) begin
		      if (webweu_int[0] == 1'b1) begin
			mem[addrbrdaddr_in[14:addrbrdaddr_lbit_124]] = 
				dibdi_int[(b_width - 1):0];
			if (width >= 8) begin
			  tmp1 = 1'b0;
			end
		      end
		    end
		    else
		      begin
			if (webweu_int[0] == 1'b1) begin
			  mem[addrbrdaddr_in[14:(addrbrdaddr_bit_124 +
				  1)]][(addrbrdaddr_in[addrbrdaddr_bit_124:addrbrdaddr_lbit_124]
				  * b_width)+:b_width] = dibdi_int[(b_width -
				  1):0];
			  if (width >= 8) begin
			    tmp1 = 1'b0;
			  end
			end
		      end
		  end
		  8: begin
		    if (b_width >= width) begin
		      if (webweu_int[0] == 1'b1) begin
			mem[addrbrdaddr_in[14:3]] = dibdi_int[7:0];
			if (width >= 8) begin
			  memp[addrbrdaddr_in[14:3]] = dipbdip_int[0];
			end
		      end
		    end
		    else
		      begin
			if (webweu_int[0] == 1'b1) begin
			  mem[addrbrdaddr_in[14:(addrbrdaddr_bit_8 +
				  1)]][(addrbrdaddr_in[addrbrdaddr_bit_8:3] *
				  8)+:8] = dibdi_int[7:0];
			  if (width >= 8) begin
			    memp[addrbrdaddr_in[14:(addrbrdaddr_bit_8 +
				    1)]][(addrbrdaddr_in[addrbrdaddr_bit_8:3] *
				    1)+:1] = dipbdip_int[0];
			  end
			end
		      end
		  end
		  16: begin
		    if (b_width >= width) begin
		      begin
			if (webweu_int[0] == 1'b1) begin
			  mem[addrbrdaddr_in[14:4]][0+:8] = dibdi_int[7:0];
			  if (width >= 8) begin
			    memp[addrbrdaddr_in[14:4]][0] = dipbdip_int[0];
			  end
			end
		      end
		      begin
			if (webweu_int[1] == 1'b1) begin
			  mem[addrbrdaddr_in[14:4]][8+:8] = dibdi_int[15:8];
			  if (width >= 8) begin
			    memp[addrbrdaddr_in[14:4]][1] = dipbdip_int[1];
			  end
			end
		      end
		    end
		    else
		      begin
			begin
			  if (webweu_int[0] == 1'b1) begin
			    mem[addrbrdaddr_in[14:(addrbrdaddr_bit_16 +
				    1)]][(addrbrdaddr_in[addrbrdaddr_bit_16:4] *
				    16)+:8] = dibdi_int[7:0];
			    if (width >= 8) begin
			      memp[addrbrdaddr_in[14:(addrbrdaddr_bit_16 +
				      1)]][(addrbrdaddr_in[addrbrdaddr_bit_16:4]
				      * 2)+:1] = dipbdip_int[0];
			    end
			  end
			end
			begin
			  if (webweu_int[1] == 1'b1) begin
			    mem[addrbrdaddr_in[14:(addrbrdaddr_bit_16 +
				    1)]][((addrbrdaddr_in[addrbrdaddr_bit_16:4]
				    * 16) + 8)+:8] = dibdi_int[15:8];
			    if (width >= 8) begin
			      memp[addrbrdaddr_in[14:(addrbrdaddr_bit_16 +
				      1)]][((addrbrdaddr_in[addrbrdaddr_bit_16:4]
				      * 2) + 1)+:1] = dipbdip_int[1];
			    end
			  end
			end
		      end
		  end
		  32: begin
		    begin
		      if (webweu_int[0] == 1'b1) begin
			mem[addrbrdaddr_in[14:5]][0+:8] = dibdi_int[7:0];
			if (width >= 8) begin
			  memp[addrbrdaddr_in[14:5]][0] = dipbdip_int[0];
			end
		      end
		    end
		    begin
		      if (webweu_int[1] == 1'b1) begin
			mem[addrbrdaddr_in[14:5]][8+:8] = dibdi_int[15:8];
			if (width >= 8) begin
			  memp[addrbrdaddr_in[14:5]][1] = dipbdip_int[1];
			end
		      end
		    end
		    begin
		      if (webweu_int[2] == 1'b1) begin
			mem[addrbrdaddr_in[14:5]][16+:8] = dibdi_int[23:16];
			if (width >= 8) begin
			  memp[addrbrdaddr_in[14:5]][2] = dipbdip_int[2];
			end
		      end
		    end
		    begin
		      if (webweu_int[3] == 1'b1) begin
			mem[addrbrdaddr_in[14:5]][24+:8] = dibdi_int[31:24];
			if (width >= 8) begin
			  memp[addrbrdaddr_in[14:5]][3] = dipbdip_int[3];
			end
		      end
		    end
		  end
		endcase
	      end
	      if ((wr_mode_b != 2'b1) && ((rstbrst_in === 1'b0) || (EN_RSTRAM_B 
		      == "FALSE"))) begin
		case (b_width)
		  1, 2, 4: begin
		    if (b_width >= width) begin
		      dobdo_buf = mem[addrbrdaddr_in[14:addrbrdaddr_lbit_124]];
		    end
		    else begin
		      dobdo_buf = mem[addrbrdaddr_in[14:(addrbrdaddr_bit_124 +
			      1)]][(addrbrdaddr_in[addrbrdaddr_bit_124:addrbrdaddr_lbit_124]
			      * b_width)+:b_width];
		    end
		  end
		  8: begin
		    if (b_width >= width) begin
		      dobdo_buf = mem[addrbrdaddr_in[14:3]];
		      dopbdop_buf = memp[addrbrdaddr_in[14:3]];
		    end
		    else
		      begin
			dobdo_buf = mem[addrbrdaddr_in[14:(addrbrdaddr_bit_8 +
				1)]][(addrbrdaddr_in[addrbrdaddr_bit_8:3] *
				8)+:8];
			dopbdop_buf = memp[addrbrdaddr_in[14:(addrbrdaddr_bit_8
				+ 1)]][(addrbrdaddr_in[addrbrdaddr_bit_8:3] *
				1)+:1];
		      end
		  end
		  16: begin
		    if (b_width >= width) begin
		      dobdo_buf = mem[addrbrdaddr_in[14:4]];
		      dopbdop_buf = memp[addrbrdaddr_in[14:4]];
		    end
		    else
		      begin
			dobdo_buf = mem[addrbrdaddr_in[14:(addrbrdaddr_bit_16 +
				1)]][(addrbrdaddr_in[addrbrdaddr_bit_16:4] *
				16)+:16];
			dopbdop_buf = memp[addrbrdaddr_in[14:(addrbrdaddr_bit_16
				+ 1)]][(addrbrdaddr_in[addrbrdaddr_bit_16:4] *
				2)+:2];
		      end
		  end
		  32: begin
		    dobdo_buf = mem[addrbrdaddr_in[14:5]];
		    dopbdop_buf = memp[addrbrdaddr_in[14:5]];
		  end
		endcase
	      end
	    end
	  end
	  if (enbrden_in) begin
	    if (((rstbrst_in === 1'b0) || (EN_RSTRAM_B == "FALSE")) && ((((
		    wr_mode_b != 2'b10) || ((DATA_WIDTH_B <= 9) && (
		    webweu_int[0] === 1'b0))) || ((DATA_WIDTH_B == 18) && (
		    webweu_int[1:0] === 2'b0))) || ((DATA_WIDTH_B == 36) && (
		    webweu_int[3:0] === 4'b0)))) begin
	      dobdo_out <= dobdo_buf;
	      if (b_width >= 8) begin
		dopbdop_out <= dopbdop_buf;
	      end
	    end
	  end
	end
	always @(posedge clkawrclk_in) begin
	  if (DOA_REG == 1) begin
	    if (RST_PRIORITY_A == "CE") begin
	      if (regcea_in == 1'b1) begin
		if (rsta_in === 1'b1) begin
		  doado_outreg <= SRVAL_A_int[0+:a_width];
		  if (a_width >= 8) begin
		    dopadop_outreg <= SRVAL_A_int[a_width+:a_widthp];
		  end
		end
		else if (rsta_in === 1'b0) begin
		  doado_outreg <= doado_out;
		  if (a_width >= 8) begin
		    dopadop_outreg <= dopadop_out;
		  end
		end
	      end
	    end
	    else
	      begin
		if (rsta_in === 1'b1) begin
		  doado_outreg <= SRVAL_A_int[0+:a_width];
		  if (a_width >= 8) begin
		    dopadop_outreg <= SRVAL_A_int[a_width+:a_widthp];
		  end
		end
		else if (rsta_in === 1'b0) begin
		  if (regcea_in == 1'b1) begin
		    doado_outreg <= doado_out;
		    if (a_width >= 8) begin
		      dopadop_outreg <= dopadop_out;
		    end
		  end
		end
	      end
	  end
	end
	always @(doado_out or dopadop_out or doado_outreg or dopadop_outreg) 
		begin
	  case (DOA_REG)
	    0: begin
	      doado_out_out[0+:a_width] = doado_out[0+:a_width];
	      if (a_width >= 8) begin
		dopadop_out_out[0+:a_widthp] = dopadop_out[0+:a_widthp];
	      end
	    end
	    1: begin
	      doado_out_out[0+:a_width] = doado_outreg[0+:a_width];
	      if (a_width >= 8) begin
		dopadop_out_out[0+:a_widthp] = dopadop_outreg[0+:a_widthp];
	      end
	    end
	  endcase
	end
	always @(posedge clkbrdclk_in) begin
	  if (DOB_REG == 1) begin
	    if (RST_PRIORITY_B == "CE") begin
	      if (regcebregce_in == 1'b1) begin
		if (rstbrst_in === 1'b1) begin
		  dobdo_outreg <= SRVAL_B_int[0+:b_width];
		  if (b_width >= 8) begin
		    dopbdop_outreg <= SRVAL_B_int[b_width+:b_widthp];
		  end
		end
		else if (rstbrst_in === 1'b0) begin
		  dobdo_outreg <= dobdo_out;
		  if (b_width >= 8) begin
		    dopbdop_outreg <= dopbdop_out;
		  end
		end
	      end
	    end
	    else
	      begin
		if (rstbrst_in === 1'b1) begin
		  dobdo_outreg <= SRVAL_B_int[0+:b_width];
		  if (b_width >= 8) begin
		    dopbdop_outreg <= SRVAL_B_int[b_width+:b_widthp];
		  end
		end
		else if (rstbrst_in === 1'b0) begin
		  if (regcebregce_in == 1'b1) begin
		    dobdo_outreg <= dobdo_out;
		    if (b_width >= 8) begin
		      dopbdop_outreg <= dopbdop_out;
		    end
		  end
		end
	      end
	  end
	end
	always @(dobdo_out or dopbdop_out or dobdo_outreg or dopbdop_outreg) 
		begin
	  case (DOB_REG)
	    0: begin
	      dobdo_out_out[0+:b_width] = dobdo_out[0+:b_width];
	      if (b_width >= 8) begin
		dopbdop_out_out[0+:b_widthp] = dopbdop_out[0+:b_widthp];
	      end
	    end
	    1: begin
	      dobdo_out_out[0+:b_width] = dobdo_outreg[0+:b_width];
	      if (b_width >= 8) begin
		dopbdop_out_out[0+:b_widthp] = dopbdop_outreg[0+:b_widthp];
	      end
	    end
	  endcase
	end

	generate  begin 
	  case (RAM_MODE)
	    "TDP": begin  begin 
		assign dibdi_int = dibdi_in;
		assign diadi_int = diadi_in;
		assign dipbdip_int = dipbdip_in;
		assign dipadip_int = dipadip_in;
		assign doado_out_port = doado_out_out;
		assign dobdo_out_port = dobdo_out_out;
		assign dopadop_out_port = dopadop_out_out;
		assign dopbdop_out_port = dopbdop_out_out;
		assign webweu_int = webweu_in;
		assign weawel_int = weawel_in;
	      end
	    end
	    "SDP": begin  begin 
		assign dibdi_int = 32'b0;
		assign diadi_int = {dibdi_in, diadi_in};
		assign dipbdip_int = 4'b0;
		assign dipadip_int = {dipbdip_in, dipadip_in};
		assign doado_out_port = dobdo_out_out[15:0];
		assign dobdo_out_port = dobdo_out_out[31:16];
		assign dopadop_out_port = dopbdop_out_out[1:0];
		assign dopbdop_out_port = dopbdop_out_out[3:2];
		assign webweu_int = 4'b0;
		assign weawel_int = {webweu_in, weawel_in};
	      end
	    end
	  endcase
	end
	endgenerate
endmodule
