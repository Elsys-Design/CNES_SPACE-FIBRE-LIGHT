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
//  /   /             Static Synchronous RAM 64-Deep by 2-Wide (Discontinue in 13.1)
// /___/   /\     Filename : RAM64X2S.v
// \   \  /  \    Timestamp : Tue Aug 19 11:15:38 PST 2009
//  \___\/\___\
//
// Revision:
//    08/19/09 - Initial version
//    08/23/13 - PR683925 - add invertible pin support.

`timescale  1 ps / 1 ps

module RAM64X2S (O0, O1, A0, A1, A2, A3, A4, A5, D0, D1, WCLK, WE);

    parameter [63:0] INIT_00 = 64'h0000000000000000;
    parameter [63:0] INIT_01 = 64'h0000000000000000;
    parameter [0:0] IS_WCLK_INVERTED = 1'b0;

    output O0, O1;

    input  A0, A1, A2, A3, A4, A5, D0, D1, WCLK, WE;

    RAM64X1S #(.INIT(INIT_00), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R5_1 (
	       .O (O0),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (A4),
	       .A5 (A5),
	       .D (D0),
	       .WCLK (WCLK),
	       .WE (WE));

    RAM64X1S #(.INIT(INIT_01), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R5_2 (
	       .O (O1),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (A4),
	       .A5 (A5),
	       .D (D1),
	       .WCLK (WCLK),
	       .WE (WE));

endmodule
