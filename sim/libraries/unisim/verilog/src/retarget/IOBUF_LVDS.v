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
//  /   /             Bi-Directional Buffer with LVDS I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IOBUF_LVDS.v
// \   \  /  \    Timestamp : Wed Dec 15 17:35:03 PST 2010

//  \___\/\___\
//
// Revision:
//    03/03/09 - Initial version

`timescale  1 ps / 1 ps


module IOBUF_LVDS (O, IO, I, T);

    output O;

    inout  IO;

    input  I, T;

        OBUFT #(.IOSTANDARD("LVDS") ) O1 (.O(IO), .I(I), .T(T)); 
	IBUF #(.IOSTANDARD("LVDS"))  I0 (.O(O), .I(IO));
        

endmodule


