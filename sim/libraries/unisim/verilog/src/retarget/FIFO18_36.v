///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                 18K-Bit FIFO 
// /___/   /\     Filename : FIFO18_36.v
// \   \  /  \    Timestamp : Thu Jul 14 10:26:15 PST 2009
//  \___\/\___\
//
// Revision:
//    07/14/09 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module FIFO18_36 (ALMOSTEMPTY, ALMOSTFULL, DO, DOP, EMPTY, FULL, RDCOUNT, RDERR, WRCOUNT, WRERR,
	       DI, DIP, RDCLK, RDEN, RST, WRCLK, WREN);

    parameter [8:0] ALMOST_EMPTY_OFFSET = 9'h080;
    parameter [8:0] ALMOST_FULL_OFFSET = 9'h080;
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
    output [8:0] RDCOUNT;
    output RDERR;
    output [8:0] WRCOUNT;
    output WRERR;

    input [31:0] DI;
    input [3:0] DIP;
    input RDCLK;
    input RDEN;
    input RST;
    input WRCLK;
    input WREN;
    wire [2:0] dummy_rdcount;
    wire [2:0] dummy_wrcount;


FIFO18E1 #(.ALMOST_EMPTY_OFFSET(ALMOST_EMPTY_OFFSET), .ALMOST_FULL_OFFSET(ALMOST_FULL_OFFSET), .DATA_WIDTH(36), .DO_REG(DO_REG), .FIFO_MODE("FIFO18_36"), .EN_SYN(EN_SYN), .FIRST_WORD_FALL_THROUGH(FIRST_WORD_FALL_THROUGH)) F8 (.ALMOSTEMPTY(ALMOSTEMPTY), .ALMOSTFULL(ALMOSTFULL), .DO(DO), .DOP(DOP), .EMPTY(EMPTY), .FULL(FULL), .RDCOUNT({dummy_rdcount[2:0], RDCOUNT[8:0]}), .RDERR(RDERR), .WRCOUNT({dummy_wrcount[2:0], WRCOUNT[8:0]}), .WRERR(WRERR), .DI(DI), .DIP(DIP), .RDCLK(RDCLK), .RDEN(RDEN), .REGCE(1'b1), .RST(RST), .RSTREG(1'b0), .WRCLK(WRCLK), .WREN(WREN));

endmodule
