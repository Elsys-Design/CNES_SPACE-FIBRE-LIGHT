///////////////////////////////////////////////////////
//  Copyright (c) 1995/2006 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 12.1
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : ICAP_VIRTEX6.v
// \  \  /  \      Timestamp : Tue Jul 27 04:13:15 PST 2010
//  \__\/\__ \                    
//                                 
//  Revision:		
//  07/27/10 - Initial version.
// End Revision
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module ICAP_VIRTEX6 (
  BUSY,
  O,
  CLK,
  CSB,
  I,
  RDWRB
);
  parameter [31:0] DEVICE_ID = 32'h04244093;

  parameter ICAP_WIDTH = "X8";
  parameter SIM_CFG_FILE_NAME = "NONE";

  output BUSY;
  output [31:0] O;

  input CLK;
  input CSB;
  input RDWRB;
  input [31:0] I;

ICAPE2 #(.DEVICE_ID(DEVICE_ID), .ICAP_WIDTH(ICAP_WIDTH), .SIM_CFG_FILE_NAME(SIM_CFG_FILE_NAME)) I5 ( .O(O), .CLK(CLK), .CSIB(CSB), .I(I), .RDWRB(RDWRB));

endmodule
