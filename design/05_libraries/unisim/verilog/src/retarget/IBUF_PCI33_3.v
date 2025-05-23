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
//  /   /             Input Buffer with PCI33_3 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUF_PCI33_3.v
// \   \  /  \    Timestamp : Thu Dec  3 09:59:16 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUF_PCI33_3 (O, I);

    output O;

    input  I;

	IBUF #(.IOSTANDARD("PCI33_3")) I0 (.O(O), .I(I));


endmodule


