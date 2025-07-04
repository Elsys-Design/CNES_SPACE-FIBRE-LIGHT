///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                 36K-Bit FIFO 
// /___/   /\     Filename : FIFO36.v
// \   \  /  \    Timestamp : Thu Jul 14 10:37:25 PST 2009
//  \___\/\___\
//
// Revision:
//    07/14/09 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module FIFO36 (ALMOSTEMPTY, ALMOSTFULL, DO, DOP, EMPTY, FULL, RDCOUNT, RDERR, WRCOUNT, WRERR,
	       DI, DIP, RDCLK, RDEN, RST, WRCLK, WREN);

    parameter [12:0] ALMOST_EMPTY_OFFSET = 13'h080;
    parameter [12:0] ALMOST_FULL_OFFSET = 13'h080;
    parameter integer DATA_WIDTH = 4;
    parameter integer DO_REG = 1;
    parameter EN_SYN = "FALSE";
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";
    parameter SIM_MODE = "SAFE";
 
    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output [31:0] DO;
    output [3:0] DOP;
    output EMPTY;
    output FULL;
    output [12:0] RDCOUNT;
    output RDERR;
    output [12:0] WRCOUNT;
    output WRERR;

    input [31:0] DI;
    input [3:0] DIP;
    input RDCLK;
    input RDEN;
    input RST;
    input WRCLK;
    input WREN;

    wire [31:0] dummy_DO;
    wire [3:0] dummy_DOP;

FIFO36E1 #(.ALMOST_EMPTY_OFFSET(ALMOST_EMPTY_OFFSET), .ALMOST_FULL_OFFSET(ALMOST_FULL_OFFSET), .DATA_WIDTH(DATA_WIDTH), .DO_REG(DO_REG), .FIFO_MODE("FIFO36"), .EN_SYN(EN_SYN), .FIRST_WORD_FALL_THROUGH(FIRST_WORD_FALL_THROUGH)) F9 (.ALMOSTEMPTY(ALMOSTEMPTY), .ALMOSTFULL(ALMOSTFULL), .DBITERR(), .DO({dummy_DO[31:0], DO[31:0]}), .DOP({dummy_DOP[3:0], DOP[3:0]}), .ECCPARITY(), .EMPTY(EMPTY), .FULL(FULL), .RDCOUNT(RDCOUNT), .RDERR(RDERR), .SBITERR(), .WRCOUNT(WRCOUNT), .WRERR(WRERR), .DI({32'b0, DI[31:0]}), .DIP({4'b0, DIP[3:0]}), .INJECTDBITERR(1'b0), .INJECTSBITERR(1'b0), .RDCLK(RDCLK), .RDEN(RDEN), .REGCE(1'b1), .RST(RST), .RSTREG(1'b0), .WRCLK(WRCLK), .WREN(WREN));

endmodule
