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
//  /   /                  16-Deep by 1-Wide ROM (Discontinue in 13.1)
// /___/   /\     Filename : ROM16X1.v
// \   \  /  \    Timestamp : TUE Mar 10 10:08:16 PST 2009
//  \___\/\___\
//
// Revision:
//    03/10/09 - Initial version.

`timescale  1 ps / 1 ps


module ROM16X1 (O, A0, A1, A2, A3);


    parameter [127:0] INIT = 16'h0000;

    output O;

    input  A0, A1, A2, A3;

    LUT4 #(.INIT(INIT)) L4 (.O(O), .I0(A0), .I1(A1), .I2(A2), .I3(A3));


endmodule

