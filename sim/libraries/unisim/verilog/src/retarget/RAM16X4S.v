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
//  /   /             Static Synchronous RAM 16-Deep by 4-Wide (Discontinue in 13.1)
// /___/   /\     Filename : RAM16X4S.v
// \   \  /  \    Timestamp : Tue Aug 19 10:44:31 PST 2009
//  \___\/\___\
//
// Revision:
//    08/19/09 - Initial version
//    08/23/13 - PR683925 - add invertible pin support.

`timescale  1 ps / 1 ps

module RAM16X4S (O0, O1, O2, O3, A0, A1, A2, A3, D0, D1, D2, D3, WCLK, WE);

    parameter [15:0] INIT_00 = 16'h0000;
    parameter [15:0] INIT_01 = 16'h0000;
    parameter [15:0] INIT_02 = 16'h0000;
    parameter [15:0] INIT_03 = 16'h0000;
    parameter [0:0] IS_WCLK_INVERTED = 1'b0;

    output O0, O1, O2, O3;

    input  A0, A1, A2, A3, D0, D1, D2, D3, WCLK, WE;

    RAM32X1S #(.INIT(INIT_00), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_1 (
	       .O (O0),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D0),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_01), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_2 (
	       .O (O1),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D1),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_02), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_3 (
	       .O (O2),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D2),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM32X1S #(.INIT(INIT_03), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R3_4 (
	       .O (O3),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (1'b0),
	       .D (D3),
	       .WCLK (WCLK),
	       .WE (WE));

endmodule
