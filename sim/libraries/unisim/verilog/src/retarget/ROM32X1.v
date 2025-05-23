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
//  /   /                  32-Deep by 1-Wide ROM (Discontinue in 13.1)
// /___/   /\     Filename : ROM32X1.v
// \   \  /  \    Timestamp : Mon Mar 09 16:49:54 PST 2009
//  \___\/\___\
//
// Revision:
//    03/09/09 - Initial version.

`timescale  1 ps / 1 ps


module ROM32X1 (O, A0, A1, A2, A3, A4);


    parameter [31:0] INIT = 32'h00000000;

    output O;

    input  A0, A1, A2, A3, A4;

    LUT5 #(.INIT(INIT)) L5 (.O(O), .I0(A0), .I1(A1), .I2(A2), .I3(A3), .I4(A4));


endmodule

