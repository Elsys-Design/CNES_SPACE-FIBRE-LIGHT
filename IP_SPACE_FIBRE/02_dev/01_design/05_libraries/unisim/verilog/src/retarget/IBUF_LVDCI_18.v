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
//  /   /             Input Buffer with LVDCI_18 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUF_LVDCI_18.v
// \   \  /  \    Timestamp : Thu Dec  3 09:59:12 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUF_LVDCI_18 (O, I);

    output O;

    input  I;

	IBUF #(.IOSTANDARD("LVDCI_18")) I0 (.O(O), .I(I));


endmodule


