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
// /___/   /\     Filename : FIFO36_72.v
// \   \  /  \    Timestamp : Thu Jul 14 10:47:20 PST 2009
//  \___\/\___\
//
// Revision:
//    07/14/09 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module FIFO36_72 (ALMOSTEMPTY, ALMOSTFULL, DBITERR, DO, DOP, ECCPARITY, EMPTY, FULL, RDCOUNT, RDERR, SBITERR, WRCOUNT, WRERR, DI, DIP, RDCLK, RDEN, RST, WRCLK, WREN);

    parameter [8:0] ALMOST_EMPTY_OFFSET = 9'h080;
    parameter [8:0] ALMOST_FULL_OFFSET = 9'h080;
    parameter integer DO_REG = 1;
    parameter EN_ECC_WRITE = "FALSE";
    parameter EN_ECC_READ = "FALSE";
    parameter EN_SYN = "FALSE";
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";
    parameter SIM_MODE = "SAFE";
 
    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output DBITERR;
    output [63:0] DO;
    output [7:0] DOP;
    output [7:0] ECCPARITY;
    output EMPTY;
    output FULL;
    output [8:0] RDCOUNT;
    output RDERR;
    output SBITERR;
    output [8:0] WRCOUNT;
    output WRERR;

    input [63:0] DI;
    input [7:0] DIP;
    input RDCLK;
    input RDEN;
    input RST;
    input WRCLK;
    input WREN;

    wire [3:0] dummy_RDCOUNT;
    wire [3:0] dummy_WRCOUNT;

FIFO36E1 #(.ALMOST_EMPTY_OFFSET(ALMOST_EMPTY_OFFSET), .ALMOST_FULL_OFFSET(ALMOST_FULL_OFFSET), .DATA_WIDTH(72), .DO_REG(DO_REG), .EN_ECC_READ(EN_ECC_READ), .EN_ECC_WRITE(EN_ECC_WRITE), .FIFO_MODE("FIFO36_72"), .EN_SYN(EN_SYN), .FIRST_WORD_FALL_THROUGH(FIRST_WORD_FALL_THROUGH)) F9 (.ALMOSTEMPTY(ALMOSTEMPTY), .ALMOSTFULL(ALMOSTFULL), .DBITERR(DBITERR), .DO(DO), .DOP(DOP), .ECCPARITY(ECCPARITY), .EMPTY(EMPTY), .FULL(FULL), .RDCOUNT({dummy_RDCOUNT[3:0], RDCOUNT[8:0]}), .RDERR(RDERR), .SBITERR(SBITERR), .WRCOUNT({dummy_WRCOUNT[3:0], WRCOUNT[8:0]}), .WRERR(WRERR), .DI(DI), .DIP(DIP), .INJECTDBITERR(1'b0), .INJECTSBITERR(1'b0), .RDCLK(RDCLK), .RDEN(RDEN), .REGCE(1'b1), .RST(RST), .RSTREG(1'b0), .WRCLK(WRCLK), .WREN(WREN));

endmodule
