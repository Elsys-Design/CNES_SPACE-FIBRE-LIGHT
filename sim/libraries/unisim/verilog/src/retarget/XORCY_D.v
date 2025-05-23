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
//  /   /             XOR for Carry Logic with Dual Output (Discontinue in 13.1)
// /___/   /\     Filename : XORCY_D.v
// \   \  /  \    Timestamp : Tue Aug 18 11:52:29 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps

module XORCY_D (LO, O, CI, LI);

    output LO, O;

    input  CI, LI;

XORCY X0 ( .O (O), .CI (CI), .LI (LI));

assign LO = O;

endmodule
