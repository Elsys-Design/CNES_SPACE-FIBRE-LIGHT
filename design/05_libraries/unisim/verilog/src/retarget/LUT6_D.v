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
//  /   /             6-input Look-Up-Table with Dual Output (Discontinue in 13.1)
// /___/   /\     Filename : LUT6_D.v
// \   \  /  \    Timestamp : Tue Mar 06 10:31:05 PST 2009
//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version
//    12/17/09 - The Local output value LO is dropped, please use ucf/sdc instead of these primitives for these values, to communicate packing rules.

`timescale  1 ps / 1 ps


module LUT6_D (LO, O, I0, I1, I2, I3, I4, I5);

    parameter [63:0] INIT = 64'h0000000000000000;

    input I0, I1, I2, I3, I4, I5;

    output LO, O;
    
    wire LO;
    wire O;

    LUT6 #(.INIT(INIT)) L6 (.O(O), .I0(I0), .I1(I1), .I2(I2), .I3(I3) , .I4(I4), .I5(I5));

    assign LO = O;

endmodule


