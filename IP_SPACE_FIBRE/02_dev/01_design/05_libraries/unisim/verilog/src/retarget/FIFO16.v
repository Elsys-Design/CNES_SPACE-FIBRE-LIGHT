///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                 16K-Bit FIFO (Discontinue in 13.1)
// /___/   /\     Filename : FIFO16.v
// \   \  /  \    Timestamp : Thu Jun 24 10:37:40 PST 2009
//  \___\/\___\
//
// Revision:
//    06/24/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module FIFO16 (ALMOSTEMPTY, ALMOSTFULL, DO, DOP, EMPTY, FULL, RDCOUNT, RDERR, WRCOUNT, WRERR, DI, DIP, RDCLK, RDEN, RST, WRCLK, WREN
);

    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output [31:0] DO;
    output [3:0] DOP;
    output EMPTY;
    output FULL;
    output [11:0] RDCOUNT;
    output RDERR;
    output [11:0] WRCOUNT;
    output WRERR;

    input [31:0] DI;
    input [3:0] DIP;
    input RDCLK;
    input RDEN;
    input RST;
    input WRCLK;
    input WREN;

    parameter [11:0] ALMOST_FULL_OFFSET = 12'h080;
    parameter [11:0] ALMOST_EMPTY_OFFSET = 12'h080;
    parameter integer DATA_WIDTH = 36;
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";

generate
if (DATA_WIDTH == 36) begin
FIFO18E1 #(.ALMOST_EMPTY_OFFSET({1'b0, ALMOST_EMPTY_OFFSET}), .ALMOST_FULL_OFFSET({1'b0, ALMOST_FULL_OFFSET}), .DATA_WIDTH(DATA_WIDTH), .FIFO_MODE("FIFO18_36"), .FIRST_WORD_FALL_THROUGH(FIRST_WORD_FALL_THROUGH)) F8 (.ALMOSTEMPTY(ALMOSTEMPTY), .ALMOSTFULL(ALMOSTFULL), .DO(DO), .DOP(DOP), .EMPTY(EMPTY), .FULL(FULL), .RDCOUNT(RDCOUNT), .RDERR(RDERR), .WRCOUNT(WRCOUNT), .WRERR(WRERR), .DI(DI), .DIP(DIP), .RDCLK(RDCLK), .RDEN(RDEN), .REGCE(1'b1), .RST(RST), .RSTREG(1'b0), .WRCLK(WRCLK), .WREN(WREN));
end
else if (DATA_WIDTH <= 18) begin
FIFO18E1 #(.ALMOST_EMPTY_OFFSET({1'b0, ALMOST_EMPTY_OFFSET}), .ALMOST_FULL_OFFSET({1'b0, ALMOST_FULL_OFFSET}), .DATA_WIDTH(DATA_WIDTH), .FIFO_MODE("FIFO18"), .FIRST_WORD_FALL_THROUGH(FIRST_WORD_FALL_THROUGH)) F8 (.ALMOSTEMPTY(ALMOSTEMPTY), .ALMOSTFULL(ALMOSTFULL), .DO(DO), .DOP(DOP), .EMPTY(EMPTY), .FULL(FULL), .RDCOUNT(RDCOUNT), .RDERR(RDERR), .WRCOUNT(WRCOUNT), .WRERR(WRERR), .DI(DI), .DIP(DIP), .RDCLK(RDCLK), .RDEN(RDEN), .REGCE(1'b1), .RST(RST), .RSTREG(1'b0), .WRCLK(WRCLK), .WREN(WREN));
end
endgenerate
endmodule 

