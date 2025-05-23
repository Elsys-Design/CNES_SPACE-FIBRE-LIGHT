// $Header:  $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  64-Deep by 1-Wide ROM (Discontinue in 13.1)
// /___/   /\     Filename : ROM64X1.v
// \   \  /  \    Timestamp : Mon Mar 09 16:07:59 PST 2009
//  \___\/\___\
//
// Revision:
//    03/09/09 - Initial version.

`timescale  1 ps / 1 ps


module ROM64X1 (O, A0, A1, A2, A3, A4, A5);

    parameter [63:0] INIT = 64'h0000000000000000;

    output O;

    input  A0, A1, A2, A3, A4, A5;

    LUT6 #(.INIT(INIT)) L6 (.O(O), .I0(A0), .I1(A1), .I2(A2), .I3(A3), .I4(A4), .I5(A5));


endmodule

