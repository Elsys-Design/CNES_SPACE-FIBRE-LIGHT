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
//  /   /             Bi-Directional Buffer with CTT I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IOBUF_CTT.v
// \   \  /  \    Timestamp : Wed Dec 15 17:33:54 PST 2010

//  \___\/\___\
//
// Revision:
//    03/03/09 - Initial version

`timescale  1 ps / 1 ps


module IOBUF_CTT (O, IO, I, T);

    output O;

    inout  IO;

    input  I, T;

        OBUFT #(.IOSTANDARD("CTT") ) O1 (.O(IO), .I(I), .T(T)); 
	IBUF #(.IOSTANDARD("CTT"))  I0 (.O(O), .I(IO));
        

endmodule


