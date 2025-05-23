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
//  /   /             Output Buffer with LVCMOS12 I/O Standard SLOW Slew 2 ma Drive (Discontinue in 13.1)
// /___/   /\     Filename : OBUF_LVCMOS12_S_2.v
// \   \  /  \    Timestamp : Thu Aug 12 15:35:24 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUF_LVCMOS12_S_2 (O, I);

    output O;

    input  I;

	OBUF #(.IOSTANDARD("LVCMOS12"), .SLEW("SLOW"), .DRIVE(2)) O4 (.O(O), .I(I));


endmodule


