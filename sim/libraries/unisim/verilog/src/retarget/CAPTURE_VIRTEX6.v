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
//  /   /                 Register State Capture for Bitstream Readback for VIRTEX6 (Discontinue in 13.1)
// /___/   /\     Filename : CAPTURE_VIRTEX6.v
// \   \  /  \    Timestamp : Tue Jul 27 03:39:15 PST 2010
//  \___\/\___\
//
// Revision:
//    07/27/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps
module CAPTURE_VIRTEX6 (CAP, CLK);

    input  CAP, CLK;
    
    parameter ONESHOT = "TRUE";

CAPTUREE2 #(.ONESHOT(ONESHOT)) C4 ( .CAP(CAP), .CLK(CLK));
endmodule
