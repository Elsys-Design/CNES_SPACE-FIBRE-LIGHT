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
// /___/   /\     Filename : XORCY_L.v
// \   \  /  \    Timestamp : Tue Aug 18 11:57:35 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps

module XORCY_L (LO, CI, LI);

    output LO;

    input  CI, LI;

XORCY X0 ( .O (LO), .CI (CI), .LI (LI));

endmodule
