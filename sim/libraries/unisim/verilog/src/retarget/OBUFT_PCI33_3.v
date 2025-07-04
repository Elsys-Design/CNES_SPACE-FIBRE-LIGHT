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
//  /   /             3-State Output Buffer with PCI33_3 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : OBUFT_PCI33_3.v
// \   \  /  \    Timestamp : Thu Aug 12 16:22:08 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUFT_PCI33_3 (O, I, T);

    output O;

    input  I, T;

	OBUFT #(.IOSTANDARD("PCI33_3") ) O1 (.O(O), .I(I), .T(T));


endmodule


