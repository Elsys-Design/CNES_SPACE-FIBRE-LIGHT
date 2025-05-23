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
//  /   /             Static Synchronous RAM 64-Deep by 1-Wide (Discontinue in 13.1)
// /___/   /\     Filename : RAM64X1S_1.v
// \   \  /  \    Timestamp : Tue Aug 19 11:08:35 PST 2009
//  \___\/\___\
//
// Revision:
//    08/19/09 - Initial version
//    08/23/13 - PR683925 - add invertible pin support.

`timescale  1 ps / 1 ps

module RAM64X1S_1 (O, A0, A1, A2, A3, A4, A5, D, WCLK, WE);

    parameter [63:0] INIT = 64'h0000000000000000;
    parameter [0:0] IS_WCLK_INVERTED = 1'b0;

    output O;

    input  A0, A1, A2, A3, A4, A5, D, WCLK, WE;

    RAM64X1S #(.INIT(INIT), .IS_WCLK_INVERTED(IS_WCLK_INVERTED)) R5 (
	       .O (O),
	       .A0 (A0),
	       .A1 (A1),
	       .A2 (A2),
	       .A3 (A3),
	       .A4 (A4),
	       .A5 (A5),
	       .D (D),
	       .WCLK (~WCLK),
	       .WE (WE));

endmodule
