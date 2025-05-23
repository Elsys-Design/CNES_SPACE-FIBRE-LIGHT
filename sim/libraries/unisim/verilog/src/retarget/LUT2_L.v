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
//  /   /             2-input Look-Up-Table with Local Output (Discontinue in 13.1)
// /___/   /\     Filename : LUT2_L.v
// \   \  /  \    Timestamp : Tue Mar 04 04:46:15 PST 2009
//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version
//    12/17/09 - The Local output value LO is dropped, please use ucf/sdc instead of these primitives for these values, to communicate packing rules.

`timescale  1 ps / 1 ps


module LUT2_L (LO, I0, I1);

    parameter [3:0] INIT = 4'h0;

    input I0, I1;

    output LO;
    
    wire LO;

    LUT2 #(.INIT(INIT)) L2 (.O(LO), .I0(I0), .I1(I1));

endmodule


