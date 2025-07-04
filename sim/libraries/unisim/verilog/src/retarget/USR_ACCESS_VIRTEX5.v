// $Header:  $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  
// /___/   /\     Filename : USR_ACCESS_VIRTEX5.v
// \   \  /  \    Timestamp : Wed Jul 28 10:21:38 PST 2010
//  \___\/\___\
//
// Revision:
//    07/28/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module USR_ACCESS_VIRTEX5 (CFGCLK, DATA, DATAVALID);

    output CFGCLK;
    output [31:0] DATA;
    output DATAVALID;


USR_ACCESSE2 U7 (
             		.CFGCLK(CFGCLK),
             		.DATA(DATA),
             		.DATAVALID(DATAVALID));

endmodule
