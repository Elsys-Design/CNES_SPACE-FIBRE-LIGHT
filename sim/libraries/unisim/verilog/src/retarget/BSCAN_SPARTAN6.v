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
//  /   /                 Boundary Scan Logic Control Circuit for SPARTAN6 (Discontinue in 13.1)
// /___/   /\     Filename : BSCAN_SPARTAN6.v
// \   \  /  \    Timestamp : Tue Jul 27 03:06:35 PST 2009
//  \___\/\___\
//
// Revision:
//    07/27/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps
module BSCAN_SPARTAN6 (CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE, TDO);

    output CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE;
    
    input TDO;

    reg SEL_zd;

    parameter integer JTAG_CHAIN = 1;

BSCANE2 #(.JTAG_CHAIN(JTAG_CHAIN)) B4 ( .CAPTURE(CAPTURE), .DRCK(DRCK), .RESET(RESET), .RUNTEST(RUNTEST), .SEL(SEL), .SHIFT(SHIFT), .TCK(TCK), .TDI(TDI), .TMS(TMS), .UPDATE(UPDATE), .TDO(TDO));

endmodule

