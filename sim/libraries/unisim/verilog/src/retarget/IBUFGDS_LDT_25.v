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
//  /   /             Differential Signaling Input Clock Buffer with LDT_25 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUFGDS_LDT_25.v
// \   \  /  \    Timestamp : Fri Mar  6 09:51:33 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUFGDS_LDT_25 (O, I, IB);

    output O;

    input  I, IB;

	IBUFGDS #(.IOSTANDARD("LDT_25")) I2 (.O(O), .I(I), .IB(IB));


endmodule


