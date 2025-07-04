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
//  /   /             2-to-1 Multiplexer for Carry Logic with Dual Output (Discontinue in 13.1)
// /___/   /\     Filename : MUXCY_D.v
// \   \  /  \    Timestamp : Tue Aug 18 02:00:35 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps

module MUXCY_D (LO, O, CI, DI, S);

    output LO, O;
    wire    O;
    wire LO;

    input  CI, DI, S;

MUXCY M0 (
		 .O (O),
		 .CI (CI),
		 .S (S),
		 .DI (DI));

assign LO = O;

endmodule
