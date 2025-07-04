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
//  /   /                  256-Deep by 1-Wide ROM (Discontinue in 13.1)
// /___/   /\     Filename : ROM256X1.v
// \   \  /  \    Timestamp : WED Mar 18 10:17:40 PST 2009
//  \___\/\___\
//
// Revision:
//    03/18/09 - Initial version.

`timescale  1 ps / 1 ps


module ROM256X1 (O, A0, A1, A2, A3, A4, A5, A6, A7);

    parameter [255:0] INIT = 256'h0000000000000000000000000000000000000000000000000000000000000000;

    output O;

    input  A0, A1, A2, A3, A4, A5, A6, A7;

    wire O1, O2, O3, O4, O5, O6;


    LUT6 #(.INIT(INIT[63:0])) L6_0 (.O(O1), .I0(A0), .I1(A1), .I2(A2), .I3(A3), .I4(A4), .I5(A5));
    LUT6 #(.INIT(INIT[127:64])) L6_1 (.O(O2), .I0(A0), .I1(A1), .I2(A2), .I3(A3), .I4(A4), .I5(A5));
    MUXF7  M7_0 (.O(O5), .I0(O1), .I1(O2), .S(A6));
    LUT6 #(.INIT(INIT[191:128])) L6_2 (.O(O3), .I0(A0), .I1(A1), .I2(A2), .I3(A3), .I4(A4), .I5(A5));
    LUT6 #(.INIT(INIT[255:192])) L6_3 (.O(O4), .I0(A0), .I1(A1), .I2(A2), .I3(A3), .I4(A4), .I5(A5));
    MUXF7  M7_1 (.O(O6), .I0(O3), .I1(O4), .S(A6));
    MUXF8 M8 (.O(O), .I0(O5), .I1(O6), .S(A7));


endmodule

