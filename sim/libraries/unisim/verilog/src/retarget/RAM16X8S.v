// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Retarget Simulation Library Component
//  /   /             Static Synchronous RAM 16-Deep by 8-Wide (Discontinue in 13.1)
// /___/   /\     Filename : RAM16X8S.v
// \   \  /  \    Timestamp : Tue Aug 19 10:47:35 PST 2009
//  \___\/\___\
//
// Revision:
//    08/19/09 - Initial version
//    08/23/13 - PR683925 - add invertible pin support.

`timescale  1 ps / 1 ps

module RAM16X8S (O, A0, A1, A2, A3, D, WCLK, WE);

    parameter [15:0] INIT_00 = 16'h0000;
    parameter [15:0] INIT_01 = 16'h0000;
    parameter [15:0] INIT_02 = 16'h0000;
    parameter [15:0] INIT_03 = 16'h0000;
    parameter [15:0] INIT_04 = 16'h0000;
    parameter [15:0] INIT_05 = 16'h0000;
    parameter [15:0] INIT_06 = 16'h0000;
    parameter [15:0] INIT_07 = 16'h0000;
    parameter [0:0] IS_WCLK_INVERTED = 1'b0;

    output [7:0] O;

    input  A0, A1, A2, A3, WCLK, WE;
    input [7:0] D;

    RAM32X1S #(.INIT(INIT_00), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_1 (
	       .O (O[0]),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D[0]),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_01), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_2 (
	       .O (O[1]),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D[1]),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_02), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_3 (
	       .O (O[2]),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D[2]),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_03), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_4 (
	       .O (O[3]),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D[3]),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_04), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_5 (
	       .O (O[4]),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D[4]),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_05), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_6 (
    	       .O (O[5]),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D[5]),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_06), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_7 (
	       .O (O[6]),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D[6]),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_07), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_8 (
	       .O (O[7]),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D[7]),
	       .WCLK (WCLK),
	       .WE (WE));

endmodule
