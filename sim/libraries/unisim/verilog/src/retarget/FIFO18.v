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
// /___/   /\     Filename : FIFO18.v
// \   \  /  \    Timestamp : Thu Jul 14 10:10:40 PST 2009
//  \___\/\___\
//
// Revision:
//    07/14/09 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module FIFO18 (ALMOSTEMPTY, ALMOSTFULL, DO, DOP, EMPTY, FULL, RDCOUNT, RDERR, WRCOUNT, WRERR,
	       DI, DIP, RDCLK, RDEN, RST, WRCLK, WREN);

    parameter [11:0] ALMOST_EMPTY_OFFSET = 12'h080;
    parameter [11:0] ALMOST_FULL_OFFSET = 12'h080;
    parameter integer DATA_WIDTH = 4;
    parameter integer DO_REG = 1;
    parameter EN_SYN = "FALSE";
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";
    parameter SIM_MODE = "SAFE";
 
    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output [15:0] DO;
    output [1:0] DOP;
    output EMPTY;
    output FULL;
    output [11:0] RDCOUNT;
    output RDERR;
    output [11:0] WRCOUNT;
    output WRERR;

    input [15:0] DI;
    input [1:0] DIP;
    input RDCLK;
    input RDEN;
    input RST;
    input WRCLK;
    input WREN;

    wire [1:0] dummy_DOP;
    wire [15:0] dummy_DO;

FIFO18E1 #(.ALMOST_EMPTY_OFFSET(ALMOST_EMPTY_OFFSET), .ALMOST_FULL_OFFSET(ALMOST_FULL_OFFSET), .DATA_WIDTH(DATA_WIDTH), .DO_REG(DO_REG), .FIFO_MODE("FIFO18"), .EN_SYN(EN_SYN), .FIRST_WORD_FALL_THROUGH(FIRST_WORD_FALL_THROUGH)) F8 (.ALMOSTEMPTY(ALMOSTEMPTY), .ALMOSTFULL(ALMOSTFULL), .DO({dummy_DO[15:0],DO[15:0]}), .DOP({dummy_DOP[1:0],DOP[1:0]}), .EMPTY(EMPTY), .FULL(FULL), .RDCOUNT(RDCOUNT), .RDERR(RDERR), .WRCOUNT(WRCOUNT), .WRERR(WRERR), .DI({16'b0,DI[15:0]}), .DIP({2'b0,DIP[1:0]}), .RDCLK(RDCLK), .RDEN(RDEN), .REGCE(1'b1), .RST(RST), .RSTREG(1'b0), .WRCLK(WRCLK), .WREN(WREN));

endmodule
