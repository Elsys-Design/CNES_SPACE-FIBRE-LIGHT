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
//  /   /             Output Buffer with HSTL_IV_DCI_18 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : OBUF_HSTL_IV_DCI_18.v
// \   \  /  \    Timestamp : Thu Aug 12 15:35:21 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUF_HSTL_IV_DCI_18 (O, I);

    output O;

    input  I;

	OBUF #(.IOSTANDARD("HSTL_IV_DCI_18") ) O4 (.O(O), .I(I));


endmodule


