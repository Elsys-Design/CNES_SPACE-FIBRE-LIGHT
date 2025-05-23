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
//  /   /             Input Clock Buffer with HSTL_III_DCI I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUFG_HSTL_III_DCI.v
// \   \  /  \    Timestamp : Thu Dec  3 10:07:09 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUFG_HSTL_III_DCI (O, I);

    output O;

    input  I;

	IBUFG #(.IOSTANDARD("HSTL_III_DCI")) I1 (.O(O), .I(I));


endmodule


