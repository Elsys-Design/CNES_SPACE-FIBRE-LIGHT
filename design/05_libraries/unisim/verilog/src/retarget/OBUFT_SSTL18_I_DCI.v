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
//  /   /             3-State Output Buffer with SSTL18_I_DCI I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : OBUFT_SSTL18_I_DCI.v
// \   \  /  \    Timestamp : Thu Aug 12 16:22:15 PDT 2010

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUFT_SSTL18_I_DCI (O, I, T);

    output O;

    input  I, T;

	OBUFT #(.IOSTANDARD("SSTL18_I_DCI") ) O1 (.O(O), .I(I), .T(T));


endmodule


