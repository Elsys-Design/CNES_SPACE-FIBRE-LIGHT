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
//  /   /             3-input AND Gate (Discontinue in 13.1)
// /___/   /\     Filename : AND3B3.v
// \   \  /  \    Timestamp : Fri Feb 27 12:15:24 PST 2009

//  \___\/\___\
//
// Revision:
//    02/27/09 - Initial version

`timescale  1 ps / 1 ps


module AND3B3 (O, I0, I1, I2);

    output O;

    input  I0, I1, I2;

    LUT3 #(.INIT(8'h01)) L3 (O, I0, I1, I2);

endmodule
