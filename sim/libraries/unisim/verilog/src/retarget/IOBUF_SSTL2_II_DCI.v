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
//  /   /             Bi-Directional Buffer with SSTL2_II_DCI I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IOBUF_SSTL2_II_DCI.v
// \   \  /  \    Timestamp : Wed Dec 15 17:35:23 PST 2010

//  \___\/\___\
//
// Revision:
//    03/03/09 - Initial version

`timescale  1 ps / 1 ps


module IOBUF_SSTL2_II_DCI (O, IO, I, T);

    output O;

    inout  IO;

    input  I, T;

        OBUFT #(.IOSTANDARD("SSTL2_II_DCI") ) O1 (.O(IO), .I(I), .T(T)); 
	IBUF #(.IOSTANDARD("SSTL2_II_DCI"))  I0 (.O(O), .I(IO));
        

endmodule


