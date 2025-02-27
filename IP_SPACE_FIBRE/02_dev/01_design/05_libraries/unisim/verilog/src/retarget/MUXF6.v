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
//  /   /             2-to-1 Lookup Table Multiplexer with Dual Output (Discontinue in 13.1)
// /___/   /\     Filename : MUXF6.v
// \   \  /  \    Timestamp : Tue Aug 18 02:53:12 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps

module MUXF6 (O, I0, I1, S);

    output O;

    input  I0, I1, S;

LUT3 #(.INIT(8'hca)) L3 (
		 .O (O),
		 .I0 (I0),
		 .I1 (I1),
		 .I2 (S));

endmodule
