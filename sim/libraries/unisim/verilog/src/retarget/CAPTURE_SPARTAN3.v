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
//  /   /                 Register State Capture for Bitstream Readback for SPARTAN3 (Discontinue in 13.1)
// /___/   /\     Filename : CAPTURE_SPARTAN3.v
// \   \  /  \    Timestamp : Tue Jul 27 03:49:26 PST 2010
//  \___\/\___\
//
// Revision:
//    08/27/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps
module CAPTURE_SPARTAN3 (CAP, CLK);

    input  CAP, CLK;
    
    parameter ONESHOT = "FALSE";

CAPTUREE2 #(.ONESHOT(ONESHOT)) C4 ( .CAP(CAP), .CLK(CLK));
endmodule
