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
//  /   /             Output Buffer with SLOW Slew 24 ma Drive (Discontinue in 13.1)
// /___/   /\     Filename : OBUF_S_24.v
// \   \  /  \    Timestamp : Thu Aug 12 15:36:04 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUF_S_24 (O, I);

    output O;

    input  I;

	OBUF #( .SLEW("SLOW"), .DRIVE(24)) O4 (.O(O), .I(I));


endmodule


