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
//  /   /                  User Interface to Global Clock, Reset and 3-State Controls for VIRTEX4 (Discontinue in 13.1)
// /___/   /\     Filename : STARTUP_VIRTEX4.v
// \   \  /  \    Timestamp : Tue Jul 27 05:01:28 PST 2010
//  \___\/\___\
//
// Revision:
//    07/27/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module STARTUP_VIRTEX4 (EOS, CLK, GSR, GTS, USRCCLKO, USRCCLKTS, USRDONEO, USRDONETS);

    output EOS;
    
    input CLK;
    input GSR;
    input GTS;
    input USRCCLKO;
    input USRCCLKTS;
    input USRDONEO;
    input USRDONETS;
  

STARTUPE2 S7 ( .CFGCLK(), .CFGMCLK(), .EOS(EOS), .PREQ(), .CLK(CLK), .GSR(GSR), .GTS(GTS), .KEYCLEARB(1'b0), .PACK(1'b0), .USRCCLKO(USRCCLKO), .USRCCLKTS(USRCCLKTS), .USRDONEO(USRDONEO), .USRDONETS(USRDONETS));

endmodule
