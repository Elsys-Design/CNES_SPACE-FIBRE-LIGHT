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
//  /   /             2-input AND Gate (Discontinue in 13.1)
// /___/   /\     Filename : AND2B2.v
// \   \  /  \    Timestamp : Fri Feb 27 12:14:48 PST 2009

//  \___\/\___\
//
// Revision:
//    02/27/09 - Initial version

`timescale  1 ps / 1 ps


module AND2B2 (O, I0, I1);

    output O;

    input  I0, I1;

    LUT2 #(.INIT(4'h1)) L2 (O, I0, I1);

endmodule
