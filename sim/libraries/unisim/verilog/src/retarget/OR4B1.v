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
//  /   /             4-input OR Gate (Discontinue in 13.1)
// /___/   /\     Filename : OR4B1.v
// \   \  /  \    Timestamp : Wed Mar  4 12:59:26 PST 2009

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OR4B1 (O, I0, I1, I2, I3);

    output O;

    input  I0, I1, I2, I3;

    LUT4 #(.INIT(16'hFFFD)) L4 (O, I0, I1, I2, I3);

endmodule
