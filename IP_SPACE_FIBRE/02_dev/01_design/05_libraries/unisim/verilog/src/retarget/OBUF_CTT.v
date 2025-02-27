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
//  /   /             Output Buffer with CTT I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : OBUF_CTT.v
// \   \  /  \    Timestamp : Thu Aug 12 15:35:10 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUF_CTT (O, I);

    output O;

    input  I;

	OBUF #(.IOSTANDARD("CTT") ) O4 (.O(O), .I(I));


endmodule


