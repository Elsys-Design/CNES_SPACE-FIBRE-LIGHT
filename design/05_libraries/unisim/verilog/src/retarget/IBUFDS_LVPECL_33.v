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
//  /   /             Differential Signaling Input Buffer with LVPECL_33 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUFDS_LVPECL_33.v
// \   \  /  \    Timestamp : Fri Mar  6 09:41:37 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUFDS_LVPECL_33 (O, I, IB);

    output O;

    input  I, IB;

	IBUFDS #(.IOSTANDARD("LVPECL_33")) I4 (.O(O), .I(I), .IB(IB));


endmodule


