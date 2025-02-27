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
//  /   /             1-input Look-Up-Table with Dual Output (Discontinue in 13.1)
// /___/   /\     Filename : LUT1_D.v
// \   \  /  \    Timestamp : Tue Mar 04 04:39:27 PST 2009
//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version
//    12/17/09 - The Local output value LO is dropped, please use ucf/sdc instead of these primitives for these values, to communicate packing rules.

`timescale  1 ps / 1 ps


module LUT1_D (LO, O, I0);

    parameter [1:0] INIT = 2'h0;

    input I0;

    output LO, O;
    
    wire LO, O;

    LUT1 #(.INIT(INIT)) L1 (.O(O), .I0(I0));

    assign LO = O;


endmodule


