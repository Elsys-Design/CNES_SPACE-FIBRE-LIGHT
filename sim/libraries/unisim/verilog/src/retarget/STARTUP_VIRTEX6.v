// $Header:  $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : 
// /___/   /\     Filename : STARTUP_VIRTEX6.v
// \   \  /  \    Timestamp : Tue Jul 27 04:57:21 PST 2010
//  \___\/\___\
//
// Revision:
//    07/27/10 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module STARTUP_VIRTEX6 (       
  CFGCLK,
  CFGMCLK,
  DINSPI,
  EOS,
  PREQ,
  TCKSPI,
  CLK,
  GSR,
  GTS,
  KEYCLEARB,
  PACK,
  USRCCLKO,
  USRCCLKTS,
  USRDONEO,
  USRDONETS
);
  parameter PROG_USR = "FALSE";

  output CFGCLK;
  output CFGMCLK;
  output DINSPI;
  output EOS;
  output PREQ;
  output TCKSPI;

  input CLK;
  input GSR;
  input GTS;
  input KEYCLEARB;
  input PACK;
  input USRCCLKO;
  input USRCCLKTS;
  input USRDONEO;
  input USRDONETS;
  

STARTUPE2 #(.PROG_USR(PROG_USR)) S7 ( .CFGCLK(CFGCLK), .CFGMCLK(CFGMCLK), .EOS(EOS), .PREQ(PREQ), .CLK(CLK), .GSR(GSR), .GTS(GTS), .KEYCLEARB(KEYCLEARB), .PACK(PACK), .USRCCLKO(USRCCLKO), .USRCCLKTS(USRCCLKTS), .USRDONEO(USRDONEO), .USRDONETS(USRDONETS));

endmodule
