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
//  /   /             Input Buffer with SSTL2_I I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IBUF_SSTL2_I.v
// \   \  /  \    Timestamp : Thu Dec  3 09:59:19 PST 2009

//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version

`timescale  1 ps / 1 ps


module IBUF_SSTL2_I (O, I);

    output O;

    input  I;

	IBUF #(.IOSTANDARD("SSTL2_I")) I0 (.O(O), .I(I));


endmodule


