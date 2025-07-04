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
//  /   /             2-to-1 Lookup Table Multiplexer with Local Output (Discontinue in 13.1)
// /___/   /\     Filename : MUXF5_L.v
// \   \  /  \    Timestamp : Tue Aug 18 02:31:50 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps

module MUXF5_L (LO, I0, I1, S);

    output LO;

    input  I0, I1, S;

LUT3 #(.INIT(8'hca)) L3 (
		 .O (LO),
		 .I0 (I0),
		 .I1 (I1),
		 .I2 (S));

endmodule
