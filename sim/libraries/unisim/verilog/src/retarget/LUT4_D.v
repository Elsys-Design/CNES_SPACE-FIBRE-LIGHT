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
//  /   /             4-input Look-Up-Table with Dual Output (Discontinue in 13.1)
// /___/   /\     Filename : LUT4_D.v
// \   \  /  \    Timestamp : Tue Mar 04 05:14:32 PST 2009
//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version
//    12/17/09 - The Local output value LO is dropped, please use ucf/sdc instead of these primitives for these values, to communicate packing rules.

`timescale  1 ps / 1 ps


module LUT4_D (LO, O, I0, I1, I2, I3);

    parameter [15:0] INIT = 16'h0000;

    input I0, I1, I2, I3;

    output LO, O;
    
    wire LO;
    wire O;

    LUT4 #(.INIT(INIT)) L4 (.O(O), .I0(I0), .I1(I1), .I2(I2), .I3(I3));

    assign LO = O;

endmodule


