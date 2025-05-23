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
//  /   /             Differential Signaling Input Clock Buffer with LVDS_33_DCI I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUFGDS_LVDS_33_DCI.v
// \   \  /  \    Timestamp : Fri Mar  6 09:51:34 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUFGDS_LVDS_33_DCI (O, I, IB);

    output O;

    input  I, IB;

	IBUFGDS #(.IOSTANDARD("LVDS_33_DCI")) I2 (.O(O), .I(I), .IB(IB));


endmodule


