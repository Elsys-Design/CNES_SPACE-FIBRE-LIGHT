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
//  /   /             2-input OR Gate (Discontinue in 13.1)
// /___/   /\     Filename : OR2B2.v
// \   \  /  \    Timestamp : Wed Mar  4 15:26:41 PST 2009

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OR2B2 (O, I0, I1);

    output O;

    input  I0, I1;

    LUT2 #(.INIT(4'h7)) L2 (O, I0, I1);

endmodule
