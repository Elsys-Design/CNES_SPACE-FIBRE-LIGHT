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
//  /   /             Input Buffer with PCIX I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUF_PCIX.v
// \   \  /  \    Timestamp : Thu Dec  3 09:59:17 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUF_PCIX (O, I);

    output O;

    input  I;

	IBUF #(.IOSTANDARD("PCIX")) I0 (.O(O), .I(I));


endmodule


