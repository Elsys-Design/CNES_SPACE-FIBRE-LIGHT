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
//  /   /             Input Clock Buffer with LVCMOS18 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUFG_LVCMOS18.v
// \   \  /  \    Timestamp : Thu Dec  3 10:07:13 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUFG_LVCMOS18 (O, I);

    output O;

    input  I;

	IBUFG #(.IOSTANDARD("LVCMOS18")) I1 (.O(O), .I(I));


endmodule


