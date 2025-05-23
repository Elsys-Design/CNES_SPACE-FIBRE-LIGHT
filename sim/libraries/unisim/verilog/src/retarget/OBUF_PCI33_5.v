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
//  /   /             Output Buffer with PCI33_5 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : OBUF_PCI33_5.v
// \   \  /  \    Timestamp : Thu Aug 12 15:36:01 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUF_PCI33_5 (O, I);

    output O;

    input  I;

	OBUF #(.IOSTANDARD("PCI33_5") ) O4 (.O(O), .I(I));


endmodule


