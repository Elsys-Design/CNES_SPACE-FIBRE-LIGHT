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
//  /   /             3-State Differential Signaling Buffer with LVDSEXT_33 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : OBUFTDS_LVDSEXT_33.v
// \   \  /  \    Timestamp : Wed Mar  4 11:46:26 PST 2009

//  \___\/\___\
//
// Revision:
//    03/04/09 - Initial version

`timescale  1 ps / 1 ps


module OBUFTDS_LVDSEXT_33 (O, OB, I, T);

    output O, OB;

    input  I, T;

	OBUFTDS #(.IOSTANDARD("LVDSEXT_33")) O2 (.O(O), .I(I), .OB(OB), .T(T));


endmodule


