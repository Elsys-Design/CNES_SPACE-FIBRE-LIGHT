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
//  /   /             Input Clock Buffer with PCI33_3 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUFG_PCI33_3.v
// \   \  /  \    Timestamp : Thu Dec  3 10:07:18 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUFG_PCI33_3 (O, I);

    output O;

    input  I;

	IBUFG #(.IOSTANDARD("PCI33_3")) I1 (.O(O), .I(I));


endmodule


