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
//  /   /             Output Buffer with LVCMOS15 I/O Standard FAST Slew 4 ma Drive (Discontinue in 13.1)
// /___/   /\     Filename : OBUF_LVCMOS15_F_4.v
// \   \  /  \    Timestamp : Thu Aug 12 15:35:27 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUF_LVCMOS15_F_4 (O, I);

    output O;

    input  I;

	OBUF #(.IOSTANDARD("LVCMOS15"), .SLEW("FAST"), .DRIVE(4)) O4 (.O(O), .I(I));


endmodule


