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
//  /   /                  128-Deep by 1-Wide ROM (Discontinue in 13.1)
// /___/   /\     Filename : ROM128X1.v
// \   \  /  \    Timestamp : TUE Mar 17 15:17:59 PST 2009
//  \___\/\___\
//
// Revision:
//    03/17/09 - Initial version.

`timescale  1 ps / 1 ps


module ROM128X1 (O, A0, A1, A2, A3, A4, A5, A6);

    parameter [127:0] INIT = 128'h00000000000000000000000000000000;

    output O;

    input  A0, A1, A2, A3, A4, A5, A6;

    wire O1, O2;

    LUT6 #(.INIT(INIT[63:0])) L6_0 (.O(O1), .I0(A0), .I1(A1), .I2(A2), .I3(A3), .I4(A4), .I5(A5));
    LUT6 #(.INIT(INIT[127:64])) L6_1 (.O(O2), .I0(A0), .I1(A1), .I2(A2), .I3(A3), .I4(A4), .I5(A5));
    MUXF7 M7 (.O(O), .I0(O1), .I1(O2), .S(A6));


endmodule

