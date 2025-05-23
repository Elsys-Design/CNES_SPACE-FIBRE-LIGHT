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
//  /   /             5-input NAND Gate (Discontinue in 13.1)
// /___/   /\     Filename : NAND5B5.v
// \   \  /  \    Timestamp : Wed Mar  4 15:10:56 PST 2009

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module NAND5B5 (O, I0, I1, I2, I3, I4);

    output O;

    input  I0, I1, I2, I3, I4;

    LUT5 #(.INIT(32'hFFFFFFFE)) L5 (O, I0, I1, I2, I3, I4);

endmodule
