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
//  /   /             Output Buffer with FAST Slew 12 ma Drive (Discontinue in 13.1)
// /___/   /\     Filename : OBUF_F_12.v
// \   \  /  \    Timestamp : Thu Aug 12 15:35:11 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUF_F_12 (O, I);

    output O;

    input  I;

	OBUF #( .SLEW("FAST"), .DRIVE(12)) O4 (.O(O), .I(I));


endmodule


