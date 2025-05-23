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
//  /   /             4-input NOR Gate (Discontinue in 13.1)
// /___/   /\     Filename : NOR4.v
// \   \  /  \    Timestamp : Wed Mar  4 15:36:12 PST 2009

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module NOR4 (O, I0, I1, I2, I3);

    output O;

    input  I0, I1, I2, I3;

    LUT4 #(.INIT(16'h0001)) L4 (O, I0, I1, I2, I3);

endmodule
