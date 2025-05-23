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
//  /   /             3-input NOR Gate (Discontinue in 13.1)
// /___/   /\     Filename : NOR3.v
// \   \  /  \    Timestamp : Wed Mar  4 15:36:06 PST 2009

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module NOR3 (O, I0, I1, I2);

    output O;

    input  I0, I1, I2;

    LUT3 #(.INIT(8'h01)) L3 (O, I0, I1, I2);

endmodule
