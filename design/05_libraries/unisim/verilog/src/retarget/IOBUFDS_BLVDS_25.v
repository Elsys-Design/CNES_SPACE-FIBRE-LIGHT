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
//  /   /             3-State Diffential Signaling I/O Buffer with BLVDS_25 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IOBUFDS_BLVDS_25.v
// \   \  /  \    Timestamp : Tue Mar  3 16:35:37 PST 2009

//  \___\/\___\
//
// Revision:
//    03/03/09 - Initial version

`timescale  1 ps / 1 ps


module IOBUFDS_BLVDS_25 (O, IO, IOB, I, T);

    output O;

    inout  IO, IOB;

    input  I, T;

	OBUFTDS #(.IOSTANDARD("BLVDS_25")) O2 (.O(IO), .OB(IOB), .I(I), .T(T));
	IBUFDS #(.IOSTANDARD("BLVDS_25")) I4 (.O(O), .I(IO), .IB(IOB));


endmodule


