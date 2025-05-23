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
//  /   /             XOR for Carry Logic with Local Output (Discontinue in 13.1)
// /___/   /\     Filename : MUXCY_L.v
// \   \  /  \    Timestamp : Tue Aug 18 02:12:38 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps

module MUXCY_L (LO, CI, DI, S);

    output LO;

    input  CI, DI, S;

MUXCY M0 (
		 .O (LO),
		 .CI (CI),
		 .S (S),
		 .DI (DI));

endmodule
