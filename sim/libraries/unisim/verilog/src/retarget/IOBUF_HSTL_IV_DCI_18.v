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
//  /   /             Bi-Directional Buffer with HSTL_IV_DCI_18 I/O Standard (Discontinue in 13.1)
// /___/   /\     Filename : IOBUF_HSTL_IV_DCI_18.v
// \   \  /  \    Timestamp : Wed Dec 15 17:34:12 PST 2010

//  \___\/\___\
//
// Revision:
//    03/03/09 - Initial version

`timescale  1 ps / 1 ps


module IOBUF_HSTL_IV_DCI_18 (O, IO, I, T);

    output O;

    inout  IO;

    input  I, T;

        OBUFT #(.IOSTANDARD("HSTL_IV_DCI_18") ) O1 (.O(IO), .I(I), .T(T)); 
	IBUF #(.IOSTANDARD("HSTL_IV_DCI_18"))  I0 (.O(O), .I(IO));
        

endmodule


