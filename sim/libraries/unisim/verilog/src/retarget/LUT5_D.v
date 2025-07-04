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
//  /   /             5-input Look-Up-Table with Dual Output (Discontinue in 13.1)
// /___/   /\     Filename : LUT5_D.v
// \   \  /  \    Timestamp : Tue Mar 04 05:17:24 PST 2009
//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version
//    12/17/09 - The Local output value LO is dropped, please use ucf/sdc instead of these primitives for these values, to communicate packing rules.

`timescale  1 ps / 1 ps


module LUT5_D (LO, O, I0, I1, I2, I3, I4);

    parameter [31:0] INIT = 32'h00000000;

    input I0, I1, I2, I3, I4;

    output LO, O;
    
    wire LO;
    wire O;

    LUT5 #(.INIT(INIT)) L5 (.O(O), .I0(I0), .I1(I1), .I2(I2), .I3(I3) , .I4(I4));

    assign LO = O;

endmodule


