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
//  /   /             5-input OR Gate (Discontinue in 13.1)
// /___/   /\     Filename : OR5B3.v
// \   \  /  \    Timestamp : Wed Mar  4 14:28:10 PST 2009

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OR5B3 (O, I0, I1, I2, I3, I4);

    output O;

    input  I0, I1, I2, I3, I4;

    LUT5 #(.INIT(32'hFFFFFF7F)) L5 (O, I0, I1, I2, I3, I4);

endmodule
