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
//  /   /             Input Clock Buffer with SSTL18_II I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUFG_SSTL18_II.v
// \   \  /  \    Timestamp : Thu Dec  3 10:07:21 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUFG_SSTL18_II (O, I);

    output O;

    input  I;

	IBUFG #(.IOSTANDARD("SSTL18_II")) I1 (.O(O), .I(I));


endmodule


