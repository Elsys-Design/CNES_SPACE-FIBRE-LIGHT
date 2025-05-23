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
//  /   /             3-input XOR Gate (Discontinue in 13.1)
// /___/   /\     Filename : XOR3.v
// \   \  /  \    Timestamp : Wed Mar  4 16:02:24 PST 2009

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module XOR3 (O, I0, I1, I2);

    output O;

    input  I0, I1, I2;

    LUT3 #(.INIT(8'h96)) L3 (O, I0, I1, I2);

endmodule
