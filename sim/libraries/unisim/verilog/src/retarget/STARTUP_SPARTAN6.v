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
//  /   /                  User Interface to Global Clock, Reset and 3-State Controls for SPARTAN6
// /___/   /\     Filename : STARTUP_SPARTAN6.v
// \   \  /  \    Timestamp : Tue Jul 27 05:06:26 PST 2010
//  \___\/\___\
//
// Revision:
//    07/27/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module STARTUP_SPARTAN6 (
  CFGCLK,
  CFGMCLK,
  EOS,
  CLK,
  GSR,
  GTS,
  KEYCLEARB);

  output CFGCLK;
  output CFGMCLK;
  output EOS;

  input CLK;
  input GSR;
  input GTS;
  input KEYCLEARB;

STARTUPE2 S7 ( .CFGCLK(CFGCLK), .CFGMCLK(CFGMCLK), .EOS(EOS), .PREQ(), .CLK(CLK), .GSR(GSR), .GTS(GTS), .KEYCLEARB(KEYCLEARB), .PACK(1'b0), .USRCCLKO(1'b0), .USRCCLKTS(1'b0), .USRDONEO(1'b0), .USRDONETS(1'b0));

endmodule
