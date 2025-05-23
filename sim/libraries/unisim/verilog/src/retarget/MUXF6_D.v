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
// /___/   /\     Filename : MUXF6_D.v
// \   \  /  \    Timestamp : Tue Aug 18 02:34:55 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps

module MUXF6_D (LO, O, I0, I1, S);

    output LO, O;
    wire LO;

    input  I0, I1, S;

LUT3 #(.INIT(8'hca)) L3 (
		 .O (O),
		 .I0 (I0),
		 .I1 (I1),
		 .I2 (S));

assign LO = O;

endmodule
