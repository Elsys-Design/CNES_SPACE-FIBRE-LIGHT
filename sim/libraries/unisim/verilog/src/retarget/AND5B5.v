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
//  /   /             5-input AND Gate (Discontinue in 13.1)
// /___/   /\     Filename : AND5B5.v
// \   \  /  \    Timestamp : Fri Feb 27 17:12:18 PST 2009

//  \___\/\___\
//
// Revision:
//    02/27/09 - Initial version

`timescale  1 ps / 1 ps


module AND5B5 (O, I0, I1, I2, I3, I4);

    output O;

    input  I0, I1, I2, I3, I4;

    LUT5 #(.INIT(32'h00000001)) L5 (O, I0, I1, I2, I3, I4);

endmodule
