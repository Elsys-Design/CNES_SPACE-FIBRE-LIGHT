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
//  /   /             4-input AND Gate (Discontinue in 13.1)
// /___/   /\     Filename : AND4.v
// \   \  /  \    Timestamp : Fri Feb 27 15:57:54 PST 2009

//  \___\/\___\
//
// Revision:
//    02/27/09 - Initial version

`timescale  1 ps / 1 ps


module AND4 (O, I0, I1, I2, I3);

    output O;

    input  I0, I1, I2, I3;

    LUT4 #(.INIT(16'h8000)) L4 (O, I0, I1, I2, I3);

endmodule
