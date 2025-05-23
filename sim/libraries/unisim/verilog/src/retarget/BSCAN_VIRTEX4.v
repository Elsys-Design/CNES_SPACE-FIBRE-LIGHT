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
//  /   /                 Boundary Scan Logic Control Circuit for VIRTEX4 (Discontinue in 13.1)
// /___/   /\     Filename : BSCAN_VIRTEX4.v
// \   \  /  \    Timestamp : Tue Jul 27 11:05:15 PST 2010
//  \___\/\___\
//
// Revision:
//    07/27/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps
module BSCAN_VIRTEX4 (CAPTURE, DRCK, RESET, SEL, SHIFT, TDI, UPDATE, TDO);

    output CAPTURE, DRCK, RESET, SEL, SHIFT, TDI, UPDATE;
    
    input TDO;

    reg SEL_zd;

    parameter integer JTAG_CHAIN = 1;

    BSCANE2 #(.JTAG_CHAIN(JTAG_CHAIN)) B4 ( .CAPTURE(CAPTURE), .DRCK(DRCK), .RESET(RESET), .RUNTEST(), .SEL(SEL), .SHIFT(SHIFT), .TCK(), .TDI(TDI), .TMS(), .UPDATE(UPDATE), .TDO(TDO));

endmodule

