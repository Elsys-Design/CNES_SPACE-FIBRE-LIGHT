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
//  /   /             Fast Multiplier AND (Discontinue in 13.1)
// /___/   /\     Filename : MULT_AND.v
// \   \  /  \    Timestamp : Tue Aug 18 12:16:32 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps

module MULT_AND (LO, I0, I1);

    output LO;

    input  I0, I1;

LUT2 #(.INIT(4'h8)) L2 (LO, I0, I1);

endmodule
