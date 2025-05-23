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
//  /   /             Differential Signaling Input Clock Buffer with LVPECL_33 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUFGDS_LVPECL_33.v
// \   \  /  \    Timestamp : Fri Mar  6 09:51:36 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUFGDS_LVPECL_33 (O, I, IB);

    output O;

    input  I, IB;

	IBUFGDS #(.IOSTANDARD("LVPECL_33")) I2 (.O(O), .I(I), .IB(IB));


endmodule


